package application;

import model.DAO.ProfessorDAO;
import model.DAO.ProfessorDAOImpl;
import model.dominio.Professor;


/**
 * Created by Danilo de Oliveira on 13/11/16.
 */
public class TesteDAO {

    public static void main(String[] args) {

        ProfessorDAO pDAO = new ProfessorDAOImpl();

        System.out.println(pDAO.recuperar(Professor.class, Long.parseLong("1")).getNome());
        System.out.println(pDAO.recuperar(Professor.class, Long.parseLong("1")).getDataNascimento());
    }
}
