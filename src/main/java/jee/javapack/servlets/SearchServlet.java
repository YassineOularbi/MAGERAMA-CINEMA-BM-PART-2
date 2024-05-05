package jee.javapack.servlets;

import db.hibernate.dao.HibernateDAO;
import db.hibernate.dao.HibernateDAOImpl;
import jee.javapack.beans.Film;
import jee.javapack.dao.FilmDAO;
import jee.javapack.dao.FilmDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        FilmDAO filmDAO = new FilmDAOImpl();
        HibernateDAO hibernateDAO = new HibernateDAOImpl();
        try {
            List<Film> ratingFilms = filmDAO.getHighRatedFilms();
            request.setAttribute("ratingFilms", ratingFilms);
            request.setAttribute("trendFilms", hibernateDAO.get(Film.class, id));
            request.setAttribute("films", hibernateDAO.show(Film.class));
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/CinemaHome.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titleFilm =request.getParameter("titleFilm");
        FilmDAO filmDAO = new FilmDAOImpl();
        HibernateDAO hibernateDAO = new HibernateDAOImpl();
        try {
            List<Film> ratingFilms = filmDAO.getHighRatedFilms();
            ArrayList<Film> film = hibernateDAO.byTitle(Film.class, titleFilm);
            request.setAttribute("ratingFilms", ratingFilms);
            if (!film.isEmpty()) {
                request.setAttribute("trendFilms", film.get(0));
                request.setAttribute("searchedFilm", film);
            }
            request.setAttribute("films", hibernateDAO.show(Film.class));
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/CinemaHome.jsp").forward(request, response);

    }

}