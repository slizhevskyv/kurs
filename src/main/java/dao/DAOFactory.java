package dao;

import dao.impl.OrderDAOImpl;

public class DAOFactory {
    private static final DAOFactory instance =  new DAOFactory();
    private final OrderDAO dao = new OrderDAOImpl();

    public static DAOFactory getInstance() {
        return instance;
    }

    public OrderDAO getOrderDAO() {
        return dao;
    }

    private DAOFactory(){}
}
