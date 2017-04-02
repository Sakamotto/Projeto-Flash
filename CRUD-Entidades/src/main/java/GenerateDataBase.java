import model.DAO.curso.CursoDAO;
import model.DAO.curso.CursoDAOImpl;
import model.DAO.disciplina.DisciplinaDAO;
import model.DAO.disciplina.DisciplinaDAOImpl;
import model.DAO.regra.RegraDAO;
import model.DAO.regra.RegraDAOImpl;
import model.dominio.Curso;
import model.dominio.Disciplina;
import model.dominio.Regra;

import java.util.List;

/**
 * Created by danilo on 23/02/17.
 */
public class GenerateDataBase {

    public static void main(String[] args) {
        DisciplinaDAO dDAO = new DisciplinaDAOImpl();
        CursoDAO cDAO = new CursoDAOImpl();
        List<Disciplina> disciplinas = dDAO.listar(Disciplina.class);

        Disciplina disciplina = new Disciplina();
        disciplina.setNome("AFF");

        Curso curso = new Curso();
        curso.setNome("ASDFSDAFSDAF");
        cDAO.inserir(curso);

        disciplina.setCurso(cDAO.listar(Curso.class).get(0));
        dDAO.inserir(disciplina);


        // Regras

        Regra regra = new Regra();

        regra.setDescricao("Teste Regra");
        regra.setPenalidade(50);
        regra.setTipoRegra(Regra.TipoRegra.Soft);
        regra.setAtivada(true);

        RegraDAO regraDAO = new RegraDAOImpl();
        regraDAO.inserir(regra);

    }
}
