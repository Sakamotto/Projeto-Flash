package model.DAO.horario;

import model.DAO.GenericDAOImpl;
import model.dominio.Horario;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by cristian on 29/11/16.
 */
public class HorarioDAOImpl extends GenericDAOImpl<Horario> implements HorarioDAO{

    @Override
    public List<Horario> listarHorariosCompletos() {
        List<Horario.DiaSemana> diaSemanas = new ArrayList<>();
        List<Horario> horariosBanco = super.listar(Horario.class);
        List<Horario> horarios = new ArrayList<>();

        diaSemanas.add(Horario.DiaSemana.SEGUNDA);
        diaSemanas.add(Horario.DiaSemana.TERCA);
        diaSemanas.add(Horario.DiaSemana.QUARTA);
        diaSemanas.add(Horario.DiaSemana.QUINTA);
        diaSemanas.add(Horario.DiaSemana.SEXTA);



        for (Horario.DiaSemana diaSemana : diaSemanas) {
            for (Horario horario : horariosBanco) {
                Horario novoHorario = new Horario();

                novoHorario.setDiaSemana(diaSemana);
                novoHorario.setHoraInicio(horario.getHoraInicio());
                novoHorario.setMinutoInicio(horario.getMinutoInicio());
                novoHorario.setHoraFim(horario.getHoraFim());
                novoHorario.setMinutoFim(horario.getMinutoFim());

                horarios.add(novoHorario);
            }
        }

        return horarios;
    }
}
