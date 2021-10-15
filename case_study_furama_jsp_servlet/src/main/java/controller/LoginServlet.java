package controller;

import model.bean.User;
import model.service.impl.EmployeeServiceImpl;
import model.service.impl.UserServiceImpl;

import javax.jws.soap.SOAPBinding;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    UserServiceImpl userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        User user = userService.selectUser(username, password);
        if (user == null) {
            request.setAttribute("message", "Wrong username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();

            Cookie cookieUserName = new Cookie("userNameCookie", user.getUsername());
            Cookie cookiePassword = new Cookie("passwordCookie", user.getPassword());
            if (remember != null) {
                cookieUserName.setMaxAge(60 * 60);
                cookiePassword.setMaxAge(60 * 60);
            } else {
                cookieUserName.setMaxAge(0);
                cookiePassword.setMaxAge(0);
            }

            response.addCookie(cookieUserName);
            response.addCookie(cookiePassword);

            session.setAttribute("user", user);
            session.setAttribute("sessionUserName", username);

            response.sendRedirect("home");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie cookie[] = request.getCookies();
        if (cookie != null) {
            for (Cookie o : cookie) {
                if (o.getName().equals("userNameCookie")) {
                    request.setAttribute("userNameCookie", o.getValue());
                }
                if (o.getName().equals("passwordCookie")) {
                    request.setAttribute("passwordCookie", o.getValue());
                }
            }
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);

    }
}
