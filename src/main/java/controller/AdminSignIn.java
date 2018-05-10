package controller;

import dao.DAOFactory;
import dao.OrderDAO;
import entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminSignIn", urlPatterns = "/admin")
public class AdminSignIn extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOFactory factory = DAOFactory.getInstance();
        OrderDAO dao = factory.getOrderDAO();
        List<Order> list = dao.getAllOrders();
        float totalCost = 0;
        for(Order order : list) {
            totalCost += order.getCost();
        }
        String format = String.format("%.2f", totalCost);
        request.setAttribute("cost", format);
        request.setAttribute("orders", list);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
