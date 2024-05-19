package jee.javapack.dto;


public class FilmReaction {
    private String UserName;
    private String commentText;
    private Integer rating;

    public FilmReaction(String userName, String commentText, Integer rating) {
        UserName = userName;
        this.commentText = commentText;
        this.rating = rating;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
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
}
