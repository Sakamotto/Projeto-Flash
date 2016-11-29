package controller.alocacaohorarios;

import application.AllocationSchedule;
import controller.Resolvedor;
import domain.Allocation;
import domain.Schedule;
import domain.Subject;
import domain.Teacher;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import model.DAO.professor.ProfessorDAOImpl;
import model.dominio.Professor;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

/**
 * Created by cristian on 28/11/16.
 */
public class ControllerAlocacao implements Initializable{

    @FXML Label labelRegrasRigidas;
    @FXML Label labelRegrasDesejaveis;


    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }

    @FXML
    public void handleIniciarRelatorio() throws Exception{
        AllocationSchedule problema = getProblem();

        Resolvedor.setAllocationSchedule(problema);

        Resolvedor resolvedor = new Resolvedor();

        Thread thread1 = new Thread(resolvedor);

        thread1.start();

        thread1.join();

        problema = resolvedor.getAllocationSchedule();

        labelRegrasRigidas.setText(Integer.toString(problema.getScore().getHardScore()));
        labelRegrasDesejaveis.setText(Integer.toString(problema.getScore().getSoftScore()));

        System.out.println(Integer.toString(problema.getScore().getHardScore()));

    }

    private AllocationSchedule getProblem() {
        Allocation allocationUm;
        Allocation allocationDois;
        Allocation allocationTres;
        Allocation allocationQuatro;

        ProfessorDAOImpl daoProfessor = new ProfessorDAOImpl();

        List<Professor> professores = daoProfessor.listar(Professor.class);

        Teacher teacherUm = new Teacher("Foo Bar", "99999988888");
        Teacher teacherDois = new Teacher("Teacher Snape", "11122233344");
        Teacher teacherTres = new Teacher("Fulano de Tal", "12312345678");
        Teacher teacherQuatro = new Teacher("Filini di Til", "32165498787");

        Subject subjectUm = new Subject("Calculo 1", 1, 60);
        Subject subjectDois = new Subject("Logica", 1, 60);
        Subject subjectTres = new Subject("Calculo 2", 2, 90);
        Subject subjectQuatro = new Subject("AOC", 2, 90);

        Schedule scheduleUm = new Schedule(1);
        Schedule scheduleDois = new Schedule(2);
        Schedule scheduleTres = new Schedule(3);

        List<Allocation> alocacoes = new ArrayList<>();
        List<Schedule> schedules;

        allocationUm = new Allocation(subjectUm, teacherUm);
        allocationDois = new Allocation(subjectDois, teacherDois);
        allocationTres = new Allocation(subjectTres, teacherDois);
        allocationQuatro = new Allocation(subjectQuatro, teacherTres);

        alocacoes.add(allocationUm);
        alocacoes.add(allocationDois);
        alocacoes.add(allocationTres);
        alocacoes.add(allocationQuatro);


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

        return new AllocationSchedule(alocacoes, schedules);
    }

}
