
package jee.javapack.servlets;


import jee.javapack.beans.Film;
import jee.javapack.dao.FilmDAO;
import jee.javapack.dao.FilmDAOImpl;
import jee.javapack.dao.LoginDAO;
import jee.javapack.dao.UserrDAO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

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
        System.out.println(role);
        if ("admin".equals(role)) {
            FilmDAOImpl show = new FilmDAOImpl();
            try {
                request.setAttribute("shows", show.showFilm());
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            this.getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
        } else if("user".equals(role)){
            List<Film> ratingFilms = filmDAO.getHighRatedFilms();
            request.setAttribute("ratingFilms", ratingFilms);
            request.setAttribute("trendFilms", ratingFilms);
            List<Film> films = filmDAO.getAllFilms();
            request.setAttribute("films", films);
            System.out.println(films);
            request.getRequestDispatcher("/CinemaHome.jsp").forward(request, response);
        } else if("notfound".equals(role)){
            response.sendRedirect("authentication.jsp");
        }
    }
}
