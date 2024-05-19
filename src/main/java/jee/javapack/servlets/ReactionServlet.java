package jee.javapack.servlets;

import db.hibernate.dao.HibernateDAO;
import db.hibernate.dao.HibernateDAOImpl;
import jee.javapack.beans.Film;
import jee.javapack.beans.Reaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet(name = "ReactionServlet", value = "/ReactionServlet")
public class ReactionServlet extends HttpServlet {


   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer idMovie = Integer.valueOf(request.getParameter("id"));
        HibernateDAO hibernateDAO = new HibernateDAOImpl();
        HttpSession session = request.getSession();
        Film foundFilm = null;
        try {
            foundFilm = (Film) hibernateDAO.get(Film.class, idMovie);
            request.setAttribute("Movie", foundFilm);
            request.setAttribute("shows", hibernateDAO.show(Reaction.class));
            request.setAttribute("UserName", session.getAttribute("name").toString());
            request.setAttribute("average", hibernateDAO.loadRating(idMovie));
            request.setAttribute("total", hibernateDAO.totalRating(idMovie));
            request.setAttribute("RatingCount", hibernateDAO.getRatingCounts(idMovie));
            request.setAttribute("shows", hibernateDAO.getReaction(idMovie));
        } catch (InstantiationException | IllegalAccessException | SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        this.getServletContext().getRequestDispatcher("/view.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        HibernateDAO hibernateDAO = new HibernateDAOImpl();
        Integer userId = (Integer) session.getAttribute("id");
        Integer filmId = Integer.valueOf(request.getParameter("filmId"));
        Integer rating = Integer.valueOf(request.getParameter("rating"));
        String commentText = request.getParameter("comment");
        Reaction reaction = new Reaction(userId, filmId, commentText, rating);
        Film foundFilm = null;
        try {
            hibernateDAO.save(reaction);
            request.setAttribute("average", hibernateDAO.loadRating(filmId));
            request.setAttribute("total", hibernateDAO.totalRating(filmId));
            request.setAttribute("RatingCount", hibernateDAO.getRatingCounts(filmId));
            foundFilm = (Film) hibernateDAO.get(Film.class, filmId);
            request.setAttribute("Movie", foundFilm);
            request.setAttribute("shows", hibernateDAO.getReaction(filmId));
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/view.jsp").forward(request, response);

    }
}
