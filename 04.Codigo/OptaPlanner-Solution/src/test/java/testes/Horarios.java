package testes;

import application.AlocacaoHorario;
import cucumber.api.PendingException;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import domain.Alocacao;
import domain.Disciplina;
import domain.Horario;
import domain.Professor;
import org.optaplanner.core.api.score.buildin.hardmediumsoft.HardMediumSoftScore;
import org.optaplanner.core.api.solver.Solver;
import org.optaplanner.core.api.solver.SolverFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;

/**
 * Created by cristian on 10/10/16.
 */
public class Horarios {


    Professor professor1 = new Professor();
    Alocacao alocacao1;
    Alocacao alocacao2;
    Disciplina disciplina1;
    Disciplina disciplina2;
    Horario h1;
    Horario h2;
    AlocacaoHorario solucao;

    private static final Logger logger = (Logger) LoggerFactory.getLogger(Horarios.class);


    @Given("^Eu tenha um conjunto de discplinas em um periodo$")
    public void eu_tenha_um_conjunto_de_discplinas_em_um_periodo() {
        disciplina1 = new Disciplina("Cálculo 1", 1, 60);
        disciplina2 = new Disciplina("Lógica", 1, 60);
    }

    @When("^Eu alocar o horario$")
    public void eu_alocar_o_horario() {
        alocacao1 = new Alocacao();
        alocacao2 = new Alocacao();
        h1 = new Horario();
        h2 = new Horario();

        alocacao1.setDisciplina(disciplina1);
        alocacao2.setDisciplina(disciplina2);

        h1.setDiaSemana(Horario.DiaSemana.SEGUNDA);
        h1.setHorarioInicio(7, 30);
        h1.setHorarioFim(9, 30);

        h2.setDiaSemana(Horario.DiaSemana.SEGUNDA);
        h2.setHorarioInicio(9, 31);
        h2.setHorarioFim(11, 30);

        alocacao1.setHorario(h1);
        alocacao2.setHorario(h1);
    }

    @When("^houver conflito$")
    public void houver_conflito() {
        ArrayList<Alocacao> alocacoes = new ArrayList<>();
        ArrayList<Horario> horarios= new ArrayList<>();

        horarios.add(h1);
        horarios.add(h1);
        alocacoes.add(alocacao1);
        alocacoes.add(alocacao2);

        AlocacaoHorario ah = new AlocacaoHorario(alocacoes, horarios);
        solucao = resolver(ah, "bruteForce_solverConfig.xml");

        assert(solucao.getScore().getHardScore() < 0);
    }

    @Then("^Enviar mensagem de erro de conflito de horario entre discplinas$")
    public void enviar_mensagem_de_erro_de_conflito_de_horario_entre_discplinas() {
        System.out.println("DEU CONFLITO!!");
        logarSolucao(solucao);
    }

    @When("^não houver conflito$")
    public void não_houver_conflito() {
        assert(solucao.getScore().getHardScore() > 0);
    }

    @Then("^Aloque o horario$")
    public void aloque_o_horario() {
        System.out.println("NÃO DEU CONFLITO!!");
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
