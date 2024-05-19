package jee.javapack.servlets;

import db.hibernate.dao.HibernateDAO;
import db.hibernate.dao.HibernateDAOImpl;
import jee.javapack.beans.Film;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer id = Integer.valueOf(request.getParameter("id"));
        HibernateDAO hibernateDAO = new HibernateDAOImpl();
        try {
            request.setAttribute("recommendedFilm", hibernateDAO.loadRecommendation((Integer) session.getAttribute("id")));
            request.setAttribute("ratingFilms", hibernateDAO.getHighRatedFilms());
            request.setAttribute("trendFilms", hibernateDAO.get(Film.class, id));
            request.setAttribute("films", hibernateDAO.show(Film.class));
            request.setAttribute("ShowingNow", hibernateDAO.ShowingNow());
            request.setAttribute("ComingSoon", hibernateDAO.ComingSoon());
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/CinemaHome.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String titleFilm =request.getParameter("titleFilm");
        HibernateDAO hibernateDAO = new HibernateDAOImpl();
        try {
            ArrayList<Film> film = hibernateDAO.byTitle(Film.class, titleFilm);
            request.setAttribute("recommendedFilm", hibernateDAO.loadRecommendation((Integer) session.getAttribute("id")));
            request.setAttribute("ratingFilms", hibernateDAO.getHighRatedFilms());
            if (!film.isEmpty()) {
                request.setAttribute("trendFilms", film.get(0));
                request.setAttribute("searchedFilm", film);
            }
            request.setAttribute("films", hibernateDAO.show(Film.class));
            request.setAttribute("ShowingNow", hibernateDAO.ShowingNow());
            request.setAttribute("ComingSoon", hibernateDAO.ComingSoon());
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/CinemaHome.jsp").forward(request, response);

    }

}