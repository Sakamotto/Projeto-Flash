package controller.alocacaohorarios;

import controller.Resolvedor;
import domain.AlocacaoHorario;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.ProgressIndicator;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import model.DAO.horario.HorarioDAO;
import model.DAO.horario.HorarioDAOImpl;
import model.DAO.professor.ProfessorDAO;
import model.DAO.professor.ProfessorDAOImpl;
import model.dominio.*;

import java.net.URL;
import java.util.*;

/**
 * Created by cristian on 28/11/16.
 */
public class ControllerAlocacao implements Initializable,  Observer {

    @FXML Label labelRegrasRigidas;
    @FXML Label labelRegrasDesejaveis;
    @FXML TableView<Alocacao> tableViewAlocacao;
    @FXML TableColumn<Curso, String> tableColumnCurso;
    @FXML TableColumn<Disciplina, String> tableColumnPeriodo;
    @FXML TableColumn<Horario, String> tableColumnHorario;
    @FXML TableColumn<Professor, String> tableColumnProfessor;
    @FXML TableColumn<Disciplina, String> tableColumnDisciplina;
    @FXML ProgressIndicator progressGeracaoHorarios;


    private static AlocacaoHorario solucao;
    private Resolvedor resolvedor;
    private static final String gerarHorario = "GERAR_HORARIO";
    private Thread threadGeracaoHorario;


    @Override
    public void initialize(URL location, ResourceBundle resources) {
        carregaTableViewAlocacao();
    }

    @FXML
    public void handleIniciarRelatorio() throws Exception {

        progressGeracaoHorarios.setVisible(true);

        AlocacaoHorario problema = ControllerAlocacao.getProblem();

        resolvedor = new Resolvedor();
        resolvedor.setAlocacaoHorario(problema);

        resolvedor.setListenner(this);

        threadGeracaoHorario = new Thread(resolvedor);
        threadGeracaoHorario.setName(gerarHorario);
        threadGeracaoHorario.start();
    }

    @Override
    public void update(Observable o, Object arg) {
        solucao = (AlocacaoHorario) arg;

        Platform.runLater(() -> labelRegrasRigidas.setText(Integer.toString(solucao.getScore().getHardScore())));

        Platform.runLater(this::carregaTableViewAlocacao);

        System.out.println("Numero: " + solucao.getScore().getHardScore());
    }

    private void carregaTableViewAlocacao() {

        if (solucao != null) {

            tableViewAlocacao.setItems(FXCollections.observableArrayList(solucao.getAlocacoes()));

            tableColumnCurso.setCellValueFactory(new PropertyValueFactory<>("CursoNome"));
            tableColumnPeriodo.setCellValueFactory(new PropertyValueFactory<>("Periodo"));
            tableColumnHorario.setCellValueFactory(new PropertyValueFactory<>("Horario"));
            tableColumnProfessor.setCellValueFactory(new PropertyValueFactory<>("ProfessorNome"));
            tableColumnDisciplina.setCellValueFactory(new PropertyValueFactory<>("DisciplinaNome"));

        }

        tableViewAlocacao.refresh();

        if (threadGeracaoHorario != null && !threadGeracaoHorario.isAlive()) {
            progressGeracaoHorarios.setVisible(false);
        }

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
}
