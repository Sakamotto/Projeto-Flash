package application;

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

    private void initIndexPage() throws IOException {
        Parent root = FXMLLoader.load(getClass().getClassLoader().getResource("index_page.fxml"));
        Scene scene = new Scene(root);

        this.primaryStage.setTitle("Escalonador de Horários");
        this.primaryStage.setScene(scene);
        this.primaryStage.setResizable(false);
        this.primaryStage.show();

    }

    public static void main(String[] args) {
        launch(args);
    }
}
