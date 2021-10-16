package controller;

import model.bean.*;
import model.repository.impl.ServiceDetailRepositoryImpl;
import model.service.impl.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ServiceDetailServlet", urlPatterns = "/service-detail")
public class ServiceDetailServlet extends HttpServlet {
    ServiceDetailServiceImpl serviceDetailService = new ServiceDetailServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        List<ServiceDetail> serviceDetailList = serviceDetailService.selectAllServiceDetail();
        request.setAttribute("serviceDetailList", serviceDetailList);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        request.setAttribute("user", user);
        request.getRequestDispatcher("/service-detail/list.jsp").forward(request, response);
    }
}
