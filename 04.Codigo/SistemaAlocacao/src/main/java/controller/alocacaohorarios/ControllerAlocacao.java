package controller.alocacaohorarios;

import domain.AlocacaoHorario;
import controller.Resolvedor;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import model.DAO.disciplina.DisciplinaDAO;
import model.DAO.disciplina.DisciplinaDAOImpl;
import model.DAO.horario.HorarioDAO;
import model.DAO.horario.HorarioDAOImpl;
import model.DAO.professor.ProfessorDAO;
import model.DAO.professor.ProfessorDAOImpl;
import model.dominio.Alocacao;
import model.dominio.Disciplina;
import model.dominio.Horario;
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
        AlocacaoHorario problema = getProblem();

        Resolvedor.setAlocacaoHorario(problema);

        Resolvedor resolvedor = new Resolvedor();

        Thread thread1 = new Thread(resolvedor);

        thread1.start();

        thread1.join();

        problema = resolvedor.getAlocacaoHorario();

        labelRegrasRigidas.setText(Integer.toString(problema.getScore().getHardScore()));
        labelRegrasDesejaveis.setText(Integer.toString(problema.getScore().getSoftScore()));

        System.out.println(Integer.toString(problema.getScore().getHardScore()));

    }

    private AlocacaoHorario getProblem() {
        List<Alocacao> alocacoes = new ArrayList<>();
        List<Horario> horarios;

        ProfessorDAO pDAO = new ProfessorDAOImpl();
        HorarioDAO hDAO = new HorarioDAOImpl();

        horarios = hDAO.listarHorariosCompletos();

        for (Horario horario : horarios) {
            System.out.println("Dia Semana: " + horario.getDiaSemana() + " | H Inicio: " + horario.getHorarioInicio());
        }

        for (Professor professor : pDAO.listar(Professor.class)) {
            for (Disciplina disciplina : professor.getDisciplinas()) {
                Alocacao alocacao = new Alocacao();

                alocacao.setProfessor(professor);
                alocacao.setDisciplina(disciplina);

                alocacoes.add(alocacao);
            }
        }

        return new AlocacaoHorario(alocacoes, horarios);
    }

}
