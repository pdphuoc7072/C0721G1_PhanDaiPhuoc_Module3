package model.service.impl;

import model.bean.ContractDetail;
import model.repository.impl.ContractDetailRepositoryImpl;
import model.service.IContractDetailService;
import model.service.Regex;

import java.sql.SQLException;
import java.util.List;

public class ContractDetailServiceImpl implements IContractDetailService {
    ContractDetailRepositoryImpl contractDetailRepository = new ContractDetailRepositoryImpl();

    @Override
    public ContractDetail selectContractDetail(int id) {
        return contractDetailRepository.selectContractDetail(id);
    }

    @Override
    public List<ContractDetail> selectAllContractDetail() {
        return contractDetailRepository.selectAllContractDetail();
    }

    @Override
    public boolean insertContractDetail(ContractDetail contractDetail) throws SQLException {
        boolean checkQuantity = false;

        checkQuantity = Regex.validateOfNumberInt(contractDetail.getQuantity());

        if (checkQuantity) {
            contractDetailRepository.insertContractDetail(contractDetail);
        }
        return checkQuantity;
    }

    public List<ContractDetail> selectContractDetailByContractId (int id) {
        return contractDetailRepository.selectContractDetailByContractId(id);
    }
}
