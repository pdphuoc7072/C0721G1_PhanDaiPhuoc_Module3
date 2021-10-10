package model.service;

import model.bean.ContractDetail;

import java.sql.SQLException;
import java.util.List;

public interface IContractDetailService {
    ContractDetail selectContractDetail (int id);
    List<ContractDetail> selectAllContractDetail ();
    void insertContractDetail (ContractDetail contractDetail) throws SQLException;
}
