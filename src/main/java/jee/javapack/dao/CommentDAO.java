package jee.javapack.dao;

import jee.javapack.beans.Comment;

import java.util.List;

public interface CommentDAO {
    void addComment(Comment comment);
    void updateComment(Comment comment);
    Comment getCommentById(Long id);
    List<Comment> getCommentsByFilmId(Long filmId);
    List<Comment> getCommentsByUserId(Long userId);
    void deleteComment(Long id);
}
