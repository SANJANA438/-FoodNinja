package com.food.servlet; 
 
import java.io.IOException; 
import java.util.List; 
 
import com.tap.DAOimpl.MenuDAOImpl; 
import com.tap.model.Menu; 
 
import jakarta.servlet.RequestDispatcher; 
import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet; 
import jakarta.servlet.http.HttpServlet; 
import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpServletResponse; 
import jakarta.servlet.http.HttpSession; 

@WebServlet("/menu") 
public class MenuServlet extends HttpServlet { 
 
    @Override 
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException { 
        
        MenuDAOImpl menuDAOImpl = new MenuDAOImpl(); 
        
        int restaurantID = Integer.parseInt(
                req.getParameter("restaurantID")
        ); 
        
        // Store restaurant ID in session
        HttpSession session = req.getSession();
        session.setAttribute("restaurantId", restaurantID);
        
        List<Menu> allMenus = menuDAOImpl.getAllMenus(restaurantID); 
        
        for(Menu menu : allMenus) { 
            System.out.println(menu); 
        } 
        
        req.setAttribute("allMenus", allMenus); 
        
        RequestDispatcher rd = req.getRequestDispatcher("Menu.jsp"); 
        rd.forward(req, resp); 
    } 
}