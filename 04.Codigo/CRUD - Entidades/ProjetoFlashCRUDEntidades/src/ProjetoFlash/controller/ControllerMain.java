package ProjetoFlash.controller;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.layout.AnchorPane;

import java.awt.*;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class ControllerMain implements Initializable {


    @FXML
    private MenuItem menuItemCadastrosAreaConhecimento,
                     menuItemCadastrosCurso,
                     menuItemCadastrosDisciplina,
                     menuItemCadastrosProfessor,
                     menuItemProcessosAlocarProfessores,
                     menuItemProcessosIniciarGeracaoHorarios,
                     menuItemRelatoriosVisualizarRelatorios;

    @FXML
    private AnchorPane anchorPane;


    /*
    @FXML
    private TextField nomeProfessor,
                      matriculaProfessor,
                      cpfProfessor,
                      municipioProfessor,
                      bairroProfessor,
                      enderecoProfessor,
                      numeroProfessor,
                      cepProfessor;

    @FXML
    private AnchorPane anchorPane;

    @FXML
    private Button cadastrar,
                   cancelar;

    */

    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }

    @FXML
    public void handleMenuItemCadastrosProfessor() throws IOException {
        AnchorPane anchorPane = FXMLLoader.load(getClass().getResource("../view/cadastro_professor.fxml"));
        this.anchorPane.getChildren().setAll(anchorPane);
    }

}
