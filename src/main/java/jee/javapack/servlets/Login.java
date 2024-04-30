
package jee.javapack.servlets;


import jee.javapack.beans.Film;
import jee.javapack.dao.FilmDAO;
import jee.javapack.dao.FilmDAOImpl;
import jee.javapack.dao.LoginDAO;
import jee.javapack.dao.UserrDAO;

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
        String login = request.getParameter("login");
        String password = request.getParameter("pwd");

        UserrDAO user = LoginDAO.authenticate(login, password);
        System.out.println("Login Attempt: Email - " + login + ", Password - " + password);
        if (user != null) {
            session.setAttribute("login", login);

            String role = user.getRole();
            if ("admin".equals(role)) {
                FilmDAOImpl show=new FilmDAOImpl();
                try {
                    request.setAttribute("shows", show.showFilm());
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                this.getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
            } else {
                session.setAttribute("id", user.getId());
                session.getAttribute("id");
                List<Film> ratingFilms = filmDAO.getHighRatedFilms();
                request.setAttribute("ratingFilms", ratingFilms);
                request.setAttribute("trendFilms", ratingFilms);
                List<Film> films = filmDAO.getAllFilms();
                request.setAttribute("films", films);
                System.out.println(films);
                request.getRequestDispatcher("/CinemaHome.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("authentication.jsp");
        }
    }
}
