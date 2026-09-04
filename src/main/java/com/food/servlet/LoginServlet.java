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
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req,
                           HttpServletResponse resp)
                           throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAOImpl userDAOImpl = new UserDAOImpl();

        User user = userDAOImpl.getUserByEmail(email);

        if (user != null) {

            String dbPassword = user.getPassword();

            if (BCrypt.checkpw(password, dbPassword)) {

                HttpSession session = req.getSession();
                session.setAttribute("user", user);

                resp.sendRedirect(
                    req.getContextPath() + "/restaurant"
                );

            } else {

                resp.sendRedirect(
                    req.getContextPath() + "/login.html"
                );
            }

        } else {

            resp.sendRedirect(
                req.getContextPath() + "/login.html"
            );
        }
    }
}