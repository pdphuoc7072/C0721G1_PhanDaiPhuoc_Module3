package controller;

import model.bean.Customer;
import model.service.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {

    CustomerServiceImpl customerService = new CustomerServiceImpl();
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
                    createNewCustomer (request, response);
                    break;
                case "edit":
                    editCustomer (request, response);
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
                    showCreateForm (request, response);
                    break;
                case "edit":
                    showEditForm (request, response);
                    break;
                case "delete":
                    deleteCustomer (request, response);
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
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("id_card");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeId = Integer.parseInt(request.getParameter("customer_type_id"));
        Customer customer = new Customer(name, birthday, gender, idCard, phone, email, address, customerTypeId);
        customerService.insertCustomer(customer);
        request.setAttribute("message", "Create successful");
        request.getRequestDispatcher("customer/create.jsp").forward(request, response);
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
        request.getRequestDispatcher("customer/edit.jsp").forward(request, response);
    }
    private void editCustomer (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
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
        Customer customer = new Customer(id, name, birthday, genderSQL, idCard, phone, email, address, customerTypeIdSQL);
        customerService.updateCustomer(customer);
        request.setAttribute("message", "Update successful");
        request.getRequestDispatcher("customer/edit.jsp").forward(request, response);
    }
}
