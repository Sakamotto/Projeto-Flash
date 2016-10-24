package model.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by danilo on 24/10/16.
 */
public class PersistenciaAreaConhecimento {

    protected static String getOne(int areaConhecimentoId) throws SQLException, ClassNotFoundException {
        return getAreaConhecimento("WHERE area_conhecimento.area_conhecimento_id = '" + areaConhecimentoId +"';").get(0);
    }

    public static ArrayList<String> get() throws SQLException, ClassNotFoundException {
        return getAreaConhecimento(";");
    }

    private static ArrayList<String> getAreaConhecimento(String adicional) throws SQLException, ClassNotFoundException {
        ArrayList<String> areaConhecimentos = new ArrayList<>();
        Connection connection = Conexao.getConexao();
        Statement statement = connection.createStatement();
        String query;
        ResultSet set;

        query  = "SELECT ";
        query += "area_conhecimento.descricao AS NOME ";
        query += "FROM flash.area_conhecimento AS area_conhecimento ";
        query +=  adicional;

        set = statement.executeQuery(query);

        while (set.next()) {
            areaConhecimentos.add(set.getString("NOME"));
        }

        return areaConhecimentos;
    }

    public static int getIdByName(String descricao) throws SQLException, ClassNotFoundException {
        Connection connection = Conexao.getConexao();
        Statement statement = connection.createStatement();
        String query;
        ResultSet set;

        query  = "SELECT ";
        query += "area_conhecimento.area_conhecimento_id AS ID ";
        query += "FROM flash.area_conhecimento AS area_conhecimento ";
        query +=  "WHERE area_conhecimento.descricao = '" + descricao + "';";

        set = statement.executeQuery(query);

        set.next();

        return Integer.parseInt(set.getString("ID"));
    }
}
