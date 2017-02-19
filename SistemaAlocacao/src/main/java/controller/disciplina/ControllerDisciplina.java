package controller.disciplina;

import controller.exception.AllertExceptionController;
import controller.professor.ControllerProfessorDialogInsercao;
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
import model.DAO.disciplina.DisciplinaDAO;
import model.DAO.disciplina.DisciplinaDAOImpl;
import model.dominio.Disciplina;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.List;
import java.util.ResourceBundle;

/**
 * Created by danilo on 24/10/16.
 */
public class ControllerDisciplina implements Initializable {
    @FXML TableView<Disciplina> tableViewDisciplina;
    @FXML TableColumn<Disciplina, String> tabelaColunaCursoNome;
    @FXML TableColumn<Disciplina, String> tabelaColunaDisciplinaNome;
    @FXML Label labelDisciplinaNome;
    @FXML Label labelDisciplinaCargaHoraria;
    @FXML Label labelDisciplinaCurso;
    @FXML Label labelDisciplinaPeriodo;

    private DisciplinaDAO dDAO = new DisciplinaDAOImpl();

    private List<Disciplina> disciplinas;
    private ObservableList<Disciplina> observableListDisciplina;


    @Override
    public void initialize(URL location, ResourceBundle resources) {
        try {
            carregaTableViewDiscplina();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        tableViewDisciplina.getSelectionModel().selectedItemProperty().addListener(
                (observable, oldValue, newValue) -> selecionaItemViewProfessor(newValue)
        );

    }

    private void carregaTableViewDiscplina() throws SQLException, ClassNotFoundException {
        tabelaColunaCursoNome.setCellValueFactory(new PropertyValueFactory<>("CursoSigla"));
        tabelaColunaDisciplinaNome.setCellValueFactory(new PropertyValueFactory<>("Nome"));

        disciplinas = dDAO.listar(Disciplina.class);

        observableListDisciplina = FXCollections.observableArrayList(disciplinas);
        tableViewDisciplina.setItems(observableListDisciplina);
    }

    private void selecionaItemViewProfessor(Disciplina disciplina) {

        if (disciplina == null) {
            disciplina = new Disciplina();
        }

        labelDisciplinaNome.setText(disciplina.getNome());
        labelDisciplinaCargaHoraria.setText(Integer.toString(disciplina.getCargaHoraria()));
        labelDisciplinaCurso.setText(disciplina.getCurso().getNome());
        labelDisciplinaPeriodo.setText(Integer.toString(disciplina.getPeriodo()));
    }

    @FXML
    public void handleButtonCadastrar() throws IOException, SQLException, ClassNotFoundException {
        Disciplina disciplina = new Disciplina();
        boolean btnSalvarClicado = showOpenCadastroDisciplinaDialog(disciplina, "Cadastro");

        if (btnSalvarClicado) {
            // System.out.println("Salvando disciplina no banco de dados.");

            dDAO.inserir(disciplina);
            disciplinas.add(disciplina);

            // Recarrega a página de cadastro de disciplina.
            carregaTableViewDiscplina();

        }
    }

    @FXML
    public void handleButtonEditar() throws IOException, SQLException, ClassNotFoundException {
        Disciplina disciplina = tableViewDisciplina.getSelectionModel().getSelectedItem();

        if (disciplina != null) {

            boolean btnSalvarClicado = showOpenCadastroDisciplinaDialog(disciplina, "Edicao");

            if (btnSalvarClicado) {
                System.out.println("Alterando professor no banco de dados.");

                // Recarrega a página de cadastro de professor.

                dDAO.alterar(disciplina);

                observableListDisciplina.clear();
                carregaTableViewDiscplina();
            }
        }
        else {
            AllertExceptionController.noItemSelected("Por favor, selecione uma disciplina.");
        }
    }


    @FXML
    public void handleButtonExcluir() throws SQLException, ClassNotFoundException {
        Disciplina disciplina = tableViewDisciplina.getSelectionModel().getSelectedItem();

        if (disciplina != null) {
            boolean deletar;
            deletar = AllertExceptionController.confirmation("Atencao. Deseja mesmo excluir essa disciplina?");

            if (deletar) {
                System.out.println("Deletando disciplina no banco de dados.");

                dDAO.deletar(disciplina);
                disciplinas.remove(disciplina);

                // Recarrega a página de cadastro de disciplina.
                observableListDisciplina.clear();
                carregaTableViewDiscplina();
            }
        }
        else {
            AllertExceptionController.noItemSelected("Por favor, selecione uma disciplina.");
        }
    }


    private boolean showOpenCadastroDisciplinaDialog(Disciplina disciplina, String action) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(ControllerProfessorDialogInsercao.class.getClassLoader().getResource("disciplina/insercao_disciplina.fxml"));

        AnchorPane paginaDialogoCadastro = fxmlLoader.load();

        // Cria um Estágio de Diálogo.
        Stage dialogStage = new Stage();
        dialogStage.setTitle(action +" de Disciplina");
        Scene scene = new Scene(paginaDialogoCadastro);
        dialogStage.setScene(scene);

        // Seta a caixa de dialogo no controller e o disciplina.
        ControllerDisciplinaDialogInsercao controller = fxmlLoader.getController();
        controller.setDialogStage(dialogStage);
        controller.setDisciplina(disciplina);

        // Mostra a tela de dialogo que foi toda carregada e espera ser fechada.
        dialogStage.showAndWait();

        return controller.isBtnSalvarClicado();

    }
}
