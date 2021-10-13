package model.service;

import model.bean.User;

public interface IUserService {
    User selectUser (String username, String password);
}
