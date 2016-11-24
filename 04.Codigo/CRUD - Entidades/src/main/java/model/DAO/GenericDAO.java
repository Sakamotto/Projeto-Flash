package model.DAO;

import java.util.List;

/**
 * Created by Danilo de Oliveira on 13/11/16.
 */
public interface GenericDAO<T> {

    List<T> listar(Class clazz);

    T recuperar(Class clazz, Long id);

    void deletar(T object);
    void alterar(T object);
    void inserir(T object);
}
