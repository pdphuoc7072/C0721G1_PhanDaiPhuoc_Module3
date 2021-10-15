package model.service;

import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeService {
    Employee selectEmployee (int id);
    List<Employee> selectAllEmployees ();
    boolean insertEmployee (Employee employee) throws SQLException;
    boolean updateEmployee (Employee employee) throws SQLException;
    boolean deleteEmployee (int id) throws SQLException;
    List<Employee> searchEmployeeByName (String search);
    List<Employee> searchEmployeeByPhone (String search);
}
