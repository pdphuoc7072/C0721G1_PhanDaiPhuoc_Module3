package model.service;

import model.bean.Customer;
import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService {
    Customer selectCustomer (int id);
    List<Customer> selectAllCustomers ();
    void insertCustomer (Customer customer) throws SQLException;
    boolean updateCustomer (Customer customer) throws SQLException;
    boolean deleteCustomer (int id) throws SQLException;
    List<Customer> searchCustomerByName (String search);
    List<Customer> searchCustomerByPhone (String search);
}
