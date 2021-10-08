package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private static final long SERIAL_VERSION_UID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    createNewUser(request, response);
                    break;
                case "edit":
                    updateUser(request, response);
                    break;
                case "search":
                    searchUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "search":
                    showSearchForm(request, response);
                    break;
                case "sort":
                    sortUser (request, response);
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<User> userList = userDAO.selectAllUsers();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("user/list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("user/create.jsp").forward(request, response);
    }

    private void createNewUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        userDAO.insertUser(user);
        request.setAttribute("message", "Create successful");
        request.getRequestDispatcher("user/create.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDAO.selectUser(id);
        request.setAttribute("existingUser", existingUser);
        request.getRequestDispatcher("user/edit.jsp").forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User userToUpdate = new User(id, name, email, country);
        userDAO.updateUser(userToUpdate);
        request.setAttribute("message", "Update successful");
        request.getRequestDispatcher("user/edit.jsp").forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(id);
        List<User> userList = userDAO.selectAllUsers();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("user/list.jsp").forward(request, response);
    }

    private void showSearchForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

        request.getRequestDispatcher("user/search.jsp").forward(request, response);
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String country = request.getParameter("countryForSearch");
        List<User> userListToSearch = userDAO.searchByCountry(country);
        request.setAttribute("userListToSearch", userListToSearch);
        RequestDispatcher dispatcher;
        if (userListToSearch == null) {
            dispatcher = request.getRequestDispatcher("/error-404.jsp");
        } else {
            request.setAttribute("userListToSearch", userListToSearch);
            request.setAttribute("message", "Search successful");
            dispatcher = request.getRequestDispatcher("/user/search-by-country.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void sortUser (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String sort = request.getParameter("sort");
        List<User> userListForSort = userDAO.sortByName(sort);
        RequestDispatcher dispatcher;
        if (userListForSort == null) {
            dispatcher = request.getRequestDispatcher("/error-404.jsp");
        } else {
            request.setAttribute("userListForSort", userListForSort);
            request.setAttribute("message", "Sort successful");
            dispatcher = request.getRequestDispatcher("/user/sort-by-name.jsp");
            dispatcher.forward(request, response);
        }
    }
}
