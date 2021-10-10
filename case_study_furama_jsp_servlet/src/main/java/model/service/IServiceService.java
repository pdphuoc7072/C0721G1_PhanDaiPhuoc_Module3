package model.service;

import model.bean.Service;

import java.sql.SQLException;
import java.util.List;

public interface IServiceService {
    Service selectService (int id);
    List<Service> selectAllServices ();
    void insertService (Service service) throws SQLException;
}
