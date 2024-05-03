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

        long filmId = Long.parseLong(request.getParameter("filmId"));
        long userId = Long.parseLong(request.getParameter("userId"));
        int rating = Integer.parseInt(request.getParameter("rating"));


        FilmRating filmRating = new FilmRating(filmId, userId, rating);

        filmRatingDAO.addFilmRating(filmRating);

        response.sendRedirect("confirmation.jsp");
    }
}
