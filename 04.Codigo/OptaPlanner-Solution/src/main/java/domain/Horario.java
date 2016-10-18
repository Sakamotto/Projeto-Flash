package domain;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import java.io.Serializable;

/**
 * Created by danilo on 01/10/16.
 */


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


    private String getStrHorario(int hora, int minuto) {
        return hora + ":" + minuto;
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder(1450207409, -1692382659)
                .append(id)
                .toHashCode();
    }

    @Override
    public boolean equals(final Object object) {
        boolean isEqual;

        if (object == null || !(object instanceof Horario) )
            isEqual = false;

        else {
            Horario horario = (Horario) object;

            isEqual = new EqualsBuilder()
                    .append( getHorarioInicio(), horario.getHorarioInicio() )
                    .append( getHorarioFim(), horario.getHorarioFim() )
                    .append( getStrDiaSemana(), horario.getStrDiaSemana() )
                    .isEquals();
        }

        return isEqual;
    }




}
