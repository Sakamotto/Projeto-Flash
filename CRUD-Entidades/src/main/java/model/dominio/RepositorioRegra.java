package model.dominio;

import model.DAO.regra.RegraDAOImpl;

import java.util.List;

/**
 * Created by danilo on 01/04/17.
 */
public class RepositorioRegra {
    private static List<Regra> regras;

    public static Regra getRegraById(int id) {

        if (regras == null) {
            regras = new RegraDAOImpl().listar(Regra.class);
        }

        for (Regra regra: regras) {
            if (regra.getId() == id) {
                return regra;
            }
        }

        throw new IllegalArgumentException("Erro: Não existe uma regra com esse id.");

    }
}
