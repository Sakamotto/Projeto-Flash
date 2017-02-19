package controller.professor;

import javafx.scene.control.DatePicker;
import javafx.util.StringConverter;
import model.dominio.Professor;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.net.URL;
import java.time.LocalDate;
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

        datePickerDataNascimento.setPromptText("dd-MM-yyyy");

        datePickerDataNascimento.setConverter(new StringConverter<LocalDate>() {
            DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");

            @Override
            public String toString(LocalDate date) {
                return (date != null) ? dateFormatter.format(date) : "";
            }

            @Override
            public LocalDate fromString(String string) {
                return (string != null && !string.isEmpty()) ? LocalDate.parse(string, dateFormatter) : null;
            }
        });
    }

    @FXML
    public void handleButtonSalvar() {
        professor.setNome(textFieldProfessorNome.getText());
        professor.setEmail(textFieldProfessorEmail.getText());
        professor.setDataNascimento(datePickerDataNascimento.getPromptText());
        professor.setRg(textFieldProfessorRg.getText());
        professor.setCpf(textFieldProfessorCpf.getText(), false);
        professor.setMatricula(textFieldProfessorMatricula.getText());

        btnSalvarClicado = true;

        dialogStage.close();
    }

    @FXML
    public void handleButtonCancelar() {
        btnSalvarClicado = false;

        dialogStage.close();
    }
}
