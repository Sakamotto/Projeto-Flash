package controller.horario;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import model.dominio.Horario;
import org.jfree.ui.IntegerDocument;

import java.net.URL;
import java.util.ResourceBundle;

/**
 * Created by danilo on 24/09/16.
 */
public class ControllerHorarioDialogInsercao implements Initializable {

    @FXML TextField textFieldHoraInicio;
    @FXML TextField textFieldMinutoInicio;
    @FXML TextField textFieldHoraFim;
    @FXML TextField textFieldMinutoFim;

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
    }

    public void initialize(URL location, ResourceBundle resources) {

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

    @FXML
    public void handleButtonSalvar() {

        horario.setHoraInicio(Integer.parseInt(textFieldHoraInicio.getText()));
        horario.setHoraFim(Integer.parseInt(textFieldHoraFim.getText()));
        horario.setMinutoInicio(Integer.parseInt(textFieldMinutoInicio.getText()));
        horario.setMinutoFim(Integer.parseInt(textFieldMinutoFim.getText()));

        btnSalvarClicado = true;

        dialogStage.close();
    }

    @FXML
    public void handleButtonCancelar() {
        btnSalvarClicado = false;

        dialogStage.close();
    }
}
