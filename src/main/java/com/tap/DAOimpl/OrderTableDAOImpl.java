package com.tap.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderTableDAO;
import com.tap.model.OrderTable;

public class OrderTableDAOImpl implements OrderTableDAO {

    private Connection connection;

    public OrderTableDAOImpl(Connection connection) {

        this.connection = connection;

    }

    // =========================================================
    // ADD ORDER
    // =========================================================

    @Override
    public int addOrder(OrderTable order) {

        String sql = "INSERT INTO ordertable "
                   + "(UserID, RestaurantID, OrderDate, TotalAmount, Status, PaymentMethod) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = connection.prepareStatement(
                sql,
                Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, order.getUserID());
            pstmt.setInt(2, order.getRestaurantID());
            pstmt.setTimestamp(3, order.getOrderDate());
            pstmt.setDouble(4, order.getTotalAmount());
            pstmt.setString(5, order.getStatus());
            pstmt.setString(6, order.getPaymentMethod());

            System.out.println("========== ORDER INSERT ==========");
            System.out.println("UserID       : " + order.getUserID());
            System.out.println("RestaurantID : " + order.getRestaurantID());
            System.out.println("OrderDate    : " + order.getOrderDate());
            System.out.println("TotalAmount  : " + order.getTotalAmount());
            System.out.println("Status       : " + order.getStatus());
            System.out.println("Payment      : " + order.getPaymentMethod());

            int rows = pstmt.executeUpdate();

            System.out.println("Rows inserted: " + rows);

            if (rows == 0) {

                System.out.println("ORDER INSERT FAILED: 0 rows inserted");

                return 0;
            }

            try (ResultSet rs = pstmt.getGeneratedKeys()) {

                if (rs.next()) {

                    int orderID = rs.getInt(1);

                    order.setOrderID(orderID);

                    System.out.println(
                        "ORDER CREATED SUCCESSFULLY"
                    );

                    System.out.println(
                        "Generated OrderID: " + orderID
                    );

                    return orderID;

                } else {

                    System.out.println(
                        "ERROR: Generated OrderID not returned."
                    );
                }

            }

        } catch (SQLException e) {

            System.out.println("=================================");
            System.out.println("SQL ERROR WHILE INSERTING ORDER");
            System.out.println("=================================");

            System.out.println("SQL State : " + e.getSQLState());
            System.out.println("Error Code: " + e.getErrorCode());
            System.out.println("Message   : " + e.getMessage());

            e.printStackTrace();

        }

        return 0;

    }

    // =========================================================
    // GET ORDER BY ID
    // =========================================================

    @Override
    public OrderTable getOrder(int orderID) {

        String sql =
            "SELECT * FROM ordertable WHERE OrderID = ?";

        OrderTable order = null;

        try (PreparedStatement pstmt =
                connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderID);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {

                    order = new OrderTable();

                    order.setOrderID(
                        rs.getInt("OrderID")
                    );

                    order.setUserID(
                        rs.getInt("UserID")
                    );

                    order.setRestaurantID(
                        rs.getInt("RestaurantID")
                    );

                    order.setOrderDate(
                        rs.getTimestamp("OrderDate")
                    );

                    order.setTotalAmount(
                        rs.getDouble("TotalAmount")
                    );

                    order.setStatus(
                        rs.getString("Status")
                    );

                    order.setPaymentMethod(
                        rs.getString("PaymentMethod")
                    );

                }
            }

        } catch (SQLException e) {

            System.out.println(
                "Error while getting order: " + orderID
            );

            e.printStackTrace();

        }

        return order;

    }

    // =========================================================
    // UPDATE ORDER
    // =========================================================

    @Override
    public void updateOrder(OrderTable order) {

        String sql =
            "UPDATE ordertable SET "
            + "UserID = ?, "
            + "RestaurantID = ?, "
            + "OrderDate = ?, "
            + "TotalAmount = ?, "
            + "Status = ?, "
            + "PaymentMethod = ? "
            + "WHERE OrderID = ?";

        try (PreparedStatement pstmt =
                connection.prepareStatement(sql)) {

            pstmt.setInt(1, order.getUserID());
            pstmt.setInt(2, order.getRestaurantID());
            pstmt.setTimestamp(3, order.getOrderDate());
            pstmt.setDouble(4, order.getTotalAmount());
            pstmt.setString(5, order.getStatus());
            pstmt.setString(6, order.getPaymentMethod());
            pstmt.setInt(7, order.getOrderID());

            int rows = pstmt.executeUpdate();

            System.out.println(
                rows + " order updated"
            );

        } catch (SQLException e) {

            System.out.println(
                "Error while updating order."
            );

            e.printStackTrace();

        }

    }

    // =========================================================
    // DELETE ORDER
    // =========================================================

    @Override
    public void deleteOrder(int orderID) {

        String sql =
            "DELETE FROM ordertable WHERE OrderID = ?";

        try (PreparedStatement pstmt =
                connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderID);

            int rows = pstmt.executeUpdate();

            System.out.println(
                rows + " order deleted"
            );

        } catch (SQLException e) {

            System.out.println(
                "Error while deleting order."
            );

            e.printStackTrace();

        }

    }

    // =========================================================
    // GET ALL ORDERS
    // =========================================================

    @Override
    public List<OrderTable> getAllOrders() {

        String sql =
            "SELECT * FROM ordertable";

        List<OrderTable> orderList =
            new ArrayList<>();

        try (PreparedStatement pstmt =
                connection.prepareStatement(sql);
             ResultSet rs =
                pstmt.executeQuery()) {

            while (rs.next()) {

                OrderTable order =
                    new OrderTable();

                order.setOrderID(
                    rs.getInt("OrderID")
                );

                order.setUserID(
                    rs.getInt("UserID")
                );

                order.setRestaurantID(
                    rs.getInt("RestaurantID")
                );

                order.setOrderDate(
                    rs.getTimestamp("OrderDate")
                );

                order.setTotalAmount(
                    rs.getDouble("TotalAmount")
                );

                order.setStatus(
                    rs.getString("Status")
                );

                order.setPaymentMethod(
                    rs.getString("PaymentMethod")
                );

                orderList.add(order);

            }

        } catch (SQLException e) {

            System.out.println(
                "Error while getting all orders."
            );

            e.printStackTrace();

        }

        return orderList;

    }

    // =========================================================
    // GET ORDERS BY USER ID
    // =========================================================

    @Override
    public List<OrderTable> getOrdersByUserID(int userID) {

        String sql =
            "SELECT * FROM ordertable "
            + "WHERE UserID = ? "
            + "ORDER BY OrderDate DESC";

        List<OrderTable> orderList =
            new ArrayList<>();

        try (PreparedStatement pstmt =
                connection.prepareStatement(sql)) {

            pstmt.setInt(1, userID);

            try (ResultSet rs =
                    pstmt.executeQuery()) {

                while (rs.next()) {

                    OrderTable order =
                        new OrderTable();

                    order.setOrderID(
                        rs.getInt("OrderID")
                    );

                    order.setUserID(
                        rs.getInt("UserID")
                    );

                    order.setRestaurantID(
                        rs.getInt("RestaurantID")
                    );

                    order.setOrderDate(
                        rs.getTimestamp("OrderDate")
                    );

                    order.setTotalAmount(
                        rs.getDouble("TotalAmount")
                    );

                    order.setStatus(
                        rs.getString("Status")
                    );

                    order.setPaymentMethod(
                        rs.getString("PaymentMethod")
                    );

                    orderList.add(order);

                }
            }

        } catch (SQLException e) {

            System.out.println(
                "Error while getting orders by UserID."
            );

            e.printStackTrace();

        }

        return orderList;

    }

}