package model.service.impl;

import model.bean.Contract;
import model.repository.impl.ContractRepositoryImpl;
import model.service.IContractService;
import model.service.Regex;

import java.sql.SQLException;
import java.util.List;

public class ContractServiceImpl implements IContractService {
    ContractRepositoryImpl contractRepository = new ContractRepositoryImpl();

    @Override
    public Contract selectContract(int id) {
        return contractRepository.selectContract(id);
    }

    @Override
    public List<Contract> selectAllContracts() {
        return contractRepository.selectAllContracts();
    }

    @Override
    public boolean insertContract(Contract contract) throws SQLException {
        boolean checkStartDate = false;
        boolean checkEndDate = false;
        boolean checkDeposit;
        boolean flag = false;

        checkStartDate = Regex.validateOfContractDate(contract.getStartDate());
        checkEndDate = Regex.validateOfContractDate(contract.getEndDate());
        checkDeposit = Regex.validateOfNumberDouble(contract.getDeposit());

        flag = checkStartDate && checkEndDate && checkDeposit;

        if (flag) {
            contractRepository.insertContract(contract);
        }
        return flag;
    }
}
