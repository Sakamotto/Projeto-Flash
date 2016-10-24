package model.database;

import model.dominio.Curso;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by danilo on 24/10/16.
 */
public class PersistenciaCurso {

    protected static Curso getOne(int cursoId) throws SQLException, ClassNotFoundException {
        return getCursos("WHERE curso.curso_id = '" + cursoId +"';").get(0);
    }

    public static ArrayList<Curso> get() throws SQLException, ClassNotFoundException {
        return getCursos(";");
    }

    private static ArrayList<Curso> getCursos(String adicional) throws SQLException, ClassNotFoundException {
        ArrayList<Curso> cursos = new ArrayList<>();
        Connection connection = Conexao.getConexao();
        Statement statement = connection.createStatement();
        String query;
        ResultSet set;

        query  = "SELECT ";
        query += "curso.nome AS NOME_CURSO, ";
        query += "curso.regime AS REGIME_CURSO, ";
        query += "curso.duracao AS DURACAO_CURSO, ";
        query += "curso.sigla AS SIGLA_CURSO ";
        query += "FROM flash.curso AS curso ";
        query +=  adicional;

        set = statement.executeQuery(query);

        while (set.next()) {
            Curso curso = new Curso();

            curso.setNome(set.getString("NOME_CURSO"));
            curso.setRegime(set.getString("REGIME_CURSO"));
            curso.setDuracao(Integer.parseInt(set.getString("DURACAO_CURSO")));
            curso.setSigla(set.getString("SIGLA_CURSO"));

            cursos.add(curso);
        }

        return cursos;
    }

    public static int getIdByName(String nome) throws SQLException, ClassNotFoundException {
        Connection connection = Conexao.getConexao();
        Statement statement = connection.createStatement();
        String query;
        ResultSet set;

        query  = "SELECT ";
        query += "curso.curso_id AS ID_CURSO ";
        query += "FROM flash.curso AS curso ";
        query +=  "WHERE curso.nome = '" + nome + "';";

        set = statement.executeQuery(query);

        set.next();

        return Integer.parseInt(set.getString("ID_CURSO"));
    }
}
