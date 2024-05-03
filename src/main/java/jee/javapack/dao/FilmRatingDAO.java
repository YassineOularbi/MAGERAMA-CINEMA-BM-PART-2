package jee.javapack.dao;

import jee.javapack.beans.FilmRating;

import java.util.List;

public interface FilmRatingDAO {
    void addFilmRating(FilmRating filmRating);
    List<FilmRating> getFilmRatings();
}
