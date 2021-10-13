package model.repository;

import model.bean.User;

public interface IUserRepository {
    User selectUser (String username, String password);
}
