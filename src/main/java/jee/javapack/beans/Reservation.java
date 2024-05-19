package jee.javapack.beans;

import javax.persistence.*;
import java.sql.Time;
import java.util.Date;

@Entity
public class Reservation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idReservation;
    private Integer idUser;
    private Integer idFilm;
    private String qrCodeBillet;
    private String seatPlace;
    private String experienceType;
    private String offerBillet;
    private Date dateReservation;
    private Time timeReservation;

    public Reservation(Integer idReservation, Integer idUser, Integer idFilm, String qrCodeBillet, String seatPlace, String ExperienceType, String offerBillet, Date dateReservation, Time timeReservation) {
        this.idReservation = idReservation;
        this.idUser = idUser;
        this.idFilm = idFilm;
        this.qrCodeBillet = qrCodeBillet;
        this.seatPlace = seatPlace;
        this.experienceType = ExperienceType;
        this.offerBillet = offerBillet;
        this.dateReservation = dateReservation;
        this.timeReservation = timeReservation;
    }

    public Reservation() {

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

    public String getQrCodeBillet() {
        return qrCodeBillet;
    }

    public void setQrCodeBillet(String qrCodeBillet) {
        this.qrCodeBillet = qrCodeBillet;
    }

    public String getSeatPlace() {
        return seatPlace;
    }

    public void setSeatPlace(String seatPlace) {
        this.seatPlace = seatPlace;
    }

    public String getExperienceType() {
        return experienceType;
    }

    public void setExperienceType(String ExperienceType) {
        experienceType = ExperienceType;
    }

    public String getOfferBillet() {
        return offerBillet;
    }

    public void setOfferBillet(String offerBillet) {
        this.offerBillet = offerBillet;
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