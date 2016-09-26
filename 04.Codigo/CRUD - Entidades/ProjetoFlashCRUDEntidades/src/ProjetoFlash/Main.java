package ProjetoFlash;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

public class Main extends Application {


    private Stage primaryStage;

    @Override
    public void start(Stage primaryStage) throws Exception {


        this.primaryStage = primaryStage;

        initIndexPage();



    }

    public void initIndexPage() throws IOException {

        Parent root = FXMLLoader.load(getClass().getResource("view/index_page.fxml"));
        Scene scene = new Scene(root);



        this.primaryStage.setTitle("Escalonador de Horários");
        this.primaryStage.setScene(scene);
        this.primaryStage.setResizable(false);
        this.primaryStage.show();

    }

    public void initCadastroProfessorPage() throws IOException {

        Parent root = FXMLLoader.load(getClass().getResource("view/cadastro_professor.fxml"));
        Scene scene = new Scene(root);

        this.primaryStage.setTitle("Cadastro Professor");
        this.primaryStage.setScene(scene);
        this.primaryStage.show();
    }


    public static void main(String[] args) {
        launch(args);
    }
}
