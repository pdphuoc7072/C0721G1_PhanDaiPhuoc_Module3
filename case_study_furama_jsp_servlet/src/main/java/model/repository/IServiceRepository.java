package model.repository;

import model.bean.Customer;
import model.bean.Service;

import java.sql.SQLException;
import java.util.List;

public interface IServiceRepository {
    Service selectService (int id);
    List<Service> selectAllServices ();
    void insertService (Service service) throws SQLException;
}
