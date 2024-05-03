package jee.javapack.beans;

import java.util.Date;

public class FilmRating {
    private Long idRating;
    private Long idUser;
    private Long idFilm;
    private int rating;
    private Date ratingDate;

    public FilmRating() {
    }

    public FilmRating(Long idFilm, Long idUser, int rating) {
        this.idFilm = idFilm;
        this.idUser = idUser;
        this.rating = rating;
    }

    public Long getIdRating() {
        return idRating;
    }

    public void setIdRating(Long idRating) {
        this.idRating = idRating;
    }

    public Long getIdUser() {
        return idUser;
    }

    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    }

    public Long getIdFilm() {
        return idFilm;
    }

    public void setIdFilm(Long idFilm) {
        this.idFilm = idFilm;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Date getRatingDate() {
        return ratingDate;
    }

    public void setRatingDate(Date ratingDate) {
        this.ratingDate = ratingDate;
    }
}
