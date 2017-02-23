package model.DAO.horario;

import model.DAO.GenericDAO;
import model.dominio.Horario;

import java.util.List;

/**
 * Created by cristian on 29/11/16.
 */
public interface HorarioDAO extends GenericDAO<Horario> {

    List<Horario> listarHorariosCompletos();

    boolean validarHorario(Horario horario);
}
