package domain;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import java.io.Serializable;

/**
 * Created by danilo on 01/10/16.
 */


@XStreamAlias("Horario")
public class Horario {

    public enum DiaSemana {DOMINGO, SEGUNDA, TERCA, QUARTA, QUINTA, SEXTA, SABADO}

    private int id;
    private int horaInicio;
    private int minutoInicio;
    private int horaFim;
    private int minutoFim;

    private DiaSemana diaSemana;

    public Horario(int idParam) {
        id = idParam;
    }


    public void setHorarioInicio(int horaInicio, int minutoInicio) {
        this.horaInicio = horaInicio;
        this.minutoInicio = minutoInicio;
    }

    public void setHorarioFim(int horaFim, int minutoFim) {
        this.horaFim = horaFim;
        this.minutoFim = minutoFim;
    }

    public void setDiaSemana(DiaSemana diaSemana) {
        this.diaSemana = diaSemana;
    }

    public String getHorarioInicio() {
        return getStrHorario(horaInicio, minutoInicio);
    }

    public String getHorarioFim() {
        return getStrHorario(horaFim, minutoFim);
    }

    public DiaSemana getDiaSemana() {
        return diaSemana;
    }


    public String getStrDiaSemana() {
        switch (diaSemana) {
            case DOMINGO:
                return "Domingo";
            case SEGUNDA:
                return "Segunda";
            case TERCA:
                return "Terça";
            case QUARTA:
                return "Quarta";
            case QUINTA:
                return "Quinta";
            case SEXTA:
                return "Sexta";
            case SABADO:
                return "Sábado";
            default:
                return "";
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(int horaInicio) {
        this.horaInicio = horaInicio;
    }

    public int getMinutoInicio() {
        return minutoInicio;
    }

    public void setMinutoInicio(int minutoInicio) {
        this.minutoInicio = minutoInicio;
    }

    public int getHoraFim() {
        return horaFim;
    }

    public void setHoraFim(int horaFim) {
        this.horaFim = horaFim;
    }

    public int getMinutoFim() {
        return minutoFim;
    }

    public void setMinutoFim(int minutoFim) {
        this.minutoFim = minutoFim;
    }

    private String getStrHorario(int hora, int minuto) {
        return hora + ":" + minuto;
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder()
                .append(id)
                .append(diaSemana)
                .append(getHorarioInicio())
                .append(getHorarioFim())
                .toHashCode();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        } else if (o instanceof Horario) {
            Horario other = (Horario) o;
            return new EqualsBuilder()
                    .append(id, other.getId())
                    .append(diaSemana, other.getDiaSemana())
                    .append(getHorarioInicio(), other.getHorarioInicio())
                    .append(getHorarioFim(), other.getHorarioFim())
                    .isEquals();
        } else {
            return false;
        }
    }

}
