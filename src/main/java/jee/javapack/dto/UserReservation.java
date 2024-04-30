package jee.javapack.dto;

import java.sql.Time;
import java.util.Date;

public class UserReservation {
    private Integer idReservation;
    private Integer idUser;
    private Integer idFilm;
    private String userName;
    private String userMail;
    private Date dateReservation;
    private Time timeReservation;

    public UserReservation(Integer idReservation, Integer idUser, Integer idFilm, String userName, String userMail, Date dateReservation, Time timeReservation) {
        this.idReservation = idReservation;
        this.idUser = idUser;
        this.idFilm = idFilm;
        this.userName = userName;
        this.userMail = userMail;
        this.dateReservation = dateReservation;
        this.timeReservation = timeReservation;
    }

    public Integer getIdReservation() {
        return idReservation;
    }

    public void setIdReservation(Integer idReservation) {
        this.idReservation = idReservation;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserMail() {
        return userMail;
    }

    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }

    public Date getDateReservation() {
        return dateReservation;
    }

    public void setDateReservation(Date dateReservation) {
        this.dateReservation = dateReservation;
    }

    public Time getTimeReservation() {
        return timeReservation;
    }

    public void setTimeReservation(Time timeReservation) {
        this.timeReservation = timeReservation;
    }
}
