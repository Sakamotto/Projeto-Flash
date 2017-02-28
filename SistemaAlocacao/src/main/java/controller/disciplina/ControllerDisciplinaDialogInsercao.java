package controller.disciplina;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.stage.Stage;
import model.DAO.curso.CursoDAO;
import model.DAO.curso.CursoDAOImpl;
import model.DAO.disciplina.DisciplinaDAO;
import model.DAO.disciplina.DisciplinaDAOImpl;
import model.dominio.Curso;
import model.dominio.Disciplina;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

/**
 * Created by danilo on 24/09/16.
 */
public class ControllerDisciplinaDialogInsercao implements Initializable {

    @FXML private TextField textFieldDisciplinaNome;
    @FXML private TextField textFieldAulasPorSemana;
    @FXML private TextField textFieldDisciplinaPeriodo;
    @FXML private TextField textFieldHoraSemanal;
    @FXML private TextField textFieldMinutoSemanal;
    @FXML private ListView<CheckBox> listViewDisciplinasRequisito;
    @FXML private ChoiceBox<Curso> choiceBoxCurso;
    @FXML private Label labelValidarCampos;

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
        textFieldAulasPorSemana.setText(Integer.toString(disciplina.getQuantidadeAulasSemanais()));
        textFieldDisciplinaPeriodo.setText(Integer.toString(disciplina.getPeriodo()));
        textFieldHoraSemanal.setText(String.valueOf(disciplina.getCargaHorariaSemanal() / 60));
        textFieldMinutoSemanal.setText(String.valueOf(disciplina.getCargaHorariaSemanal() % 60));

        choiceBoxCurso.setItems(FXCollections.observableArrayList(listCursos));
        choiceBoxCurso.getSelectionModel().selectFirst();

        popularListViewDisciplinas();
    }


    public void initialize(URL location, ResourceBundle resources) {

        // Força o campo ser apenas inteiro.
        textFieldDisciplinaPeriodo.textProperty().addListener((observable, oldValue, newValue) -> {
            textFieldDisciplinaPeriodo.setText(newValue.replaceAll("\\D", ""));
        });

        textFieldAulasPorSemana.textProperty().addListener((observable, oldValue, newValue) -> {
            textFieldAulasPorSemana.setText(newValue.replaceAll("\\D", ""));
        });

        textFieldHoraSemanal.textProperty().addListener((observable, oldValue, newValue) -> {
            textFieldHoraSemanal.setText(newValue.replaceAll("\\D", ""));
        });

        textFieldMinutoSemanal.textProperty().addListener((observable, oldValue, newValue) -> {
            textFieldMinutoSemanal.setText(newValue.replaceAll("\\D", ""));
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

        if (validarCampos()) {
            int horaSemanal = Integer.parseInt(textFieldHoraSemanal.getText());
            int minutoSemanal = Integer.parseInt(textFieldMinutoSemanal.getText());

            disciplina.setNome(textFieldDisciplinaNome.getText());
            disciplina.setQuantidadeAulasSemanais(Integer.parseInt(textFieldAulasPorSemana.getText()));
            disciplina.setCurso(choiceBoxCurso.getSelectionModel().getSelectedItem());
            disciplina.setPeriodo(Integer.parseInt(textFieldDisciplinaPeriodo.getText()));
            disciplina.setCargaHorariaSemanal((horaSemanal * 60) + minutoSemanal);

            for (CheckBox checkBoxDisciplina : listViewDisciplinasRequisito.getItems()) {
                if (checkBoxDisciplina.isSelected()) {
                    Disciplina disciplinaRequisito = dDAO.recuperar(Disciplina.class, Integer.parseInt(checkBoxDisciplina.getId()));

                    disciplina.addDisciplinaRequisito(disciplinaRequisito);
                }
            }

            btnSalvarClicado = true;

            dialogStage.close();
        }
        else {
            labelValidarCampos.setVisible(true);
        }

    }

    @FXML
    public void handleButtonCancelar() {
        btnSalvarClicado = false;

        dialogStage.close();
    }

    private boolean validarCampos() {
        String nome = textFieldDisciplinaNome.getText();
        Curso curso = choiceBoxCurso.getSelectionModel().getSelectedItem();
        String periodo = textFieldDisciplinaPeriodo.getText();
        String horaraSemanal = textFieldHoraSemanal.getText();
        String minutoSemanal = textFieldHoraSemanal.getText();

        return !nome.equals("") &&
                curso != null &&
                !periodo.equals("") &&
                !horaraSemanal.equals("") &&
                !minutoSemanal.equals("");

    }
}
