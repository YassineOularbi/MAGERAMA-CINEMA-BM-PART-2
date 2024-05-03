package jee.javapack.dao;

import jee.javapack.beans.Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CommentDAOImpl implements CommentDAO {

    @Override
    public void addComment(Comment comment) {
        try (Connection connection = ConnectionDAO.getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO CommentFilm (idUser, idFilm, commentText) VALUES (?, ?, ?)")) {
            statement.setLong(1, comment.getIdUser());
            statement.setLong(2, comment.getIdFilm());
            statement.setString(3, comment.getCommentText());
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Comment> getComments() {
        List<Comment> comments = new ArrayList<>();
        try (Connection connection = ConnectionDAO.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM CommentFilm");
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                long id = resultSet.getLong("id");
                long idUser = resultSet.getLong("idUser");
                long idFilm = resultSet.getLong("idFilm");
                String commentText = resultSet.getString("commentText");

                // Créer un objet Comment à partir des données de la base de données
                Comment comment = new Comment(id, idUser, idFilm, commentText);
                // Ajouter l'objet Comment à la liste
                comments.add(comment);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return comments;
    }

    @Override
    public void deleteComment(Long id) {
        try (Connection connection = ConnectionDAO.getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM CommentFilm WHERE id = ?")) {
            statement.setLong(1, id);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


}
