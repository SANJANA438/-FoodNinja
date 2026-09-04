package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOimpl.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();

        // Get all restaurants from database
        List<Restaurant> allRestaurants =
                restaurantDAO.getAllRestaurant();

        // Debug
        System.out.println("Restaurants found: "
                + (allRestaurants == null
                ? "NULL"
                : allRestaurants.size()));

        // Send restaurants to home.jsp
        request.setAttribute("allrestaurant", allRestaurants);

        // Open home.jsp
        request.getRequestDispatcher("/home.jsp")
               .forward(request, response);
    }
}