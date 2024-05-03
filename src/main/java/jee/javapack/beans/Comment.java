package jee.javapack.beans;

import java.time.LocalDateTime;

public class Comment {
    private int idComment;
    private int idUser;
    private int idFilm;
    private String commentText;
    private LocalDateTime commentDate;

    public Comment() {

    }

    public Comment(int idUser, int idFilm, String commentText) {
        this.idUser = idUser;
        this.idFilm = idFilm;
        this.commentText = commentText;
    }

    public int getIdComment() {
        return idComment;
    }

    public void setIdComment(int idComment) {
        this.idComment = idComment;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdFilm() {
        return idFilm;
    }

    public void setIdFilm(int idFilm) {
        this.idFilm = idFilm;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public LocalDateTime getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(LocalDateTime commentDate) {
        this.commentDate = commentDate;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "idComment=" + idComment +
                ", idUser=" + idUser +
                ", idFilm=" + idFilm +
                ", commentText='" + commentText + '\'' +
                ", commentDate=" + commentDate +
                '}';
    }

    public void setUserId(Long userId) {
    }

    public void setFilmId(Long filmId) {
    }
}
