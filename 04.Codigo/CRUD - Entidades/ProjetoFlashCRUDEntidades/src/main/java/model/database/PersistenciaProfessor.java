package model.database;

import model.dominio.Endereco;
import model.dominio.Professor;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by danilo on 26/09/16.
 */
public class PersistenciaProfessor {

    public static boolean salvarProfessor(Professor professor) {
        Connection con;
        Statement stm = null;
        boolean professorSalvoSucesso;

        try {
            con = Conexao.getConexao();
            stm = con.createStatement();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        String valueEndereco = "('";
        String valueProfessor = "('";
        String enderecoID;
        ResultSet rs;

        valueEndereco += professor.getEndereco().getNumero() + "','";
        valueEndereco += professor.getEndereco().getEndereco() + "','";
        valueEndereco += professor.getEndereco().getBairro() + "','";
        valueEndereco += professor.getEndereco().getMunicipio() + "','";
        valueEndereco += professor.getEndereco().getCep() + "')";



        try {
            stm.execute("INSERT INTO flash.endereco (numero, endereco, bairro, municipio, cep) VALUES " + valueEndereco + ";");

            rs = stm.executeQuery("SELECT MAX(endereco_id) FROM flash.endereco;");

            rs.next();

            enderecoID = rs.getString("max");
            System.out.println(enderecoID);

            valueProfessor += professor.getNome() + "','";
            valueProfessor += professor.getEmail() + "','";
            valueProfessor += professor.getDataNascimento() + "','";
            valueProfessor += professor.getRg() + "','";
            valueProfessor += professor.getCpf() + "','";
            valueProfessor += professor.getMatricula() + "','";
            valueProfessor += enderecoID + "')";

            stm.execute("INSERT INTO flash.professor (nome, email, data_nascimento, rg, cpf, matricula,  endereco_id) VALUES " + valueProfessor + ";");

            professorSalvoSucesso = true;
        } catch (SQLException e) {
            professorSalvoSucesso = false;
        }

        return professorSalvoSucesso;
    }

    public static ArrayList<Professor> getProfessores() throws SQLException, ClassNotFoundException {
        ArrayList<Professor> professores = new ArrayList<Professor>();
        Connection con = Conexao.getConexao();
        Statement stm = con.createStatement();
        ResultSet rs;

        rs = stm.executeQuery("" +
                "SELECT " +
                "professor.nome AS NOME, " +
                "professor.email AS EMAIL, " +
                "professor.data_nascimento AS DATA_NASCIMENTO, " +
                "professor.rg AS RG, " +
                "professor.cpf AS CPF, " +
                "professor.matricula AS MATRICULA, " +
                "endereco.numero AS NUMERO, " +
                "endereco.endereco AS ENDERECO, " +
                "endereco.bairro AS BAIRRO, " +
                "endereco.municipio AS MUNICIPIO, " +
                "endereco.cep AS CEP " +
                "FROM flash.professor AS professor " +
                "INNER JOIN flash.endereco AS endereco " +
                "ON professor.endereco_id = endereco.endereco_id;");

        while (rs.next()) {
            Professor professor = new Professor();
            Endereco endereco = new Endereco();

            professor.setNome(rs.getString("NOME"));
            professor.setEmail(rs.getString("EMAIL"));
            professor.setDataNascimento(rs.getString("DATA_NASCIMENTO"));
            professor.setRg(rs.getString("RG"));
            professor.setCpf(rs.getString("CPF"), false);
            professor.setMatricula(rs.getString("MATRICULA"));

            endereco.setNumero(rs.getString("NUMERO"));
            endereco.setEndereco(rs.getString("ENDERECO"));
            endereco.setBairro(rs.getString("BAIRRO"));
            endereco.setMunicipio(rs.getString("MUNICIPIO"));
            endereco.setCep(rs.getString("CEP"));

            professor.setEndereco(endereco);

            professores.add(professor);

        }

        return professores;

    }

    public static void deleteProfessor(Professor professor) throws SQLException, ClassNotFoundException {
        Connection con = Conexao.getConexao();
        Statement stm = con.createStatement();

        stm.executeUpdate("DELETE FROM flash.endereco " +
                          "USING flash.professor " +
                          "WHERE endereco.endereco_id = professor.endereco_id " +
                          "AND professor.cpf = '" + professor.getCpf() + "';");

        stm.executeUpdate("DELETE FROM flash.professor WHERE professor.cpf='" + professor.getCpf() + "';");
    }

    public static void alterProfessor(Professor professorAntigo, Professor professorNovo) throws SQLException, ClassNotFoundException {
        Connection con = Conexao.getConexao();
        Statement stm = con.createStatement();

        stm.executeUpdate("UPDATE flash.endereco SET " +
                          "numero='" + professorNovo.getEndereco().getNumero() + "', " +
                          "endereco='" + professorNovo.getEndereco().getEndereco() + "', " +
                          "bairro='" + professorNovo.getEndereco().getBairro() + "', " +
                          "municipio='" + professorNovo.getEndereco().getMunicipio() + "', " +
                          "cep='" + professorNovo.getEndereco().getCep() + "' " +
                          "WHERE endereco_id = " +
                          "(SELECT professor.endereco_id FROM flash.professor WHERE professor.cpf = '" + professorAntigo.getCpf() + "');");

        stm.executeUpdate("UPDATE flash.professor SET " +
                          "nome='" + professorNovo.getNome() + "', " +
                          "email='" + professorNovo.getEmail() + "', " +
                          "data_nascimento='" + professorNovo.getDataNascimento() + "', " +
                          "rg='" + professorNovo.getRg() + "', " +
                          "cpf='" + professorNovo.getCpf() + "', " +
                          "matricula='" + professorNovo.getMatricula() + "' " +
                          "WHERE professor.cpf='" + professorAntigo.getCpf() + "';");


    }


}
