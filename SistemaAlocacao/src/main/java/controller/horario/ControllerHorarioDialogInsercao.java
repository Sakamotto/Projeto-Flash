package controller.horario;

import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import model.dominio.DiaSemana;
import model.dominio.Horario;
import model.dominio.solver.Turno;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

/**
 * Created by danilo on 24/09/16.
 */
public class ControllerHorarioDialogInsercao implements Initializable {

    @FXML TextField textFieldHoraInicio;
    @FXML TextField textFieldMinutoInicio;
    @FXML TextField textFieldHoraFim;
    @FXML TextField textFieldMinutoFim;
    @FXML ChoiceBox<DiaSemana> choiceBoxDiaSemana;
    @FXML ChoiceBox<Turno> choiceBoxTurno;

    private Stage dialogStage;
    private boolean btnSalvarClicado = false;
    private Horario horario;

    void setDialogStage(Stage dialogStage) {
        this.dialogStage = dialogStage;
    }

    boolean isBtnSalvarClicado() {
        return btnSalvarClicado;
    }

    void setHorario(Horario horario) {
        this.horario = horario;

        textFieldHoraInicio.setText(Integer.toString(horario.getHoraInicio()));
        textFieldMinutoInicio.setText(Integer.toString(horario.getMinutoInicio()));
        textFieldHoraFim.setText(Integer.toString(horario.getHoraFim()));
        textFieldMinutoFim.setText(Integer.toString(horario.getMinutoFim()));
        choiceBoxDiaSemana.getSelectionModel().select(horario.getDiaSemana());
        choiceBoxTurno.getSelectionModel().select(horario.getTurno());
    }

    public void initialize(URL location, ResourceBundle resources) {

        popularChoiceBoxers();

        // Força o campo ser apenas inteiro.
        textFieldHoraInicio.textProperty().addListener((observable, oldValue, newValue) -> {
            if (!newValue.matches("\\d*")) {
                textFieldHoraInicio.setText(newValue.replaceAll("[^\\d]", ""));
            }
        });

        textFieldMinutoInicio.textProperty().addListener((observable, oldValue, newValue) -> {
            if (!newValue.matches("\\d*")) {
                textFieldMinutoInicio.setText(newValue.replaceAll("[^\\d]", ""));
            }
        });

        textFieldHoraFim.textProperty().addListener((observable, oldValue, newValue) -> {
            if (!newValue.matches("\\d*")) {
                textFieldHoraFim.setText(newValue.replaceAll("[^\\d]", ""));
            }
        });

        textFieldMinutoFim.textProperty().addListener((observable, oldValue, newValue) -> {
            if (!newValue.matches("\\d*")) {
                textFieldMinutoFim.setText(newValue.replaceAll("[^\\d]", ""));
            }
        });
    }

    private void popularChoiceBoxers() {
        ArrayList<DiaSemana> listDiaSemana = new ArrayList<DiaSemana>(){{
            add(DiaSemana.DOMINGO);
            add(DiaSemana.SEGUNDA);
            add(DiaSemana.TERCA);
            add(DiaSemana.QUARTA);
            add(DiaSemana.QUINTA);
            add(DiaSemana.SEXTA);
            add(DiaSemana.SABADO);
        }};

        ArrayList<Turno> listTurno = new ArrayList<Turno>(){{
            add(Turno.MATUTINO);
            add(Turno.VESPERTINO);
            add(Turno.NOTURNO);
        }};

        choiceBoxDiaSemana.setItems(FXCollections.observableArrayList(listDiaSemana));
        choiceBoxTurno.setItems(FXCollections.observableArrayList(listTurno));
    }

    @FXML
    public void handleButtonSalvar() {

        horario.setHoraInicio(Integer.parseInt(textFieldHoraInicio.getText()));
        horario.setHoraFim(Integer.parseInt(textFieldHoraFim.getText()));
        horario.setMinutoInicio(Integer.parseInt(textFieldMinutoInicio.getText()));
        horario.setMinutoFim(Integer.parseInt(textFieldMinutoFim.getText()));
        horario.setDiaSemana(choiceBoxDiaSemana.getValue());
        horario.setTurno(choiceBoxTurno.getValue());

        btnSalvarClicado = true;

        dialogStage.close();
    }

    @FXML
    public void handleButtonCancelar() {
        btnSalvarClicado = false;

        dialogStage.close();
    }
}
