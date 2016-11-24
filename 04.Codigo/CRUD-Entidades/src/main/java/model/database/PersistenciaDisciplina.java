package model.database;

import model.dominio.Curso;
import model.dominio.Disciplina;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by danilo on 24/10/16.
 */
public class PersistenciaDisciplina {

    public static ArrayList<Disciplina> get() throws SQLException, ClassNotFoundException {
        ArrayList<Disciplina> disciplinas = new ArrayList<>();
        Connection connection = Conexao.getConexao();
        Statement statement = connection.createStatement();
        String query;
        ResultSet set;

        query  = "SELECT ";
        query += "disciplina.nome AS NOME, ";
        query += "disciplina.carga_horaria AS CARGA_HORARIA, ";
        query += "disciplina.periodo AS PERIODO, ";
        query += "disciplina.curso_id AS ID_CURSO, ";
        query += "area_conhecimento.descricao AS NOME_AREA_CONHECIMENTO ";
        query += "FROM flash.disciplina AS disciplina ";
        query += "INNER JOIN flash.area_conhecimento ";
        query += "ON disciplina.area_conhecimento_id = area_conhecimento.area_conhecimento_id;";

        set = statement.executeQuery(query);

        while (set.next()) {
            Disciplina disciplina = new Disciplina();
            Curso curso = PersistenciaCurso.getOne(Integer.parseInt(set.getString("ID_CURSO")));

            disciplina.setNome(set.getString("NOME"));
            disciplina.setCargaHoraria(set.getString("CARGA_HORARIA"));
            disciplina.setPeriodo(set.getString("PERIODO"));
            disciplina.setCurso(curso);
            disciplina.setAreaConhecimento(set.getString("NOME_AREA_CONHECIMENTO"));

            disciplinas.add(disciplina);
        }

        return disciplinas;
    }

    public static void save(Disciplina disciplina) throws SQLException, ClassNotFoundException {
        Connection connection = Conexao.getConexao();
        Statement statement = connection.createStatement();
        String insert = "INSERT INTO" +
                " flash.disciplina (nome, carga_horaria, periodo, curso_id, area_conhecimento_id) " +
                "VALUES ('";

        insert += disciplina.getNome() + "', ";
        insert += disciplina.getCargaHoraria() + ", ";
        insert += disciplina.getPeriodo() + ", ";
        insert += PersistenciaCurso.getIdByName( disciplina.getCurso().getNome() ) + ", ";
        insert += PersistenciaAreaConhecimento.getIdByName( disciplina.getAreaConhecimento() );

        insert += ");";

        statement.execute(insert);
    }

    public static void update(Disciplina antiga, Disciplina nova) throws SQLException, ClassNotFoundException {
        Connection connection = Conexao.getConexao();
        Statement statement = connection.createStatement();

        String update = "UPDATE flash.disciplina SET nome = '" + nova.getNome() + "' WHERE nome = '" + antiga.getNome() + "'; " +
                "UPDATE flash.disciplina SET carga_horaria = " + nova.getCargaHoraria() + " WHERE nome = '" + antiga.getNome() + "'; " +
                "UPDATE flash.disciplina SET periodo = " + nova.getPeriodo() + " WHERE nome = '" + antiga.getNome() + "'; " +
                "UPDATE flash.disciplina SET curso_id = " + PersistenciaCurso.getIdByName(nova.getCurso().getNome()) + " WHERE nome = '" + antiga.getNome() + "'; " +
                "UPDATE flash.disciplina SET area_conhecimento_id = " + PersistenciaAreaConhecimento.getIdByName(nova.getAreaConhecimento()) + " WHERE nome = '" + antiga.getNome() + "'; ";

        statement.execute(update);

    }

    public static void delete(Disciplina disciplina) throws SQLException, ClassNotFoundException {
        Connection connection = Conexao.getConexao();
        Statement statement = connection.createStatement();
        String delete = "DELETE FROM flash.disciplina WHERE disciplina.nome = '" + disciplina.getNome() + "';";

        statement.execute(delete);
    }
}
