package model.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

/**
 * Created by Danilo de Oliveira on 12/11/16.
 */


public final class HibernateUtil {

    private static SessionFactory sessionFactory = null;
    private static StandardServiceRegistry standardRegistry = null;

    private static SessionFactory createSessionFactory() {
        standardRegistry = new StandardServiceRegistryBuilder()
                .configure( "hibernate.cfg.xml" )
                .build();

        Metadata metadata = new MetadataSources( standardRegistry )
                .getMetadataBuilder()
                .build();

        sessionFactory = metadata.getSessionFactoryBuilder().build();

        return sessionFactory;
    }

    private static SessionFactory getSessionFactory() {

        if (sessionFactory == null || standardRegistry == null) {
            sessionFactory = createSessionFactory();
        }

        return sessionFactory;
    }

    public static Session getSession() {
        return getSessionFactory().openSession();
    }
}
