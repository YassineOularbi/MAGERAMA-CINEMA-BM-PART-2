package jee.javapack.dao;

import jee.javapack.dto.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAOImpl implements UserDAO{
    @Override
    public UserDTO authenticate(String login, String password) throws SQLException, ClassNotFoundException {
        UserDTO userDTO = new UserDTO();
        Connection connection = ConnectionDAO.getConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT id, user_role, username FROM users WHERE  user_mail = ? AND user_password = ? ");
        statement.setString(1, login);
        statement.setString(2, password);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            userDTO.setId(resultSet.getInt("id"));
            userDTO.setRoleAU(resultSet.getString("user_role"));
            userDTO.setUserName(resultSet.getString("username"));
        }
        connection.close();
        statement.close();
        return userDTO;
    }
}
