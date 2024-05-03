package jee.javapack.dao;

import jee.javapack.dto.UserDTO;

import java.sql.SQLException;

public interface UserDAO {
    UserDTO authenticate(String login, String password) throws SQLException, ClassNotFoundException;
}
