package model.repository;

import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerRepository {
    Customer selectCustomer (int id);
    List<Customer> selectAllCustomers ();
    void insertCustomer (Customer customer) throws SQLException;
    boolean updateCustomer (Customer customer) throws SQLException;
    boolean deleteCustomer (int id) throws SQLException;
}
