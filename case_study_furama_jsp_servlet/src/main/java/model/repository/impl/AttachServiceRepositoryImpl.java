package model.repository.impl;

import model.bean.AttachService;
import model.repository.IAttachServiceRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AttachServiceRepositoryImpl implements IAttachServiceRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_management?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Phantuankiet_1603";

    private static final String SELECT_ALL_ATTACH_SERVICE = "SELECT * FROM attach_service";

    public AttachServiceRepositoryImpl () {}

    protected Connection getConnection () {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    @Override
    public List<AttachService> selectAllAttachService() {
        List<AttachService> attachServiceList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ATTACH_SERVICE);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("attach_service_id");
                String name = resultSet.getString("attach_service_name");
                double cost = resultSet.getDouble("attach_service_cost");
                int unit = resultSet.getInt("attach_service_unit");
                String status = resultSet.getString("attach_service_status");
                AttachService attachService = new AttachService(id, name, cost, unit, status);
                attachServiceList.add(attachService);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return attachServiceList;
    }
}
