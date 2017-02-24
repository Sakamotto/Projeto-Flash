package controller.disciplina;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.CheckBox;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.CheckBoxListCell;
import javafx.stage.Stage;
import model.DAO.curso.CursoDAO;
import model.DAO.curso.CursoDAOImpl;
import model.DAO.disciplina.DisciplinaDAO;
import model.DAO.disciplina.DisciplinaDAOImpl;
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

    @FXML
    private TextField textFieldDisciplinaNome;
    @FXML
    private TextField textFieldDisciplinaCargaHoraria;
    @FXML
    private TextField textFieldDisciplinaPeriodo;
    @FXML
    private ListView<CheckBox> listViewDisciplinasRequisito;
    @FXML
    private ChoiceBox<Curso> choiceBoxCurso;

    private CursoDAO cDAO = new CursoDAOImpl();
    private DisciplinaDAO dDAO = new DisciplinaDAOImpl();

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

        popularListViewDisciplinas();
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

    private void popularListViewDisciplinas() {

        List<Disciplina> disciplinas = dDAO.listar(Disciplina.class);
        ObservableList<CheckBox> observableListCheckboxDisciplinas = FXCollections.observableArrayList();

        for (Disciplina disciplina : disciplinas) {

            if (disciplina.getId() != this.getDisciplina().getId()) {
                CheckBox checkBoxDisciplina = new CheckBox(disciplina.getNome());

                checkBoxDisciplina.setId(Integer.toString(disciplina.getId()));

                observableListCheckboxDisciplinas.add(checkBoxDisciplina);
            }

        }

        listViewDisciplinasRequisito.setItems(observableListCheckboxDisciplinas);
    }

    @FXML
    public void handleButtonSalvar() {

        disciplina.setNome(textFieldDisciplinaNome.getText());
        disciplina.setCargaHoraria(Integer.parseInt(textFieldDisciplinaCargaHoraria.getText()));
        disciplina.setCurso(choiceBoxCurso.getSelectionModel().getSelectedItem());
        disciplina.setPeriodo(Integer.parseInt(textFieldDisciplinaPeriodo.getText()));

        for (CheckBox checkBoxDisciplina : listViewDisciplinasRequisito.getItems()) {
            if (checkBoxDisciplina.isSelected()) {
                Disciplina disciplinaRequisito = dDAO.recuperar(Disciplina.class, Integer.parseInt(checkBoxDisciplina.getId()));

                disciplina.addDisciplinaRequisito(disciplinaRequisito);
            }
        }

        btnSalvarClicado = true;

        dialogStage.close();
    }

    @FXML
    public void handleButtonCancelar() {
        btnSalvarClicado = false;

        dialogStage.close();
    }
}
