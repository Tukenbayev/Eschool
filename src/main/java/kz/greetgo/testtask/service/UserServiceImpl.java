package kz.greetgo.testtask.service;

import kz.greetgo.testtask.mapper.UserMapper;
import kz.greetgo.testtask.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    @Transactional
    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    @Override
    public User getUserByLoginPassword(String login, String password) {
        return userMapper.getUserByLogin(login);
    }

    @Override
    public boolean isUserExist(String login) {
        User user = userMapper.getUserByLogin(login);

        if (user != null)
            return true;

        return false;
    }
}
