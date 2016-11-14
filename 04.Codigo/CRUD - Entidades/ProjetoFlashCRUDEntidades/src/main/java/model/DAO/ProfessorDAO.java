package model.DAO;

import model.dominio.Professor;

/**
 * Created by Danilo de Oliveira on 13/11/16.
 */
public interface ProfessorDAO extends GenericDAO<Professor> {

    Professor recuperarPorMatricula(String matricula);

}
