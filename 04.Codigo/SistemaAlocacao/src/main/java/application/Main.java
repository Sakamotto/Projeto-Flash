package application;

import javafx.application.Application;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class Main extends Application implements Initializable {
    @FXML
    private AnchorPane anchorPane;
    private Stage primaryStage;

    @Override
    public void start(Stage primaryStage) throws Exception {
        this.primaryStage = primaryStage;
        initIndexPage();

    }

    private void initIndexPage() throws IOException {
        Parent root = FXMLLoader.load(getClass().getClassLoader().getResource("index_page.fxml"));
        Scene scene = new Scene(root);

        primaryStage.setTitle("Escalonador de Horarios");
        primaryStage.setScene(scene);
        primaryStage.setResizable(false);
        primaryStage.show();

    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {}

    @FXML
    public void handleMenuItemCadastrosProfessor() throws IOException {
        AnchorPane anchorPane = FXMLLoader.load(getClass().getClassLoader().getResource("professor/cadastro_professor.fxml"));
        this.anchorPane.getChildren().setAll(anchorPane);
    }

    @FXML
    public void handleMenuItemCadastrosDisicplina() throws IOException {
        AnchorPane anchorPane = FXMLLoader.load(getClass().getClassLoader().getResource("disciplina/cadastro_disciplina.fxml"));
        this.anchorPane.getChildren().setAll(anchorPane);
    }

    @FXML
    public void handleMenuItemVisuzlizarRelatorio() throws IOException{
        AnchorPane anchorPane = FXMLLoader.load(getClass().getClassLoader().getResource("alocacaoHorarios/alocacaoHorarios.fxml"));
        this.anchorPane.getChildren().setAll(anchorPane);
    }

    @FXML
    public void handleMenuItemProfessorDisciplina() throws IOException{
        AnchorPane anchorPane = FXMLLoader.load(getClass().getClassLoader().getResource("professor_disciplina/professor_disciplina.fxml"));
        this.anchorPane.getChildren().setAll(anchorPane);
    }

    @FXML
    public void handleMenuItemCadastrosHorarios()throws IOException{
        AnchorPane anchorPane = FXMLLoader.load(getClass().getClassLoader().getResource("horario/cadastro_horario.fxml"));
        this.anchorPane.getChildren().setAll(anchorPane);
    }

    @FXML
    public void handleMenuItemCadastroCurso() throws IOException {
        AnchorPane anchorPane = FXMLLoader.load(getClass().getClassLoader().getResource("curso/cadastro_curso.fxml"));
        this.anchorPane.getChildren().setAll(anchorPane);
    }


    public static void main(String[] args) {
        launch(args);
    }
}
