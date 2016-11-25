package testes;

import application.AlocacaoHorario;
import controller.Resolvedor;
import cucumber.api.java.pt.Dado;
import cucumber.api.java.pt.Entao;
import cucumber.api.java.pt.Quando;
import domain.Alocacao;
import domain.Schedule;
import domain.Subject;
import domain.Teacher;
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

    private Teacher teacher1 = new Teacher("Fulano de Tal", "12312345678");
    private Teacher teacher2 = new Teacher("Filini di Til", "32165498787");
    private Teacher teacher3 = new Teacher("Foo Bar", "99999988888");
    private Teacher teacher4 = new Teacher("Teacher Snape", "11122233344");

    private Subject subject1;
    private Subject subject2;
    private Subject subject3;
    private Subject subject4;

    private Schedule h1;
    private Schedule h2;

    private AlocacaoHorario solucao;

    private static final Logger logger = (Logger) LoggerFactory.getLogger(PeriodosHorariosDiferentes.class);


    @Dado("^Eu tenha um conjunto de discplinas em um periodo$")
    public void eu_tenha_um_conjunto_de_discplinas_em_um_periodo() {
        subject1 = new Subject("Cálculo 1", 1, 60);
        subject2 = new Subject("Lógica", 1, 60);
        subject3 = new Subject("Cálculo 2", 2, 90);
        subject4 = new Subject("AOC", 2, 90);

    }

    @Quando("^Eu alocar o horario$")
    public void eu_alocar_o_horario() {
        alocacao1 = new Alocacao();
        alocacao2 = new Alocacao();
        alocacao3 = new Alocacao();
        alocacao4 = new Alocacao();
        h1 = new Schedule(1);
        h2 = new Schedule(2);

        alocacao1.setSubject(subject1);
        alocacao1.setTeacher(teacher1);

        alocacao2.setSubject(subject2);
        alocacao2.setTeacher(teacher2);

        alocacao3.setSubject(subject3);
        alocacao3.setTeacher(teacher3);

        alocacao4.setSubject(subject4);
        alocacao4.setTeacher(teacher4);

        h1.setDayWeek(Schedule.DayWeek.MONDAY);
        h1.setInitSchedule(7, 30);
        h1.setFinalSchedule(9, 30);

        h2.setDayWeek(Schedule.DayWeek.MONDAY);
        h2.setInitSchedule(9, 31);
        h2.setFinalSchedule(11, 30);

    }

    @Quando("^houver conflito$")
    public void houver_conflito() {
        ArrayList<Alocacao> alocacoes = new ArrayList<>();
        ArrayList<Schedule> schedules = new ArrayList<>();

        schedules.add(h1);
        schedules.add(h1);
        alocacoes.add(alocacao1);
        alocacoes.add(alocacao2);
        alocacoes.add(alocacao3);
        alocacoes.add(alocacao4);

        AlocacaoHorario ah = new AlocacaoHorario(alocacoes, schedules);
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
        ArrayList<Schedule> schedules = new ArrayList<>();

        schedules.add(h1);
        schedules.add(h2);
        alocacoes.add(alocacao1);
        alocacoes.add(alocacao2);
        alocacoes.add(alocacao3);
        alocacoes.add(alocacao4);


        AlocacaoHorario ah = new AlocacaoHorario(alocacoes, schedules);
        solucao = Resolvedor.resolver(ah, "solver/bruteForce_solverConfig.xml");

        assertEquals(solucao.getScore().isFeasible(), true);
    }

}
