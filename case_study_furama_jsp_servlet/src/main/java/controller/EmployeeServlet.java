package controller;

import model.bean.Employee;
import model.bean.User;
import model.service.impl.EmployeeServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    EmployeeServiceImpl employeeService = new EmployeeServiceImpl();

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
                    createNewEmployee(request, response);
                    break;
                case "edit":
                    editEmployee(request, response);
                    break;
                case "search":
                    searchEmployee(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    if (user.getRoleId() == 1) {
                        showCreateForm(request, response);
                    } else {
                        response.sendRedirect("error-404.jsp");
                    }
                    break;
                case "edit":
                    if (user.getRoleId() == 1) {
                        showEditForm(request, response);
                    } else {
                        response.sendRedirect("error-404.jsp");
                    }
                    break;
                case "delete":
                    deleteEmployee(request, response);
                    break;
                case "search":
                    showSearchForm(request, response);
                    break;
                default:
                    listEmployee(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Employee> employeeList = employeeService.selectAllEmployees();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        request.setAttribute("user", user);
        request.setAttribute("employeeList", employeeList);
        request.getRequestDispatcher("employee/list.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        request.setAttribute("user", user);
        request.getRequestDispatcher("employee/create.jsp").forward(request, response);
    }

    private void createNewEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        boolean flag = false;
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("id_card");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("position_id"));
        int educationDegreeId = Integer.parseInt(request.getParameter("education_degree_id"));
        int divisionId = Integer.parseInt(request.getParameter("division_id"));
        String username = request.getParameter("username");
        Employee employee = new Employee(name, birthday, idCard, salary, phone, email, address, positionId, educationDegreeId, divisionId, username);
        flag = employeeService.insertEmployee(employee);
        if (flag) {
            request.setAttribute("message1", "Create successful");
        } else {
            request.setAttribute("message2", "Create unsuccessful");
        }
        request.getRequestDispatcher("employee/create.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.selectEmployee(id);
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("/employee/edit.jsp").forward(request, response);
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        boolean flag = false;
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String idCard = request.getParameter("id_card");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String position = request.getParameter("position");
        int positionId = 0;
        switch (position) {
            case "Lễ tân":
                positionId = 1;
                break;
            case "Phục vụ":
                positionId = 2;
                break;
            case "Chuyên viên":
                positionId = 3;
                break;
            case "Giám sát":
                positionId = 4;
                break;
            case "Quản lý":
                positionId = 5;
                break;
            case "Giám đốc":
                positionId = 6;
                break;
        }
        String educationDegree = request.getParameter("education_degree");
        int educationDegreeId = 0;
        switch (educationDegree) {
            case "Trung cấp":
                educationDegreeId = 1;
                break;
            case "Cao đẳng":
                educationDegreeId = 2;
                break;
            case "Đại học":
                educationDegreeId = 3;
                break;
            case "Sau đại học":
                educationDegreeId = 4;
                break;
        }
        String division = request.getParameter("division");
        int divisionId = 0;
        switch (division) {
            case "Sale - Marketing":
                divisionId = 1;
                break;
            case "Hành chính":
                divisionId = 2;
                break;
            case "Phục vụ":
                divisionId = 3;
                break;
            case "Quản lý":
                divisionId = 4;
                break;
        }
        String username = request.getParameter("username");
        Employee employee = new Employee(id, name, birthday, idCard, salary, phone, email, address, positionId, educationDegreeId, divisionId, username);
        flag = employeeService.updateEmployee(employee);
        if (flag) {
            request.setAttribute("message1", "Edit successful");
        } else {
            request.setAttribute("message2", "Edit unsuccessful");
        }
        request.getRequestDispatcher("/employee/edit.jsp").forward(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.deleteEmployee(id);
        List<Employee> employeeList = employeeService.selectAllEmployees();
        request.setAttribute("employeeList", employeeList);
        request.getRequestDispatcher("/employee/list.jsp").forward(request, response);
    }

    private void showSearchForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String search = request.getParameter("search");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        request.setAttribute("user", user);
        request.setAttribute("search", search);
        request.getRequestDispatcher("/employee/search.jsp").forward(request, response);
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String searchNP = request.getParameter("search");
        List<Employee> employeeList = new ArrayList<>();
        RequestDispatcher dispatcher;
        switch (searchNP) {
            case "name":
                String searchName = request.getParameter("name");
                employeeList = employeeService.searchEmployeeByName(searchName);
                if (employeeList == null) {
                    dispatcher = request.getRequestDispatcher("/error-404.jsp");
                } else {
                    request.setAttribute("search", searchNP);
                    request.setAttribute("employeeList", employeeList);
                    request.setAttribute("message", "Search successful");
                    dispatcher = request.getRequestDispatcher("/employee/search-result.jsp");
                    dispatcher.forward(request, response);
                }
                break;
            case "phone":
                String searchPhone = request.getParameter("phone");
                employeeList = employeeService.searchEmployeeByPhone(searchPhone);
                if (employeeList == null) {
                    dispatcher = request.getRequestDispatcher("/error-404.jsp");
                } else {
                    request.setAttribute("search", searchNP);
                    request.setAttribute("employeeList", employeeList);
                    request.setAttribute("message", "Search successful");
                    dispatcher = request.getRequestDispatcher("/employee/search-result.jsp");
                    dispatcher.forward(request, response);
                }
                break;
        }
    }
}
