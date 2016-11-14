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

    protected static Session session;
    protected static Transaction transaction;

    protected void initializeDAO() {
        session = HibernateUtil.getSession();
        transaction = session.beginTransaction();
    }

    protected void closeDAO() {
        session.close();
    }

    @Override
    public List<T> listar(Class clazz) {
        initializeDAO();

        Criteria getAll = session.createCriteria(clazz);
        Hibernate.initialize(clazz);
        List<T> listProfessores = getAll.list();

        transaction.commit();

        return listProfessores;
    }


    @Override
    public T recuperar(Class clazz, Long id) {
        initializeDAO();

        T object = (T) session.load(clazz, id);
        Hibernate.initialize(clazz);

        if (transaction.wasCommitted()) {
            transaction.commit();
        }

        session.flush();

        return object;
    }

    @Override
    public void deletar(T object) {
        initializeDAO();

        session.delete(object);
        session.flush();
        transaction.commit();

    }

    @Override
    public void alterar(T object) {
        initializeDAO();

        session.update(object);
        session.flush();
        transaction.commit();

    }

    @Override
    public void inserir(T object) {
        initializeDAO();

        session.save(object);

        session.flush();
        transaction.commit();

    }
}
