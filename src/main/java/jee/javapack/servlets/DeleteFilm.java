package jee.javapack.servlets;

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

    private FilmDAO filmDao;

    @Override
    public void init() throws ServletException {
        super.init();
        filmDao = new FilmDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer idFilm = Integer.parseInt(request.getParameter("idFilm"));
        try {
            filmDao.deleteFilm(idFilm);
            request.setAttribute("shows", filmDao.showFilm());
        } catch (SQLException e) {
            throw new ServletException("Failed to delete film", e);
        }
        request.getRequestDispatcher("/Admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer idFilm = Integer.parseInt(request.getParameter("idFilm"));
        try {
            filmDao.deleteFilm(idFilm);
            request.setAttribute("shows", filmDao.showFilm());
        } catch (SQLException e) {
            throw new ServletException("Failed to delete film", e);
        }
        request.getRequestDispatcher("/Admin.jsp").forward(request, response);
    }
}
