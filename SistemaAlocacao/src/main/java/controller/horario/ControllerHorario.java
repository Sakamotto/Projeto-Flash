package controller.horario;

import controller.exception.AllertExceptionController;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import model.DAO.horario.HorarioDAO;
import model.DAO.horario.HorarioDAOImpl;
import model.dominio.Horario;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

/**
 * Created by cristian on 29/11/16.
 */
public class ControllerHorario implements Initializable{

    @FXML TableView<Horario> tableViewHorario;
    @FXML TableColumn<Horario, String> tabelaColunaHorarioInicio;
    @FXML TableColumn<Horario, String> tabelaColunaHorarioFim;
    @FXML Label labelHorarioInicio;
    @FXML Label labelHorarioFim;

    private HorarioDAO hDAO = new HorarioDAOImpl();
    private List<Horario> horarios = new ArrayList<>();

    private ObservableList<Horario> observableListHorario;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        horarios = hDAO.listar(Horario.class);

        for (Horario h: horarios){
            System.out.println("Horário: " + h.getHorarioInicio());
        }

        carregaTableViewHorario();

        tableViewHorario.getSelectionModel().selectedItemProperty().addListener(
                (observable, oldValue, newValue) -> selecionaItemViewHorario(newValue)
        );
    }

    private void carregaTableViewHorario(){
        tabelaColunaHorarioInicio.setCellValueFactory(new PropertyValueFactory<>("HorarioInicio"));
        tabelaColunaHorarioFim.setCellValueFactory(new PropertyValueFactory<>("HorarioFim"));

        observableListHorario = FXCollections.observableArrayList(horarios);
        tableViewHorario.setItems(observableListHorario);
    }

    public void selecionaItemViewHorario(Horario horario){
        if (horario != null) {
            labelHorarioInicio.setText(horario.getHorarioInicio());
            labelHorarioFim.setText(horario.getHorarioFim());
        }
    }

    @FXML
    public void handleButtonCadastrar() throws IOException {
        Horario horario = new Horario();
        boolean btnSalvarClicado = showOpenCadastroHorarioDialog(horario, "Cadastro");

        if (btnSalvarClicado) {
            // System.out.println("Salvando horário no banco de dados.");

            hDAO.inserir(horario);
            horarios.add(horario);

            // Recarrega a página de cadastro de horário.
            carregaTableViewHorario();
        }
    }

    @FXML
    public void handleButtonEditar() throws IOException {
        Horario horario = tableViewHorario.getSelectionModel().getSelectedItem();
        boolean btnSalvarClicado = showOpenCadastroHorarioDialog(horario, "Editar");

        if(horario != null){
            if (btnSalvarClicado) {
                // System.out.println("Salvando horário no banco de dados.");

                hDAO.alterar(horario);
                observableListHorario.clear();
                // Recarrega a página de cadastro de horário.
                carregaTableViewHorario();
            }
        }else{
            AllertExceptionController.noItemSelected("Por favor, selecione um horario.");
        }
    }

    @FXML
    public void handleButtonExcluir(){
        Horario horario = tableViewHorario.getSelectionModel().getSelectedItem();

        if(horario != null){
            boolean deletar = AllertExceptionController.confirmation("Atencao. Deseja mesmo excluir essa Horario?");

            if (deletar) {
                // System.out.println("Salvando horario no banco de dados.");

                hDAO.deletar(horario);
                horarios.remove(horario);

                // Recarrega a página de cadastro de horario.
                observableListHorario.clear();
                carregaTableViewHorario();
            }
        }else{
            AllertExceptionController.noItemSelected("Por favor, selecione um horario.");
        }

    }

    private boolean showOpenCadastroHorarioDialog(Horario horario, String action) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(ControllerHorarioDialogInsercao.class.getClassLoader().getResource("horario/insercao_horario.fxml"));

        AnchorPane paginaDialogoCadastro = fxmlLoader.load();

        // Cria um Estágio de Diálogo.
        Stage dialogStage = new Stage();
        dialogStage.setTitle(action +" de Horários");
        Scene scene = new Scene(paginaDialogoCadastro);
        dialogStage.setScene(scene);

        // Seta a caixa de dialogo no controller e o horario.
        ControllerHorarioDialogInsercao controller = fxmlLoader.getController();
        controller.setDialogStage(dialogStage);
        controller.setHorario(horario);

        // Mostra a tela de dialogo que foi toda carregada e espera ser fechada.
        dialogStage.showAndWait();

        return controller.isBtnSalvarClicado();

    }

}
