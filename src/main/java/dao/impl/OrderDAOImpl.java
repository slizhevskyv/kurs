package dao.impl;

import dao.OrderDAO;
import entity.Order;
import entity.OrderBuilder;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderDAOImpl implements OrderDAO {
    private final String driverName = "com.mysql.jdbc.Driver";
    private final String url = "jdbc:mysql://localhost:3306/business?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private final String userDB = "root";
    private final String passwordDB = "root";

    public boolean addOrder(Order order) {
        try {
            Class.forName(driverName);
            Connection connection = null;
            try {
                connection = DriverManager.getConnection(url,userDB,passwordDB);
                PreparedStatement statement = null;
                try{
                    String sql = "INSERT INTO business.order(departure, destination, customerName, telephone, cost, comment, typeOfMachine, addRequirement, dateOrder, time) VALUES(?,?,?,?,?,?,?,?,?,?)";
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
                    statement.setDate(9, new java.sql.Date(date.getTime()));
                    statement.setTime(10, new java.sql.Time(System.currentTimeMillis()));
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

    public String getRoleByLoginAndPass(String login, String password) {
        try {
            Class.forName(driverName);
            Connection connection = DriverManager.getConnection(url,userDB,passwordDB);
            try {
                Statement statement = connection.createStatement();
                try {
                    ResultSet set = statement.executeQuery("SELECT login,password,role FROM business.users");
                    try {
                        while (set.next()) {;
                            String loginDB1 = set.getString("login");
                            String passwordDB1 = set.getString("password");
                            String userRole = set.getString("role");
                            if (login.equalsIgnoreCase(loginDB1) && password.equals(passwordDB1)) {
                                return userRole;
                            }
                        }
                    } finally {
                        set.close();
                    }
                }finally {
                    statement.close();
                }
                }finally {
                connection.close();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "";
    }

    public boolean userIsExist(String login, String password) {
        try {
            Class.forName(driverName);
            Connection connection = DriverManager.getConnection(url,userDB,passwordDB);
            try {
                Statement statement = connection.createStatement();
                try {
                    ResultSet set = statement.executeQuery("SELECT login,password FROM business.users");
                    try {
                        while (set.next()) {
                            String loginDB1 = set.getString("login");
                            String passwordDB1 = set.getString("password");
                            if (login.equalsIgnoreCase(loginDB1) && password.equals(passwordDB1)) {
                               return true;
                            }
                        }
                    } finally {
                        set.close();
                    }
                }finally {
                    statement.close();
                }
            }finally {
                connection.close();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getCostByDate() {
        StringBuffer buffer = new StringBuffer();
        try {
            Class.forName(driverName);
            Connection connection = DriverManager.getConnection(url,userDB,passwordDB);
            try {
                Statement statement = connection.createStatement();
                try {
                    ResultSet set = statement.executeQuery("SELECT dateOrder,SUM(cost) AS cost FROM business.order WHERE dateOrder <= CURRENT_DATE GROUP BY dateOrder LIMIT 5");
                    try {
                        while (set.next()) {
                            buffer.append(set.getDate("dateOrder") + " " + set.getFloat("cost") + "\n");
                        }
                    } finally {
                        set.close();
                    }
                }finally {
                    statement.close();
                }
            }finally {
                connection.close();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return buffer.toString();
    }

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<Order>();
        try {
            Class.forName(driverName);
            Connection connection = DriverManager.getConnection(url,userDB,passwordDB);
            try {
                Statement statement = connection.createStatement();
                try {
                    ResultSet set = statement.executeQuery("SELECT departure,destination,customerName,telephone,cost,comment,typeOfMachine,addRequirement FROM business.order");
                    try {
                        while (set.next()) {
                            Order order = new OrderBuilder()
                                    .addRequirement(set.getString("addRequirement"))
                                    .typeOfMachine(set.getString("typeOfMachine"))
                                    .comment(set.getString("comment"))
                                    .cost(set.getFloat("cost"))
                                    .phoneNumber(set.getString("telephone"))
                                    .customerName(set.getString("customerName"))
                                    .destination(set.getString("destination"))
                                    .departure(set.getString("departure"))
                                    .build();
                            list.add(order);
                        }
                    } finally {
                        set.close();
                    }
                }finally {
                    statement.close();
                }
            }finally {
                connection.close();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
