package com.food.servlet;

import java.io.IOException;

import com.tap.DAOimpl.MenuDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        int newRestaurantID =
                Integer.parseInt(req.getParameter("restaurantID"));

        Integer restaurantIDObj =
                (Integer) session.getAttribute("restaurantID");

        int restaurantID;

        if (restaurantIDObj == null) {

            restaurantID = newRestaurantID;

        } else {

            restaurantID = restaurantIDObj;
        }

        if (cart == null || restaurantID != newRestaurantID) {

            cart = new Cart();

            session.setAttribute("cart", cart);

            session.setAttribute("restaurantID", newRestaurantID);
        }

        String action = req.getParameter("action");

        if (action.equals("add")) {

            addItemToCart(req, cart);

        } else if (action.equals("update")) {

            updateItemToCart(req, cart);

        } else {

            removeItemToCart(req,cart);
        }

        RequestDispatcher rd = req.getRequestDispatcher("cart.jsp");

        rd.forward(req, resp);
    }

    private void removeItemToCart(HttpServletRequest req, Cart cart) {
    	int menuID=Integer.parseInt(req.getParameter("menuID"));
       cart.removeItem(menuID);
    }
    

    private void updateItemToCart(HttpServletRequest req, Cart cart) {

        int menuID = Integer.parseInt(req.getParameter("menuID"));

        int quantity = Integer.parseInt(req.getParameter("qty"));

        cart.updateItem(menuID, quantity);
    }

    private void addItemToCart(HttpServletRequest req, Cart cart) {

        int menuID =
                Integer.parseInt(req.getParameter("menuID"));

        int qty =
                Integer.parseInt(req.getParameter("qty"));

        MenuDAOImpl menuDAOImpl =
                new MenuDAOImpl();

        Menu menu =
                menuDAOImpl.getMenu(menuID);

        HttpSession session = req.getSession();

        session.setAttribute("restaurantID", menu.getRestaurantId());

        CartItem cartItem =
                new CartItem(
                        menu.getMenuId(),
                        menu.getRestaurantId(),
                        menu.getItemName(),
                        menu.getPrice(),
                        qty
                );

        cart.addItem(cartItem);
    }
}