package model.repository.impl;

import model.bean.User;
import model.repository.DBConnection;
import model.repository.IUserRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRepositoryImpl implements IUserRepository {
    private static final String SELECT_USER = "SELECT e.username, u.`password`, ur.role_id, e.employee_name\n" +
            "FROM employee e\n" +
            "JOIN `user` u ON e.username = u.username\n" +
            "JOIN user_role ur ON u.username = ur.username\n" +
            "WHERE e.username = ? AND u.`password` = ?;";

    @Override
    public User selectUser(String username, String password) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        User user = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_USER);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    String userName = resultSet.getString("username");
                    String passWord = resultSet.getString("password");
                    int roleId = resultSet.getInt("role_id");
                    String employeeName = resultSet.getString("employee_name");
                    user = new User(userName, passWord, roleId, employeeName);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return user;
    }
}
