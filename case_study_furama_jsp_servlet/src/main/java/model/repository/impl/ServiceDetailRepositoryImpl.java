package model.repository.impl;

import model.bean.ServiceDetail;
import model.repository.DBConnection;
import model.repository.IServiceDetailRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class ServiceDetailRepositoryImpl implements IServiceDetailRepository {
    private static final String CALL_SP = "{CALL get_service_detail}";
    private static final String CALL_SP_ID = "{CALL get_service_detail_by_id (?)}";

    @Override
    public List<ServiceDetail> selectAllServiceDetail() {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;
        List<ServiceDetail> serviceDetailList = new ArrayList<>();

        if (connection != null) {
            try {
                callableStatement = connection.prepareCall(CALL_SP);
                resultSet = callableStatement.executeQuery();
                ServiceDetail serviceDetail = null;
                while (resultSet.next()) {
                    int serviceId = resultSet.getInt("service_id");
                    String serviceName = resultSet.getString("service_name");
                    String customerName = resultSet.getString("customer_name");
                    int contractId = resultSet.getInt("contract_id");
                    String contractStartDateSQL = resultSet.getString("contract_start_date");
                    String contractStartDate = new SimpleDateFormat("dd-MM-yyyy").format
                            (new SimpleDateFormat("yyyy-MM-dd").parse(contractStartDateSQL));
                    String contractEndDateSQL = resultSet.getString("contract_end_date");
                    String contractEndDate = new SimpleDateFormat("dd-MM-yyyy").format
                            (new SimpleDateFormat("yyyy-MM-dd").parse(contractEndDateSQL));
                    int contractDetailId = resultSet.getInt("contract_detail_id");
                    String attachServiceName = resultSet.getString("attach_service_name");
                    int quantity = resultSet.getInt("quantity");
                    serviceDetail = new ServiceDetail(serviceId, serviceName, customerName, contractId,
                            contractStartDate, contractEndDate, contractDetailId, attachServiceName, quantity);
                    serviceDetailList.add(serviceDetail);
                }
            } catch (SQLException | ParseException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    callableStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return serviceDetailList;
    }

    @Override
    public List<ServiceDetail> selectServiceDetailById(int id) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;
        List<ServiceDetail> serviceDetailListById = new ArrayList<>();

        if (connection != null) {
            try {
                callableStatement = connection.prepareCall(CALL_SP_ID);
                callableStatement.setInt(1, id);
                resultSet = callableStatement.executeQuery();
                ServiceDetail serviceDetail = null;
                while (resultSet.next()) {
                    int serviceId = resultSet.getInt("service_id");
                    String serviceName = resultSet.getString("service_name");
                    String customerName = resultSet.getString("customer_name");
                    String contractStartDateSQL = resultSet.getString("contract_start_date");
                    String contractStartDate = new SimpleDateFormat("dd-MM-yyyy").format
                            (new SimpleDateFormat("yyyy-MM-dd").parse(contractStartDateSQL));
                    String contractEndDateSQL = resultSet.getString("contract_end_date");
                    String contractEndDate = new SimpleDateFormat("dd-MM-yyyy").format
                            (new SimpleDateFormat("yyyy-MM-dd").parse(contractEndDateSQL));
                    int contractDetailId = resultSet.getInt("contract_detail_id");
                    String attachServiceName = resultSet.getString("attach_service_name");
                    int quantity = resultSet.getInt("quantity");
                    serviceDetail = new ServiceDetail(serviceId, serviceName, customerName, id,
                            contractStartDate, contractEndDate, contractDetailId, attachServiceName, quantity);
                    serviceDetailListById.add(serviceDetail);
                }
            } catch (SQLException | ParseException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    callableStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return serviceDetailListById;
    }
}
