package com.tap.utility;

import java.sql.Connection;
import java.sql.Timestamp;

import com.tap.DAO.OrderTableDAO;
import com.tap.DAO.OrderItemDAO;
import com.tap.DAOimpl.OrderTableDAOImpl;
import com.tap.DAOimpl.OrderItemDAOImpl;
import com.tap.model.OrderTable;
import com.tap.model.OrderItem;

public class Test {

    public static void main(String[] args) {

        try {

            // =========================================
            // DATABASE CONNECTION
            // =========================================

            Connection connection = DBConnection.getConnection();


            // =========================================
            // CREATE DAO OBJECTS
            // =========================================

            OrderTableDAO orderDAO =
                    new OrderTableDAOImpl(connection);

            OrderItemDAO orderItemDAO =
                    new OrderItemDAOImpl();


            // =========================================
            // 1. CREATE ORDER
            // =========================================

            Timestamp orderDate =
                    new Timestamp(System.currentTimeMillis());

            OrderTable order = new OrderTable(
                    1,          // userID
                    1,          // restaurantID
                    orderDate,  // orderDate
                    440.0,      // totalAmount
                    "PLACED",   // status
                    "UPI"       // paymentMethod
            );

            orderDAO.addOrder(order);

            System.out.println("\n========== ORDER CREATED ==========");
            System.out.println(order);


            // =========================================
            // 2. GET ORDER ID
            // =========================================

            int orderID = order.getOrderID();

            System.out.println("\nGenerated OrderID: " + orderID);


            // =========================================
            // 3. CREATE ORDER ITEM
            // =========================================

            OrderItem orderItem = new OrderItem(
                    orderID,    // OrderID
                    1,          // MenuID
                    2,          // Quantity
                    440.0       // ItemTotal
            );

            orderItemDAO.addOrderItem(orderItem);

            System.out.println("\n========== ORDER ITEM CREATED ==========");
            System.out.println(orderItem);


            // =========================================
            // 4. GET ORDER
            // =========================================

            System.out.println("\n========== GET ORDER ==========");

            OrderTable fetchedOrder =
                    orderDAO.getOrder(orderID);

            System.out.println(fetchedOrder);


            // =========================================
            // 5. GET ORDER ITEM
            // =========================================

            System.out.println("\n========== GET ORDER ITEM ==========");

            OrderItem fetchedItem =
                    orderItemDAO.getOrderItem(
                            orderItem.getOrderItemID()
                    );

            System.out.println(fetchedItem);


            // =========================================
            // 6. GET ALL ORDERS
            // =========================================

            System.out.println("\n========== ALL ORDERS ==========");

            for (OrderTable o : orderDAO.getAllOrders()) {

                System.out.println(o);
            }


            // =========================================
            // 7. GET ALL ORDER ITEMS
            // =========================================

            System.out.println("\n========== ALL ORDER ITEMS ==========");

            for (OrderItem oi : orderItemDAO.getAllOrderItems()) {

                System.out.println(oi);
            }


            // =========================================
            // CLOSE CONNECTION
            // =========================================

            connection.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}