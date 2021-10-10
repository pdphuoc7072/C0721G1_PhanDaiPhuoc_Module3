package model.repository.impl;

import model.bean.Employee;
import model.repository.IEmployeeRepository;
import model.service.IEmployeeService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements IEmployeeRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_management?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Phantuankiet_1603";

    private static final String SELECT_ALL_EMPLOYEES = "SELECT * FROM employee";
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT * FROM employee WHERE employee_id = ?";
    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO employee (employee_name, employee_birthday, " +
            "employee_id_card, employee_salary, employee_phone, employee_email, employee_address, position_id, " +
            "education_degree_id, division_id, username) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String UPDATE_EMPLOYEE_SQL = "UPDATE employee SET employee_name = ?, employee_birthday = ?, " +
            "employee_id_card = ?, employee_salary = ?, employee_phone = ?, employee_email = ?, employee_address = ?, " +
            "position_id = ?, education_degree_id = ?, division_id = ?, username = ? WHERE employee_id = ?;";
    private static final String DELETE_EMPLOYEE_SQL = "DELETE FROM employee WHERE employee_id = ?; ";
    private static final String SELECT_EMPLOYEE_BY_NAME = "SELECT * FROM employee WHERE substring_index(employee_name,' ', -1) LIKE ?;";
    private static final String SELECT_EMPLOYEE_BY_PHONE = "SELECT * FROM employee WHERE employee_phone LIKE ?;";

    public EmployeeRepositoryImpl() {
    }

    protected Connection getConnection() {
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
    public Employee selectEmployee(int id) {
        Employee employee = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID);) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String username = resultSet.getString("username");
                employee = new Employee(id, name, birthday, idCard, salary, phone, email, address, positionId, educationDegreeId, divisionId, username);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public List<Employee> selectAllEmployees() {
        List<Employee> employeeList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEES);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String username = resultSet.getString("username");
                Employee employee = new Employee(id, name, birthday, idCard, salary, phone, email, address, positionId, educationDegreeId, divisionId, username);
                employeeList.add(employee);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public void insertEmployee(Employee employee) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE_SQL);) {
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthday());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.setString(11, employee.getUsername());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL);) {
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthday());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.setString(11, employee.getUsername());
            preparedStatement.setInt(12, employee.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE_SQL);) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public List<Employee> searchEmployeeByName(String search) {
        List<Employee> employeeList = new ArrayList<>();
        Employee employee = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_NAME);) {
            String searchSQL = search.concat("%");
            preparedStatement.setString(1, searchSQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String username = resultSet.getString("username");
                employee = new Employee(id, name, birthday, idCard, salary, phone, email, address, positionId, educationDegreeId, divisionId, username);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public List<Employee> searchEmployeeByPhone(String search) {
        List<Employee> employeeList = new ArrayList<>();
        Employee employee = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_PHONE);) {
            String searchSQL = search.concat("%");
            preparedStatement.setString(1, searchSQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String username = resultSet.getString("username");
                employee = new Employee(id, name, birthday, idCard, salary, phone, email, address, positionId, educationDegreeId, divisionId, username);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
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
