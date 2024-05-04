package jee.javapack.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PlaylistDAO {

    private static final String INSERT_FILM_SQL = "INSERT INTO Playlist (userId, filmId) VALUES (?, ?)";

    public static void addFilmToPlaylist(int userId, int filmId) {
        try (Connection connection = ConnectionDAO.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FILM_SQL)) {
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, filmId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
