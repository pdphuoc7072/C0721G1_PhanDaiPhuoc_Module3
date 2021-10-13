package model.bean;

public class User {
    private String username;
    private String password;
    private int roleId;
    private String employeeName;

    public User() {
    }

    public User(String username, String password, int roleId, String employeeName) {
        this.username = username;
        this.password = password;
        this.roleId = roleId;
        this.employeeName = employeeName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }
}
