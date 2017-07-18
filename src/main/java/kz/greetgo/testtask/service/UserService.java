package kz.greetgo.testtask.service;


import kz.greetgo.testtask.model.User;

public interface UserService {

    void insertUser(User user);

    User getUserByLoginPassword(String login, String password);

    boolean isUserExist(String login);
}
