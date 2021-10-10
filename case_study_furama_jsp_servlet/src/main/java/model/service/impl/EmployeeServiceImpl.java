package model.service.impl;

import model.bean.Employee;
import model.repository.impl.EmployeeRepositoryImpl;
import model.service.IEmployeeService;

import java.sql.SQLException;
import java.util.List;

public class EmployeeServiceImpl implements IEmployeeService {
    EmployeeRepositoryImpl employeeRepository = new EmployeeRepositoryImpl();

    @Override
    public Employee selectEmployee(int id) {
        return employeeRepository.selectEmployee(id);
    }

    @Override
    public List<Employee> selectAllEmployees() {
        return employeeRepository.selectAllEmployees();
    }

    @Override
    public void insertEmployee(Employee employee) throws SQLException {
        employeeRepository.insertEmployee(employee);
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        return employeeRepository.updateEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        return employeeRepository.deleteEmployee(id);
    }

    @Override
    public List<Employee> searchEmployeeByName(String search) {
        return employeeRepository.searchEmployeeByName(search);
    }

    @Override
    public List<Employee> searchEmployeeByPhone(String search) {
        return employeeRepository.searchEmployeeByPhone(search);
    }
}
