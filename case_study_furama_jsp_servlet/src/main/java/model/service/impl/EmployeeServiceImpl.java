package model.service.impl;

import model.bean.Employee;
import model.repository.impl.EmployeeRepositoryImpl;
import model.service.IEmployeeService;
import model.service.Regex;

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
    public boolean insertEmployee(Employee employee) throws SQLException {
        boolean checkPhone = false;
        boolean checkIdCard = false;
        boolean checkEmail = false;
        boolean checkBirthday = false;
        boolean checkSalary = false;
        boolean flag = false;

        checkPhone = Regex.validateOfPhoneNumber(employee.getPhone());
        checkIdCard = Regex.validateOfIdCard(employee.getIdCard());
        checkEmail = Regex.validateOfEmail(employee.getEmail());
        checkBirthday = Regex.validateOfBirthday(employee.getBirthday());
        checkSalary = Regex.validateOfNumberDouble(employee.getSalary());

        flag = checkPhone && checkIdCard && checkEmail && checkBirthday && checkSalary;

        if (flag) {
            employeeRepository.insertEmployee(employee);
        }
        return flag;
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        boolean checkPhone = false;
        boolean checkIdCard = false;
        boolean checkEmail = false;
        boolean checkBirthday = false;
        boolean checkSalary = false;
        boolean flag = false;

        checkPhone = Regex.validateOfPhoneNumber(employee.getPhone());
        checkIdCard = Regex.validateOfIdCard(employee.getIdCard());
        checkEmail = Regex.validateOfEmail(employee.getEmail());
        checkBirthday = Regex.validateOfBirthday(employee.getBirthday());
        checkSalary = Regex.validateOfNumberDouble(employee.getSalary());

        flag = checkPhone && checkIdCard && checkEmail && checkBirthday && checkSalary;

        if (flag) {
            return employeeRepository.updateEmployee(employee);
        }
        return flag;

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
