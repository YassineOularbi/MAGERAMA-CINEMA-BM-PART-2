package jee.javapack.dao;

import jee.javapack.beans.Film;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface FilmDAO {

    List<Film> getHighRatedFilms() throws SQLException, ClassNotFoundException;
}
