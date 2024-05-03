package jee.javapack.dao;

import jee.javapack.beans.Comment;

import java.util.List;

public interface CommentDAO {
    void addComment(Comment comment);

    List<Comment> getComments();

    void deleteComment(Long id);
}
