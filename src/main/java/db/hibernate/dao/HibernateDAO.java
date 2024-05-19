package db.hibernate.dao;

import jee.javapack.beans.Film;
import jee.javapack.beans.Reaction;
import jee.javapack.beans.Reservation;
import jee.javapack.dto.*;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface HibernateDAO {
    void save(Object C) throws InstantiationException, IllegalAccessException;
    <T> void delete(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException;
    void merge(Object C) throws InstantiationException, IllegalAccessException;
    <T> ArrayList<T> show(Class<T> C) throws InstantiationException, IllegalAccessException;
    <T> Object load(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException;
    <T> Object get(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException;
    <T> ArrayList<T> byTitle(Class<T> C, String title) throws InstantiationException, IllegalAccessException;
    UserDTO authenticate(String login, String password) throws SQLException, ClassNotFoundException;
    List<Film> getHighRatedFilms() throws SQLException, ClassNotFoundException;
    ArrayList<Film> loadRecommendation(Integer idUser)  throws SQLException, ClassNotFoundException;
    ArrayList<Film> ShowingNow()  throws SQLException, ClassNotFoundException;
    ArrayList<Film> ComingSoon()  throws SQLException, ClassNotFoundException;
    ArrayList<Reservation> getUserReservation(Integer idUser) throws SQLException, ClassNotFoundException;
    UserTicket getUserTicket(Integer idReservation) throws  SQLException, ClassNotFoundException;
    BigDecimal loadRating(Integer idFilm) throws  SQLException, ClassNotFoundException;
    BigInteger totalRating(Integer idFilm) throws SQLException, ClassNotFoundException;
    List<RatingCount> getRatingCounts(Integer idFilm) throws SQLException, ClassNotFoundException;

    ArrayList<MyFilm> getPlaylist(Integer idUser) throws SQLException, ClassNotFoundException;

    ArrayList<FilmReaction> getReaction(Integer idFilm) throws SQLException, ClassNotFoundException;

}
