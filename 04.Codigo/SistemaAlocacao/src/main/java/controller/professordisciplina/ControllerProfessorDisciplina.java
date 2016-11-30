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
import java.util.*;

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

    private Professor professorSelecionado = new Professor();

    private List<String> disciplinasLecionando = new ArrayList<>();
    private List<String> disciplinasNaoLecionando = new ArrayList<>();

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

    private void addDisciplinaLecionando(Disciplina disciplina) {
        disciplinasLecionando.add(disciplina.getNome());
        mapDisciplinasLecionando.put(disciplina.getNome(), disciplina);

        Collections.sort(disciplinasLecionando);
    }

    private void addDisciplinaNaoLecionando(Disciplina disciplina) {
        disciplinasNaoLecionando.add(disciplina.getNome());
        mapDisciplinasNaoLecionando.put(disciplina.getNome(), disciplina);
        Collections.sort(disciplinasNaoLecionando);
    }

    private void removeDisciplinaLecionando(Disciplina disciplina) {
        disciplinasLecionando.remove(disciplina.getNome());
        mapDisciplinasLecionando.remove(disciplina.getNome());
    }

    private void removeDisciplinaNaoLecionando(Disciplina disciplina) {
        disciplinasNaoLecionando.remove(disciplina.getNome());
        mapDisciplinasNaoLecionando.remove(disciplina.getNome());
    }

    private void defineListViewLecionando() {
        observableListDisciplinaLecionando = FXCollections.observableArrayList(disciplinasLecionando);

        listViewLecionando.setItems(observableListDisciplinaLecionando);
        listViewLecionando.setCellFactory(ComboBoxListCell.forListView(observableListDisciplinaLecionando));
    }

    private void defineListViewNaoLecionando() {
        observableListDisciplinaNaoLecionando = FXCollections.observableArrayList(disciplinasNaoLecionando);

        listViewNaoLecionando.setItems(observableListDisciplinaNaoLecionando);
        listViewNaoLecionando.setCellFactory(ComboBoxListCell.forListView(observableListDisciplinaNaoLecionando));
    }

    private void selecionaItemViewProfessor(Professor professor) {

        if (professor != null)
            professorSelecionado = professor;

        disciplinasLecionando = new ArrayList<>();
        disciplinasNaoLecionando = new ArrayList<>();


        for (Disciplina disciplina : professorSelecionado.getDisciplinas()) {
            if (disciplina != null){
                System.out.println("O professor " + professorSelecionado.getNome() + " Leciona: " + disciplina.getNome());
                addDisciplinaLecionando(disciplina);
            }
        }

        for (Disciplina disciplina : new DisciplinaDAOImpl().listar(Disciplina.class)) {
            if (!disciplinasLecionando.contains(disciplina.getNome())) {
                addDisciplinaNaoLecionando(disciplina);
            }
        }

        defineListViewLecionando();

        defineListViewNaoLecionando();
    }

    @FXML
    public void handleAddLecionaDisciplina(){
        String disciplinaSelecionadaNome = listViewNaoLecionando.getSelectionModel().getSelectedItems().get(0);
        Disciplina disciplinaSelecionada;
        Set<Disciplina> setDisciplinas = professorSelecionado.getDisciplinas();

        if (disciplinaSelecionadaNome != null) {
            disciplinaSelecionada = mapDisciplinasNaoLecionando.get(disciplinaSelecionadaNome);
            setDisciplinas.add(disciplinaSelecionada);

            addDisciplinaLecionando(disciplinaSelecionada);
            removeDisciplinaNaoLecionando(disciplinaSelecionada);
        }

        defineListViewLecionando();
        defineListViewNaoLecionando();

        for (Disciplina d: professorSelecionado.getDisciplinas()){
            System.out.println("Disciplina: " + d.getNome());
        }

        pDAO.alterar(professorSelecionado);
    }

    @FXML
    public void handleRemoveLecionaDisciplina(){
        String disciplinaSelecionadaNome = listViewLecionando.getSelectionModel().getSelectedItems().get(0);
        Disciplina disciplinaSelecionada;
        Set<Disciplina> setDisciplinas = professorSelecionado.getDisciplinas();

        if (disciplinaSelecionadaNome != null) {
            disciplinaSelecionada = mapDisciplinasLecionando.get(disciplinaSelecionadaNome);
            setDisciplinas.remove(disciplinaSelecionada);

            removeDisciplinaLecionando(disciplinaSelecionada);
            addDisciplinaNaoLecionando(disciplinaSelecionada);
        }

        defineListViewNaoLecionando();
        defineListViewLecionando();

        pDAO.alterar(professorSelecionado);

    }

}
