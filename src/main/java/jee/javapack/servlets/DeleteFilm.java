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

@WebServlet(name = "DeleteFilm", value = "/DeleteFilm")
public class DeleteFilm extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HibernateDAO hibernateDAO = new HibernateDAOImpl();
        Integer idFilm = Integer.parseInt(request.getParameter("idFilm"));
        try {
            hibernateDAO.delete(Film.class, idFilm);
            request.setAttribute("shows", hibernateDAO.show(Film.class));
        } catch (InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/Admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer idFilm = Integer.parseInt(request.getParameter("idFilm"));
        HibernateDAOImpl hibernateDAO = new HibernateDAOImpl();
        try {
            request.setAttribute("shows", hibernateDAO.show(Film.class));
            hibernateDAO.delete(Film.class, idFilm);
        } catch (InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/Admin.jsp").forward(request, response);
    }
}
