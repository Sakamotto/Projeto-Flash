package domain;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import model.dominio.Horario;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * Created by danilo on 01/10/16.
 */


@XStreamAlias("Schedule")
public class Schedule extends Horario {

    public Schedule(int idParam) {
        super(idParam);
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder()
                .append(getId())
                .append(getDiaSemana())
                .append(getHorarioInicio())
                .append(getHorarioFim())
                .toHashCode();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        } else if (o instanceof Schedule) {
            Schedule other = (Schedule) o;
            return new EqualsBuilder()
                    .append(getDiaSemana(), other.getDiaSemana())
                    .append(getHorarioInicio(), other.getHorarioInicio())
                    .append(getHorarioFim(), other.getHorarioFim())
                    .isEquals();
        } else {
            return false;
        }
    }

}
