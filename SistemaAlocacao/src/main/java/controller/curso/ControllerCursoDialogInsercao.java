package controller.curso;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
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

        curso.setNome(textFieldCursoNome.getText());
        curso.setRegime(textFieldCursoRegime.getText());
        curso.setDuracao(Integer.parseInt(textFieldCursoDucarao.getText()));
        curso.setSigla(textFieldCursoSigla.getText());

        btnSalvarClicado = true;

        dialogStage.close();
    }

    @FXML
    public void handleButtonCancelar() {
        btnSalvarClicado = false;

        dialogStage.close();
    }
}
