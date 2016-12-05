package controller.professordisciplina;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import model.DAO.disciplina.DisciplinaDAOImpl;
import model.DAO.professor.ProfessorDAO;
import model.DAO.professor.ProfessorDAOImpl;
import model.dominio.Disciplina;
import model.dominio.Professor;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import java.util.Set;

/**
 * Created by cristian on 28/11/16.
 */
public class ControllerProfessorDisciplina implements Initializable{

    @FXML TableView<Professor> tableViewProfessor;
    @FXML TableColumn<Professor, String> tabelaColunaProfessorNome;

    @FXML TableView<Disciplina> tableViewLecionando;
    @FXML TableColumn<Disciplina, String> tableColumnLecionandoSiglaCurso;
    @FXML TableColumn<Disciplina, String> tableColumnLecionandoNome;

    @FXML TableView<Disciplina> tableViewNaoLecionando;
    @FXML TableColumn<Disciplina, String> tableColumnNaoLecionandoSiglaCurso;
    @FXML TableColumn<Disciplina, String> tableColumnNaoLecionandoNome;

    @FXML Label labelProfessor;

    private ProfessorDAO pDAO = new ProfessorDAOImpl();
    private List<Professor> professores;
    private ObservableList<Professor> observableListProfessor;

    private Professor professorSelecionado = new Professor();

    private List<Disciplina> disciplinasLecionando = new ArrayList<>();
    private List<Disciplina> disciplinasNaoLecionando = new ArrayList<>();


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
        disciplinasLecionando.add(disciplina);
    }

    private void addDisciplinaNaoLecionando(Disciplina disciplina) {
        disciplinasNaoLecionando.add(disciplina);
    }

    private void removeDisciplinaLecionando(Disciplina disciplina) {
        disciplinasLecionando.remove(disciplina);
    }

    private void removeDisciplinaNaoLecionando(Disciplina disciplina) {
        disciplinasNaoLecionando.remove(disciplina);
    }

    private void defineListViewLecionando() {
        tableViewLecionando.setItems(FXCollections.observableArrayList(disciplinasLecionando));
        tableColumnLecionandoNome.setCellValueFactory(new PropertyValueFactory<>("Nome"));
        tableColumnLecionandoSiglaCurso.setCellValueFactory(new PropertyValueFactory<>("SiglaCurso"));

        tableViewLecionando.sort();
    }

    private void defineListViewNaoLecionando() {
        tableViewNaoLecionando.setItems(FXCollections.observableArrayList(disciplinasNaoLecionando));
        tableColumnNaoLecionandoNome.setCellValueFactory(new PropertyValueFactory<>("Nome"));
        tableColumnNaoLecionandoSiglaCurso.setCellValueFactory(new PropertyValueFactory<>("SiglaCurso"));
    }

    private void selecionaItemViewProfessor(Professor professor) {

        if (professor != null) {
            professorSelecionado = professor;
            labelProfessor.setText(professor.getNome());
        }

        disciplinasLecionando = new ArrayList<>();
        disciplinasNaoLecionando = new ArrayList<>();


        for (Disciplina disciplina : professorSelecionado.getDisciplinas()) {
            if (disciplina != null){
                System.out.println("O professor " + professorSelecionado.getNome() + " Leciona: " + disciplina.getNome());
                addDisciplinaLecionando(disciplina);
            }
        }

        for (Disciplina disciplina : new DisciplinaDAOImpl().listar(Disciplina.class)) {
            if (!disciplinasLecionando.contains(disciplina)) {
                addDisciplinaNaoLecionando(disciplina);
            }
        }

        defineListViewLecionando();

        defineListViewNaoLecionando();
    }

    @FXML
    public void handleAddLecionaDisciplina(){
        Disciplina disciplinaSelecionada = tableViewNaoLecionando.getSelectionModel().getSelectedItem();
        Set<Disciplina> setDisciplinas = professorSelecionado.getDisciplinas();

        if (disciplinaSelecionada != null) {
            setDisciplinas.add(disciplinaSelecionada);

            addDisciplinaLecionando(disciplinaSelecionada);
            removeDisciplinaNaoLecionando(disciplinaSelecionada);
        }
        else {
            System.out.println("Nulo.");
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
        Disciplina disciplinaSelecionada = tableViewLecionando.getSelectionModel().getSelectedItem();
        Set<Disciplina> setDisciplinas = professorSelecionado.getDisciplinas();

        if (disciplinaSelecionada != null) {
            setDisciplinas.remove(disciplinaSelecionada);

            System.out.println("Removeu!");

            removeDisciplinaLecionando(disciplinaSelecionada);
            addDisciplinaNaoLecionando(disciplinaSelecionada);
        }

        defineListViewNaoLecionando();
        defineListViewLecionando();

        pDAO.alterar(professorSelecionado);

    }

}
