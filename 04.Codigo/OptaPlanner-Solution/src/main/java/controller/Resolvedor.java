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


public class Resolvedor implements Runnable{

    private static final Logger logger = (Logger) LoggerFactory.getLogger(Resolvedor.class);

    private static AllocationSchedule allocationSchedule;

    private static boolean terminado = false;

    public static void benchMark() {
        PlannerBenchmarkFactory plannerBenchmarkFactory = PlannerBenchmarkFactory.createFromXmlResource(
                "solver/benchmark/horariosBenchmarkConfig.xml");
        PlannerBenchmark plannerBenchmark = plannerBenchmarkFactory.buildPlannerBenchmark();

        plannerBenchmark.benchmark();
    }

    public static AllocationSchedule resolver(String solverConfig) {
        SolverFactory sF = SolverFactory.createFromXmlResource(solverConfig);
        Solver solver = sF.buildSolver();
        solver.solve(allocationSchedule);

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

        solucao.getAllocations().forEach(a -> logger.info("Subject = [{}] -> Schedule = [{}]", a.getSubject().getNome(), a.getSchedule().getStrDiaSemana() + ", " + a.getSchedule().getHorarioInicio() + " - " + a.getSchedule().getHorarioInicio()));
    }

    public static void printResultSolution(AllocationSchedule solucao) {
        List<Allocation> resultadoAlocacoes = solucao.getAllocations();

        for( Allocation resultadoAllocation : resultadoAlocacoes) {
            System.out.println("\n\nTeacher: " + resultadoAllocation.getTeacher().getNome() +
                    "\nDisciplina: " + resultadoAllocation.getSubject().getNome() +
                    "\nDia da Semana: " + resultadoAllocation.getSchedule().getStrDiaSemana() +
                    "\nHorario de Inicio " + resultadoAllocation.getSchedule().getHorarioInicio());
        }
    }

    public static int getScore() {
        return 123456;
    }

    public AllocationSchedule getAllocationSchedule() {
        return allocationSchedule;
    }

    public static void setAllocationSchedule(AllocationSchedule allocationSchedule) {
        Resolvedor.allocationSchedule = allocationSchedule;
    }



    @Override
    public void run() {
        allocationSchedule = resolver("solver/bruteForce_solverConfig.xml");

        terminado = true;
    }

    public static boolean isTerminado() {
        return terminado;
    }

}
