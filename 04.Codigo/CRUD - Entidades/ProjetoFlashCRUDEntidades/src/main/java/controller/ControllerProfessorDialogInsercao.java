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

    @FXML
    private Button btnSalvarProfessor, btnCancelarProfessor;

    private Stage dialogStage;
    private boolean btnSalvarClicado = false;
    private Professor professor;


    public Stage getDialogStage() {
        return dialogStage;
    }

    public void setDialogStage(Stage dialogStage) {
        this.dialogStage = dialogStage;
    }

    public boolean isBtnSalvarClicado() {
        return btnSalvarClicado;
    }

    public void setBtnSalvarClicado(boolean btnSalvarClicado) {
        this.btnSalvarClicado = btnSalvarClicado;
    }

    public Professor getProfessor() {
        return professor;
    }

    public void setProfessor(Professor professor) {
        this.professor = professor;

        this.textFieldProfessorNome.setText(this.professor.getNome());
        this.textFieldProfessorEmail.setText(this.professor.getEmail());
        this.textFieldProfessorDataNascimento.setText(this.professor.getDataNascimento());
        this.textFieldProfessorRg.setText(this.professor.getRg());
        this.textFieldProfessorCpf.setText(this.professor.getCpf());
        this.textFieldProfessorMatricula.setText(this.professor.getMatricula());
        this.textFieldProfessorMunicipio.setText(this.professor.getEndereco().getMunicipio());
        this.textFieldProfessorBairro.setText(this.professor.getEndereco().getBairro());
        this.textFieldProfessorEndereco.setText(this.professor.getEndereco().getEndereco());
        this.textFieldProfessorNumero.setText(this.professor.getEndereco().getNumero());
        this.textFieldProfessorCep.setText(this.professor.getEndereco().getCep());

    }


    public void initialize(URL location, ResourceBundle resources) {



    }

    @FXML
    public void handleButtonSalvar() {

        Endereco endereco = new Endereco();
        endereco.setMunicipio(textFieldProfessorMunicipio.getText());
        endereco.setBairro(textFieldProfessorBairro.getText());
        endereco.setEndereco(textFieldProfessorEndereco.getText());
        endereco.setNumero(textFieldProfessorNumero.getText());
        endereco.setCep(textFieldProfessorCep.getText());

        this.professor.setNome(textFieldProfessorNome.getText());
        this.professor.setEmail(textFieldProfessorEmail.getText());
        this.professor.setDataNascimento(textFieldProfessorDataNascimento.getText());
        this.professor.setRg(textFieldProfessorRg.getText());
        this.professor.setCpf(textFieldProfessorCpf.getText(), false);
        this.professor.setMatricula(textFieldProfessorMatricula.getText());
        this.professor.setEndereco(endereco);

        btnSalvarClicado = true;

        dialogStage.close();
    }

    @FXML
    public void handleButtonCancelar() {
        btnSalvarClicado = false;

        dialogStage.close();
    }
}
