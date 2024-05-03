package db.hibernate.dao;

import java.util.ArrayList;
import java.util.List;

public interface HibernateDAO {
    void save(Object C) throws InstantiationException, IllegalAccessException;
    <T> void delete(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException;
    void merge(Object C) throws InstantiationException, IllegalAccessException;
    <T> ArrayList<T> show(Class<T> C) throws InstantiationException, IllegalAccessException;
    <T> Object load(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException;
    <T> Object get(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException;
    <T> List byTitle(Class<T> C, String title) throws InstantiationException, IllegalAccessException;

}
