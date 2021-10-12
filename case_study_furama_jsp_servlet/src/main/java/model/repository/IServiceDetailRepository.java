package model.repository;

import model.bean.ServiceDetail;

import java.util.List;

public interface IServiceDetailRepository {
    List<ServiceDetail> selectAllServiceDetail ();
    List<ServiceDetail> selectServiceDetailById (int id);
}
