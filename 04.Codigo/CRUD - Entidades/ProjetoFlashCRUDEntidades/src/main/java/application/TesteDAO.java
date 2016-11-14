package application;

import model.DAO.ProfessorDAO;
import model.DAO.ProfessorDAOImpl;
import model.dominio.Professor;


/**
 * Created by Danilo de Oliveira on 13/11/16.
 */
public class TesteDAO {

    public static void main(String[] args) throws ClassNotFoundException {

        ProfessorDAO pDAO = new ProfessorDAOImpl();

        Long idRecuperar = 25L;
        Long idRemover = 26L;

        // Recuperar
        Professor professor = pDAO.recuperar(Professor.class, idRecuperar);

        // Alterar
        professor.setNome("Nome Alterado");
        pDAO.alterar(professor);

        // Inserir
        professor = GeradorDados.gerarProfessores(1).get(0);
        pDAO.inserir(professor);

        // Deletar
        professor = pDAO.recuperar(Professor.class, idRemover);
        pDAO.deletar(professor);
    }
}
