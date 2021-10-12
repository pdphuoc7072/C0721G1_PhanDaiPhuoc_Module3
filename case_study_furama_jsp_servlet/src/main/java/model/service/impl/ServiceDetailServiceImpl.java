package model.service.impl;

import model.bean.ServiceDetail;
import model.repository.impl.ServiceDetailRepositoryImpl;
import model.service.IServiceDetailService;

import java.util.List;

public class ServiceDetailServiceImpl implements IServiceDetailService {
    ServiceDetailRepositoryImpl serviceDetailRepository = new ServiceDetailRepositoryImpl();

    @Override
    public List<ServiceDetail> selectAllServiceDetail() {
        return serviceDetailRepository.selectAllServiceDetail();
    }

    @Override
    public List<ServiceDetail> selectServiceDetailById(int id) {
        return serviceDetailRepository.selectServiceDetailById(id);
    }
}
