package model.repository.impl;

import model.bean.Service;
import model.repository.DBConnection;
import model.repository.IServiceRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements IServiceRepository {

    private static final String SELECT_ALL_SERVICES = "SELECT * FROM service";
    private static final String SELECT_SERVICE_BY_ID = "SELECT * FROM service WHERE service_id = ?";
    private static final String INSERT_SERVICE_SQL = "INSERT INTO service (service_name, service_area, service_cost, " +
            "service_max_people, rent_type_id, service_type_id, standard_room, description_other_convenience, " +
            "pool_area, number_of_floors) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

    public ServiceRepositoryImpl () {}

    @Override
    public Service selectService(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Service service = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_SERVICE_BY_ID);
                preparedStatement.setInt(1, id);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    String name = resultSet.getString("service_name");
                    int area = resultSet.getInt("service_area");
                    double cost = resultSet.getDouble("service_cost");
                    int maxPeople = resultSet.getInt("service_max_people");
                    int rentTypeId = resultSet.getInt("rent_type_id");
                    int serviceTypeId = resultSet.getInt("service_type_id");
                    String standardRoom = resultSet.getString("standard_room");
                    String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                    double poolArea = resultSet.getDouble("pool_area");
                    int numberOfFloors = resultSet.getInt("number_of_floors");
                    service = new Service(id, name, area, cost, maxPeople, rentTypeId, serviceTypeId, standardRoom,
                            descriptionOtherConvenience, poolArea, numberOfFloors);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return service;
    }

    @Override
    public List<Service> selectAllServices() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Service> serviceList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICES);
                resultSet = preparedStatement.executeQuery();
                Service service = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("service_id");
                    String name = resultSet.getString("service_name");
                    int area = resultSet.getInt("service_area");
                    double cost = resultSet.getDouble("service_cost");
                    int maxPeople = resultSet.getInt("service_max_people");
                    int rentTypeId = resultSet.getInt("rent_type_id");
                    int serviceTypeId = resultSet.getInt("service_type_id");
                    String standardRoom = resultSet.getString("standard_room");
                    String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                    double poolArea = resultSet.getDouble("pool_area");
                    int numberOfFloors = resultSet.getInt("number_of_floors");
                    service = new Service(id, name, area, cost, maxPeople, rentTypeId, serviceTypeId, standardRoom,
                            descriptionOtherConvenience, poolArea, numberOfFloors);
                    serviceList.add(service);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return serviceList;
    }

    @Override
    public void insertService(Service service) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(INSERT_SERVICE_SQL);
                preparedStatement.setString(1, service.getName());
                preparedStatement.setInt(2, service.getArea());
                preparedStatement.setDouble(3, service.getCost());
                preparedStatement.setInt(4, service.getMaxPeople());
                preparedStatement.setInt(5, service.getRentTypeId());
                preparedStatement.setInt(6, service.getServiceTypeId());
                preparedStatement.setString(7, service.getStandardRoom());
                preparedStatement.setString(8, service.getDescriptionOtherConvenience());
                preparedStatement.setDouble(9, service.getPoolArea());
                preparedStatement.setInt(10, service.getNumberOfFloors());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                printSQLException(e);
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
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
}
