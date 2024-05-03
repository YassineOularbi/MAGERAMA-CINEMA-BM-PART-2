// FilmRatingDAO.java
package jee.javapack.dao;

import jee.javapack.beans.FilmRating;

import java.util.List;

public interface FilmRatingDAO {
    void addFilmRating(FilmRating filmRating);
    void updateFilmRating(FilmRating filmRating);
    FilmRating getFilmRatingById(Long id);
    List<FilmRating> getFilmRatingsByFilmId(Long filmId);
    List<FilmRating> getFilmRatingsByUserId(Long userId);
    void deleteFilmRating(Long id);
}
