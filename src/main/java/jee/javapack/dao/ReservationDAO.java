package jee.javapack.dao;

import jee.javapack.dto.UserReservation;
import jee.javapack.dto.UserTicket;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ReservationDAO {
    ArrayList<UserReservation> getUserReservation(Integer idUser) throws SQLException, ClassNotFoundException;
    UserTicket getUserTicket(Integer idReservation) throws  SQLException, ClassNotFoundException;
}
