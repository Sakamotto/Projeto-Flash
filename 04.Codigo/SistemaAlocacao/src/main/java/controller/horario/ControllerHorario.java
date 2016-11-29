package controller.horario;

import domain.Schedule;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import model.DAO.horario.HorarioDAO;
import model.DAO.horario.HorarioDAOImpl;
import model.dominio.Horario;

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
        labelHorarioInicio.setText(horario.getHorarioInicio());
        labelHorarioFim.setText(horario.getHorarioFim());
    }

    @FXML
    public void handleButtonCadastrar(){

    }

    @FXML
    public void handleButtonEditar(){

    }

    @FXML
    public void handleButtonExcluir(){

    }



}
