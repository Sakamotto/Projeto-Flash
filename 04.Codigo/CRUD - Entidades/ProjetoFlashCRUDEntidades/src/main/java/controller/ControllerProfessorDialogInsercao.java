package controller;

import model.dominio.Endereco;
import model.dominio.Professor;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.net.URL;
import java.util.ResourceBundle;

/**
 * Created by danilo on 24/09/16.
 */
public class ControllerProfessorDialogInsercao implements Initializable {

    @FXML
    private TextField textFieldProfessorNome, textFieldProfessorMatricula, textFieldProfessorCpf, textFieldProfessorMunicipio,
                      textFieldProfessorBairro, textFieldProfessorEndereco, textFieldProfessorNumero, textFieldProfessorCep,
                      textFieldProfessorEmail, textFieldProfessorDataNascimento, textFieldProfessorRg;

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
        textFieldProfessorDataNascimento.setText(professor.getDataNascimento());
        textFieldProfessorRg.setText(professor.getRg());
        textFieldProfessorCpf.setText(professor.getCpf());
        textFieldProfessorMatricula.setText(professor.getMatricula());
        textFieldProfessorMunicipio.setText(professor.getEndereco().getMunicipio());
        textFieldProfessorBairro.setText(professor.getEndereco().getBairro());
        textFieldProfessorEndereco.setText(professor.getEndereco().getEndereco());
        textFieldProfessorNumero.setText(professor.getEndereco().getNumero());
        textFieldProfessorCep.setText(professor.getEndereco().getCep());

    }


    public void initialize(URL location, ResourceBundle resources) {}

    @FXML
    public void handleButtonSalvar() {
        Endereco endereco = new Endereco();
        endereco.setMunicipio(textFieldProfessorMunicipio.getText());
        endereco.setBairro(textFieldProfessorBairro.getText());
        endereco.setEndereco(textFieldProfessorEndereco.getText());
        endereco.setNumero(textFieldProfessorNumero.getText());
        endereco.setCep(textFieldProfessorCep.getText());

        professor.setNome(textFieldProfessorNome.getText());
        professor.setEmail(textFieldProfessorEmail.getText());
        professor.setDataNascimento(textFieldProfessorDataNascimento.getText());
        professor.setRg(textFieldProfessorRg.getText());
        professor.setCpf(textFieldProfessorCpf.getText(), false);
        professor.setMatricula(textFieldProfessorMatricula.getText());
        professor.setEndereco(endereco);

        btnSalvarClicado = true;

        dialogStage.close();
    }

    @FXML
    public void handleButtonCancelar() {
        btnSalvarClicado = false;

        dialogStage.close();
    }
}
