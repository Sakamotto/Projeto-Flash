package controller;

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
    private AnchorPane anchorPane;

    public void initialize(URL location, ResourceBundle resources) {}

    @FXML
    public void handleMenuItemCadastrosProfessor() throws IOException {
        AnchorPane anchorPane = FXMLLoader.load(getClass().getClassLoader().getResource("cadastro_professor.fxml"));
        this.anchorPane.getChildren().setAll(anchorPane);
    }

}
