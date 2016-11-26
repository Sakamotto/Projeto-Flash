package testes;


import application.AllocationSchedule;
import controller.Resolvedor;
import cucumber.api.java.pt.Dado;
import cucumber.api.java.pt.Entao;
import cucumber.api.java.pt.Quando;
import domain.*;


import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;


/**
 * Created by Danilo de Oliveira on 14/11/16.
 */
public class IntervaloTresHoras {

    private List<Allocation> alocacoes;
    private List<Schedule> schedules;

    @Dado("^Eu tenha um conjunto de professores alocados a um conjunto de disciplinas$")
    public void eu_tenha_um_conjunto_de_professores_alocados_a_um_conjunto_de_disciplinas() throws Throwable {
        Teacher teacher = new Teacher("Bruno R. G.", "12345678910");

        Subject subjectUm = new Subject("Calculo 1", 1, 90);
        Subject subjectDois = new Subject("Lógica", 1, 90);

        Allocation allocationUm = new Allocation(subjectUm);
        Allocation allocationDois = new Allocation(subjectDois);

        allocationUm.setTeacher(teacher);
        allocationDois.setTeacher(teacher);

        alocacoes = new ArrayList<>();

        alocacoes.add(allocationUm);
        alocacoes.add(allocationDois);

    }

    @Quando("^Eu alocar os horarios com intervalo maior que tres horas$")
    public void eu_alocar_os_horarios_com_intervalo_maior_que_tres_horas() throws Throwable {
        Schedule scheduleUm = new Schedule(1);
        scheduleUm.setDayWeek(Schedule.DayWeek.MONDAY);
        scheduleUm.setInitSchedule(7, 30);
        scheduleUm.setFinalSchedule(9, 20);

        Schedule scheduleDois = new Schedule(2);
        scheduleDois.setDayWeek(Schedule.DayWeek.MONDAY);
        scheduleDois.setInitSchedule(13, 20);
        scheduleDois.setFinalSchedule(15, 30);

        schedules = new ArrayList<>();

        schedules.add(scheduleUm);
        schedules.add(scheduleDois);

        AllocationSchedule problema = new AllocationSchedule(alocacoes, schedules);

        AllocationSchedule solucao = Resolvedor.resolver(problema, "solver/bruteForce_solverConfig.xml");

        assertEquals(solucao.getScore().isFeasible(), false);
    }

    @Entao("^Enviar mensagem de erro informando a quebra da regra$")
    public void enviar_mensagem_de_erro_informando_a_quebra_da_regra() throws Throwable {
        System.out.println("Existe um professor com um intervalo de 3 horas vagas entre schedules de aula.");
    }

    @Quando("^Eu alocar os sem intervalo maior ou igual a tres horas para todos os professores$")
    public void eu_alocar_os_sem_intervalo_maior_ou_igual_a_tres_horas_para_todos_os_professores() throws Throwable {
        Schedule scheduleUm = new ScheduleBuilder(1)
                .addDayWeek(Schedule.DayWeek.MONDAY)
                .addInitSchedule(7, 30)
                .addFinalSchedule(9, 20)
                .getSchedule();
        Schedule scheduleDois = new ScheduleBuilder(2)
                .addDayWeek(Schedule.DayWeek.MONDAY)
                .addInitSchedule(9, 40)
                .addFinalSchedule(11, 30)
                .getSchedule();

        schedules = new ArrayList<>();

        schedules.add(scheduleUm);
        schedules.add(scheduleDois);

        AllocationSchedule problema = new AllocationSchedule(alocacoes, schedules);

        AllocationSchedule solucao = Resolvedor.resolver(problema, "solver/bruteForce_solverConfig.xml");

        assertEquals(solucao.getScore().isFeasible(), true);

    }

    @Entao("^Aloque o horario$")
    public void aloque_o_horario() throws Throwable {
        System.out.println("Alcoado.");
    }

}
