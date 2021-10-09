package model.repository;

import model.bean.Customer;
import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeRepository {
    Employee selectEmployee (int id);
    List<Employee> selectAllEmployees ();
    void insertEmployee (Employee employee) throws SQLException;
    boolean updateEmployee (Employee employee) throws SQLException;
    boolean deleteEmployee (int id) throws SQLException;
}
