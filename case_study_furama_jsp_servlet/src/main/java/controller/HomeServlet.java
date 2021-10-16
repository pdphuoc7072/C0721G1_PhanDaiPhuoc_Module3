package controller;

import model.bean.User;
import model.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "HomeServlet", urlPatterns = "/home")
public class HomeServlet extends HttpServlet {
    UserServiceImpl userService = new UserServiceImpl();
    User user = null;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = "";
        String password = "";
        HttpSession session = request.getSession();
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userNameCookie")) {
                    username = cookie.getValue();
                }
                if (cookie.getName().equals("passwordCookie")) {
                    password = cookie.getValue();
                }
            }
            if ((user = userService.selectUser(username, password)) != null) {
                session.setAttribute("user", user);
                session.setAttribute("sessionUserName", username);
            }
        }
        if (session.getAttribute("sessionUserName") == null) {
            response.sendRedirect("login.jsp");
        } else {
            request.getRequestDispatcher("/home/home.jsp").forward(request, response);
        }
    }
}
