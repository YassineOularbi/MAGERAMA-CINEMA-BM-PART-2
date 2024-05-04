package jee.javapack.servlets;

import db.hibernate.dao.HibernateDAO;
import db.hibernate.dao.HibernateDAOImpl;
import jee.javapack.beans.Film;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "UpDateFilms", value = "/UpDateFilms")
public class UpDateFilms extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer idMovie = Integer.valueOf(request.getParameter("id"));
        HibernateDAO hibernateDAO = new HibernateDAOImpl();
        try {
            Film foundFilm = (Film) hibernateDAO.get(Film.class, idMovie);
            request.setAttribute("film", foundFilm);
        } catch (InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/UpDateFilm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HibernateDAO hibernateDAO = new HibernateDAOImpl();
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
        String trailer = request.getParameter("trailer");
        Film film = new Film(idFilm, titleFilm, descriptionFilm, runTimeFilm, genreFilm, producedIn, directedBy, pictureURL, backgroundURL, ratingFilm, streamingNow, trailer);
        try {
            hibernateDAO.merge(film);
            request.setAttribute("shows", hibernateDAO.show(Film.class));
        } catch (InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
 }
}
