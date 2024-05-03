package jee.javapack.dao;
import jee.javapack.beans.Film;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class FilmDAOImpl implements FilmDAO {


    @Override
    public List<Film> getHighRatedFilms() throws SQLException, ClassNotFoundException{
        List<Film> highRatedFilms = new ArrayList<>();
        Connection connection = ConnectionDAO.getConnection();
        String query = "SELECT * FROM film WHERE ratingFilm > 4 ORDER BY  ratingFilm DESC ";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            Film film = new Film();
            film.setIdFilm(resultSet.getInt("idFilm"));
            film.setTitleFilm(resultSet.getString("titleFilm"));
            film.setDescriptionFilm(resultSet.getString("descriptionFilm"));
            film.setRunTimeFilm(resultSet.getString("runTimeFilm"));
            film.setGenreFilm(resultSet.getString("genreFilm"));
            film.setProducedIn(resultSet.getDate("producedIn"));
            film.setDirectedBy(resultSet.getString("directedBy"));
            film.setPictureURL(resultSet.getString("pictureURL"));
            film.setStreamingNow(resultSet.getString("streamingNow"));
            film.setRatingFilm(resultSet.getString("ratingFilm"));
            film.setBackgroundURL(resultSet.getString("backgroundURL"));
            highRatedFilms.add(film);
        }
        return highRatedFilms;
    }


    @Override
    public ArrayList<Film> SearchFilms(String Title) throws SQLException, ClassNotFoundException {
        Connection connection = ConnectionDAO.getConnection();
        ArrayList<Film> SearchFilmsRe = new ArrayList<>();
        String requet = "SELECT * FROM  film WHERE titleFilm=?";
        PreparedStatement statement = connection.prepareStatement(requet);
        statement.setString(1, Title);
        ResultSet resultat = statement.executeQuery();
        while (resultat.next()) {
            Integer idFilm = resultat.getInt("idFilm");
            String titleFilm = resultat.getString("titleFilm");
            String descriptionFilm = resultat.getString("descriptionFilm");
            String runTimeFilm = resultat.getString("runTimeFilm");
            String genreFilm = resultat.getString("genreFilm");
            Date producedIn = resultat.getDate("producedIn");
            String directedBy = resultat.getString("directedBy");
            String pictureURL = resultat.getString("pictureURL");
            String backgroundURL = resultat.getString("backgroundURL");
            String ratingFilm = resultat.getString("ratingFilm");
            String streamingNow = resultat.getString("streamingNow");
            SearchFilmsRe.add(new Film(idFilm,  titleFilm,  descriptionFilm,  runTimeFilm,  genreFilm,  producedIn,  directedBy,  pictureURL,  backgroundURL,  ratingFilm,  streamingNow));
        }
        connection.close();
        statement.close();
        return SearchFilmsRe;
    }
}

