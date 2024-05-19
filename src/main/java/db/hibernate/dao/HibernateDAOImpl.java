package db.hibernate.dao;

import db.hibernate.config.HibernateUtil;
import jee.javapack.beans.*;
import jee.javapack.dto.*;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class HibernateDAOImpl implements HibernateDAO {

    @Override
    public void save(Object C){
        Session session = HibernateUtil.CreateSessionFactory(C.getClass()).openSession();
        session.beginTransaction();
        session.save(C);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public <T> void delete(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException {
        Session session = HibernateUtil.CreateSessionFactory(C).openSession();
        session.beginTransaction();
        Object O = session.get(C, id);
        if(O != null){
            session.delete(O);
        }
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void merge(Object C){
        Session session = HibernateUtil.CreateSessionFactory(C.getClass()).openSession();
        session.beginTransaction();
        session.merge(C);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public <T> ArrayList<T> show(Class<T> C) throws InstantiationException, IllegalAccessException {
        Session session = HibernateUtil.CreateSessionFactory(C).openSession();
        session.beginTransaction();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<T> criteria = builder.createQuery(C);
        criteria.from(C);
        ArrayList<T> data = (ArrayList<T>) session.createQuery(criteria).getResultList();
        session.getTransaction().commit();
        session.close();
        return data;
    }

    @Override
    public <T> Object load(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException {
        Session session = HibernateUtil.CreateSessionFactory(C).openSession();
        session.beginTransaction();
        Object data = session.load(C, id);
        session.getTransaction().commit();
        session.close();
        return data;
    }

    @Override
    public <T> Object get(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException {
        Session session = HibernateUtil.CreateSessionFactory(C).openSession();
        session.beginTransaction();
        Object data = session.get(C, id);
        session.getTransaction().commit();
        session.close();
        return data;
    }

    @Override
    public <T> ArrayList<T> byTitle(Class<T> C, String title) throws InstantiationException, IllegalAccessException {
        Session session = HibernateUtil.CreateSessionFactory(C).openSession();
        session.beginTransaction();
        Query query = session.createQuery("FROM " + C.getSimpleName() + " C WHERE C.titleFilm LIKE :title");
        query.setParameter("title", "%" + title + "%");
        ArrayList<T> data = (ArrayList<T>) query.list();
        session.getTransaction().commit();
        session.close();
        return data;
    }

    @Override
    public UserDTO authenticate(String login, String password) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.CreateSessionFactory(User.class).openSession();
        session.beginTransaction();
        Query query = session.createQuery("FROM User C WHERE C.userMail = :login AND C.password = :password");
        query.setParameter("login", login);
        query.setParameter("password", password);
        User user = (User) query.getSingleResult();
        session.getTransaction().commit();
        session.close();
        return new UserDTO(user);
    }

    @Override
    public List<Film> getHighRatedFilms() throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.CreateSessionFactory(Film.class).openSession();
        session.beginTransaction();
        Query query = session.createQuery("FROM Film C ORDER BY C.ratingFilm DESC");
        query.setMaxResults(10);
        List<Film> films = query.list();
        session.getTransaction().commit();
        session.close();
        return films;
    }

    @Override
    public ArrayList<Film> loadRecommendation(Integer idUser) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.CreateSessionFactory(Film.class).openSession();
        session.beginTransaction();
        Query queryGenre = session.createSQLQuery("SELECT genre, COUNT(*) AS nombre_de_reservations FROM (SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(f.genreFilm, ',', n.n), ',', -1) AS genre FROM film f INNER JOIN Reservation r ON f.idFilm = r.idFilm CROSS JOIN (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6) AS n WHERE LENGTH(f.genreFilm) - LENGTH(REPLACE(f.genreFilm, ',', '')) >= n.n - 1 AND r.idUser = :id) AS genres_extracted GROUP BY genre ORDER BY nombre_de_reservations DESC");
        queryGenre.setParameter("id", idUser);
        queryGenre.setMaxResults(1);
        Object[] result = (Object[]) queryGenre.uniqueResult();
        String genre = (String) result[0];
        Query queryFilm = session.createQuery("FROM Film f WHERE f.genreFilm LIKE :genre  AND NOT EXISTS (FROM Reservation r WHERE r.idFilm = f.idFilm AND r.idUser = :userId)");
        queryFilm.setParameter("genre", "%" + genre + "%");
        queryFilm.setParameter("userId", idUser);
        ArrayList<Film> data = (ArrayList<Film>) queryFilm.list();
        session.getTransaction().commit();
        session.close();
        return data;
    }

    @Override
    public ArrayList<Film> ShowingNow() throws SQLException, ClassNotFoundException {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = now.format(formatter);
        Session session = HibernateUtil.CreateSessionFactory(Film.class).openSession();
        session.beginTransaction();
        Query query = session.createQuery("FROM Film WHERE streamingNow LIKE :date");
        query.setParameter("date", "%" + formattedDate + "%");
        ArrayList<Film> data = (ArrayList<Film>) query.list();
        session.getTransaction().commit();
        session.close();
        return data;
    }

    @Override
    public ArrayList<Film> ComingSoon() throws SQLException, ClassNotFoundException {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = now.format(formatter);
        Session session = HibernateUtil.CreateSessionFactory(Film.class).openSession();
        session.beginTransaction();
        Query query = session.createQuery("FROM Film WHERE streamingNow NOT LIKE :date");
        query.setParameter("date", "%" + formattedDate + "%");
        ArrayList<Film> data = (ArrayList<Film>) query.list();
        session.getTransaction().commit();
        session.close();
        return data;
    }

    @Override
    public ArrayList<Reservation> getUserReservation(Integer idUser) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.CreateSessionFactory(Reservation.class).openSession();
        session.beginTransaction();
        Query query = session.createQuery("FROM Reservation WHERE idUser = :id");
        query.setParameter("id", idUser);
        ArrayList<Reservation> data = (ArrayList<Reservation>) query.list();
        session.getTransaction().commit();
        session.close();
        return data;
    }

    @Override
    public UserTicket getUserTicket(Integer idReservation) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.CreateSessionFactory(Reservation.class).openSession();
        session.beginTransaction();
        Query query = session.createSQLQuery("SELECT f.titleFilm,  f.backgroundURL, f.pictureURL, r.dateReservation, r.timeReservation, r.qrCodeBillet, r.seatPlace, r.experienceType, r.offerBillet FROM Reservation r INNER JOIN film f ON r.idFilm = f.idFilm WHERE r.idReservation = :id");
        query.setParameter("id", idReservation);
        Object[] result = (Object[]) query.getSingleResult();
        UserTicket data = new UserTicket((String) result[0], (String) result[1], (String) result[2], (Date) result[3], (Time) result[4], (String) result[5], (String) result[6], (String) result[7], (String) result[8]);
        session.getTransaction().commit();
        session.close();
        return data;
    }

    @Override
    public BigDecimal loadRating(Integer idFilm) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.CreateSessionFactory(Film.class).openSession();
        session.beginTransaction();
        Query queryAverage = session.createSQLQuery("SELECT ROUND(AVG(rating), 1) AS moyenne FROM reaction WHERE idFilm = :id");
        queryAverage.setParameter("id", idFilm);
        BigDecimal averageDecimal = (BigDecimal) queryAverage.uniqueResult();
        String average = averageDecimal.toString();
        Query queryUpdate = session.createQuery("UPDATE Film SET ratingFilm = :average WHERE idFilm = :id");
        queryUpdate.setParameter("average", average);
        queryUpdate.setParameter("id", idFilm);
        queryUpdate.executeUpdate();
        session.getTransaction().commit();
        session.close();
        return averageDecimal;
    }

    @Override
    public BigInteger totalRating(Integer idFilm) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.CreateSessionFactory(Film.class).openSession();
        session.beginTransaction();
        Query queryTotal = session.createSQLQuery("SELECT COUNT(DISTINCT idComment) AS count FROM reaction WHERE idFilm = :id");
        queryTotal.setParameter("id", idFilm);
        BigInteger total = (BigInteger) queryTotal.uniqueResult();
        return total;
    }

    @Override
    public List<RatingCount> getRatingCounts(Integer idFilm) throws SQLException, ClassNotFoundException {
        List<RatingCount> ratingCounts = new ArrayList<>();
        Session session = HibernateUtil.CreateSessionFactory(Film.class).openSession();
        session.beginTransaction();
        Query query = session.createSQLQuery("SELECT rating, COUNT(*) AS count FROM reaction WHERE idFilm = :id GROUP BY rating");
        query.setParameter("id", idFilm);
        List<Object[]> results = query.list();
        for (Object[] row : results) {
            Integer rating = (Integer) row[0];
            long count = ((Number) row[1]).longValue();
            BigDecimal countDecimal = new BigDecimal(count);
            BigDecimal totalDecimal = new BigDecimal(totalRating(idFilm));
            BigDecimal percent = countDecimal.divide(totalDecimal, 2, RoundingMode.HALF_UP).multiply(new BigDecimal(100));
            RatingCount ratingCount = new RatingCount(rating, count, percent);
            ratingCounts.add(ratingCount);
        }
        session.getTransaction().commit();
        session.close();
        return ratingCounts;
    }

    @Override
    public ArrayList<MyFilm> getPlaylist(Integer idUser) throws SQLException, ClassNotFoundException {
        ArrayList<MyFilm> data = new ArrayList<>();
        Session session = HibernateUtil.CreateSessionFactory(Playlist.class).openSession();
        session.beginTransaction();
        Query query = session.createSQLQuery("SELECT F.idFilm, F.pictureURL, F.titleFilm, F.descriptionFilm FROM Playlist P INNER JOIN film F ON P.idFilm = F.idFilm WHERE P.idUser = :id");
        query.setParameter("id", idUser);
        List<Object[]> results = query.list();
        for (Object[] row : results) {
            MyFilm film = new MyFilm((Integer) row[0],(String) row[1],(String) row[2],(String) row[3]);
            data.add(film);
        }
        return data;
    }

    @Override
    public ArrayList<FilmReaction> getReaction(Integer idFilm) throws SQLException, ClassNotFoundException {
        ArrayList<FilmReaction> data = new ArrayList<>();
        Session session = HibernateUtil.CreateSessionFactory(Reaction.class).openSession();
        session.beginTransaction();
        Query query = session.createSQLQuery("SELECT u.username, r.commentText, r.rating FROM users u INNER JOIN Reaction r ON u.id = r.idUser WHERE r.idFilm = :id");
        query.setParameter("id", idFilm);
        List<Object[]> results = query.list();
        for (Object[] row : results) {
            FilmReaction filmReaction = new FilmReaction((String) row[0],(String) row[1],(Integer) row[2]);
            data.add(filmReaction);
        }

        return data;
    }
}
