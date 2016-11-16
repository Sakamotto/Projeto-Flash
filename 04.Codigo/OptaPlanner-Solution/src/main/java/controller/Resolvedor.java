package controller;

import application.AlocacaoHorario;
import domain.Alocacao;
import org.optaplanner.benchmark.api.PlannerBenchmark;
import org.optaplanner.benchmark.api.PlannerBenchmarkFactory;
import org.optaplanner.core.api.score.buildin.hardmediumsoft.HardMediumSoftScore;
import org.optaplanner.core.api.solver.Solver;
import org.optaplanner.core.api.solver.SolverFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;


public class Resolvedor {

    private static final Logger logger = (Logger) LoggerFactory.getLogger(Resolvedor.class);

    public static void benchMark() {
        PlannerBenchmarkFactory plannerBenchmarkFactory = PlannerBenchmarkFactory.createFromXmlResource(
                "solver/benchmark/horariosBenchmarkConfig.xml");
        PlannerBenchmark plannerBenchmark = plannerBenchmarkFactory.buildPlannerBenchmark();
        plannerBenchmark.benchmark();
    }

    public static AlocacaoHorario resolver(AlocacaoHorario problem, String solverConfig) {
        SolverFactory sF = SolverFactory.createFromXmlResource(solverConfig);
        Solver solver = sF.buildSolver();
        solver.solve(problem);

        AlocacaoHorario solucao = (AlocacaoHorario) solver.getBestSolution();

        logarSolucao(solucao);
        printResultSolution(solucao);

        return solucao;
    }

    public static void logarSolucao(AlocacaoHorario solucao) {
        HardMediumSoftScore score = solucao.getScore();
        String viabilidade = (score.isFeasible()) ? "Sim": "Nao";

        System.out.println("Melhor score: " + score);

        System.out.println("Solução é viável ? R = " + viabilidade);

        solucao.getAlocacoes().forEach(a -> logger.info("Disciplina = [{}] -> Horario = [{}]", a.getDisciplina().getNome(), a.getHorario().getStrDiaSemana() + ", " + a.getHorario().getHorarioInicio() + " - " + a.getHorario().getHorarioFim()));
    }

    public static void printResultSolution(AlocacaoHorario solucao) {
        List<Alocacao> resultadoAlocacoes = solucao.getAlocacoes();

        for( Alocacao resultadoAlocacao : resultadoAlocacoes) {
            System.out.println("\n\nProfessor: " + resultadoAlocacao.getProfessor().getNome() +
                    "\nDisciplina: " + resultadoAlocacao.getDisciplina().getNome() +
                    "\nDia da Semana: " + resultadoAlocacao.getHorario().getStrDiaSemana() +
                    "\nHorario Inicio " + resultadoAlocacao.getHorario().getHorarioInicio());
        }
    }
}
