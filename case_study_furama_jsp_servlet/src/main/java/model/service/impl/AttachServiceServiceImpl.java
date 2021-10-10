package model.service.impl;

import model.bean.AttachService;
import model.repository.impl.AttachServiceRepositoryImpl;
import model.service.IAttachServiceService;

import java.util.List;

public class AttachServiceServiceImpl implements IAttachServiceService {
    AttachServiceRepositoryImpl attachServiceRepository = new AttachServiceRepositoryImpl();

    @Override
    public List<AttachService> selectAllAttachService() {
        return attachServiceRepository.selectAllAttachService();
    }
}
