package controller.curso;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import model.dominio.Curso;

import java.net.URL;
import java.util.ResourceBundle;

/**
 * Created by danilo on 24/09/16.
 */
public class ControllerCursoDialogInsercao implements Initializable {
    @FXML TextField textFieldCursoNome;
    @FXML TextField textFieldCursoRegime;
    @FXML TextField textFieldCursoDucarao;
    @FXML TextField textFieldCursoSigla;
    @FXML Label validatorFieldsProfessor;

        private Stage dialogStage;
    private boolean btnSalvarClicado = false;
    private Curso curso;

    void setDialogStage(Stage dialogStage) {
        this.dialogStage = dialogStage;
    }

    boolean isBtnSalvarClicado() {
        return btnSalvarClicado;
    }

    void setCurso(Curso curso) {
        this.curso = curso;

        textFieldCursoNome.setText(curso.getNome());
        textFieldCursoRegime.setText(curso.getRegime());
        textFieldCursoDucarao.setText(Integer.toString(curso.getDuracao()));
        textFieldCursoSigla.setText(curso.getSigla());
    }

    public void initialize(URL location, ResourceBundle resources) {

        // Força o campo ser apenas inteiro.
        textFieldCursoDucarao.textProperty().addListener((observable, oldValue, newValue) -> {
            textFieldCursoDucarao.setText(
                    textFieldCursoDucarao.getText().replaceFirst("\\D", "")
            );
        });
    }

    @FXML
    public void handleButtonSalvar() {

        if (validarCampos()) {
            int duracaoCurso = 0;

            if (textFieldCursoDucarao.getText().length() > 0) {
                duracaoCurso = Integer.parseInt(textFieldCursoDucarao.getText());
            }

            curso.setNome(textFieldCursoNome.getText());
            curso.setRegime(textFieldCursoRegime.getText());
            curso.setDuracao(duracaoCurso);
            curso.setSigla(textFieldCursoSigla.getText());

            btnSalvarClicado = true;

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

    private boolean validarCampos() {
        String nomeCurso = textFieldCursoNome.getText();
        String siglaCurso = textFieldCursoSigla.getText();

        return nomeCurso.length() > 0 && siglaCurso.length() > 0;
    }
}
