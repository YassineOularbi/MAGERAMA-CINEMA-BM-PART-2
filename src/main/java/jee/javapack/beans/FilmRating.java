package jee.javapack.beans;

import javax.persistence.*;
import java.util.Date;
@Entity
public class FilmRating {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idRating;
    @Column(name = "id")
    private Integer idUser;
    private Integer idFilm;
    private Integer rating;


    public FilmRating() {
    }

    public FilmRating(Integer idFilm, Integer idUser, Integer rating) {
        this.idFilm = idFilm;
        this.idUser = idUser;
        this.rating = rating;
    }

    public Integer getIdRating() {
        return idRating;
    }

    public void setIdRating(Integer idRating) {
        this.idRating = idRating;
    }

    public Integer getIdUser() {
        return idUser;
    }

    public void setIdUser(Integer idUser) {
        this.idUser = idUser;
    }

    public Integer getIdFilm() {
        return idFilm;
    }

    public void setIdFilm(Integer idFilm) {
        this.idFilm = idFilm;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

}
