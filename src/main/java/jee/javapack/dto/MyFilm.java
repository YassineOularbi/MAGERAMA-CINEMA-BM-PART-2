package jee.javapack.dto;

public class MyFilm {
    private Integer idFilm;
    private String pictureURL;
    private String titleFilm;
    private String descriptionFilm;

    public MyFilm(Integer idFilm, String pictureURL, String titleFilm, String descriptionFilm) {
        this.idFilm = idFilm;
        this.pictureURL = pictureURL;
        this.titleFilm = titleFilm;
        this.descriptionFilm = descriptionFilm;
    }

    public Integer getIdFilm() {
        return idFilm;
    }

    public void setIdFilm(Integer idFilm) {
        this.idFilm = idFilm;
    }

    public String getPictureURL() {
        return pictureURL;
    }

    public void setPictureURL(String pictureURL) {
        this.pictureURL = pictureURL;
    }

    public String getTitleFilm() {
        return titleFilm;
    }

    public void setTitleFilm(String titleFilm) {
        this.titleFilm = titleFilm;
    }

    public String getDescriptionFilm() {
        return descriptionFilm;
    }

    public void setDescriptionFilm(String descriptionFilm) {
        this.descriptionFilm = descriptionFilm;
    }
}
