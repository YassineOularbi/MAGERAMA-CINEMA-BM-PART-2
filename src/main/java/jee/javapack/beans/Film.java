package jee.javapack.beans;

import java.sql.Date;


public class Film {
    private Integer idFilm;
    private String titleFilm;
    private String descriptionFilm;
    private String runTimeFilm;
    private String genreFilm;
    private Date producedIn;
    private String directedBy;
    private String pictureURL;
    private String backgroundURL;
    private String ratingFilm;
    private String streamingNow;

    public Film(Integer idFilm, String titleFilm, String descriptionFilm, String runTimeFilm, String genreFilm, Date producedIn, String directedBy, String pictureURL, String backgroundURL, String ratingFilm, String streamingNow) {
        this.idFilm = idFilm;
        this.titleFilm = titleFilm;
        this.descriptionFilm = descriptionFilm;
        this.runTimeFilm = runTimeFilm;
        this.genreFilm = genreFilm;
        this.producedIn = producedIn;
        this.directedBy = directedBy;
        this.pictureURL = pictureURL;
        this.backgroundURL = backgroundURL;
        this.ratingFilm = ratingFilm;
        this.streamingNow = streamingNow;
    }

    public Film() {}

    public int getIdFilm() {
        return idFilm;
    }

    public void setIdFilm(int idFilm) {
        this.idFilm = idFilm;
    }

    public String getDescriptionFilm() {
        return descriptionFilm;
    }

    public void setDescriptionFilm(String descriptionFilm) {
        this.descriptionFilm = descriptionFilm;
    }

    public String getTitleFilm() {
        return titleFilm;
    }

    public void setTitleFilm(String titleFilm) {
        this.titleFilm = titleFilm;
    }

    public String getRunTimeFilm() {
        return runTimeFilm;
    }

    public void setRunTimeFilm(String runTimeFilm) {
        this.runTimeFilm = runTimeFilm;
    }

    public String getGenreFilm() {
        return genreFilm;
    }

    public void setGenreFilm(String genreFilm) {
        this.genreFilm = genreFilm;
    }

    public Date getProducedIn() {
        return producedIn;
    }

    public void setProducedIn(Date producedIn) {
        this.producedIn = producedIn;
    }

    public String getDirectedBy() {
        return directedBy;
    }

    public void setDirectedBy(String directedBy) {
        this.directedBy = directedBy;
    }

    public String getPictureURL() {
        return pictureURL;
    }

    public void setPictureURL(String pictureURL) {
        this.pictureURL = pictureURL;
    }

    public String getBackgroundURL() {
        return backgroundURL;
    }

    public void setBackgroundURL(String backgroundURL) {
        this.backgroundURL = backgroundURL;
    }

    public String getRatingFilm() {
        return ratingFilm;
    }

    public void setRatingFilm(String ratingFilm) {
        this.ratingFilm = ratingFilm;
    }

    public String getStreamingNow() {
        return streamingNow;
    }

    public void setStreamingNow(String streamingNow) {
        this.streamingNow = streamingNow;
    }

    @Override
    public String toString() {
        return "Film{" +
                "idFilm=" + idFilm +
                ", titleFilm='" + titleFilm + '\'' +
                ", descriptionFilm='" + descriptionFilm + '\'' +
                ", runTimeFilm=" + runTimeFilm +
                ", genreFilm='" + genreFilm + '\'' +
                ", producedIn=" + producedIn +
                ", directedBy='" + directedBy + '\'' +
                ", pictureURL='" + pictureURL + '\'' +
                ", backgroundURL='" + backgroundURL + '\'' +
                ", ratingFilm='" + ratingFilm + '\'' +
                ", streamingNow=" + streamingNow +
                '}';
    }
}
