package controller.professordisciplina;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ListView;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.ComboBoxListCell;
import javafx.scene.control.cell.PropertyValueFactory;
import model.DAO.disciplina.DisciplinaDAOImpl;
import model.DAO.professor.ProfessorDAO;
import model.DAO.professor.ProfessorDAOImpl;
import model.dominio.Disciplina;
import model.dominio.Professor;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.ResourceBundle;

/**
 * Created by cristian on 28/11/16.
 */
public class ControllerProfessorDisciplina implements Initializable{

    @FXML TableView<Professor> tableViewProfessor;
    @FXML TableColumn<Professor, String> tabelaColunaProfessorNome;
    @FXML ListView<String> listViewLecionando;
    @FXML ListView<String> listViewNaoLecionando;

    private ProfessorDAO pDAO = new ProfessorDAOImpl();
    private List<Professor> professores;
    private ObservableList<Professor> observableListProfessor;
    private ObservableList<String> observableListDisciplinaLecionando;
    private ObservableList<String> observableListDisciplinaNaoLecionando;

    private HashMap<String, Disciplina> mapDisciplinasLecionando = new HashMap<>();
    private HashMap<String, Disciplina> mapDisciplinasNaoLecionando = new HashMap<>();




    @Override
    public void initialize(URL location, ResourceBundle resources) {

        professores = pDAO.listar(Professor.class);
        carregaTableViewProfessor();

        tableViewProfessor.getSelectionModel().selectedItemProperty().addListener(
                (observable, oldValue, newValue) -> selecionaItemViewProfessor(newValue)
        );

    }

    private void carregaTableViewProfessor(){
        tabelaColunaProfessorNome.setCellValueFactory(new PropertyValueFactory<>("Nome"));
        observableListProfessor = FXCollections.observableArrayList(professores);
        tableViewProfessor.setItems(observableListProfessor);
    }

    private void selecionaItemViewProfessor(Professor professor) {

        List<String> disciplinas = new ArrayList<>();
        List<String> disciplinasNaoLecionado = new ArrayList<>();

        if (professor == null) {
            professor = new Professor();
        }


        for (Disciplina disciplina : professor.getDisciplinas()) {
            if (disciplina != null){
                System.out.println("O professor " + professor.getNome() + " Leciona: " + disciplina.getNome());

                disciplinas.add(disciplina.getNome());
                mapDisciplinasLecionando.put(disciplina.getNome(), disciplina);
            }
        }

        for (Disciplina disciplina : new DisciplinaDAOImpl().listar(Disciplina.class)) {
            if (!disciplinas.contains(disciplina.getNome())) {
                disciplinasNaoLecionado.add(disciplina.getNome());
                mapDisciplinasNaoLecionando.put(disciplina.getNome(), disciplina);
            }
        }

        observableListDisciplinaLecionando = FXCollections.observableArrayList(disciplinas);
        observableListDisciplinaNaoLecionando = FXCollections.observableArrayList(disciplinasNaoLecionado);

        listViewLecionando.setItems(observableListDisciplinaLecionando);
        listViewLecionando.setCellFactory(ComboBoxListCell.forListView(observableListDisciplinaLecionando));

        listViewNaoLecionando.setItems(observableListDisciplinaNaoLecionando);
        listViewLecionando.setCellFactory(ComboBoxListCell.forListView(observableListDisciplinaNaoLecionando));

    }

    @FXML
    public void handleButtonSalvarProfessorDisciplina(){

    }

    @FXML
    public void handleButtonRemoverProfessorDisciplina(){

    }

    @FXML
    public void handleAddLecionaDisciplina(){

    }

    @FXML
    public void handleRemoveLecionaDisciplina(){

    }

}
