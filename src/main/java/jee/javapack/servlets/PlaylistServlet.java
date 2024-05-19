package jee.javapack.servlets;

import db.hibernate.dao.HibernateDAO;
import db.hibernate.dao.HibernateDAOImpl;
import jee.javapack.beans.Playlist;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "playlist", value = "/playlist")
public class PlaylistServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HibernateDAO hibernateDAO = new HibernateDAOImpl();
        HttpSession session = request.getSession();
        Integer idFilm = Integer.valueOf(request.getParameter("id"));
        Integer idUser = (Integer) session.getAttribute("id");
        Playlist playlist = new Playlist(null, idUser, idFilm);
        try {
            hibernateDAO.save(playlist);
            request.setAttribute("films", hibernateDAO.getPlaylist(idUser));
        } catch (InstantiationException | IllegalAccessException | SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/playlist.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}