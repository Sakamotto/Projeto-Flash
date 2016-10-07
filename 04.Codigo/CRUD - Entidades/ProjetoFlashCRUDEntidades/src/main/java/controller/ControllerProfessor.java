package controller;

import model.database.PersistenciaProfessor;
import model.dominio.Professor;
import model.dominio.ProfessorFakeFactory;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.*;


public class ControllerProfessor implements Initializable {

    @FXML
    private TableView<Professor> tableViewProfessor;

    @FXML
    private TableColumn<Professor, String> tabelaColunaProfessorNome, tabelaColunaProfessorCpf;

    @FXML
    private Button btnCadastrarProfessor, btnEditarProfessor, btnExcluirProfessor;

    @FXML
    private Label labelProfessorNome, labelProfessorMatricula, labelProfessorCpf, labelProfessorMunicipio,
                  labelProfessorBairro, labelProfessorEndereco, labelProfessorNumero, labelProfessorCep,
                  labelProfessorEmail, labelProfessorDataNascimento, labelProfessorRg;

    private List<Professor> listProfessor;
    private ObservableList<Professor> observableListProfessor;




    public void initialize(URL location, ResourceBundle resources) {
        //Professor prof = ProfessorFakeFactory.getProfessorFake(ProfessorFakeFactory.Tipo.FAKE);
        try {
            listProfessor = PersistenciaProfessor.getProfessores();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        carregaTableViewProfessor();

        // Abaixo temos uma função lambda em java. Do lado esquerdo é os parâmetros e do lado direito é a função.
        tableViewProfessor.getSelectionModel().selectedItemProperty().addListener(
                (observable, oldValue, newValue) -> selecionaItemViewClientes(newValue)
        );

    }

    public void carregaTableViewProfessor () {
        tabelaColunaProfessorNome.setCellValueFactory(new PropertyValueFactory<>("Nome"));
        tabelaColunaProfessorCpf.setCellValueFactory(new PropertyValueFactory<>("Cpf"));

        observableListProfessor = FXCollections.observableArrayList(listProfessor);
        tableViewProfessor.setItems(observableListProfessor);

    }

    // Recebe um professor, pois o tableView é do tipo Professor.
    public void selecionaItemViewClientes (Professor professor) {
        String pNome = "", pMatricula = "", pCpf = "", pMunicipio = "", pBairro = "", pEndereco = "", pNumero = "", pCep = "", pEmail = "", pDataNascimento = "", pRg = "";

        if (professor != null) {
            pNome = professor.getNome();
            pEmail = professor.getEmail();
            pDataNascimento = professor.getDataNascimento();
            pRg = professor.getRg();
            pCpf = professor.getCpf();
            pMatricula = professor.getMatricula();
            pMunicipio = professor.getEndereco().getMunicipio();
            pBairro = professor.getEndereco().getBairro();
            pEndereco = professor.getEndereco().getEndereco();
            pNumero = professor.getEndereco().getNumero();
            pCep = professor.getEndereco().getCep();

        }

        labelProfessorNome.setText(pNome);
        labelProfessorEmail.setText(pEmail);
        labelProfessorDataNascimento.setText(pDataNascimento);
        labelProfessorRg.setText(pRg);
        labelProfessorCpf.setText(pCpf);
        labelProfessorMatricula.setText(pMatricula);
        labelProfessorMunicipio.setText(pMunicipio);
        labelProfessorBairro.setText(pBairro);
        labelProfessorEndereco.setText(pEndereco);
        labelProfessorNumero.setText(pNumero);
        labelProfessorCep.setText(pCep);

    }

    @FXML
    public void handleButtonCadastrar () throws IOException, SQLException, ClassNotFoundException {
        Professor professor = ProfessorFakeFactory.getProfessorFake(ProfessorFakeFactory.Tipo.VAZIO);
        boolean btnSalvarClicado = showOpenCadastroProfessorDialog(professor);

        if (btnSalvarClicado) {
            // System.out.println("Salvando professor no banco de dados.");

            listProfessor.add(professor);
            PersistenciaProfessor.salvarProfessor(professor);

            // Recarrega a página de cadastro de professor.
            carregaTableViewProfessor();

        }
    }

    @FXML
    public void handleButtonEditar () throws IOException, SQLException, ClassNotFoundException {
        Professor professor = tableViewProfessor.getSelectionModel().getSelectedItem();


        if (professor != null) {
            Professor professorAntigo = (Professor) professor.clone();

            boolean btnSalvarClicado = showOpenCadastroProfessorDialog(professor);

            if (btnSalvarClicado) {
                System.out.println("Alterando professor no banco de dados.");

                // Recarrega a página de cadastro de professor.

                PersistenciaProfessor.alterProfessor(professorAntigo, professor);

                observableListProfessor.clear();
                carregaTableViewProfessor();


            }
        }
        else {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setContentText("Por favor, selecione um professor.");
            alert.show();
        }

    }

    @FXML
    public void handleButtonExcluir () throws SQLException, ClassNotFoundException {
        Professor professor = tableViewProfessor.getSelectionModel().getSelectedItem();

        if (professor != null) {
            Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
            alert.setContentText("Atenção. Esse professor será deletado. Deseja mesmo fazer isso?");
            alert.showAndWait();

            if (alert.getResult() == ButtonType.OK) {
                System.out.println("Deletando professor no banco de dados.");

                listProfessor.remove(professor);
                PersistenciaProfessor.deleteProfessor(professor);


                // Recarrega a página de cadastro de professor.
                carregaTableViewProfessor();
            }
        }
        else {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setContentText("Por favor, selecione um professor.");
            alert.show();
        }
    }

    public boolean showOpenCadastroProfessorDialog(Professor professor) throws IOException {

        FXMLLoader fxmlLoader = new FXMLLoader(ControllerProfessorDialogInsercao.class.getClassLoader().getResource("insercao_professor.fxml"));

        AnchorPane paginaDialogoCadastro = fxmlLoader.load();

        // Cria um Estágio de Diálogo.
        Stage dialogStage = new Stage();
        dialogStage.setTitle("Cadastro de Cliente");
        Scene scene = new Scene(paginaDialogoCadastro);
        dialogStage.setScene(scene);

        // Seta a caixa de dialogo no controller e o professor.
        ControllerProfessorDialogInsercao controller = fxmlLoader.getController();
        controller.setDialogStage(dialogStage);
        controller.setProfessor(professor);

        // Mostra a tela de dialogo que foi toda carregada e espera ser fechada.
        dialogStage.showAndWait();

        return controller.isBtnSalvarClicado();

    }


}
