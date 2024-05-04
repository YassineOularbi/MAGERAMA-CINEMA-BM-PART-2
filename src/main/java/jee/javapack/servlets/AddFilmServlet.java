package jee.javapack.servlets;

import db.hibernate.dao.HibernateDAO;
import db.hibernate.dao.HibernateDAOImpl;
import jee.javapack.beans.Film;
import jee.javapack.dao.FilmDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "AddFilmServlet", value = "/addFilm")
public class AddFilmServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/addFilm.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HibernateDAO hibernateDAO = new HibernateDAOImpl();
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
        Film film = new Film(null, titleFilm, descriptionFilm, runTimeFilm, genreFilm, producedIn, directedBy, pictureURL, backgroundURL, ratingFilm, streamingNow, trailer);
        try {
            hibernateDAO.save(film);
            request.setAttribute("shows", hibernateDAO.show(Film.class));
        } catch (InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);

    }
}