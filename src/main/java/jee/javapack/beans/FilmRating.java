package jee.javapack.beans;

public class FilmRating {
    private Long id;
    private Long filmId;
    private Long userId;
    private int rating;


    public FilmRating(Long id) {
        this.id = id;
    }
}
