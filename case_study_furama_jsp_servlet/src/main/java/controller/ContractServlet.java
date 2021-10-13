package controller;

import model.bean.*;
import model.service.impl.ContractServiceImpl;
import model.service.impl.CustomerServiceImpl;
import model.service.impl.EmployeeServiceImpl;
import model.service.impl.ServiceServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ContractServlet", urlPatterns = "/contract")
public class ContractServlet extends HttpServlet {
    ContractServiceImpl contractService = new ContractServiceImpl();
    EmployeeServiceImpl employeeService = new EmployeeServiceImpl();
    CustomerServiceImpl customerService = new CustomerServiceImpl();
    ServiceServiceImpl serviceService = new ServiceServiceImpl();

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
                    createNewContract (request, response);
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
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateForm (request, response);
                    break;
                default:
                    listContract (request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listContract (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Contract> contractList = contractService.selectAllContracts();
        List<Employee> employeeList = employeeService.selectAllEmployees();
        List<Customer> customerList = customerService.selectAllCustomers();
        List<Service> serviceList = serviceService.selectAllServices();
        request.setAttribute("contractList", contractList);
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("customerList", customerList);
        request.setAttribute("serviceList", serviceList);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        request.setAttribute("user", user);
        request.getRequestDispatcher("/contract/list.jsp").forward(request, response);
    }
    private void showCreateForm (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Employee> employeeList = employeeService.selectAllEmployees();
        List<Customer> customerList = customerService.selectAllCustomers();
        List<Service> serviceList = serviceService.selectAllServices();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("customerList", customerList);
        request.setAttribute("serviceList", serviceList);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        request.setAttribute("user", user);
        request.getRequestDispatcher("/contract/create.jsp").forward(request, response);
    }
    private void createNewContract (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        double deposit = Double.parseDouble(request.getParameter("deposit"));
        double totalMoney = Double.parseDouble(request.getParameter("total_money"));
        int employeeId = Integer.parseInt(request.getParameter("employee_id"));
        int customerId = Integer.parseInt(request.getParameter("customer_id"));
        int serviceId = Integer.parseInt(request.getParameter("service_id"));
        Contract contract = new Contract(startDate, endDate, deposit, totalMoney, employeeId, customerId, serviceId);
        contractService.insertContract(contract);
        request.setAttribute("message", "Create successful");
        request.getRequestDispatcher("/contract/create.jsp").forward(request, response);
    }
}
