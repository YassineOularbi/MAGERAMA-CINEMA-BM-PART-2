package jee.javapack.dao;

import jee.javapack.beans.Comment;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDAOImpl implements CommentDAO {

    @Override
    public void addComment(Comment comment) {
        try (Connection connection = ConnectionDAO.getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO CommentFilm (idUser, idFilm, commentText) VALUES (?, ?, ?)")) {
            statement.setInt(1, comment.getIdUser());
            statement.setInt(2, comment.getIdFilm());
            statement.setString(3, comment.getCommentText());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateComment(Comment comment) {
        // Implémenter la logique pour mettre à jour un commentaire dans la base de données
    }

    @Override
    public Comment getCommentById(Long id) {
        // Implémenter la logique pour récupérer un commentaire par son identifiant dans la base de données
        return null;
    }

    @Override
    public List<Comment> getCommentsByFilmId(Long filmId) {
        // Implémenter la logique pour récupérer tous les commentaires pour un film donné dans la base de données
        return new ArrayList<>();
    }

    @Override
    public List<Comment> getCommentsByUserId(Long userId) {
        // Implémenter la logique pour récupérer tous les commentaires d'un utilisateur donné dans la base de données
        return new ArrayList<>();
    }

    @Override
    public void deleteComment(Long id) {
        // Implémenter la logique pour supprimer un commentaire de la base de données
    }
}
