package controller.professor;

import javafx.beans.property.ObjectProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.util.StringConverter;
import model.dominio.Professor;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.net.URL;
import java.time.LocalDate;
import java.time.chrono.Chronology;
import java.time.format.DateTimeFormatter;
import java.util.ResourceBundle;

/**
 * Created by danilo on 24/09/16.
 */
public class ControllerProfessorDialogInsercao implements Initializable {

    @FXML private TextField textFieldProfessorNome;
    @FXML private TextField textFieldProfessorMatricula;
    @FXML private TextField textFieldProfessorCpf;
    @FXML private TextField textFieldProfessorEmail;
    @FXML private DatePicker datePickerDataNascimento;
    @FXML private TextField textFieldProfessorRg;
    @FXML private Label validatorFieldsProfessor;

    private Stage dialogStage;
    private boolean btnSalvarClicado = false;
    private Professor professor;

    void setDialogStage(Stage dialogStage) {
        this.dialogStage = dialogStage;
    }

    boolean isBtnSalvarClicado() {
        return btnSalvarClicado;
    }

    public void setBtnSalvarClicado(boolean btnSalvarClicado) {
        this.btnSalvarClicado = btnSalvarClicado;
    }

    public Professor getProfessor() {
        return professor;
    }

    void setProfessor(Professor professor) {
        this.professor = professor;

        textFieldProfessorNome.setText(professor.getNome());
        textFieldProfessorEmail.setText(professor.getEmail());
        datePickerDataNascimento.setPromptText(professor.getDataNascimento());
        textFieldProfessorRg.setText(professor.getRg());
        textFieldProfessorCpf.setText(professor.getCpf());
        textFieldProfessorMatricula.setText(professor.getMatricula());
    }


    public void initialize(URL location, ResourceBundle resources) {

        datePickerDataNascimento.setPromptText("dd/MM/yyyy");

        datePickerDataNascimento.setConverter(new StringConverter<LocalDate>() {
            DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

            @Override
            public String toString(LocalDate date) {
                return (date != null) ? dateFormatter.format(date) : "";
            }

            @Override
            public LocalDate fromString(String string) {
                return (string != null && !string.isEmpty()) ? LocalDate.parse(string, dateFormatter) : null;
            }
        });

        cpfMask(textFieldProfessorCpf);
    }

    /**
     * Monta as mascara para CPF/CNPJ. A mascara eh exibida somente apos o campo perder o foco.
     *
     * @param textField TextField
     */
    private static void cpfMask(final TextField textField) {

        textField.lengthProperty().addListener( (observable, oldChange, newChange) -> {
            if (textField.isFocused()) {
                textField.setText(textField.getText().replaceAll("\\D", ""));

                if (textField.getText().length() >= 11) {
                    textField.setText(textField.getText().substring(0, 11));
                }
            }
        });

        textField.focusedProperty().addListener((observableValue, aBoolean, fieldChange) -> {

            String value = textField.getText();

            if (textField.isFocused()) {
                value = textField.getText().replaceAll("\\D", "");
            }
            else if (!fieldChange && textField.getText().length() == 11) {
                value = value.replaceAll("[^0-9]", "");
                value = value.replaceFirst("([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})$", "$1.$2.$3-$4");
            }


            textField.setText(value);

            if (textField.getText().equals(value)) {
                textField.setText("");
                textField.insertText(0, value);
            }

        });

    }

    @FXML
    public void handleButtonSalvar() {
        professor.setNome(textFieldProfessorNome.getText());
        professor.setEmail(textFieldProfessorEmail.getText());
        professor.setDataNascimento(datePickerDataNascimento.editorProperty().get().getText());
        professor.setRg(textFieldProfessorRg.getText());
        professor.setCpf(textFieldProfessorCpf.getText(), false);
        professor.setMatricula(textFieldProfessorMatricula.getText());

        btnSalvarClicado = true;

        if (professor.getNome().length() > 0 && professor.getCpf().length() == 14) {
            dialogStage.close();
        }
        else {
            validatorFieldsProfessor.setVisible(true);
        }
    }

    @FXML
    public void handleButtonCancelar() {
        btnSalvarClicado = false;

        dialogStage.close();
    }
}
