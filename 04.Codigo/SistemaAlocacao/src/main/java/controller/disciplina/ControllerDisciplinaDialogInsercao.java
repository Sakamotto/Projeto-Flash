package controller.disciplina;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import model.DAO.areaConhecimento.AreaConhecimentoDAO;
import model.DAO.areaConhecimento.AreaConhecimentoDAOImpl;
import model.DAO.curso.CursoDAO;
import model.DAO.curso.CursoDAOImpl;
import model.dominio.AreaConhecimento;
import model.dominio.Curso;
import model.dominio.Disciplina;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.ResourceBundle;

/**
 * Created by danilo on 24/09/16.
 */
public class ControllerDisciplinaDialogInsercao implements Initializable {

    @FXML private TextField textFieldDisciplinaNome;
    @FXML private TextField textFieldDisciplinaCargaHoraria;
    @FXML private TextField textFieldDisciplinaPeriodo;
    @FXML private ChoiceBox<String> choiceBoxAreaConhecimento;
    @FXML private ChoiceBox<String> choiceBoxCurso;

    private CursoDAO cDAO = new CursoDAOImpl();
    private AreaConhecimentoDAO acDAO = new AreaConhecimentoDAOImpl();

    private ObservableList<String> observableListCurso;
    private ObservableList<String> observableListAreaConhecimento;

    private ArrayList<String> listCursos = new ArrayList<>();
    private ArrayList<String> listAreaConhecimentos = new ArrayList<>();

    private HashMap<String, Curso> cursos = new HashMap<>();
    private HashMap<String, AreaConhecimento> areaConhecimentos = new HashMap<>();

    private Stage dialogStage;
    private boolean btnSalvarClicado = false;
    private Disciplina disciplina;

    void setDialogStage(Stage dialogStage) {
        this.dialogStage = dialogStage;
    }

    boolean isBtnSalvarClicado() {
        return btnSalvarClicado;
    }

    public void setBtnSalvarClicado(boolean btnSalvarClicado) {
        this.btnSalvarClicado = btnSalvarClicado;
    }

    public Disciplina getDisciplina() {
        return disciplina;
    }

    void setDisciplina(Disciplina disciplina) {
        this.disciplina = disciplina;

        textFieldDisciplinaNome.setText(disciplina.getNome());
        textFieldDisciplinaCargaHoraria.setText(Integer.toString(disciplina.getCargaHoraria()));
        textFieldDisciplinaPeriodo.setText(Integer.toString(disciplina.getPeriodo()));

        // Coloca a Área de conhecimento da disciplina com oescolhido.
        if (!disciplina.getNome().equals("") && !disciplina.getAreaConhecimento().equals("")) {
            Collections.swap(listAreaConhecimentos, 0, listAreaConhecimentos.indexOf(disciplina.getAreaConhecimento().getDescricao()));
            Collections.swap(listCursos, 0, listCursos.indexOf(disciplina.getCurso().getNome()));
        }

        observableListCurso = FXCollections.observableArrayList(listCursos);
        choiceBoxCurso.setItems(observableListCurso);
        choiceBoxCurso.getSelectionModel().selectFirst();


        observableListAreaConhecimento = FXCollections.observableArrayList(listAreaConhecimentos);
        choiceBoxAreaConhecimento.setItems(observableListAreaConhecimento);
        choiceBoxAreaConhecimento.getSelectionModel().selectFirst();
    }


    public void initialize(URL location, ResourceBundle resources) {

        // Força o campo ser apenas inteiro.
        textFieldDisciplinaPeriodo.textProperty().addListener((observable, oldValue, newValue) -> {
            if (!newValue.matches("\\d*")) {
                textFieldDisciplinaPeriodo.setText(newValue.replaceAll("[^\\d]", ""));
            }
        });

        textFieldDisciplinaCargaHoraria.textProperty().addListener((observable, oldValue, newValue) -> {
            if (!newValue.matches("\\d*")) {
                textFieldDisciplinaCargaHoraria.setText(newValue.replaceAll("[^\\d]", ""));
            }
        });

        for (Curso curso : cDAO.listar(Curso.class)) {
            listCursos.add(curso.getNome());
            cursos.put(curso.getNome(), curso);
        }

        for (AreaConhecimento areaConhecimento : acDAO.listar(AreaConhecimento.class)) {
            listAreaConhecimentos.add(areaConhecimento.getDescricao());
            areaConhecimentos.put(areaConhecimento.getDescricao(), areaConhecimento);
        }
    }

    @FXML
    public void handleButtonSalvar() {

        disciplina.setNome(textFieldDisciplinaNome.getText());
        disciplina.setCargaHoraria(Integer.parseInt(textFieldDisciplinaCargaHoraria.getText()));
        disciplina.setCurso(cursos.get(choiceBoxCurso.getSelectionModel().getSelectedItem()));
        disciplina.setPeriodo(Integer.parseInt(textFieldDisciplinaPeriodo.getText()));
        disciplina.setAreaConhecimento(areaConhecimentos.get(choiceBoxAreaConhecimento.getSelectionModel().getSelectedItem()));

        btnSalvarClicado = true;

        dialogStage.close();
    }

    @FXML
    public void handleButtonCancelar() {
        btnSalvarClicado = false;

        dialogStage.close();
    }
}
