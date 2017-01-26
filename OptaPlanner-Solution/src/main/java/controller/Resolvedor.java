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
import java.util.Observer;


public class Resolvedor extends java.util.Observable implements Runnable{

    private static final Logger logger = (Logger) LoggerFactory.getLogger(Resolvedor.class);
    private AlocacaoHorario alocacaoHorario;
    private AlocacaoHorario novaSolucaoAlocacaoHorario;
    private boolean terminado = false;

    private Observer listenner;

    public boolean novaSolucao = false;

    private List<Alocacao> solucao;

    public static void benchMark() {
        PlannerBenchmarkFactory plannerBenchmarkFactory = PlannerBenchmarkFactory.createFromXmlResource(
                "solver/benchmark/horariosBenchmarkConfig.xml");
        PlannerBenchmark plannerBenchmark = plannerBenchmarkFactory.buildPlannerBenchmark();

        plannerBenchmark.benchmark();
    }

    public static AlocacaoHorario resolver(String solverConfig, AlocacaoHorario problema) {
        SolverFactory sF = SolverFactory.createFromXmlResource(solverConfig);
        Solver solver = sF.buildSolver();

        solver.solve(problema);

        AlocacaoHorario solucao = (AlocacaoHorario) solver.getBestSolution();

        logarSolucao(solucao);
        printResultSolution(solucao);

        return solucao;
    }

    /*public static void resolver() {
        SolverFactory sF = SolverFactory.createFromXmlResource("solver/tabuSearch_solverConfig.xml");
        Solver solver = sF.buildSolver();

        solver.addEventListener(event -> {
            if (event.isEveryProblemFactChangeProcessed()) {
                System.out.println("Encontrou nova solução.");

                novaSolucaoAlocacaoHorario = (AlocacaoHorario) event.getNewBestSolution();
                novaSolucao = true;
            }
        });

        solver.solve(alocacaoHorario);

        novaSolucaoAlocacaoHorario = (AlocacaoHorario) solver.getBestSolution();

        *//*terminado = true;*//*
    }*/

    public static void logarSolucao(AlocacaoHorario solucao) {
        HardMediumSoftScore score = solucao.getScore();
        String viabilidade = (score.isFeasible()) ? "Sim": "Nao";

        System.out.println("Melhor score: " + score);

        System.out.println("Solução é viável ? R = " + viabilidade);

        solucao.getAlocacoes().forEach(a -> logger.info("Professor = [{}] -> Disciplina = [{}] -> Horários = [{}]", a.getProfessor().getNome(), a.getDisciplina().getNome() + " - "+ a.getDisciplina().getPeriodo(), a.getHorario().getStrDiaSemana() + ", " + a.getHorario().getHorarioInicio() + " - " + a.getHorario().getHorarioFim()));
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

    public int getScore() {
        return 123456;
    }

    public AlocacaoHorario getAlocacaoHorario() {
        return alocacaoHorario;
    }

    public void setAlocacaoHorario(AlocacaoHorario alocacaoHorario) {
        this.alocacaoHorario = alocacaoHorario;
    }

    public Observer getListenner() {
        return listenner;
    }

    public void setListenner(Observer listenner) {
        this.listenner = listenner;
    }

    @Override
    public void run() {
        SolverFactory sF = SolverFactory.createFromXmlResource("solver/tabuSearch_solverConfig.xml");
        Solver solver = sF.buildSolver();
        AlocacaoHorario bestSolution;

        solver.addEventListener(event -> {
            if (event.isEveryProblemFactChangeProcessed()) {
                AlocacaoHorario newBestSolution;
                System.out.println("Encontrou nova solução.");

                newBestSolution = (AlocacaoHorario) event.getNewBestSolution();

                logarSolucao(newBestSolution);

                listenner.update(Resolvedor.this, event.getNewBestSolution());
            }
        });

        solver.solve(alocacaoHorario);

        bestSolution = (AlocacaoHorario) solver.getBestSolution();

        logarSolucao(bestSolution);

        listenner.update(this, bestSolution);
    }

}
