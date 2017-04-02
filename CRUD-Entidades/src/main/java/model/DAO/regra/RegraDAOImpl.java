package model.DAO.regra;

import model.DAO.GenericDAOImpl;
import model.dominio.Regra;
import org.hibernate.Hibernate;

/**
 * Created by danilo on 01/04/17.
 */
public class RegraDAOImpl extends GenericDAOImpl<Regra> implements RegraDAO {

    public RegraDAOImpl() {
        Hibernate.initialize(Regra.class);
    }

}
