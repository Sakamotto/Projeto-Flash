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

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * Created by Danilo de Oliveira on 15/11/16.
 */
public class HorariosProfessorConflitantes {

    private Alocacao alocacaoUm;
    private Alocacao alocacaoDois;
    private Alocacao alocacaoTres;

    private Teacher teacherUm = new Teacher("Foo Bar", "99999988888");
    private Teacher teacherDois = new Teacher("Teacher Snape", "11122233344");

    private Subject subjectUm = new Subject("Calculo 1", 1, 60);
    private Subject subjectDois = new Subject("Logica", 1, 60);
    private Subject subjectTres = new Subject("Calculo 2", 2, 90);

    private Schedule scheduleUm = new Schedule(1);
    private Schedule scheduleDois = new Schedule(2);
    private Schedule scheduleTres = new Schedule(3);

    private List<Alocacao> alocacoes = new ArrayList<>();
    private List<Schedule> schedules;

    @Dado("^Existe um conjunto de professores alocados a um conjunto de disciplinas$")
    public void existe_um_conjunto_de_professores_alocados_a_um_conjunto_de_disciplinas() throws Throwable {
        alocacaoUm = new Alocacao(subjectUm, teacherUm);
        alocacaoDois = new Alocacao(subjectDois, teacherDois);
        alocacaoTres = new Alocacao(subjectTres, teacherDois);

        alocacoes.add(alocacaoUm);
        alocacoes.add(alocacaoDois);
        alocacoes.add(alocacaoTres);
    }

    @Quando("^Eu alocar os horarios que geram conflito de horarios dos professores$")
    public void eu_alocar_os_horarios_que_geram_conflito_de_horarios_dos_professores() throws Throwable {
        scheduleUm.setDayWeek(Schedule.DayWeek.TUESDAY);
        scheduleUm.setInitSchedule(7, 30);
        scheduleUm.setFinalSchedule(9, 20);

        scheduleDois.setDayWeek(Schedule.DayWeek.TUESDAY);
        scheduleDois.setInitSchedule(7, 30);
        scheduleDois.setFinalSchedule(9, 20);

        scheduleTres.setDayWeek(Schedule.DayWeek.TUESDAY);
        scheduleTres.setInitSchedule(7, 30);
        scheduleTres.setFinalSchedule(9, 20);

        schedules = new ArrayList<>();

        schedules.add(scheduleUm);
        schedules.add(scheduleDois);
        schedules.add(scheduleTres);

        AlocacaoHorario problema = new AlocacaoHorario(alocacoes, schedules);

        AlocacaoHorario solucao = Resolvedor.resolver(problema, "solver/bruteForce_solverConfig.xml");

        assertEquals(solucao.getScore().isFeasible(), false);
    }

    @Entao("^Enviar mensagem de conflito de horarios de professor$")
    public void enviar_mensagem_de_conflito_de_horarios_de_professor() throws Throwable {
        System.out.println("### Deu conflito! ###");
    }

    @Quando("^Alocar os horarios que nao geram conflito de horarios dos professores$")
    public void alocar_os_horarios_que_nao_geram_conflito_de_horarios_dos_professores() throws Throwable {
        scheduleUm.setDayWeek(Schedule.DayWeek.MONDAY);
        scheduleUm.setInitSchedule(7, 30);
        scheduleUm.setFinalSchedule(9, 20);

        scheduleDois.setDayWeek(Schedule.DayWeek.TUESDAY);
        scheduleDois.setInitSchedule(7, 30);
        scheduleDois.setFinalSchedule(9, 20);

        scheduleTres.setDayWeek(Schedule.DayWeek.TUESDAY);
        scheduleTres.setInitSchedule(7, 30);
        scheduleTres.setFinalSchedule(9, 20);

        schedules = new ArrayList<>();

        schedules.add(scheduleUm);
        schedules.add(scheduleDois);
        schedules.add(scheduleTres);

        AlocacaoHorario problema = new AlocacaoHorario(alocacoes, schedules);

        AlocacaoHorario solucao = Resolvedor.resolver(problema, "solver/bruteForce_solverConfig.xml");

        assertEquals(solucao.getScore().isFeasible(), true);
    }
}
