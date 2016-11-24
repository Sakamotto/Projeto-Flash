package model.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by danilo on 26/09/16.
 */
public class Conexao {

    private static Connection connection = null;
    private static Conexao conexao = null;

    private Conexao() throws ClassNotFoundException {
        String url = "jdbc:postgresql://localhost:5432/projetoflash";
        String user = "postgres";
        String password = "admin123";

        Class.forName("org.postgresql.Driver");

        try {
            connection = DriverManager.getConnection(url, user, password);
        }
        catch (SQLException exception) {
            exception.printStackTrace();
            System.out.println("Erro ao abrir conexao.");
        }
    }

    public static Connection getConexao() throws SQLException, ClassNotFoundException {
        if (conexao == null)
            conexao = new Conexao();

        return connection;
    }
}
