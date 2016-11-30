package controller.curso;

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
import model.DAO.curso.CursoDAO;
import model.DAO.curso.CursoDAOImpl;
import model.dominio.Curso;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.List;
import java.util.ResourceBundle;

/**
 * Created by danilo on 24/10/16.
 */
public class ControllerCurso implements Initializable {
    @FXML TableView<Curso> tableViewCurso;
    @FXML TableColumn<Curso, String> tabelaColunaCursoSigla;
    @FXML TableColumn<Curso, String> tabelaColunaCursoNome;
    @FXML Label labelCursoNome;
    @FXML Label labelCursoRegime;
    @FXML Label labelCursoDuracao;
    @FXML Label labelCursoSigla;

    private CursoDAO cDAO = new CursoDAOImpl();

    private List<Curso> cursos;
    private ObservableList<Curso> observableListCurso;


    @Override
    public void initialize(URL location, ResourceBundle resources) {

        try {
            carregaTableViewCurso();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        tableViewCurso.getSelectionModel().selectedItemProperty().addListener(
                (observable, oldValue, newValue) -> selecionaItemViewProfessor(newValue)
        );

    }

    private void carregaTableViewCurso() throws SQLException, ClassNotFoundException {
        tabelaColunaCursoSigla.setCellValueFactory(new PropertyValueFactory<>("Sigla"));
        tabelaColunaCursoNome.setCellValueFactory(new PropertyValueFactory<>("Nome"));

        cursos = cDAO.listar(Curso.class);

        observableListCurso = FXCollections.observableArrayList(cursos);
        tableViewCurso.setItems(observableListCurso);
    }

    private void selecionaItemViewProfessor(Curso curso) {

        if (curso == null) {
            curso = new Curso();
        }

        labelCursoNome.setText(curso.getNome());
        labelCursoRegime.setText(curso.getRegime());
        labelCursoDuracao.setText(Integer.toString(curso.getDuracao()));
        labelCursoSigla.setText(curso.getSigla());
    }

    @FXML
    public void handleButtonCadastrar() throws IOException, SQLException, ClassNotFoundException {
        Curso curso = new Curso();
        boolean btnSalvarClicado = showOpenCadastroCursoDialog(curso, "Cadastro");

        if (btnSalvarClicado) {
            // System.out.println("Salvando curso no banco de dados.");

            cDAO.inserir(curso);
            cursos.add(curso);

            // Recarrega a página de cadastro de curso.
            carregaTableViewCurso();

        }
    }

    @FXML
    public void handleButtonEditar() throws IOException, SQLException, ClassNotFoundException {
        Curso curso = tableViewCurso.getSelectionModel().getSelectedItem();

        if (curso != null) {

            boolean btnSalvarClicado = showOpenCadastroCursoDialog(curso, "Edicao");

            if (btnSalvarClicado) {
                System.out.println("Alterando Curso no banco de dados.");

                // Recarrega a página de cadastro de curso.

                cDAO.alterar(curso);

                observableListCurso.clear();
                carregaTableViewCurso();
            }
        }
        else {
            AllertExceptionController.noItemSelected("Por favor, selecione um curso.");
        }
    }


    @FXML
    public void handleButtonExcluir() throws SQLException, ClassNotFoundException {
        Curso curso = tableViewCurso.getSelectionModel().getSelectedItem();

        if (curso != null) {
            boolean deletar;
            deletar = AllertExceptionController.confirmation("Atencao. Deseja mesmo excluir essa curso?");

            if (deletar) {
                System.out.println("Deletando curso no banco de dados.");

                cDAO.deletar(curso);
                cursos.remove(curso);

                // Recarrega a página de cadastro de curso.
                observableListCurso.clear();
                carregaTableViewCurso();
            }
        }
        else {
            AllertExceptionController.noItemSelected("Por favor, selecione um curso.");
        }
    }


    private boolean showOpenCadastroCursoDialog(Curso curso, String action) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(ControllerCursoDialogInsercao.class.getClassLoader().getResource("curso/insercao_curso.fxml"));

        AnchorPane paginaDialogoCadastro = fxmlLoader.load();

        // Cria um Estágio de Diálogo.
        Stage dialogStage = new Stage();
        dialogStage.setTitle(action +" de Curso");
        Scene scene = new Scene(paginaDialogoCadastro);
        dialogStage.setScene(scene);

        // Seta a caixa de dialogo no controller e o curso.
        ControllerCursoDialogInsercao controller = fxmlLoader.getController();
        controller.setDialogStage(dialogStage);
        controller.setCurso(curso);

        // Mostra a tela de dialogo que foi toda carregada e espera ser fechada.
        dialogStage.showAndWait();

        return controller.isBtnSalvarClicado();

    }
}
