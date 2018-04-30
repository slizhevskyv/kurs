package dao.impl;

import dao.OrderDAO;
import entity.Order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderDAOImpl implements OrderDAO {
    private final String driverName = "com.mysql.jdbc.Driver";

    public boolean addOrder(Order order) {
        try {
            Class.forName(driverName);
            Connection connection = null;
            try {
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
                PreparedStatement statement = null;
                try{
                    String sql = "INSERT INTO business.order(departure, destination, customerName, telephone, cost, comment, typeOfMachine, addRequirement, date) VALUES(?,?,?,?,?,?,?,?,?)";
                    statement = connection.prepareStatement(sql);
                    Date date = new Date();
                    statement.setString(1, order.getPointOfDeparture());
                    statement.setString(2, order.getDestination());
                    statement.setString(3,order.getCustomerName());
                    statement.setString(4, order.getPhoneNumber());
                    statement.setFloat(5, order.getCost());
                    statement.setString(6, order.getComment());
                    statement.setString(7, order.getTypeOfMachine());
                    statement.setString(8, order.getAddRequirement());
                    statement.setTimestamp(9, new java.sql.Timestamp(date.getTime()));
                    statement.executeUpdate();
                } finally {
                    if(statement != null) {
                        statement.close();
                    }
                }
            }finally {
                if(connection != null) {
                    connection.close();
                }
            }
            return true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
