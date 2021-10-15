package model.service.impl;

import model.bean.Customer;
import model.repository.impl.CustomerRepositoryImpl;
import model.service.ICustomerService;
import model.service.Regex;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    CustomerRepositoryImpl customerRepository = new CustomerRepositoryImpl();
    @Override
    public Customer selectCustomer(int id) {
        return customerRepository.selectCustomer(id);
    }

    @Override
    public List<Customer> selectAllCustomers() {
        return customerRepository.selectAllCustomers();
    }

    @Override
    public boolean insertCustomer(Customer customer) throws SQLException {
        boolean checkCustomerCode = false;
        boolean checkPhone = false;
        boolean checkIdCard = false;
        boolean checkEmail = false;
        boolean checkBirthday = false;
        boolean flag = false;

        checkCustomerCode = Regex.validateOfCustomerCode(customer.getCustomerCode());
        checkPhone = Regex.validateOfPhoneNumber(customer.getPhone());
        checkIdCard = Regex.validateOfIdCard(customer.getIdCard());
        checkEmail = Regex.validateOfEmail(customer.getEmail());
        checkBirthday = Regex.validateOfBirthday(customer.getBirthday());

        flag = checkCustomerCode && checkPhone && checkIdCard && checkEmail && checkBirthday;

        if (flag) {
            customerRepository.insertCustomer(customer);
        }
        return flag;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        boolean checkCustomerCode = false;
        boolean checkPhone = false;
        boolean checkIdCard = false;
        boolean checkEmail = false;
        boolean checkBirthday = false;
        boolean flag = false;

        checkCustomerCode = Regex.validateOfCustomerCode(customer.getCustomerCode());
        checkPhone = Regex.validateOfPhoneNumber(customer.getPhone());
        checkIdCard = Regex.validateOfIdCard(customer.getIdCard());
        checkEmail = Regex.validateOfEmail(customer.getEmail());
        checkBirthday = Regex.validateOfBirthday(customer.getBirthday());

        flag = checkCustomerCode && checkPhone && checkIdCard && checkEmail && checkBirthday;

        if (flag) {
            return customerRepository.updateCustomer(customer);
        }
        return flag;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public List<Customer> searchCustomerByName(String search) {
        return customerRepository.searchCustomerByName(search);
    }

    @Override
    public List<Customer> searchCustomerByPhone(String search) {
        return customerRepository.searchCustomerByPhone(search);
    }
}
