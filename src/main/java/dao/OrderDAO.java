package dao;

import entity.Order;

import java.util.List;

public interface OrderDAO {
    boolean addOrder(Order order);
    String getRoleByLoginAndPass(String login, String password);
    boolean userIsExist(String login, String password);
    String getCostByDate();
    List<Order> getAllOrders();
}
