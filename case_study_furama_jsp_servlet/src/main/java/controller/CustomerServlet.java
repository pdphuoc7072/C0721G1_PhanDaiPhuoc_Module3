package controller;

import model.bean.Customer;
import model.bean.Employee;
import model.bean.User;
import model.service.impl.CustomerServiceImpl;

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

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {

    CustomerServiceImpl customerService = new CustomerServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    createNewCustomer (request, response);
                    break;
                case "edit":
                    editCustomer (request, response);
                    break;
                case "search":
                    searchCustomer(request, response);
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
                    showCreateForm (request, response);
                    break;
                case "edit":
                    showEditForm (request, response);
                    break;
                case "delete":
                    deleteCustomer (request, response);
                    break;
                case "search":
                    showSearchForm(request, response);
                    break;
                default:
                    listCustomer (request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listCustomer (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Customer> customerList = customerService.selectAllCustomers();
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("customer/list.jsp").forward(request, response);
    }

    private void showCreateForm (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        request.getRequestDispatcher("customer/create.jsp").forward(request, response);
    }

    private void createNewCustomer (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        boolean flag = false;
        String customerCode = request.getParameter("customer_code");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("id_card");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeId = Integer.parseInt(request.getParameter("customer_type_id"));
        Customer customer = new Customer(customerCode, name, birthday, gender, idCard, phone, email, address, customerTypeId);
        flag = customerService.insertCustomer(customer);
        if (flag) {
            request.setAttribute("message1", "Create successful");
        } else {
            request.setAttribute("message2", "Create unsuccessful");
        }
        request.getRequestDispatcher("/customer/create.jsp").forward(request, response);
    }
    private void deleteCustomer (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.deleteCustomer(id);
        List<Customer> customerList = customerService.selectAllCustomers();
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("/customer/list.jsp").forward(request, response);
    }
    private void showEditForm (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.selectCustomer(id);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("/customer/edit.jsp").forward(request, response);
    }
    private void editCustomer (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        boolean flag = false;
        int id = Integer.parseInt(request.getParameter("id"));
        String customerCode = request.getParameter("customer_code");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        int genderSQL = 0;
        switch (gender) {
            case "Nam":
                genderSQL = 1;
                break;
            case "Nữ":
                genderSQL = 2;
                break;
            case "LGBT":
                genderSQL = 3;
                break;
        }
        String idCard = request.getParameter("id_card");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String customerTypeId = request.getParameter("customer_type_id");
        int customerTypeIdSQL = 0;
        switch (customerTypeId) {
            case "Diamond":
                customerTypeIdSQL = 1;
                break;
            case "Platinium":
                customerTypeIdSQL = 2;
                break;
            case "Gold":
                customerTypeIdSQL = 3;
                break;
            case "Silver":
                customerTypeIdSQL = 4;
                break;
            case "Member":
                customerTypeIdSQL = 5;
                break;
        }
        Customer customer = new Customer(id, customerCode, name, birthday, genderSQL, idCard, phone, email, address, customerTypeIdSQL);
        flag = customerService.updateCustomer(customer);
        if (flag) {
            request.setAttribute("message1", "Edit successful");
        } else {
            request.setAttribute("message2", "Edit unsuccessful");
        }
        request.getRequestDispatcher("/customer/edit.jsp").forward(request, response);
    }

    private void showSearchForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String search = request.getParameter("search");
        request.setAttribute("search", search);
        request.getRequestDispatcher("/customer/search.jsp").forward(request, response);
    }

    private void searchCustomer (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String searchNP = request.getParameter("search");
        List<Customer> customerList = new ArrayList<>();
        RequestDispatcher dispatcher;
        switch (searchNP) {
            case "name":
                String searchName = request.getParameter("name");
                customerList = customerService.searchCustomerByName(searchName);
                if (customerList == null) {
                    dispatcher = request.getRequestDispatcher("/error-404.jsp");
                } else {
                    request.setAttribute("search", searchNP);
                    request.setAttribute("customerList", customerList);
                    request.setAttribute("message", "Search successful");
                    dispatcher = request.getRequestDispatcher("/customer/search-result.jsp");
                    dispatcher.forward(request, response);
                }
                break;
            case "phone":
                String searchPhone = request.getParameter("phone");
                customerList = customerService.searchCustomerByPhone(searchPhone);
                if (customerList == null) {
                    dispatcher = request.getRequestDispatcher("/error-404.jsp");
                } else {
                    request.setAttribute("search", searchNP);
                    request.setAttribute("customerList", customerList);
                    request.setAttribute("message", "Search successful");
                    dispatcher = request.getRequestDispatcher("/customer/search-result.jsp");
                    dispatcher.forward(request, response);
                }
                break;
        }
    }
}
