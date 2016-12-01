package model.dominio.solver;

import model.dominio.Horario;
import org.apache.commons.lang.builder.CompareToBuilder;

import java.util.Comparator;

/**
 * Created by cristian on 01/12/16.
 */
public class HorarioStrengthComparator implements Comparator<Horario> {
    @Override
    public int compare(Horario horario1, Horario horario2) {
        return new CompareToBuilder()
                .append(horario1.getHorarioInicio(), horario2.getHorarioInicio())
                .append(horario1.getHorarioFim(), horario2.getHorarioFim())
                .append(horario1.getStrDiaSemana(), horario2.getStrDiaSemana())
                .toComparison();
    }
}
