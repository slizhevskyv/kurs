package dao;

import entity.Order;

public interface OrderDAO {
    boolean addOrder(Order order);
    String getRoleByLoginAndPass(String login, String password);
    boolean userIsExist(String login, String password);
}
