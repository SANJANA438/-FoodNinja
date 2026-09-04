package com.food.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;

import com.tap.DAOimpl.OrderTableDAOImpl;
import com.tap.DAOimpl.OrderItemDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.OrderItem;
import com.tap.model.OrderTable;
import com.tap.model.User;
import com.tap.utility.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkoutServlet")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
                           throws ServletException, IOException {

        HttpSession session = request.getSession();
        Connection con = null;

        try {

            // ==========================================
            // 1. GET LOGGED-IN USER
            // ==========================================

            User user = (User) session.getAttribute("user");

            if (user == null) {

                response.sendRedirect(
                    request.getContextPath() + "/login.html"
                );

                return;
            }

            // ==========================================
            // 2. GET USER ID
            // ==========================================

            int userID = user.getUserID();

            // ==========================================
            // 3. GET CHECKOUT DETAILS
            // ==========================================

            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String paymentMode = request.getParameter("paymentMode");

            // ==========================================
            // 4. VALIDATE CHECKOUT DETAILS
            // ==========================================

            if (name == null || name.trim().isEmpty()) {

                throw new Exception("Name is required.");
            }

            if (phone == null || phone.trim().isEmpty()) {

                throw new Exception("Phone number is required.");
            }

            if (address == null || address.trim().isEmpty()) {

                throw new Exception("Address is required.");
            }

            if (paymentMode == null || paymentMode.trim().isEmpty()) {

                throw new Exception("Payment method is required.");
            }

            // ==========================================
            // 5. GET CART
            // ==========================================

            Cart cart = (Cart) session.getAttribute("cart");

            if (cart == null ||
                cart.getItem() == null ||
                cart.getItem().isEmpty()) {

                response.sendRedirect(
                    request.getContextPath() + "/cart.jsp"
                );

                return;
            }

            // ==========================================
            // 6. GET RESTAURANT ID
            // ==========================================

            Integer restaurantID =
                (Integer) session.getAttribute("restaurantID");

            if (restaurantID == null) {

                for (CartItem item : cart.getItem().values()) {

                    restaurantID = item.getRestaurantID();

                    break;
                }
            }

            if (restaurantID == null) {

                throw new Exception(
                    "Restaurant ID is missing."
                );
            }

            // ==========================================
            // 7. CALCULATE SUBTOTAL
            // ==========================================

            double subTotal = 0.0;

            for (CartItem item : cart.getItem().values()) {

                double itemTotal =
                    item.getPrice() * item.getQty();

                subTotal += itemTotal;
            }

            // ==========================================
            // 8. CALCULATE TOTAL
            // ==========================================

            double deliveryCharge = 40.0;

            double gst = subTotal * 0.05;

            double grandTotal =
                subTotal + deliveryCharge + gst;

            // ==========================================
            // 9. DATABASE CONNECTION
            // ==========================================

            con = DBConnection.getConnection();

            if (con == null) {

                throw new Exception(
                    "Database connection is null."
                );
            }

            // ==========================================
            // 10. CREATE ORDER DAO
            // ==========================================

            OrderTableDAOImpl orderDAO =
                new OrderTableDAOImpl(con);

            // ==========================================
            // 11. CREATE ORDER OBJECT
            // ==========================================

            OrderTable order =
                new OrderTable(
                    userID,
                    restaurantID,
                    new Timestamp(
                        System.currentTimeMillis()
                    ),
                    grandTotal,
                    "PLACED",
                    paymentMode
                );

            // ==========================================
            // 12. INSERT ORDER
            // ==========================================

            int orderID =
                orderDAO.addOrder(order);

            if (orderID <= 0) {

                throw new Exception(
                    "Order could not be created in database."
                );
            }

            System.out.println(
                "================================="
            );

            System.out.println(
                "ORDER CREATED SUCCESSFULLY"
            );

            System.out.println(
                "Order ID: " + orderID
            );

            System.out.println(
                "User ID: " + userID
            );

            System.out.println(
                "Restaurant ID: " + restaurantID
            );

            System.out.println(
                "Total: " + grandTotal
            );

            System.out.println(
                "Payment: " + paymentMode
            );

            System.out.println(
                "================================="
            );

            // ==========================================
            // 13. CREATE AND SAVE ORDER ITEMS
            // ==========================================

            OrderItemDAOImpl orderItemDAO =
                new OrderItemDAOImpl();

            for (CartItem item :
                 cart.getItem().values()) {

                double itemTotal =
                    item.getPrice() * item.getQty();

                OrderItem orderItem =
                    new OrderItem(
                        orderID,
                        item.getMenuID(),
                        item.getQty(),
                        itemTotal
                    );

                orderItemDAO.addOrderItem(orderItem);

                System.out.println(
                    "OrderItem saved: "
                    + orderItem
                );
            }

            // ==========================================
            // 14. SAVE ORDER DETAILS IN SESSION
            // ==========================================

            session.setAttribute(
                "orderID",
                orderID
            );

            session.setAttribute(
                "orderName",
                name
            );

            session.setAttribute(
                "orderPhone",
                phone
            );

            session.setAttribute(
                "orderAddress",
                address
            );

            session.setAttribute(
                "paymentMode",
                paymentMode
            );

            session.setAttribute(
                "orderTotal",
                grandTotal
            );

            session.setAttribute(
                "orderStatus",
                "PLACED"
            );

            // ==========================================
            // 15. CLEAR CART
            // ==========================================

            session.removeAttribute("cart");

            session.removeAttribute("grandTotal");

            // ==========================================
            // 16. REDIRECT TO ORDER CONFIRMATION
            // ==========================================

            response.sendRedirect(
                request.getContextPath()
                + "/orderConfirmation.jsp"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/plain");

            response.getWriter().println(
                "ORDER ERROR: " + e.getMessage()
            );

            e.printStackTrace(
                response.getWriter()
            );

        } finally {

            // ==========================================
            // CLOSE DATABASE CONNECTION
            // ==========================================

            if (con != null) {

                try {

                    con.close();

                } catch (Exception e) {

                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        doPost(request, response);
    }
}