package com.food.servlet;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOimpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("userName");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String role = req.getParameter("role");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");

        // Hash password
        String hashpw = BCrypt.hashpw(
                password,
                BCrypt.gensalt(12)
        );

        // PHONE IS LAST
        User user = new User(
                name,
                email,
                address,
                role,
                hashpw,
                phone
        );

        UserDAOImpl userDAOImpl = new UserDAOImpl();

        int result = userDAOImpl.addUser(user);

        System.out.println("Registration result = " + result);

        if (result == 1) {

            System.out.println("Registration successful");

            resp.sendRedirect(
                req.getContextPath() + "/login.html"
            );

        } else {

            System.out.println("Registration failed");

            resp.sendRedirect(
                req.getContextPath() + "/register.html"
            );
        }
    }
}