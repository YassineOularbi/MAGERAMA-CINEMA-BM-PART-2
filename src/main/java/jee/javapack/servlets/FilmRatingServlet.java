package jee.javapack.servlets;

import jee.javapack.beans.FilmRating;
import jee.javapack.dao.FilmRatingDAO;
import jee.javapack.dao.FilmRatingDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "FilmRatingServlet", value = "/FilmRatingServlet")
public class FilmRatingServlet extends HttpServlet {

    private final FilmRatingDAO filmRatingDAO = new FilmRatingDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les données de la requête
        long filmId = Long.parseLong(request.getParameter("filmId"));
        long userId = Long.parseLong(request.getParameter("userId"));
        int rating = Integer.parseInt(request.getParameter("rating"));

        // Créer un objet FilmRating avec les données récupérées
        FilmRating filmRating = new FilmRating(filmId, userId, rating);

        // Appeler la méthode addFilmRating du DAO pour ajouter la note de film dans la base de données
        filmRatingDAO.addFilmRating(filmRating);

        // Rediriger l'utilisateur vers une page de confirmation ou une autre page de votre choix
        response.sendRedirect("confirmation.html");
    }
}
