package controller;

import domain.AlocacaoHorario;
import model.dominio.Alocacao;
import org.optaplanner.benchmark.api.PlannerBenchmark;
import org.optaplanner.benchmark.api.PlannerBenchmarkFactory;
import org.optaplanner.core.api.score.buildin.hardmediumsoft.HardMediumSoftScore;
import org.optaplanner.core.api.solver.Solver;
import org.optaplanner.core.api.solver.SolverFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;


public class Resolvedor implements Runnable{

    private static final Logger logger = (Logger) LoggerFactory.getLogger(Resolvedor.class);

    private static AlocacaoHorario alocacaoHorario;

    private static boolean terminado = false;

    public static void benchMark() {
        PlannerBenchmarkFactory plannerBenchmarkFactory = PlannerBenchmarkFactory.createFromXmlResource(
                "solver/benchmark/horariosBenchmarkConfig.xml");
        PlannerBenchmark plannerBenchmark = plannerBenchmarkFactory.buildPlannerBenchmark();

        plannerBenchmark.benchmark();
    }

    public static AlocacaoHorario resolver(String solverConfig) {
        SolverFactory sF = SolverFactory.createFromXmlResource(solverConfig);
        Solver solver = sF.buildSolver();
        solver.solve(alocacaoHorario);

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

        solucao.getAlocacoes().forEach(a -> logger.info("Disciplina = [{}] -> Horários = [{}]", a.getDisciplina().getNome(), a.getHorario().getStrDiaSemana() + ", " + a.getHorario().getHorarioInicio() + " - " + a.getHorario().getHorarioInicio()));
    }

    public static void printResultSolution(AlocacaoHorario solucao) {
        List<Alocacao> resultadoAlocacoes = solucao.getAlocacoes();

        for( Alocacao resultadoAlocacao : resultadoAlocacoes) {
            System.out.println("\n\nProfessor: " + resultadoAlocacao.getProfessor().getNome() +
                    "\nDisciplina: " + resultadoAlocacao.getDisciplina().getNome() +
                    "\nDia da Semana: " + resultadoAlocacao.getHorario().getStrDiaSemana() +
                    "\nHorario de Inicio " + resultadoAlocacao.getHorario().getHorarioInicio());
        }
    }

    public static int getScore() {
        return 123456;
    }

    public AlocacaoHorario getAlocacaoHorario() {
        return alocacaoHorario;
    }

    public static void setAlocacaoHorario(AlocacaoHorario alocacaoHorario) {
        Resolvedor.alocacaoHorario = alocacaoHorario;
    }

    @Override
    public void run() {
        alocacaoHorario = resolver("solver/bruteForce_solverConfig.xml");

        terminado = true;
    }

    public static boolean isTerminado() {
        return terminado;
    }

}
