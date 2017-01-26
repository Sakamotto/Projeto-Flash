package model.DAO;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import java.util.Properties;

/**
 * Created by Danilo de Oliveira on 12/11/16.
 */


public final class HibernateUtil {

    private static SessionFactory sessionFactory = null;
    private static ServiceRegistry serviceRegistry = null;
    private static Configuration configuration;
    private static Properties properties;

    private static void configurar() {
        configuration = new Configuration();
        configuration.configure();
        properties = configuration.getProperties();
    }

    private static SessionFactory getSessionFactory() throws HibernateException {

        if (serviceRegistry == null || sessionFactory == null) {
            configurar();

            serviceRegistry = new ServiceRegistryBuilder().applySettings(properties).buildServiceRegistry();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        }

        return sessionFactory;
    }

    public static Session getSession() {
        return getSessionFactory().openSession();
    }
}
