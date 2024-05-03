package jee.javapack.servlets;

import jee.javapack.dao.ReservationDAO;
import jee.javapack.dao.ReservationDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ReservationHistory", value = "/ReservationHistory")
public class ReservationHistory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ReservationDAO reservationDAO = new ReservationDAOImpl();
        try {
            request.setAttribute("arrayReservation", reservationDAO.getUserReservation((Integer) session.getAttribute("id")));
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/ReservationHistory.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}