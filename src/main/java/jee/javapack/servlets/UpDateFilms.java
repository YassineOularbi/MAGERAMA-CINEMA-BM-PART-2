package jee.javapack.servlets;

import jee.javapack.beans.Film;
import jee.javapack.dao.FilmDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "UpDateFilms", value = "/UpDateFilms")
public class UpDateFilms extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        FilmDAOImpl filmDAO = new FilmDAOImpl();
        try {
            Film film = filmDAO.getMovieById(id);
            request.setAttribute("film", film);
            System.out.println(film);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/UpDateFilm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer idFilm = Integer.valueOf(request.getParameter("idFilm"));
        String titleFilm = request.getParameter("titleFilm");
        String descriptionFilm = request.getParameter("descriptionFilm");
        String runTimeFilm = request.getParameter("runTimeFilm");
        String genreFilm = request.getParameter("genreFilm");
        Date producedIn = Date.valueOf(request.getParameter("producedIn"));
        String directedBy = request.getParameter("directedBy");
        String pictureURL = request.getParameter("pictureURL");
        String ratingFilm = request.getParameter("ratingFilm");
        String backgroundURL = request.getParameter("backgroundURL");
        String streamingNow = request.getParameter("streamingNow");
        Film film = new Film(idFilm, titleFilm, descriptionFilm, runTimeFilm, genreFilm, producedIn, directedBy, pictureURL, ratingFilm, backgroundURL, streamingNow);
        FilmDAOImpl filmDAO = new FilmDAOImpl();
        try {
            filmDAO.updateFilm(film);
            request.setAttribute("shows", filmDAO.showFilm());
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        this.getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
 }
}
