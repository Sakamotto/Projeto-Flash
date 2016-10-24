package controller.disciplina;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import model.database.PersistenciaAreaConhecimento;
import model.database.PersistenciaCurso;
import model.dominio.Curso;
import model.dominio.Disciplina;

import java.net.URL;
import java.sql.SQLException;
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

    private ObservableList<String> observableListCurso;
    private ObservableList<String> observableListAreaConhecimento;

    ArrayList<String> listCursos = new ArrayList<>();
    ArrayList<String> listAreaConhecimentos = new ArrayList<>();
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
        textFieldDisciplinaCargaHoraria.setText(disciplina.getCargaHoraria());
        textFieldDisciplinaPeriodo.setText(disciplina.getPeriodo());

        // Coloca a Área de conhecimento da disciplina com oescolhido.
        Collections.swap(listAreaConhecimentos, 0, listAreaConhecimentos.indexOf(disciplina.getAreaConhecimento()));
        Collections.swap(listCursos, 0, listCursos.indexOf(disciplina.getCurso().getNome()));

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

        try {

            for (Curso curso : PersistenciaCurso.get()) {
                listCursos.add(curso.getNome());
            }

            listAreaConhecimentos = PersistenciaAreaConhecimento.get();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @FXML
    public void handleButtonSalvar() {

        disciplina.setNome(textFieldDisciplinaNome.getText());
        disciplina.setCargaHoraria(textFieldDisciplinaCargaHoraria.getText());
        disciplina.getCurso().setNome(choiceBoxCurso.getSelectionModel().getSelectedItem());
        disciplina.setPeriodo(textFieldDisciplinaPeriodo.getText());
        disciplina.setAreaConhecimento(choiceBoxAreaConhecimento.getSelectionModel().getSelectedItem());

        btnSalvarClicado = true;

        dialogStage.close();
    }

    @FXML
    public void handleButtonCancelar() {
        btnSalvarClicado = false;

        dialogStage.close();
    }
}
