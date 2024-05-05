package jee.javapack.servlets;

import db.hibernate.dao.HibernateDAO;
import db.hibernate.dao.HibernateDAOImpl;
import jee.javapack.beans.Comment;
import jee.javapack.beans.Film;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CommentServlet", value = "/CommentServlet")
public class CommentServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer idMovie = Integer.valueOf(request.getParameter("id"));
        HibernateDAO hibernateDAO = new HibernateDAOImpl();
        Film foundFilm = null;
        try {
            foundFilm = (Film) hibernateDAO.get(Film.class, idMovie);
            request.setAttribute("Movie", foundFilm);
        } catch (InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("Movie", foundFilm);
        HttpSession session = request.getSession();
        try {
            request.setAttribute("shows", hibernateDAO.show(Comment.class));
            request.setAttribute("UserName", session.getAttribute("name").toString());
        } catch (InstantiationException | IllegalAccessException e) {
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
        String commentText = request.getParameter("commentText");
        Integer rating = Integer.valueOf(request.getParameter("rating"));
        System.out.println(commentText);
        System.out.println(userId);
        System.out.println(filmId);
        Comment comment = new Comment(userId, filmId, commentText,rating);
        try {
            hibernateDAO.save(comment);
            request.setAttribute("shows", hibernateDAO.show(Comment.class));
            request.setAttribute("UserName", session.getAttribute("name").toString());
        } catch (InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }


        Film foundFilm = null;
        try {
            foundFilm = (Film) hibernateDAO.get(Film.class, filmId);
            request.setAttribute("Movie", foundFilm);
        } catch (InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }


        this.getServletContext().getRequestDispatcher("/view.jsp").forward(request, response);

    }
}
