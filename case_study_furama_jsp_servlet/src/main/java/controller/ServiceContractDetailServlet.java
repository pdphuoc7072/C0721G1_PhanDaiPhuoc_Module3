package controller;

import model.bean.AttachService;
import model.bean.ContractDetail;
import model.service.impl.AttachServiceServiceImpl;
import model.service.impl.ContractDetailServiceImpl;

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
                case "show":
                    showContractDetail (request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void showContractDetail (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<ContractDetail> contractDetailList = contractDetailService.selectContractDetailByContractId(id);
        List<AttachService> attachServiceList = attachServiceService.selectAllAttachService();
        request.setAttribute("contractDetailList", contractDetailList);
        request.setAttribute("attachServiceList", attachServiceList);
        request.getRequestDispatcher("/service-contract-detail/list.jsp").forward(request, response);
    }
}
