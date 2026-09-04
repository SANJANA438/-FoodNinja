package com.food.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.tap.DAOimpl.OrderTableDAOImpl;
import com.tap.model.OrderTable;
import com.tap.utility.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        Connection con = null;

        try {

            // Get database connection
            con = DBConnection.getConnection();

            // Create DAO object
            OrderTableDAOImpl orderDAO =
                    new OrderTableDAOImpl(con);

            // Get all orders from database
            List<OrderTable> orderList =
                    orderDAO.getAllOrders();

            // Send order list to JSP
            request.setAttribute("orderList", orderList);

            // Open order.jsp
            request.getRequestDispatcher("order.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                "<h2>Error while loading order history</h2>"
            );

            response.getWriter().println(
                "<p>" + e.getMessage() + "</p>"
            );

        } finally {

            try {

                if (con != null) {
                    con.close();
                }

            } catch (Exception e) {

                e.printStackTrace();
            }
        }
    }
}