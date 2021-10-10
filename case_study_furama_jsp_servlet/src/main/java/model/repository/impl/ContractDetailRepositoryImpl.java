package model.repository.impl;

import model.bean.ContractDetail;
import model.repository.IContractDetailRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContractDetailRepositoryImpl implements IContractDetailRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_management?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Phantuankiet_1603";

    private static final String SELECT_ALL_CONTRACT_DETAIL = "SELECT * FROM contract_detail";
    private static final String SELECT_CONTRACT_DETAIL_BY_ID = "SELECT * FROM contract_detail WHERE contract_detail_id = ?";
    private static final String INSERT_CONTRACT_DETAIL_SQL = "INSERT INTO contract_detail (contract_id, attach_service_id, " +
            "quantity) VALUES (?, ?, ?);";
    private static final String SELECT_CONTRACT_DETAIL_BY_CONTRACT_ID = "SELECT * FROM contract_detail WHERE contract_id = ?;";

    public ContractDetailRepositoryImpl() {}

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
    public ContractDetail selectContractDetail(int id) {
        ContractDetail contractDetail = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CONTRACT_DETAIL_BY_ID);) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int contractId = resultSet.getInt("contract_id");
                int attachServiceId = resultSet.getInt("attach_service_id");
                int quantity = resultSet.getInt("quantity");
                contractDetail = new ContractDetail(id, contractId, attachServiceId, quantity);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractDetail;
    }

    @Override
    public List<ContractDetail> selectAllContractDetail() {
        List<ContractDetail> contractDetailList = new ArrayList<>();
        try (Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CONTRACT_DETAIL);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int contractDetailId = resultSet.getInt("contract_detail_id");
                int contractId = resultSet.getInt("contract_id");
                int attachServiceId = resultSet.getInt("attach_service_id");
                int quantity = resultSet.getInt("quantity");
                ContractDetail contractDetail = new ContractDetail(contractDetailId, contractId, attachServiceId, quantity);
                contractDetailList.add(contractDetail);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractDetailList;
    }

    @Override
    public void insertContractDetail(ContractDetail contractDetail) throws SQLException {
        try (Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CONTRACT_DETAIL_SQL);) {
            preparedStatement.setInt(1, contractDetail.getContractId());
            preparedStatement.setInt(2, contractDetail.getAttachServiceId());
            preparedStatement.setInt(3, contractDetail.getQuantity());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    public List<ContractDetail> selectContractDetailByContractId (int id) {
        List<ContractDetail> contractDetailList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CONTRACT_DETAIL_BY_CONTRACT_ID);) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int contractDetailId = resultSet.getInt("contract_detail_id");
                int attachServiceId = resultSet.getInt("attach_service_id");
                int quantity = resultSet.getInt("quantity");
                ContractDetail contractDetail = new ContractDetail(contractDetailId, id, attachServiceId, quantity);
                contractDetailList.add(contractDetail);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractDetailList;
    }
}
