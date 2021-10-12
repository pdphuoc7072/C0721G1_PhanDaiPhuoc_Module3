package controller;

import model.bean.User;
import model.service.impl.UserServiceImpl;

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
    private UserServiceImpl userService;

    public void init() {
        userService = new UserServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
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
                    break;
                case "permission":
                    addUserPermission (request, response);
                    break;
                case "test-without-tran":
                    testWithoutTran(request, response);
                    break;
                case "test-use-tran":
                    testUseTran(request, response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
//        List<User> userList = userService.selectAllUsers();
        List<User> userList = userService.getAllUsersBySP();
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
        userService.insertUserStore(user);
        request.setAttribute("message", "Create successful");
        request.getRequestDispatcher("user/create.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userService.getUserById(id);
        request.setAttribute("existingUser", existingUser);
        request.getRequestDispatcher("user/edit.jsp").forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User userToUpdate = new User(id, name, email, country);
//        userService.updateUser(userToUpdate);
        userService.updateUserBySP(userToUpdate);
        request.setAttribute("message", "Update successful");
        request.getRequestDispatcher("user/edit.jsp").forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
//        userService.deleteUser(id);
//        List<User> userList = userService.selectAllUsers();
//        request.setAttribute("userList", userList);
//        request.getRequestDispatcher("user/list.jsp").forward(request, response);
        userService.deleteUserBySP(id);
        listUser(request, response);
    }

    private void showSearchForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

        request.getRequestDispatcher("user/search.jsp").forward(request, response);
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String country = request.getParameter("countryForSearch");
        List<User> userListToSearch = userService.searchByCountry(country);
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
        List<User> userListForSort = userService.sortByName(sort);
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

    private void addUserPermission(HttpServletRequest request, HttpServletResponse response) {
        User user = new User("Linh", "linh123@yahoo.com", "VN");
        int[] permission = {1, 2, 3};
        userService.addUserTransaction(user, permission);
    }

    private void testWithoutTran(HttpServletRequest request, HttpServletResponse response) {
        userService.insertUpdateWithoutTransaction();
    }
    private void testUseTran(HttpServletRequest request, HttpServletResponse response) {
        userService.insertUpdateUseTransaction();
    }
}
