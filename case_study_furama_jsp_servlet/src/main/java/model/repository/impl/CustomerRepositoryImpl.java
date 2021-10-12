package model.repository.impl;

import model.bean.Customer;
import model.bean.Employee;
import model.repository.DBConnection;
import model.repository.ICustomerRepository;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {

    private static final String SELECT_ALL_CUSTOMERS = "SELECT * FROM customer";
    private static final String SELECT_CUSTOMER_BY_ID = "SELECT * FROM customer WHERE customer_id = ?";
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer (customer_name, customer_birthday, " +
            "customer_gender, customer_id_card, customer_phone, customer_email, customer_address, customer_type_id) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String UPDATE_CUSTOMER_SQL = "UPDATE customer SET customer_name = ?, " +
            "customer_birthday = ?, customer_gender = ?, customer_id_card = ?, customer_phone = ?, customer_email = ?, " +
            "customer_address = ?, customer_type_id = ? WHERE customer_id = ?;";
    private static final String DELETE_CUSTOMER_SQL = "DELETE FROM customer WHERE customer_id = ?; ";
    private static final String SELECT_CUSTOMER_BY_NAME = "SELECT * FROM customer WHERE substring_index(customer_name,' ', -1) LIKE ?;";
    private static final String SELECT_CUSTOMER_BY_PHONE = "SELECT * FROM customer WHERE customer_phone LIKE ?;";

    public CustomerRepositoryImpl () {
    }

    @Override
    public Customer selectCustomer(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Customer customer = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
                preparedStatement.setInt(1, id);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    String name = resultSet.getString("customer_name");
                    String birthdaySQL = resultSet.getString("customer_birthday");
                    String birthday = new SimpleDateFormat("dd-MM-yyyy").format
                            (new SimpleDateFormat("yyyy-MM-dd").parse(birthdaySQL));
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    int customerTypeId = resultSet.getInt("customer_type_id");
                    customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, customerTypeId);
                }
            } catch (SQLException | ParseException e) {
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
        return customer;
    }

    @Override
    public List<Customer> selectAllCustomers() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Customer> customerList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMERS);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("customer_id");
                    String name = resultSet.getString("customer_name");
                    String birthdaySQL = resultSet.getString("customer_birthday");
                    String birthday = new SimpleDateFormat("dd-MM-yyyy").format
                            (new SimpleDateFormat("yyyy-MM-dd").parse(birthdaySQL));
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    int customerTypeId = resultSet.getInt("customer_type_id");
                    Customer customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, customerTypeId);
                    customerList.add(customer);
                }
            } catch (SQLException | ParseException e) {
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
        return customerList;
    }

    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL);
                preparedStatement.setString(1, customer.getName());
                preparedStatement.setString(2, new SimpleDateFormat("yyyy-MM-dd").format
                        (new SimpleDateFormat("dd-MM-yyyy").parse(customer.getBirthday())));
                preparedStatement.setInt(3, customer.getGender());
                preparedStatement.setString(4, customer.getIdCard());
                preparedStatement.setString(5, customer.getPhone());
                preparedStatement.setString(6, customer.getEmail());
                preparedStatement.setString(7, customer.getAddress());
                preparedStatement.setInt(8, customer.getCustomerTypeId());
                preparedStatement.executeUpdate();
            } catch (ParseException e) {
                e.printStackTrace();
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

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        boolean rowUpdated;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_SQL);
                preparedStatement.setString(1, customer.getName());
                preparedStatement.setString(2, new SimpleDateFormat("yyyy-MM-dd").format
                        (new SimpleDateFormat("dd-MM-yyyy").parse(customer.getBirthday())));
                preparedStatement.setInt(3, customer.getGender());
                preparedStatement.setString(4, customer.getIdCard());
                preparedStatement.setString(5, customer.getPhone());
                preparedStatement.setString(6, customer.getEmail());
                preparedStatement.setString(7, customer.getAddress());
                preparedStatement.setInt(8, customer.getCustomerTypeId());
                preparedStatement.setInt(9, customer.getId());
                rowUpdated = preparedStatement.executeUpdate() > 0;
                return rowUpdated;
            } catch (SQLException | ParseException e) {
                e.printStackTrace();
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return false;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        boolean rowDeleted;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_SQL);
                preparedStatement.setInt(1, id);
                rowDeleted = preparedStatement.executeUpdate() > 0;
                return rowDeleted;
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return false;
    }

    @Override
    public List<Customer> searchCustomerByName(String search) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Customer> customerList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_NAME);
                String searchSQL = search.concat("%");
                preparedStatement.setString(1, searchSQL);
                resultSet = preparedStatement.executeQuery();
                Customer customer = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("customer_id");
                    String name = resultSet.getString("customer_name");
                    String birthdaySQL = resultSet.getString("customer_birthday");
                    String birthday = new SimpleDateFormat("dd-MM-yyyy").format
                            (new SimpleDateFormat("yyyy-MM-dd").parse(birthdaySQL));
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    int customerTypeId = resultSet.getInt("customer_type_id");
                    customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, customerTypeId);
                    customerList.add(customer);
                }
            } catch (SQLException | ParseException e) {
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
        return customerList;
    }

    @Override
    public List<Customer> searchCustomerByPhone(String search) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Customer> customerList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_PHONE);
                String searchSQL = search.concat("%");
                preparedStatement.setString(1, searchSQL);
                resultSet = preparedStatement.executeQuery();
                Customer customer = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("customer_id");
                    String name = resultSet.getString("customer_name");
                    String birthdaySQL = resultSet.getString("customer_birthday");
                    String birthday = new SimpleDateFormat("dd-MM-yyyy").format
                            (new SimpleDateFormat("yyyy-MM-dd").parse(birthdaySQL));
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    int customerTypeId = resultSet.getInt("customer_type_id");
                    customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, customerTypeId);
                    customerList.add(customer);
                }
            } catch (SQLException | ParseException e) {
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
        return customerList;
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
