package service;

import dao.DAOFactory;
import dao.OrderDAO;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        final HttpServletRequest request = (HttpServletRequest) servletRequest;
        final HttpServletResponse response = (HttpServletResponse) servletResponse;

        final String login = request.getParameter("login");
        final String password = request.getParameter("password");
        final HttpSession session = request.getSession();

        if((login == null &&
                password == null) && (session.getAttribute("login") == null
                                    && session.getAttribute("password") == null)) {
            request.getRequestDispatcher("/jsp/signInForm.jsp").forward(request, response);
        }


        DAOFactory factory = DAOFactory.getInstance();
        OrderDAO dao = factory.getOrderDAO();

        if(session != null &&
                session.getAttribute("login") != null &&
                session.getAttribute("password") != null) {
            final String role = (String) session.getAttribute("role");
            moveToMenu(request,response,role);
        } else if(dao.userIsExist(login,password)) {
            final String role = dao.getRoleByLoginAndPass(login,password);
            session.setAttribute("password", password);
            session.setAttribute("login", login);
            session.setAttribute("role", role);
            session.setMaxInactiveInterval(20*60);
            moveToMenu(request, response, role);
        } else {
            moveToMenu(request, response, "UNKNOWN");
        }
    }

    private void moveToMenu(HttpServletRequest request, HttpServletResponse response, String role) throws ServletException, IOException {
        if(role.equals("ADMIN")) {
            AdminSignIn signIn = new AdminSignIn();
            signIn.doPost(request,response);
            request.getRequestDispatcher("/jsp/adminPanel.jsp").forward(request, response);
        }else {
            request.getRequestDispatcher("/jsp/signInForm.jsp").forward(request, response);
        }
    }

    public void destroy() {

    }
}
