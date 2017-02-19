package controller.disciplina;

import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import model.DAO.curso.CursoDAO;
import model.DAO.curso.CursoDAOImpl;
import model.dominio.Curso;
import model.dominio.Disciplina;

import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.ResourceBundle;

/**
 * Created by danilo on 24/09/16.
 */
public class ControllerDisciplinaDialogInsercao implements Initializable {

    @FXML private TextField textFieldDisciplinaNome;
    @FXML private TextField textFieldDisciplinaCargaHoraria;
    @FXML private TextField textFieldDisciplinaPeriodo;
    @FXML private ChoiceBox<Curso> choiceBoxCurso;

    private CursoDAO cDAO = new CursoDAOImpl();

    private List<Curso> listCursos = new ArrayList<>();

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

        choiceBoxCurso.setItems(FXCollections.observableArrayList(listCursos));
        choiceBoxCurso.getSelectionModel().selectFirst();
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

        listCursos = cDAO.listar(Curso.class);
    }

    @FXML
    public void handleButtonSalvar() {

        disciplina.setNome(textFieldDisciplinaNome.getText());
        disciplina.setCargaHoraria(Integer.parseInt(textFieldDisciplinaCargaHoraria.getText()));
        disciplina.setCurso(choiceBoxCurso.getSelectionModel().getSelectedItem());
        disciplina.setPeriodo(Integer.parseInt(textFieldDisciplinaPeriodo.getText()));

        btnSalvarClicado = true;

        dialogStage.close();
    }

    @FXML
    public void handleButtonCancelar() {
        btnSalvarClicado = false;

        dialogStage.close();
    }
}
