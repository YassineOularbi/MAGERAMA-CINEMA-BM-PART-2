
package jee.javapack.dao;

import jee.javapack.beans.FilmRating;

import java.sql.*;
import java.util.Collections;
import java.util.List;

public class FilmRatingDAOImpl implements FilmRatingDAO {

    
    @Override
    public void addFilmRating(FilmRating filmRating) {
        try (Connection connection = DriverManager.getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO RatingFilm (idUser, idFilm, rating) VALUES (?, ?, ?)")) {
            statement.setLong(1, filmRating.getIdUser());
            statement.setLong(2, filmRating.getIdFilm());
            statement.setInt(3, filmRating.getRating());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateFilmRating(FilmRating filmRating) {

    }

    @Override
    public FilmRating getFilmRatingById(Long id) {
        return null;
    }

    @Override
    public List<FilmRating> getFilmRatingsByFilmId(Long filmId) {
        return Collections.emptyList();
    }

    @Override
    public List<FilmRating> getFilmRatingsByUserId(Long userId) {
        return Collections.emptyList();
    }

    @Override
    public void deleteFilmRating(Long id) {

    }

    // Autres méthodes pour update, getFilmRatingById, getFilmRatingsByFilmId, getFilmRatingsByUserId et deleteFilmRating

}
