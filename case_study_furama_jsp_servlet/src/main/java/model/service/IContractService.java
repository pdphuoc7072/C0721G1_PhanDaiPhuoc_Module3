package model.service;

import model.bean.Contract;

import java.sql.SQLException;
import java.util.List;

public interface IContractService {
    Contract selectContract (int id);
    List<Contract> selectAllContracts ();
    void insertContract (Contract contract) throws SQLException;
}
