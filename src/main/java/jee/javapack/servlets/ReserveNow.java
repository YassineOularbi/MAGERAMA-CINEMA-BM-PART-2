package jee.javapack.servlets;

import jee.javapack.beans.Film;
import jee.javapack.dao.FilmDAOImpl;
import jee.javapack.dao.ReservationDAOImpl;
import jee.javapack.dto.DateModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeParseException;
import java.util.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "ReserveNow", value = "/ReserveNow")
public class ReserveNow extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer idMovie = Integer.valueOf(request.getParameter("id"));
        FilmDAOImpl filmDAO = new FilmDAOImpl();
        Film foundFilm = null;
        try {
            foundFilm = filmDAO.getMovieById(idMovie);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String[] dates = foundFilm.getStreamingNow().split(" ");
        java.sql.Date minDate = java.sql.Date.valueOf(dates[0]);
        java.sql.Date maxDate = java.sql.Date.valueOf(dates[dates.length - 1]);
        request.setAttribute("minDate", minDate);
        request.setAttribute("maxDate", maxDate);
        request.setAttribute("dates", convertDate(foundFilm.getStreamingNow()));
        request.setAttribute("Movie", foundFilm);
        this.getServletContext().getRequestDispatcher("/Reservation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FilmDAOImpl filmDAO = new FilmDAOImpl();
        HttpSession session = request.getSession();
        ReservationDAOImpl reservationDAO = new ReservationDAOImpl();
        Integer idUser = (Integer) session.getAttribute("id");
        String dateStr = request.getParameter("dateInput");
        String time = request.getParameter("timeInput");
        String experience = request.getParameter("experienceInput");
        String seat = request.getParameter("seatInput");
        String offer = request.getParameter("offerInput");
        Integer idMovie = Integer.valueOf(request.getParameter("idInput"));
        String qrCode = generateRandomCode();
        time += ":00";
        try {
            reservationDAO.makeReservation(idUser, idMovie, java.sql.Date.valueOf(dateStr), java.sql.Time.valueOf(time), qrCode, seat, experience, offer);
            request.setAttribute("Movie", filmDAO.getMovieById(idMovie));
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("EEEE, MMM dd'th' yyyy", Locale.ENGLISH);
        try {
            LocalDate date = LocalDate.parse(dateStr, inputFormatter);
            String formattedDate = date.format(outputFormatter);

            request.setAttribute("date", formattedDate);
        } catch (DateTimeParseException e) {
            e.printStackTrace();
        }
        request.setAttribute("time", time);
        request.setAttribute("experience", experience);
        request.setAttribute("seat", seat);
        request.setAttribute("offer", offer);
        request.setAttribute("qrcode", qrCode);
        this.getServletContext().getRequestDispatcher("/ReservationTicket.jsp").forward(request, response);
    }
    public ArrayList<DateModel> convertDate (String dateData){
        String[] dates = dateData.split(" ");
        ArrayList<DateModel> outputDates = new ArrayList<>();
        for (String date : dates) {
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date dateFormat = inputFormat.parse(date);
                SimpleDateFormat outputFormat = new SimpleDateFormat("EEE dd MMM", Locale.ENGLISH);
                String[] outputDate = outputFormat.format(dateFormat).split(" ");
                outputDates.add(new DateModel(outputDate[0].toUpperCase(), outputDate[1].toUpperCase(), outputDate[2].toUpperCase()));
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }
        return outputDates;
    }
    public static String generateRandomCode() {
        Random random = new Random();

        String digits = "0123456789";
        String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

        String part1 = String.valueOf(random.nextInt(10));
        String part2 = String.valueOf(letters.charAt(random.nextInt(letters.length())));
        String part3 = String.valueOf(letters.charAt(random.nextInt(letters.length())));
        String part4 = String.valueOf(random.nextInt(10));
        String part5 = String.valueOf(letters.charAt(random.nextInt(letters.length())));
        String part6 = String.valueOf(random.nextInt(10));

        return "#" + part1 + part2 + part3 + part4 + part5 + part6;
    }
}