package com.food.servlet;

import java.io.IOException;

import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req,
                          HttpServletResponse resp)
                          throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // Check whether session exists
        if (session == null) {

            resp.sendRedirect(
                req.getContextPath() + "/login.html"
            );

            return;
        }

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        // Check whether user is logged in
        if (user == null) {

            resp.sendRedirect(
                req.getContextPath() + "/login.html"
            );

            return;
        }

        // Send user object to profile.jsp
        req.setAttribute("user", user);

        // Open profile page
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/profile.jsp");

        dispatcher.forward(req, resp);
    }
}