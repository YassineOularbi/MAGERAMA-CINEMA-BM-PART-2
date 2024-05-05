
package jee.javapack.servlets;


import db.hibernate.dao.HibernateDAO;
import db.hibernate.dao.HibernateDAOImpl;
import jee.javapack.beans.Film;
import jee.javapack.dao.FilmDAO;
import jee.javapack.dao.FilmDAOImpl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final FilmDAO filmDAO = new FilmDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        HibernateDAO hibernateDAO = new HibernateDAOImpl();
        if ("admin".equals(role)) {
            try {
                request.setAttribute("shows", hibernateDAO.show(Film.class));
            } catch (InstantiationException | IllegalAccessException e) {
                throw new RuntimeException(e);
            }
            this.getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
        } else if("user".equals(role)){
            try {
                List<Film> ratingFilms = filmDAO.getHighRatedFilms();
                request.setAttribute("ratingFilms", ratingFilms);
                request.setAttribute("trendFilms", ratingFilms.get(0));
                request.setAttribute("films", hibernateDAO.show(Film.class));
            } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
                throw new RuntimeException(e);
            }
            this.getServletContext().getRequestDispatcher("/CinemaHome.jsp").forward(request, response);
        } else if("notfound".equals(role)){
            response.sendRedirect("authentication.jsp");
        }
    }
}
