package testes;

import application.AlocacaoHorario;
import controller.Resolvedor;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import cucumber.api.java.pt.Dado;
import cucumber.api.java.pt.Entao;
import cucumber.api.java.pt.Quando;
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

import static org.junit.Assert.assertEquals;

/**
 * Created by cristian on 10/10/16.
 */
public class Horarios {

    Professor professor1 = new Professor();
    Alocacao alocacao1;
    Alocacao alocacao2;
    Alocacao alocacao3;
    Alocacao alocacao4;
    Disciplina disciplina1;
    Disciplina disciplina2;
    Disciplina disciplina3;
    Disciplina disciplina4;
    Horario h1;
    Horario h2;
    AlocacaoHorario solucao;

    private static final Logger logger = (Logger) LoggerFactory.getLogger(Horarios.class);


    @Dado("^Eu tenha um conjunto de discplinas em um periodo$")
    public void eu_tenha_um_conjunto_de_discplinas_em_um_periodo() {
        disciplina1 = new Disciplina("Cálculo 1", 1, 60);
        disciplina2 = new Disciplina("Lógica", 1, 60);
        disciplina3 = new Disciplina("Cálculo 2", 2, 90);
        disciplina4 = new Disciplina("AOC", 2, 90);

    }

    @Quando("^Eu alocar o horario$")
    public void eu_alocar_o_horario() {
        alocacao1 = new Alocacao();
        alocacao2 = new Alocacao();
        alocacao3 = new Alocacao();
        alocacao4 = new Alocacao();
        h1 = new Horario(1);
        h2 = new Horario(2);

        alocacao1.setDisciplina(disciplina1);
        alocacao2.setDisciplina(disciplina2);
        alocacao3.setDisciplina(disciplina3);
        alocacao4.setDisciplina(disciplina4);

        h1.setDiaSemana(Horario.DiaSemana.SEGUNDA);
        h1.setHorarioInicio(7, 30);
        h1.setHorarioFim(9, 30);

        h2.setDiaSemana(Horario.DiaSemana.SEGUNDA);
        h2.setHorarioInicio(9, 31);
        h2.setHorarioFim(11, 30);

    }

    @Quando("^houver conflito$")
    public void houver_conflito() {
        ArrayList<Alocacao> alocacoes = new ArrayList<>();
        ArrayList<Horario> horarios= new ArrayList<>();

        horarios.add(h1);
        horarios.add(h1);
        alocacoes.add(alocacao1);
        alocacoes.add(alocacao2);
        alocacoes.add(alocacao3);
        alocacoes.add(alocacao4);

        AlocacaoHorario ah = new AlocacaoHorario(alocacoes, horarios);
        solucao = Resolvedor.resolver(ah, "solver/bruteForce_solverConfig.xml");

        assertEquals(solucao.getScore().isFeasible(), false);
    }

    @Entao("^Enviar mensagem de erro de conflito de horario entre discplinas$")
    public void enviar_mensagem_de_erro_de_conflito_de_horario_entre_discplinas() {
        System.out.println("DEU CONFLITO!!");
        Resolvedor.logarSolucao(solucao);
    }

    @Quando("^nao houver conflito$")
    public void nao_houver_conflito() {
        ArrayList<Alocacao> alocacoes = new ArrayList<>();
        ArrayList<Horario> horarios= new ArrayList<>();

        horarios.add(h1);
        horarios.add(h2);
        alocacoes.add(alocacao1);
        alocacoes.add(alocacao2);
        alocacoes.add(alocacao3);
        alocacoes.add(alocacao4);


        AlocacaoHorario ah = new AlocacaoHorario(alocacoes, horarios);
        solucao = Resolvedor.resolver(ah, "solver/bruteForce_solverConfig.xml");

        assertEquals(solucao.getScore().isFeasible(), true);
    }

    @Entao("^Aloque o horario$")
    public void aloque_o_horario() {
        System.out.println("NÃO DEU CONFLITO!!!");
    }

}
