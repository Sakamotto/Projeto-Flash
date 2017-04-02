package controller.alocacaohorarios;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import model.dominio.Regra;

import java.net.URL;
import java.util.ResourceBundle;

/**
 * Created by danilo on 24/09/16.
 */
public class ControllerRegraDialogEdicao implements Initializable {
    @FXML Label labelRegraDescricao;
    @FXML Label labelRegraTipo;
    @FXML TextField textFieldRegraPenalidade;
    @FXML ChoiceBox<String> choiceBoxRegraEstado;
    @FXML Label validatorFieldsRegra;

    private Stage dialogStage;
    private boolean btnSalvarClicado = false;
    private Regra regra;

    void setDialogStage(Stage dialogStage) {
        this.dialogStage = dialogStage;
    }

    boolean isBtnSalvarClicado() {
        return btnSalvarClicado;
    }

    void setRegra(Regra regra) {
        this.regra = regra;

        labelRegraDescricao.setText(regra.getDescricao());
        labelRegraTipo.setText(regra.getTipoRegra().toString());
        textFieldRegraPenalidade.setText(Integer.toString(regra.getPenalidade()));

        ObservableList<String> estados = FXCollections.observableArrayList();

        estados.add(0, "Ativada");
        estados.add(1, "Desativada");

        choiceBoxRegraEstado.setItems(estados);

        if (regra.isAtivada()) {
            choiceBoxRegraEstado.getSelectionModel().select(0);
        } else {
            choiceBoxRegraEstado.getSelectionModel().select(1);
        }

        textFieldRegraPenalidade.textProperty().addListener((observable, oldValue, newValue) -> {
            textFieldRegraPenalidade.setText(newValue.replaceAll("\\D", ""));
        });

    }

    public void initialize(URL location, ResourceBundle resources) {


    }

    @FXML
    public void handleButtonSalvar() {

        if (validarCampos()) {
            int penalidade = 0;

            if (textFieldRegraPenalidade.getText().length() > 0) {
                penalidade = Integer.parseInt(textFieldRegraPenalidade.getText());
            }

            regra.setPenalidade(penalidade);

            regra.setAtivada(choiceBoxRegraEstado.getSelectionModel().isSelected(0));

            btnSalvarClicado = true;

            dialogStage.close();
        }

        else {
            validatorFieldsRegra.setVisible(true);
        }

    }

    @FXML
    public void handleButtonCancelar() {
        btnSalvarClicado = false;

        dialogStage.close();
    }

    private boolean validarCampos() {
        String estado = choiceBoxRegraEstado.getValue();

        return estado.length() > 0;
    }
}
