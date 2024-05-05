package jee.javapack.dao;

import jee.javapack.beans.FilmRating;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class FilmRatingDAOImpl implements FilmRatingDAO {

    @Override
    public void addFilmRating(FilmRating filmRating) {
        try (Connection connection = ConnectionDAO.getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO RatingFilm (idUser, idFilm, rating) VALUES (?, ?, ?)")) {
            statement.setLong(1, filmRating.getIdUser());
            statement.setLong(2, filmRating.getIdFilm());
            statement.setInt(3, filmRating.getRating());
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<FilmRating> getFilmRatings() {
        List<FilmRating> filmRatings = new ArrayList<>();
        try (Connection connection = ConnectionDAO.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM ratingfilm");
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Integer idUser = resultSet.getInt("idUser");
                Integer idFilm = resultSet.getInt("idFilm");
                Integer rating = resultSet.getInt("rating");

                FilmRating filmRating = new FilmRating(idUser, idFilm, rating);
                filmRatings.add(filmRating);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return filmRatings;
    }


}
