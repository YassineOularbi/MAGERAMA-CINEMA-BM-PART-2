package jee.javapack.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jee.javapack.dao.ConnectionDAO;

public class LoginDAO {
    public static UserrDAO authenticate(String login, String password) {
        UserrDAO user = null;
        try (Connection connection = ConnectionDAO.getConnection();
             PreparedStatement pst = connection.prepareStatement("SELECT id, user_role FROM users WHERE  user_mail = ? AND user_password = ? ")) {

            pst.setString(1, login);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user = new UserrDAO();
                user.setId(rs.getInt("id"));
                user.setRole(rs.getString("user_role"));
            }
            rs.close();
        } catch (SQLException e) {
            System.out.print(e);
        }
        return user;
    }
}
