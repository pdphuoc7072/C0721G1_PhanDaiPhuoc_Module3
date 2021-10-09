package model.service.impl;

import model.bean.Service;
import model.repository.impl.ServiceRepositoryImpl;
import model.service.IServiceService;

import java.sql.SQLException;
import java.util.List;

public class ServiceServiceImpl implements IServiceService {
    ServiceRepositoryImpl serviceRepository = new ServiceRepositoryImpl();
    @Override
    public Service selectService(int id) {
        return serviceRepository.selectService(id);
    }

    @Override
    public List<Service> selectAllServices() {
        return serviceRepository.selectAllServices();
    }

    @Override
    public void insertService(Service service) throws SQLException {
        serviceRepository.insertService(service);
    }
}
