package jee.javapack.dao;

import jee.javapack.beans.Reservation;
import jee.javapack.dto.UserReservation;
import jee.javapack.dto.UserTicket;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAOImpl implements ReservationDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/cinema_db";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "root";

    @Override
    public List<Reservation> getReservationsByUserId(int userId) {
        List<Reservation> reservations = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Reservation WHERE idUser = ?");
        ) {
            preparedStatement.setInt(1, userId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {


                }
            }

        } catch (SQLException e) {
            System.err.println("Error fetching reservations: " + e.getMessage());
            e.printStackTrace();
        }

        return reservations;
    }
    @Override
    public void makeReservation(Integer idUser, Integer idMovie, Date dateReserve, Time timeReserve, String qrCode, String seat, String experience, String offer) throws SQLException, ClassNotFoundException {
        Connection connection = ConnectionDAO.getConnection();
        String queryReserve = "INSERT INTO Reservation (idUser, idFilm, dateReservation, timeReservation, qrCodeBillet, seatPlace, experienceType, offerBillet) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(queryReserve);
        statement.setInt(1, idUser);
        statement.setInt(2, idMovie);
        statement.setDate(3, dateReserve);
        statement.setTime(4, timeReserve);
        statement.setString(5, qrCode);
        statement.setString(6, seat);
        statement.setString(7, experience);
        statement.setString(8, offer);
        statement.executeUpdate();
        connection.close();
        statement.close();
    }

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
        return userTicket;
    }

}
