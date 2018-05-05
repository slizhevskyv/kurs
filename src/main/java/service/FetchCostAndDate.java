package service;

import dao.DAOFactory;
import dao.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "FetchCostAndDate", urlPatterns = "/fetchCostAndDate")
public class FetchCostAndDate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOFactory factory = DAOFactory.getInstance();
        OrderDAO dao = factory.getOrderDAO();
        response.getWriter().write(dao.getCostByDate());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
