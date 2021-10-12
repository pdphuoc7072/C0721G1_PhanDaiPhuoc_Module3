package controller;

import model.bean.ServiceDetail;
import model.service.impl.ServiceDetailServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ServiceContractDetailServlet", urlPatterns = "/service-contract-detail")
public class ServiceContractDetailServlet extends HttpServlet {
    ServiceDetailServiceImpl serviceDetailService = new ServiceDetailServiceImpl();

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
                case "show":
                    showServiceContractDetail (request, response);
                    break;
                default:
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void showServiceContractDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<ServiceDetail> serviceDetailListById = serviceDetailService.selectServiceDetailById(id);

        request.setAttribute("serviceDetailListById", serviceDetailListById);
        request.setAttribute("id", id);
        request.getRequestDispatcher("/service-contract-detail/list.jsp").forward(request, response);
    }
}
