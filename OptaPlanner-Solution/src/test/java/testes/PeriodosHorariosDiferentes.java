package testes;

import domain.AlocacaoHorario;
import controller.Resolvedor;
import cucumber.api.java.pt.Dado;
import cucumber.api.java.pt.Entao;
import cucumber.api.java.pt.Quando;
import model.dominio.Alocacao;
import model.dominio.Disciplina;
import model.dominio.Horario;
import model.dominio.Professor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;

import static org.junit.Assert.assertEquals;

/**
 * Created by cristian on 10/10/16.
 */
public class PeriodosHorariosDiferentes {

    private Alocacao alocacao1;
    private Alocacao alocacao2;
    private Alocacao alocacao3;
    private Alocacao alocacao4;

    private Professor professor1 = new Professor("Fulano de Tal", "12312345678");
    private Professor professor2 = new Professor("Filini di Til", "32165498787");
    private Professor professor3 = new Professor("Foo Bar", "99999988888");
    private Professor professor4 = new Professor("Professor Snape", "11122233344");

    private Disciplina disciplina1;
    private Disciplina disciplina2;
    private Disciplina disciplina3;
    private Disciplina disciplina4;

    private Horario h1;
    private Horario h2;

    private AlocacaoHorario solucao;

    private static final Logger logger = (Logger) LoggerFactory.getLogger(PeriodosHorariosDiferentes.class);


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
        alocacao1.setProfessor(professor1);

        alocacao2.setDisciplina(disciplina2);
        alocacao2.setProfessor(professor2);

        alocacao3.setDisciplina(disciplina3);
        alocacao3.setProfessor(professor3);

        alocacao4.setDisciplina(disciplina4);
        alocacao4.setProfessor(professor4);

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
        ArrayList<Horario> schedules = new ArrayList<>();

        schedules.add(h1);
        schedules.add(h1);
        alocacoes.add(alocacao1);
        alocacoes.add(alocacao2);
        alocacoes.add(alocacao3);
        alocacoes.add(alocacao4);

        AlocacaoHorario problema = new AlocacaoHorario(alocacoes, schedules);

        solucao = Resolvedor.resolver("solver/bruteForce_solverConfig.xml", problema);

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
        ArrayList<Horario> schedules = new ArrayList<>();

        schedules.add(h1);
        schedules.add(h2);
        alocacoes.add(alocacao1);
        alocacoes.add(alocacao2);
        alocacoes.add(alocacao3);
        alocacoes.add(alocacao4);


        AlocacaoHorario problema = new AlocacaoHorario(alocacoes, schedules);

        solucao = Resolvedor.resolver("solver/bruteForce_solverConfig.xml", problema);

        assertEquals(solucao.getScore().isFeasible(), true);
    }

}
