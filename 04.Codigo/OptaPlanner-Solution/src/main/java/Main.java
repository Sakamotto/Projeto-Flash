import domain.Alocacao;
import domain.Disciplina;
import domain.Horario;
import org.optaplanner.core.api.score.buildin.hardmediumsoft.HardMediumSoftScore;
import org.optaplanner.core.api.solver.Solver;
import org.optaplanner.core.api.solver.SolverFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class Main {

    private static final Logger logger = (Logger) LoggerFactory.getLogger(Main.class);

    public static void main(String[] args) {
        AlocacaoHorario problema;


        Horario h01 = new Horario();
        h01.setDiaSemana(Horario.DiaSemana.SEGUNDA);
        h01.setHorarioInicio(7, 30);
        h01.setHorarioFim(9, 30);

        Horario h02 = new Horario();
        h02.setDiaSemana(Horario.DiaSemana.TERCA);
        h02.setHorarioInicio(7, 30);
        h02.setHorarioFim(9, 30);

        Horario h03 = new Horario();
        h03.setDiaSemana(Horario.DiaSemana.QUARTA);
        h03.setHorarioInicio(7, 30);
        h03.setHorarioFim(9, 30);

        Horario h04 = new Horario();
        h04.setDiaSemana(Horario.DiaSemana.QUINTA);
        h04.setHorarioInicio(7, 30);
        h04.setHorarioFim(9, 30);

        Horario h05 = new Horario();
        h05.setDiaSemana(Horario.DiaSemana.SEXTA);
        h05.setHorarioInicio(7, 30);
        h05.setHorarioFim(9, 30);

        Disciplina d1 = new Disciplina("Cálculo 1", 1, 60);
        Disciplina d2 = new Disciplina("Sociologia 1", 1, 30);
        Disciplina d3 = new Disciplina("Metodologia da Pesquisa", 1, 30);

        Alocacao alocacao1 = new Alocacao();
        alocacao1.setDisciplina(d1);

        Alocacao alocacao2 = new Alocacao();
        alocacao2.setDisciplina(d2);

        Alocacao alocacao3 = new Alocacao();
        alocacao3.setDisciplina(d3);




        problema = new AlocacaoHorario(listAlocacao(alocacao1, alocacao2, alocacao3), listHorarios(h02, h01, h03, h04, h05));



        AlocacaoHorario solucao = resolver(problema, "bruteForce_solverConfig.xml");

        List<Alocacao> resultado = solucao.getAlocacoes();

        for( Alocacao alocacao : resultado) {
            System.out.println("Turma: " + alocacao.getDisciplina().getNome() +
                               " | " + alocacao.getHorario().getStrDiaSemana() +
                               " | " + alocacao.getHorario().getHorarioInicio());
        }


    }


    private static List<Horario> listHorarios(Horario... hs) {
        ArrayList<Horario> horarios = new ArrayList<>();

        Collections.addAll(horarios, hs);

        return horarios;
    }

    private static List<Alocacao> listAlocacao(Alocacao... ds) {
        ArrayList<Alocacao> alocacao = new ArrayList<>();

        Collections.addAll(alocacao, ds);

        return alocacao;
    }

    private static AlocacaoHorario resolver(AlocacaoHorario problem, String solverConfig) {
        SolverFactory sF = SolverFactory.createFromXmlResource(solverConfig);
        Solver solver = sF.buildSolver();
        solver.solve(problem);

        AlocacaoHorario solucao = (AlocacaoHorario) solver.getBestSolution();

        logarSolucao(solucao);

        return solucao;
    }

    private static void logarSolucao(AlocacaoHorario solucao) {
        HardMediumSoftScore score = solucao.getScore();
        logger.info("Melhor score: {}", score);
        logger.info("Solução é viável? {}", score.isFeasible());
        solucao.getAlocacoes().forEach(g -> logger.info("Grupo=[{}] -> Veículo=[{}]", g, g.getHorario()));
    }
}
