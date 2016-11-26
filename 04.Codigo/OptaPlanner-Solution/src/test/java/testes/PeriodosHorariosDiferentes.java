package testes;

import application.AllocationSchedule;
import controller.Resolvedor;
import cucumber.api.java.pt.Dado;
import cucumber.api.java.pt.Entao;
import cucumber.api.java.pt.Quando;
import domain.Allocation;
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

    private Allocation allocation1;
    private Allocation allocation2;
    private Allocation allocation3;
    private Allocation allocation4;

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

    private AllocationSchedule solucao;

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
        allocation1 = new Allocation();
        allocation2 = new Allocation();
        allocation3 = new Allocation();
        allocation4 = new Allocation();
        h1 = new Schedule(1);
        h2 = new Schedule(2);

        allocation1.setSubject(subject1);
        allocation1.setTeacher(teacher1);

        allocation2.setSubject(subject2);
        allocation2.setTeacher(teacher2);

        allocation3.setSubject(subject3);
        allocation3.setTeacher(teacher3);

        allocation4.setSubject(subject4);
        allocation4.setTeacher(teacher4);

        h1.setDayWeek(Schedule.DayWeek.MONDAY);
        h1.setInitSchedule(7, 30);
        h1.setFinalSchedule(9, 30);

        h2.setDayWeek(Schedule.DayWeek.MONDAY);
        h2.setInitSchedule(9, 31);
        h2.setFinalSchedule(11, 30);

    }

    @Quando("^houver conflito$")
    public void houver_conflito() {
        ArrayList<Allocation> alocacoes = new ArrayList<>();
        ArrayList<Schedule> schedules = new ArrayList<>();

        schedules.add(h1);
        schedules.add(h1);
        alocacoes.add(allocation1);
        alocacoes.add(allocation2);
        alocacoes.add(allocation3);
        alocacoes.add(allocation4);

        AllocationSchedule ah = new AllocationSchedule(alocacoes, schedules);
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
        ArrayList<Allocation> alocacoes = new ArrayList<>();
        ArrayList<Schedule> schedules = new ArrayList<>();

        schedules.add(h1);
        schedules.add(h2);
        alocacoes.add(allocation1);
        alocacoes.add(allocation2);
        alocacoes.add(allocation3);
        alocacoes.add(allocation4);


        AllocationSchedule ah = new AllocationSchedule(alocacoes, schedules);
        solucao = Resolvedor.resolver(ah, "solver/bruteForce_solverConfig.xml");

        assertEquals(solucao.getScore().isFeasible(), true);
    }

}
