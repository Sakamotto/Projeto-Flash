package model.DAO.horario;

import model.DAO.GenericDAOImpl;
import model.dominio.DiaSemana;
import model.dominio.Horario;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by cristian on 29/11/16.
 */
public class HorarioDAOImpl extends GenericDAOImpl<Horario> implements HorarioDAO{

    @Override
    public List<Horario> listarHorariosCompletos() {
        List<DiaSemana> diaSemanas = new ArrayList<>();
        List<Horario> horariosBanco = super.listar(Horario.class);
        List<Horario> horarios = new ArrayList<>();

        diaSemanas.add(DiaSemana.SEGUNDA);
        diaSemanas.add(DiaSemana.TERCA);
        diaSemanas.add(DiaSemana.QUARTA);
        diaSemanas.add(DiaSemana.QUINTA);
        diaSemanas.add(DiaSemana.SEXTA);



        for (DiaSemana diaSemana : diaSemanas) {
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

    @Override
    public boolean validarHorario(Horario horarioParam) {

        List<Horario> horarios = listar(Horario.class);
        int horarioParamInicioEmMinutos = (horarioParam.getHoraInicio() * 60) + horarioParam.getMinutoInicio();
        int horarioParamFimEmMinutos = (horarioParam.getHoraFim() * 60) + horarioParam.getMinutoFim();

        for (Horario horario : horarios) {

            if (horario.getDiaSemana() == horarioParam.getDiaSemana()) {
                int horarioInicioEmMinutos = (horario.getHoraInicio() * 60) + horario.getMinutoInicio();
                int horarioFimEmMinutos = (horario.getHoraFim() * 60) + horario.getMinutoFim();

                if (horarioParamInicioEmMinutos >= horarioInicioEmMinutos && horarioParamInicioEmMinutos <= horarioFimEmMinutos
                        || horarioParamFimEmMinutos >= horarioInicioEmMinutos && horarioParamFimEmMinutos <= horarioFimEmMinutos) {
                    return false;
                }
            }
        }

        return true;
    }
}
