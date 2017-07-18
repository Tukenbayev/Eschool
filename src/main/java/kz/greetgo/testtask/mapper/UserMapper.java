package kz.greetgo.testtask.mapper;


import kz.greetgo.testtask.model.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {

    String GET_USER_BY_LOGIN_QUERY = "SELECT * FROM schools WHERE login = #{login}";
    String INSERT_USER_QUERY = "INSERT INTO schools (login, password) VALUES(#{login}, #{password})";

    @Insert(INSERT_USER_QUERY)
    @Options(useGeneratedKeys = true, keyColumn = "id")
    void insertUser(User user);

    @Select(GET_USER_BY_LOGIN_QUERY)
    User getUserByLogin(String login);
}
