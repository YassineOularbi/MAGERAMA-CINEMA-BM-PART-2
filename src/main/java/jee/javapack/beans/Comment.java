package jee.javapack.beans;


import javax.persistence.*;

@Entity
@Table(name = "commentfilm")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idComment;
    @Column(name = "id")
    private Integer idUser;
    private Integer idFilm;
    private String commentText;
    private Integer rating;


    public Comment() {

    }

    public Comment(int idUser, int idFilm, String commentText,Integer rating) {
        this.idUser = idUser;
        this.idFilm = idFilm;
        this.commentText = commentText;
        this.rating = rating;
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
    public Integer getRating() {
        return rating;
    }
    public void setRating(Integer rating) {
        this.rating = rating;
    }


    @Override
    public String toString() {
        return "Comment{" +
                "idComment=" + idComment +
                ", idUser=" + idUser +
                ", idFilm=" + idFilm +
                ", commentText='" + commentText + '\'' +
                ", rating=" + rating +
                '}';
    }

}
