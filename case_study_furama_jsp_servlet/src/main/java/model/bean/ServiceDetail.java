package model.bean;

public class ServiceDetail {
    private int serviceId;
    private String serviceName;
    private String customerName;
    private int contractId;
    private String contractOfStartDate;
    private String contractOfEndDate;
    private int contractDetailId;
    private String attachServiceName;
    private int quantity;
    private double total;

    public ServiceDetail() {
    }

    public ServiceDetail(int serviceId, String serviceName, String customerName, int contractId, String contractOfStartDate,
                         String contractOfEndDate, int contractDetailId, String attachServiceName, int quantity, double total) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.customerName = customerName;
        this.contractId = contractId;
        this.contractOfStartDate = contractOfStartDate;
        this.contractOfEndDate = contractOfEndDate;
        this.contractDetailId = contractDetailId;
        this.attachServiceName = attachServiceName;
        this.quantity = quantity;
        this.total = total;
    }

    public ServiceDetail(int serviceId, String serviceName, String customerName, int contractId, String contractOfStartDate,
                         String contractOfEndDate, int contractDetailId, String attachServiceName, int quantity) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.customerName = customerName;
        this.contractId = contractId;
        this.contractOfStartDate = contractOfStartDate;
        this.contractOfEndDate = contractOfEndDate;
        this.contractDetailId = contractDetailId;
        this.attachServiceName = attachServiceName;
        this.quantity = quantity;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public String getContractOfStartDate() {
        return contractOfStartDate;
    }

    public void setContractOfStartDate(String contractOfStartDate) {
        this.contractOfStartDate = contractOfStartDate;
    }

    public String getContractOfEndDate() {
        return contractOfEndDate;
    }

    public void setContractOfEndDate(String contractOfEndDate) {
        this.contractOfEndDate = contractOfEndDate;
    }

    public int getContractDetailId() {
        return contractDetailId;
    }

    public void setContractDetailId(int contractDetailId) {
        this.contractDetailId = contractDetailId;
    }

    public String getAttachServiceName() {
        return attachServiceName;
    }

    public void setAttachServiceName(String attachServiceName) {
        this.attachServiceName = attachServiceName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
