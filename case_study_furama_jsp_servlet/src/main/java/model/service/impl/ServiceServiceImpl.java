package model.service.impl;

import model.bean.Service;
import model.repository.impl.ServiceRepositoryImpl;
import model.service.IServiceService;
import model.service.Regex;

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
    public boolean insertService(Service service) throws SQLException {
        boolean checkServiceCode = false;
        boolean checkCost = false;
        boolean checkNumberOfFloors = false;
        boolean check = false;

        checkServiceCode = Regex.validateOfServiceCode(service.getServiceCode());
        checkCost = Regex.validateOfNumberDouble(service.getCost());
        checkNumberOfFloors = Regex.validateOfNumberInt(service.getNumberOfFloors());

        check = checkServiceCode && checkCost && checkNumberOfFloors;

        if (check) {
            serviceRepository.insertService(service);
        }
        return check;
    }
}
