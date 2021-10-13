package model.service.impl;

import model.bean.User;
import model.repository.impl.UserRepositoryImpl;
import model.service.IUserService;

public class UserServiceImpl implements IUserService {
    UserRepositoryImpl userRepository = new UserRepositoryImpl();

    @Override
    public User selectUser(String username, String password) {
        return userRepository.selectUser(username, password);
    }
}
