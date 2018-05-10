package controller;

import dao.DAOFactory;
import dao.OrderDAO;
import entity.Order;
import entity.OrderBuilder;
import org.json.JSONException;
import org.json.JSONObject;
import util.CostParser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "OrderTaxi", urlPatterns = "/orderTaxi")
public class OrderTaxi extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuffer stringBuffer = new StringBuffer();
        String line;
        BufferedReader bufferedReader = request.getReader();
        while((line = bufferedReader.readLine()) != null) {
            stringBuffer.append(line);
        }
        try {
            JSONObject jObject = new JSONObject(stringBuffer.toString());
            Order order = new OrderBuilder()
                            .departure(jObject.getString("pointOfDeparture"))
                            .destination(jObject.getString("destination"))
                            .cost(CostParser.parse(jObject.getString("cost")))
                            .customerName(jObject.getString("name"))
                            .phoneNumber(jObject.getString("phoneNumber"))
                            .comment(jObject.getString("comment"))
                            .typeOfMachine(jObject.getString("typeOfMachine"))
                            .addRequirement(jObject.getString("other"))
                            .build();
            DAOFactory factory = DAOFactory.getInstance();
            OrderDAO dao = factory.getOrderDAO();
            boolean result = dao.addOrder(order);
            if(result) {
                response.getWriter().write("1");
            } else {
                response.getWriter().write("0");
            }
        }catch(JSONException ex) {
            throw new IOException("Error parsing JSON request string");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
