package jee.javapack.dao;

import jee.javapack.beans.Reservation;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;

public interface ReservationDAO {
    List<Reservation> getReservationsByUserId(int userId);
    public void makeReservation(Integer idUser, Integer idMovie, Date dateReserve, Time timeReserve, String qrCode, String seat, String experience, String offer) throws SQLException, ClassNotFoundException;

}
