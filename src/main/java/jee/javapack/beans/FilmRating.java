package jee.javapack.beans;

import java.util.Date;

public class FilmRating {
    private Long idRating;
    private Long idUser;
    private Long idFilm;
    private int rating;
    private Date ratingDate;

    // Constructeur par défaut
    public FilmRating() {
    }

    // Constructeur avec paramètres
    public FilmRating(Long idRating, Long idUser, Long idFilm, int rating, Date ratingDate) {
        this.idRating = idRating;
        this.idUser = idUser;
        this.idFilm = idFilm;
        this.rating = rating;
        this.ratingDate = ratingDate;
    }

    // Getters et setters
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
