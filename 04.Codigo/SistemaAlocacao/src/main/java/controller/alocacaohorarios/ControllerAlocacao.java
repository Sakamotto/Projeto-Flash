package controller.alocacaohorarios;

import controller.Resolvedor;
import domain.AlocacaoHorario;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import model.DAO.horario.HorarioDAO;
import model.DAO.horario.HorarioDAOImpl;
import model.DAO.professor.ProfessorDAO;
import model.DAO.professor.ProfessorDAOImpl;
import model.dominio.Alocacao;
import model.dominio.Disciplina;
import model.dominio.Horario;
import model.dominio.Professor;

import java.net.URL;
import java.util.*;

/**
 * Created by cristian on 28/11/16.
 */
public class ControllerAlocacao implements Initializable,  Observer {

    @FXML Label labelRegrasRigidas;
    @FXML Label labelRegrasDesejaveis;
    private static AlocacaoHorario solucao;
    private Resolvedor resolvedor;


    @Override
    public void initialize(URL location, ResourceBundle resources) {
        labelRegrasRigidas.accessibleTextProperty();
    }

    @FXML
    public void handleIniciarRelatorio() throws Exception {
        AlocacaoHorario problema = ControllerAlocacao.getProblem();

        resolvedor = new Resolvedor();
        resolvedor.setAlocacaoHorario(problema);

        resolvedor.setListenner(this);

        Thread thread = new Thread(resolvedor);
        thread.start();
    }

    private static AlocacaoHorario getProblem() {
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

                for (int i = 0 ; i < (disciplina.getCargaHoraria()/30) ; i++) {
                    Alocacao alocacao = new Alocacao();
                    alocacao.setProfessor(professor);
                    alocacao.setDisciplina(disciplina);

                    alocacoes.add(alocacao);
                }

            }
        }

        return new AlocacaoHorario(alocacoes, horarios);
    }

    @Override
    public void update(Observable o, Object arg) {
        solucao = (AlocacaoHorario) arg;

        Platform.runLater(() -> labelRegrasRigidas.setText(Integer.toString(solucao.getScore().getHardScore())));

        System.out.println("Numero: " + solucao.getScore().getHardScore());
    }
}
