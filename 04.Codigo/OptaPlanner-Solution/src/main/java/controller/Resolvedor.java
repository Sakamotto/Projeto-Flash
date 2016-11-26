package controller;

import application.AllocationSchedule;
import domain.Allocation;
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

    public static AllocationSchedule resolver(AllocationSchedule problem, String solverConfig) {
        SolverFactory sF = SolverFactory.createFromXmlResource(solverConfig);
        Solver solver = sF.buildSolver();
        solver.solve(problem);

        AllocationSchedule solucao = (AllocationSchedule) solver.getBestSolution();

        logarSolucao(solucao);
        printResultSolution(solucao);

        return solucao;
    }

    public static void logarSolucao(AllocationSchedule solucao) {
        HardMediumSoftScore score = solucao.getScore();
        String viabilidade = (score.isFeasible()) ? "Sim": "Nao";

        System.out.println("Melhor score: " + score);

        System.out.println("Solução é viável ? R = " + viabilidade);

        solucao.getAllocations().forEach(a -> logger.info("Subject = [{}] -> Schedule = [{}]", a.getSubject().getNome(), a.getSchedule().getStrDiaSemana() + ", " + a.getSchedule().getInitSchedule() + " - " + a.getSchedule().getFinalSchedule()));
    }

    public static void printResultSolution(AllocationSchedule solucao) {
        List<Allocation> resultadoAlocacoes = solucao.getAllocations();

        for( Allocation resultadoAllocation : resultadoAlocacoes) {
            System.out.println("\n\nTeacher: " + resultadoAllocation.getTeacher().getNome() +
                    "\nDisciplina: " + resultadoAllocation.getSubject().getNome() +
                    "\nDia da Semana: " + resultadoAllocation.getSchedule().getStrDiaSemana() +
                    "\nHorario de Inicio " + resultadoAllocation.getSchedule().getInitSchedule());
        }
    }
}
