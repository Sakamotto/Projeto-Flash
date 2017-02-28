package controller.horario;

import controller.exception.AllertExceptionController;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import model.DAO.horario.HorarioDAO;
import model.DAO.horario.HorarioDAOImpl;
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
    @FXML Label validatorFieldsHorario;

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

        if (validarCampos()) {
            Horario horarioTeste = new Horario();

            horarioTeste.setHoraInicio(Integer.parseInt(textFieldHoraInicio.getText()));
            horarioTeste.setHoraFim(Integer.parseInt(textFieldHoraFim.getText()));
            horarioTeste.setMinutoInicio(Integer.parseInt(textFieldMinutoInicio.getText()));
            horarioTeste.setMinutoFim(Integer.parseInt(textFieldMinutoFim.getText()));
            horarioTeste.setDiaSemana(choiceBoxDiaSemana.valueProperty().getValue());
            horarioTeste.setTurno(choiceBoxTurno.valueProperty().getValue());

            if (new HorarioDAOImpl().validarHorario(horarioTeste)) {

                horario.setHoraInicio(Integer.parseInt(textFieldHoraInicio.getText()));
                horario.setHoraFim(Integer.parseInt(textFieldHoraFim.getText()));
                horario.setMinutoInicio(Integer.parseInt(textFieldMinutoInicio.getText()));
                horario.setMinutoFim(Integer.parseInt(textFieldMinutoFim.getText()));
                horario.setDiaSemana(choiceBoxDiaSemana.valueProperty().getValue());
                horario.setTurno(choiceBoxTurno.valueProperty().getValue());

                btnSalvarClicado = true;

                dialogStage.close();
            }
            else {
                AllertExceptionController.erro("Já existe um horário nesse intervalo.");
            }

        }

    }

    private boolean validarCampos() {
        boolean valido = true;

        valido = valido && choiceBoxDiaSemana.getValue() != null;
        valido = valido && choiceBoxTurno.getValue() != null;
        valido = valido && !textFieldHoraInicio.getText().equals("");
        valido = valido && !textFieldMinutoInicio.getText().equals("");
        valido = valido && !textFieldHoraFim.getText().equals("");
        valido = valido && !textFieldMinutoFim.getText().equals("");

        if (!valido) {
            validatorFieldsHorario.setVisible(true);
        } else {
            int horaInicio = Integer.parseInt(textFieldHoraInicio.getText());
            int minutoInicio = Integer.parseInt(textFieldMinutoInicio.getText());
            int horaFim = Integer.parseInt(textFieldHoraFim.getText());
            int minutoFim = Integer.parseInt(textFieldMinutoFim.getText());

            if (horaFim < horaInicio || (horaFim == horaInicio && minutoFim < minutoInicio)) {
                AllertExceptionController.erro("O horário de término deve ser menor que o início.");

                valido = false;
            }

        }

        return valido;
    }

    @FXML
    public void handleButtonCancelar() {
        btnSalvarClicado = false;

        dialogStage.close();
    }
}
