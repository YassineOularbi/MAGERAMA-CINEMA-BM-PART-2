package jee.javapack.dao;
import jee.javapack.beans.Film;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class FilmDAOImpl implements FilmDAO {


    public void statementFilm(ArrayList<Film> listFilm, PreparedStatement statement) throws SQLException {
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Film film = new Film(
                    resultSet.getInt("idFilm"),
                    resultSet.getString("titleFilm"),
                    resultSet.getString("descriptionFilm"),
                    resultSet.getString("runTimeFilm"),
                    resultSet.getString("genreFilm"),
                    resultSet.getDate("producedIn"),
                    resultSet.getString("directedBy"),
                    resultSet.getString("pictureURL"),
                    resultSet.getString("backgroundURL"),
                    resultSet.getString("ratingFilm"),
                    resultSet.getString("streamingNow")
            );
            listFilm.add(film);
        }
    }



    @Override
    public List<Film> getHighRatedFilms() {
        List<Film> highRatedFilms = new ArrayList<>();

        try {
            Connection connection = ConnectionDAO.getConnection();
            String query = "SELECT * FROM film WHERE ratingFilm > 4 ORDER BY ratingFilm DESC";
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
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return highRatedFilms;
    }


    @Override
    public Film getMovieById(Integer idMovie) throws SQLException, ClassNotFoundException {
        Film foundFilm = null;
        Connection connection = ConnectionDAO.getConnection();
        String queryIdMovie = "SELECT * FROM film WHERE idFilm = ?";
        PreparedStatement statement = connection.prepareStatement(queryIdMovie);
        statement.setInt(1, idMovie);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            foundFilm = new Film(
                    resultSet.getInt("idFilm"),
                    resultSet.getString("titleFilm"),
                    resultSet.getString("descriptionFilm"),
                    resultSet.getString("runTimeFilm"),
                    resultSet.getString("genreFilm"),
                    resultSet.getDate("producedIn"),
                    resultSet.getString("directedBy"),
                    resultSet.getString("pictureURL"),
                    resultSet.getString("backgroundURL"),
                    resultSet.getString("ratingFilm"),
                    resultSet.getString("streamingNow")
            );
        }
        return foundFilm;
    }


    @Override
    public List<Film> getAllFilms(){

        List<Film> films = new ArrayList<>();

                try {
                    Connection connection = ConnectionDAO.getConnection();
                    String query = "SELECT * FROM film";
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
                        film.setPictureURL(resultSet.getString("pictureURL"));
                        film.setStreamingNow(resultSet.getString("streamingNow"));
                        film.setRatingFilm(resultSet.getString("ratingFilm"));

                        films.add(film);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return films;
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

        return SearchFilmsRe;
    }

    @Override
    public void addFilms(Film film) throws SQLException {
        Connection connection = ConnectionDAO.getConnection();
        String sql = "INSERT INTO film ( titleFilm, descriptionFilm, runTimeFilm, genreFilm, producedIn, directedBy, pictureURL, ratingFilm, backgroundURL, streamingNow)\n" +
                "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, film.getTitleFilm());
            statement.setString(2, film.getDescriptionFilm());
            statement.setString(3, film.getRunTimeFilm());
            statement.setString(4, film.getGenreFilm());
            statement.setDate(5, film.getProducedIn());
            statement.setString(6, film.getDirectedBy());
            statement.setString(7, film.getPictureURL());
            statement.setString(8, film.getRatingFilm());
            statement.setString(9, film.getBackgroundURL());
            statement.setString(10, film.getStreamingNow());
            statement.executeUpdate();
        }

    }
    @Override
    public  ArrayList<Film> showFilm() throws SQLException {
        Connection connection = ConnectionDAO.getConnection();
        ArrayList<Film> films = new ArrayList<>();
        String sql = "SELECT * FROM film";
        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultat = statement.executeQuery()) {
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

                Film film = new Film(idFilm, titleFilm,  descriptionFilm,  runTimeFilm,  genreFilm,  producedIn,  directedBy,  pictureURL,  backgroundURL,  ratingFilm,  streamingNow);
                films.add(film);
            }
        }
        return films;
    }


    @Override
    public void updateFilm(Film film) throws SQLException {
        Connection connection = ConnectionDAO.getConnection();
        String sql = "UPDATE film SET titleFilm=?, descriptionFilm=?, runTimeFilm=?, genreFilm=?, producedIn=?, directedBy=?, pictureURL=?, ratingFilm=?, backgroundURL=?, streamingNow=? WHERE idFilm=?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, film.getTitleFilm());
            statement.setString(2, film.getDescriptionFilm());
            statement.setString(3, film.getRunTimeFilm());
            statement.setString(4, film.getGenreFilm());
            statement.setDate(5, film.getProducedIn());
            statement.setString(6, film.getDirectedBy());
            statement.setString(7, film.getPictureURL());
            statement.setString(8, film.getRatingFilm());
            statement.setString(9, film.getBackgroundURL());
            statement.setString(10, film.getStreamingNow());
            statement.setInt(11, film.getIdFilm());
            statement.executeUpdate();
        }

    }

    @Override
    public void deleteFilm(int idFilm) throws SQLException {
        Connection connection = ConnectionDAO.getConnection();
        String sql = "DELETE FROM film WHERE idFilm=?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, idFilm);
            statement.executeUpdate();
        }
    }

    }

