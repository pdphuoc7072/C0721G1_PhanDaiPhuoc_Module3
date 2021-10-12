package model.service;

import model.bean.ServiceDetail;

import java.util.List;

public interface IServiceDetailService {
    List<ServiceDetail> selectAllServiceDetail ();
    List<ServiceDetail> selectServiceDetailById (int id);
}
