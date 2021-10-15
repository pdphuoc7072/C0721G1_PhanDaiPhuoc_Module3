package model.service;

import model.bean.Service;

import java.sql.SQLException;
import java.util.List;

public interface IServiceService {
    Service selectService (int id);
    List<Service> selectAllServices ();
    boolean insertService (Service service) throws SQLException;
}
