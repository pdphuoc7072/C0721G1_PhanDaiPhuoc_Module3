package model.repository;

import model.bean.AttachService;

import java.util.List;

public interface IAttachServiceRepository {
    List<AttachService> selectAllAttachService ();
}
