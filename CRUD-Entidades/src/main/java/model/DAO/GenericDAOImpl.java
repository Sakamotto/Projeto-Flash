package model.DAO;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Danilo de Oliveira on 13/11/16.
 */
public abstract class GenericDAOImpl<T> implements GenericDAO<T> {

    protected static Session session = HibernateUtil.getSession();;

    @Override
    public List<T> listar(Class clazz) {
        session.beginTransaction();

        Criteria getAll = session.createCriteria(clazz);
        Hibernate.initialize(clazz);
        List<T> listProfessores = getAll.list();

        session.getTransaction().commit();
        return listProfessores;
    }


    @Override
    public T recuperar(Class clazz, int id) {
        session.beginTransaction();

        T object = (T) session.load(clazz, id);
        Hibernate.initialize(clazz);

        session.getTransaction().commit();
        return object;
    }

    @Override
    public void deletar(T object) {
        session.beginTransaction();

        session.delete(object);

        session.getTransaction().commit();
    }

    @Override
    public void alterar(T object) {
        session.beginTransaction();

        session.update(object);

        session.getTransaction().commit();
    }

    @Override
    public void inserir(T object) {
        session.beginTransaction();

        session.save(object);

        session.getTransaction().commit();
    }
}
