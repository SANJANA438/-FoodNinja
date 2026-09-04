package com.tap.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    @Override
    public void addOrderItem(OrderItem orderItem) {

        String sql = "INSERT INTO orderitem "
                   + "(OrderID, MenuID, Quantity, ItemTotal) "
                   + "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                     sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, orderItem.getOrderID());
            pstmt.setInt(2, orderItem.getMenuID());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setDouble(4, orderItem.getItemTotal());

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                System.out.println("OrderItem added successfully");
            }

            ResultSet rs = pstmt.getGeneratedKeys();

            if (rs.next()) {
                orderItem.setOrderItemID(rs.getInt(1));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public OrderItem getOrderItem(int orderItemID) {

        String sql = "SELECT * FROM orderitem WHERE OrderItemID = ?";

        OrderItem orderItem = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, orderItemID);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                orderItem = new OrderItem();

                orderItem.setOrderItemID(rs.getInt("OrderItemID"));
                orderItem.setOrderID(rs.getInt("OrderID"));
                orderItem.setMenuID(rs.getInt("MenuID"));
                orderItem.setQuantity(rs.getInt("Quantity"));
                orderItem.setItemTotal(rs.getDouble("ItemTotal"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderItem;
    }

    @Override
    public List<OrderItem> getAllOrderItems() {

        String sql = "SELECT * FROM orderitem";

        List<OrderItem> orderItems = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {

                OrderItem orderItem = new OrderItem();

                orderItem.setOrderItemID(rs.getInt("OrderItemID"));
                orderItem.setOrderID(rs.getInt("OrderID"));
                orderItem.setMenuID(rs.getInt("MenuID"));
                orderItem.setQuantity(rs.getInt("Quantity"));
                orderItem.setItemTotal(rs.getDouble("ItemTotal"));

                orderItems.add(orderItem);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderItems;
    }

    @Override
    public void updateOrderItem(OrderItem orderItem) {

        String sql = "UPDATE orderitem SET "
                   + "OrderID = ?, "
                   + "MenuID = ?, "
                   + "Quantity = ?, "
                   + "ItemTotal = ? "
                   + "WHERE OrderItemID = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, orderItem.getOrderID());
            pstmt.setInt(2, orderItem.getMenuID());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setDouble(4, orderItem.getItemTotal());
            pstmt.setInt(5, orderItem.getOrderItemID());

            int rows = pstmt.executeUpdate();

            System.out.println(rows + " order item updated");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrderItem(int orderItemID) {

        String sql = "DELETE FROM orderitem WHERE OrderItemID = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, orderItemID);

            int rows = pstmt.executeUpdate();

            System.out.println(rows + " order item deleted");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}