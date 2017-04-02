package controller.alocacaohorarios;

import controller.Resolvedor;
import domain.AlocacaoHorario;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.DirectoryChooser;
import javafx.stage.Stage;
import model.DAO.horario.HorarioDAO;
import model.DAO.horario.HorarioDAOImpl;
import model.DAO.professor.ProfessorDAO;
import model.DAO.professor.ProfessorDAOImpl;
import model.DAO.regra.RegraDAOImpl;
import model.dominio.*;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.util.*;

/**
 * Created by cristian on 28/11/16.
 */
public class ControllerAlocacao implements Initializable,  Observer {

    @FXML Label labelRegrasRigidas;
    @FXML Label labelRegrasDesejaveis;
    @FXML TableView<Alocacao> tableViewAlocacao;
    @FXML TableView<Regra> tableViewGerenciamentoRegras;
    @FXML TableColumn<Curso, String> tableColumnCurso;
    @FXML TableColumn<Disciplina, String> tableColumnPeriodo;
    @FXML TableColumn<Regra, String> tableColumnRegraNome;
    @FXML TableColumn<Regra, String> tableColumnRegraTipo;
    @FXML TableColumn<Regra, String> tableColumnRegraPenalidade;
    @FXML TableColumn<Regra, String> tableColumnRegraEstado;
    @FXML TableColumn<Horario, String> tableColumnHorario;
    @FXML TableColumn<Professor, String> tableColumnProfessor;
    @FXML TableColumn<Disciplina, String> tableColumnDisciplina;
    @FXML ProgressIndicator progressGeracaoHorarios;


    private static AlocacaoHorario solucao;
    private List<Regra> regras;
    private Resolvedor resolvedor;
    private static final String gerarHorario = "GERAR_HORARIO";
    private Thread threadGeracaoHorario;


    @Override
    public void initialize(URL location, ResourceBundle resources) {
        carregaTableViewAlocacao();
        carregaTableViewRegras();

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

    @FXML
    public void salvarSolucao() {

        String dir = getDiretorio();

        if (solucao != null && dir != null) {
            String stringCsvSolucao = getCsvSolucao();

            File fileSolucao = new File(dir + File.separator + "Grade-Horario_" + Calendar.getInstance().getTime().toString().replaceAll(":","-") + ".csv");

            try {
                FileWriter fileWriter = new FileWriter(fileSolucao);

                fileWriter.write(stringCsvSolucao);

                fileWriter.close();

                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setContentText("Salvo com sucesso.");
                alert.setTitle("Ok");
                alert.showAndWait();

            }
            catch (IOException e) {
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setContentText(e.getMessage());
                alert.showAndWait();
            }
        }

    }

    private String getDiretorio() {
        DirectoryChooser directoryChooser = new DirectoryChooser();

        directoryChooser.setTitle("Escolha o diretório para salvar o CSV da solução");
        directoryChooser.setInitialDirectory(new File(System.getProperty("user.home")));

        File dir = directoryChooser.showDialog(new Stage());

        return (dir != null) ? dir.getAbsolutePath() : null;
    }

    private String getCsvSolucao() {

        String stringCsvSolucao = "Curso,Periodo,Dia da Semana,Horario,Professor,Disciplina";

        for (Alocacao alocacao : solucao.getAlocacoes()) {
            stringCsvSolucao += "\n" + alocacao.getCursoNome() + ",";
            stringCsvSolucao += alocacao.getPeriodo() + ",";
            stringCsvSolucao += alocacao.getHorario() + ",";
            stringCsvSolucao += alocacao.getProfessorNome() + ",";
            stringCsvSolucao += alocacao.getDisciplinaNome();
        }

        return stringCsvSolucao;
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

    private void carregaTableViewRegras() {

        if (regras == null) {
            regras = new RegraDAOImpl().listar(Regra.class);

        }

        tableViewGerenciamentoRegras.setItems(FXCollections.observableArrayList(regras));

        tableColumnRegraNome.setCellValueFactory(new PropertyValueFactory<>("Descricao"));
        tableColumnRegraTipo.setCellValueFactory(new PropertyValueFactory<>("TipoRegra"));
        tableColumnRegraPenalidade.setCellValueFactory(new PropertyValueFactory<>("Penalidade"));
        tableColumnRegraEstado.setCellValueFactory(new PropertyValueFactory<>("Estado"));

        tableViewGerenciamentoRegras.refresh();
    }

    // TODO: Criar tela para Ativação e Alteração de pontos para Regras.

    private static AlocacaoHorario getProblem() {
        List<Alocacao> alocacoes = new ArrayList<>();
        List<Horario> horarios;

        ProfessorDAO pDAO = new ProfessorDAOImpl();
        HorarioDAO hDAO = new HorarioDAOImpl();

        horarios = hDAO.listar(Horario.class);

        for (Horario horario : horarios) {
            System.out.println("Dia Semana: " + horario.getDiaSemana() + " | H Inicio: " + horario.getHorarioInicio());
        }

        for (Professor professor : pDAO.listar(Professor.class)) {
            for (Disciplina disciplina : professor.getDisciplinas()) {

                for (int i = 0 ; i < (disciplina.getQuantidadeAulasSemanais()) ; i++) {
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
