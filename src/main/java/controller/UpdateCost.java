package controller;

import com.sun.org.apache.bcel.internal.generic.DADD;
import dao.DAOFactory;
import dao.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateCost", urlPatterns = "/updateCost")
public class UpdateCost extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOFactory factory = DAOFactory.getInstance();
        OrderDAO dao = factory.getOrderDAO();
        dao.updateCost();
        float newCost = dao.getTotalCost();
        response.getWriter().write(String.valueOf(newCost));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
