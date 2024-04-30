package jee.javapack.dao;

import jee.javapack.beans.Reservation;

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
                    Reservation reservation = new Reservation(
                            resultSet.getInt("idReservation"),
                            resultSet.getInt("idUser"),
                            resultSet.getInt("idFilm"),
                            resultSet.getDate("dateReservation"),
                            resultSet.getInt("numberBillets")
                    );
                    reservations.add(reservation);
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
    // Implémentez d'autres méthodes nécessaires pour votre DAO
}
