package model.repository.impl;

import model.bean.ServiceDetail;
import model.repository.DBConnection;
import model.repository.IServiceDetailRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceDetailRepositoryImpl implements IServiceDetailRepository {
    private static final String CALL_SP = "{CALL get_service_detail}";

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
                    String contractStartDate = resultSet.getString("contract_start_date");
                    String contractEndDate = resultSet.getString("contract_end_date");
                    int contractDetailId = resultSet.getInt("contract_detail_id");
                    String attachServiceName = resultSet.getString("attach_service_name");
                    int quantity = resultSet.getInt("quantity");
                    serviceDetail = new ServiceDetail(serviceId, serviceName, customerName, contractId,
                            contractStartDate, contractEndDate, contractDetailId, attachServiceName, quantity);
                    serviceDetailList.add(serviceDetail);
                }
            } catch (SQLException e) {
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
}
