package jee.javapack.dao;

import jee.javapack.beans.Reservation;
import jee.javapack.dto.UserReservation;
import jee.javapack.dto.UserTicket;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public interface ReservationDAO {
    List<Reservation> getReservationsByUserId(int userId);
    void makeReservation(Integer idUser, Integer idMovie, Date dateReserve, Time timeReserve, String qrCode, String seat, String experience, String offer) throws SQLException, ClassNotFoundException;
    ArrayList<UserReservation> getUserReservation(Integer idUser) throws SQLException, ClassNotFoundException;
    UserTicket getUserTicket(Integer idReservation) throws  SQLException, ClassNotFoundException;
}
