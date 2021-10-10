package controller;

import model.bean.*;
import model.service.impl.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ServiceDetailServlet", urlPatterns = "/service-detail")
public class ServiceDetailServlet extends HttpServlet {
    ServiceServiceImpl serviceService = new ServiceServiceImpl();
    CustomerServiceImpl customerService = new CustomerServiceImpl();
    ContractServiceImpl contractService = new ContractServiceImpl();
    ContractDetailServiceImpl contractDetailService = new ContractDetailServiceImpl();
    AttachServiceServiceImpl attachServiceService = new AttachServiceServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
                    break;
                default:
                    listServiceDetail (request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listServiceDetail (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Service> serviceList = serviceService.selectAllServices();
        List<Customer> customerList = customerService.selectAllCustomers();
        List<Contract> contractList = contractService.selectAllContracts();
        List<ContractDetail> contractDetailList = contractDetailService.selectAllContractDetail();
        List<AttachService> attachServiceList = attachServiceService.selectAllAttachService();
        request.setAttribute("serviceList", serviceList);
        request.setAttribute("customerList", customerList);
        request.setAttribute("contractList", contractList);
        request.setAttribute("contractDetailList", contractDetailList);
        request.setAttribute("attachServiceList", attachServiceList);
        request.getRequestDispatcher("/service-detail/list.jsp").forward(request, response);
    }
}
