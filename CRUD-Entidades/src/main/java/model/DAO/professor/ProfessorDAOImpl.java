package model.DAO.professor;

import model.DAO.GenericDAOImpl;
import model.dominio.Professor;
import org.hibernate.Hibernate;

/**
 * Created by Danilo de Oliveira on 13/11/16.
 */
public class ProfessorDAOImpl extends GenericDAOImpl<Professor> implements ProfessorDAO {

    public ProfessorDAOImpl() {
        Hibernate.initialize(Professor.class);
    }

    @Override
    public Professor recuperarPorMatricula(String matricula) {
        return null;
    }
}
