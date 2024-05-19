package jee.javapack.dto;

import javax.persistence.Entity;
import java.sql.Time;
import java.util.Date;

@Entity
public class UserTicket {
    private String titleFilm;
    private String backgroundURL;
    private String pictureURL;
    private Date dateReservation;
    private Time timeReservation;
    private String qrCodeBillet;
    private String seatPlace;
    private String experienceType;
    private String offerBillet;

    public UserTicket(String titleFilm, String backgroundURL, String pictureURL, Date dateReservation, Time timeReservation, String qrCodeBillet, String seatPlace, String experienceType, String offerBillet) {
        this.titleFilm = titleFilm;
        this.backgroundURL = backgroundURL;
        this.pictureURL = pictureURL;
        this.dateReservation = dateReservation;
        this.timeReservation = timeReservation;
        this.qrCodeBillet = qrCodeBillet;
        this.seatPlace = seatPlace;
        this.experienceType = experienceType;
        this.offerBillet = offerBillet;
    }

    public UserTicket() {

    }

    public String getTitleFilm() {
        return titleFilm;
    }

    public void setTitleFilm(String titleFilm) {
        this.titleFilm = titleFilm;
    }

    public String getBackgroundURL() {
        return backgroundURL;
    }

    public void setBackgroundURL(String backgroundURL) {
        this.backgroundURL = backgroundURL;
    }

    public String getPictureURL() {
        return pictureURL;
    }

    public void setPictureURL(String pictureURL) {
        this.pictureURL = pictureURL;
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

    public void setExperienceType(String experienceType) {
        this.experienceType = experienceType;
    }

    public String getOfferBillet() {
        return offerBillet;
    }

    public void setOfferBillet(String offerBillet) {
        this.offerBillet = offerBillet;
    }

    @Override
    public String toString() {
        return "UserTicket{" +
                "titleFilm='" + titleFilm + '\'' +
                ", backgroundURL='" + backgroundURL + '\'' +
                ", pictureURL='" + pictureURL + '\'' +
                ", dateReservation=" + dateReservation +
                ", timeReservation=" + timeReservation +
                ", qrCodeBillet='" + qrCodeBillet + '\'' +
                ", seatPlace='" + seatPlace + '\'' +
                ", experienceType='" + experienceType + '\'' +
                ", offerBillet='" + offerBillet + '\'' +
                '}';
    }
}
