package jee.javapack.servlets;

import jee.javapack.dao.ReservationDAO;
import jee.javapack.dao.ReservationDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ReservationTicket", value = "/ReservationTicket")
public class ReservationTicket extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ReservationDAO reservationDAO = new ReservationDAOImpl();
        Integer reservationId = Integer.valueOf(request.getParameter("reservationId"));
        System.out.println(reservationId);
        try {
            System.out.println(reservationDAO.getUserTicket(reservationId));
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            request.setAttribute("ticket", reservationDAO.getUserTicket(reservationId));
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/ReservationTicketHistory.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}