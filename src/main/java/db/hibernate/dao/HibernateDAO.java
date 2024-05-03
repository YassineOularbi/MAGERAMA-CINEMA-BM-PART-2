package db.hibernate.dao;

import java.util.ArrayList;

public interface HibernateDAO {
    void save(Object C) throws InstantiationException, IllegalAccessException;
    <T> void delete(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException;
    void merge(Object C) throws InstantiationException, IllegalAccessException;
    <T> ArrayList<T> show(Class<T> C) throws InstantiationException, IllegalAccessException;
    <T> Object load(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException;
    <T> ArrayList<T> get(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException;

}
