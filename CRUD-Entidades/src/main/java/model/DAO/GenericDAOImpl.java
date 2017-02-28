package model.DAO;

import org.hibernate.Hibernate;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * Created by Danilo de Oliveira on 13/11/16.
 */
public abstract class GenericDAOImpl<T> implements GenericDAO<T> {

    private static Session session = HibernateUtil.getSession();

    @Override
    public List<T> listar(Class clazz) {
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<T> criteria = builder.createQuery( clazz );
        Root<T> root = criteria.from( clazz );

        criteria.select( root );

        return session.createQuery( criteria ).getResultList();
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
