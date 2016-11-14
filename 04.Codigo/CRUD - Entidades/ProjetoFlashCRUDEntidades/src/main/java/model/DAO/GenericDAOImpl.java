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

    protected void initializeTransaction() {

        if (session == null)
            session = HibernateUtil.getSession();

        transaction = session.getTransaction();
        transaction.begin();
    }

    protected void finalizeTransaction() {
        session.flush();
        transaction.commit();
        // session.close();
    }

    @Override
    public List<T> listar(Class clazz) {
        initializeTransaction();

        Criteria getAll = session.createCriteria(clazz);
        Hibernate.initialize(clazz);
        List<T> listProfessores = getAll.list();

        finalizeTransaction();
        return listProfessores;
    }


    @Override
    public T recuperar(Class clazz, Long id) {
        initializeTransaction();

        T object = (T) session.load(clazz, id);
        Hibernate.initialize(clazz);

        finalizeTransaction();
        return object;
    }

    @Override
    public void deletar(T object) {
        initializeTransaction();

        session.delete(object);

        finalizeTransaction();
    }

    @Override
    public void alterar(T object) {
        initializeTransaction();

        session.update(object);

        finalizeTransaction();
    }

    @Override
    public void inserir(T object) {
        initializeTransaction();

        session.save(object);

        finalizeTransaction();
    }
}
