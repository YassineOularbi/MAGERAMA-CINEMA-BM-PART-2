package jee.javapack.dao;

import jee.javapack.beans.Comment;
import jee.javapack.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDAOImpl implements CommentDAO {

    @Override
    public void addComment(Comment comment) {
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO CommentFilm (idUser, idFilm, commentText) VALUES (?, ?, ?)")) {
            statement.setInt(1, comment.getIdUser());
            statement.setInt(2, comment.getIdFilm());
            statement.setString(3, comment.getCommentText());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateComment(Comment comment) {
    }

    @Override
    public Comment getCommentById(Long id) {
        return null;
    }

    @Override
    public List<Comment> getCommentsByFilmId(Long filmId) {
        return new ArrayList<>();
    }

    @Override
    public List<Comment> getCommentsByUserId(Long userId) {
        return new ArrayList<>();
    }

    @Override
    public void deleteComment(Long id) {
    }
}
