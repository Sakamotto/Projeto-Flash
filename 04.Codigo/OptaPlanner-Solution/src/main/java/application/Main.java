package application;

import controller.Resolvedor;
import domain.Alocacao;
import domain.Schedule;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class Main {


    public static void main(String[] args) {
        Resolvedor.benchMark();

//        AlocacaoHorario problema;
//
//
//        Schedule horario01 = new ScheduleBuilder(1)
//                .addDayWeek(Schedule.DayWeek.MONDAY)
//                .addInitSchedule(7, 30)
//                .addFinalSchedule(9, 30)
//                .getSchedule();
//
//
//        Schedule horario02 = new ScheduleBuilder(2)
//                .addDayWeek(Schedule.DayWeek.MONDAY)
//                .addInitSchedule(7, 30)
//                .addFinalSchedule(9, 30)
//                .getSchedule();
//
//        Schedule horario03 = new ScheduleBuilder(3)
//                .addDayWeek(Schedule.DayWeek.WEDNESDAY)
//                .addInitSchedule(7, 30)
//                .addFinalSchedule(9, 30)
//                .getSchedule();
//
//        Schedule horario04 = new ScheduleBuilder(4)
//                .addDayWeek(Schedule.DayWeek.THURSDAY)
//                .addInitSchedule(7, 30)
//                .addFinalSchedule(9, 30)
//                .getSchedule();
//
//        Schedule horario05 = new ScheduleBuilder(5)
//                .addDayWeek(Schedule.DayWeek.FRIDAY)
//                .addInitSchedule(7, 30)
//                .addFinalSchedule(9, 30)
//                .getSchedule();
//
//
//        Schedule horario06 = new ScheduleBuilder(6)
//                .addDayWeek(Schedule.DayWeek.THURSDAY)
//                .addInitSchedule(15, 30)
//                .addFinalSchedule(17, 30)
//                .getSchedule();
//
//
//        Schedule horario07 = new ScheduleBuilder(7)
//                .addDayWeek(Schedule.DayWeek.THURSDAY)
//                .addInitSchedule(9, 40)
//                .addFinalSchedule(11, 30)
//                .getSchedule();
//
//
//        Subject disciplina01 = new Subject("Calculo 1", 1, 60);
//        Subject disciplina02 = new Subject("Sociologia 1", 1, 30);
//        Subject disciplina03 = new Subject("Metodologia da Pesquisa", 1, 30);
//        Subject disciplina04 = new Subject("FSI", 1, 30);
//        Subject disciplina05 = new Subject("Logica", 1, 30);
//        Subject disciplina06 = new Subject("Programacao 1", 1, 60);
//
//        Alocacao alocacao1 = new Alocacao( disciplina01 );
//
//        Alocacao alocacao2 = new Alocacao( disciplina02 );
//
//        Alocacao alocacao3 = new Alocacao( disciplina03 );
//
//        Alocacao alocacao4 = new Alocacao( disciplina04 );
//
//        Alocacao alocacao5 = new Alocacao( disciplina05 );
//
//        Alocacao alocacao6 = new Alocacao( disciplina06 );
//
//
//
//
//        problema = new AlocacaoHorario(
//                listAlocacao(alocacao1, alocacao2, alocacao3, alocacao4, alocacao5, alocacao6),
//                listHorarios(horario01, horario02, horario03, horario04, horario06, horario05, horario07)
//        );
//
//
//
//        AlocacaoHorario solucao = Resolvedor.resolver(problema, "solver/bruteForce_solverConfig.xml");
//
//        // printResultSolution(solucao);

    }

    private static List<Schedule> listHorarios(Schedule... hs) {
        ArrayList<Schedule> schedules = new ArrayList<>();

        Collections.addAll(schedules, hs);

        return schedules;
    }

    private static List<Alocacao> listAlocacao(Alocacao... ds) {
        ArrayList<Alocacao> alocacao = new ArrayList<>();

        Collections.addAll(alocacao, ds);

        return alocacao;
    }

}
