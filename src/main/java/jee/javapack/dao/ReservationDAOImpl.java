package jee.javapack.dao;

import jee.javapack.dto.UserReservation;
import jee.javapack.dto.UserTicket;

import java.sql.*;
import java.util.ArrayList;

public class ReservationDAOImpl implements ReservationDAO {


    @Override
    public ArrayList<UserReservation> getUserReservation(Integer idUser) throws SQLException, ClassNotFoundException {
        ArrayList<UserReservation> userReservations = new ArrayList<>();
        Connection connection = ConnectionDAO.getConnection();
        String queryUser = "SELECT Reservation.idReservation, Reservation.idFilm, Reservation.idUser, Reservation.dateReservation, Reservation.timeReservation, users.username, users.user_mail  FROM Reservation INNER JOIN users ON Reservation.idUser = users.id WHERE Reservation.idUser = ?";
        PreparedStatement statement = connection.prepareStatement(queryUser);
        statement.setInt(1, idUser);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()){
            Integer idReservation = resultSet.getInt("Reservation.idReservation");
            Integer idFilm = resultSet.getInt( "Reservation.idFilm");
            Integer idUsers = resultSet.getInt("Reservation.idUser");
            String userName = resultSet.getString("users.username");
            String userMail = resultSet.getString("users.user_mail");
            Date dateReservation = resultSet.getDate("Reservation.dateReservation");
            Time timeReservation = resultSet.getTime("Reservation.timeReservation");
            UserReservation userReservation = new UserReservation(idReservation, idFilm, idUsers, userName, userMail, dateReservation, timeReservation);
            userReservations.add(userReservation);
        }
        connection.close();
        statement.close();
        return userReservations;
    }

    @Override
    public UserTicket getUserTicket(Integer idReservation) throws SQLException, ClassNotFoundException {
        UserTicket userTicket = null;
        Connection connection = ConnectionDAO.getConnection();
        String queryUser = "SELECT film.backgroundURL, film.pictureURL, film.titleFilm, Reservation.dateReservation, Reservation.timeReservation, Reservation.qrCodeBillet, Reservation.seatPlace, Reservation.experienceType, Reservation.offerBillet FROM Reservation INNER JOIN film ON Reservation.idFilm = film.idFilm WHERE Reservation.idReservation = ?";
        PreparedStatement statement = connection.prepareStatement(queryUser);
        statement.setInt(1, idReservation);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()){
            String backgroundURL = resultSet.getString("film.backgroundURL");
            String pictureURL = resultSet.getString("film.pictureURL");
            String titleFilm = resultSet.getString("film.titleFilm");
            Date dateReservation = resultSet.getDate("Reservation.dateReservation");
            Time timeReservation = resultSet.getTime("Reservation.timeReservation");
            String qrCodeBillet = resultSet.getString("Reservation.qrCodeBillet");
            String seatPlace = resultSet.getString("Reservation.seatPlace");
            String experienceType = resultSet.getString("Reservation.experienceType");
            String offerBillet = resultSet.getString("Reservation.offerBillet");
            userTicket = new UserTicket(titleFilm, backgroundURL, pictureURL, dateReservation, timeReservation, qrCodeBillet, seatPlace, experienceType, offerBillet);
        }
        connection.close();
        statement.close();
        return userTicket;
    }
}
