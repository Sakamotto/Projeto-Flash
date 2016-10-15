package domain;

import org.apache.commons.lang.builder.HashCodeBuilder;

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
        return getStrHorario(this.horaInicio, this.minutoInicio);
    }

    public String getHorarioFim() {
        return getStrHorario(this.horaFim, this.minutoFim);
    }

    public DiaSemana getDiaSemana() {
        return this.diaSemana;
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
        return new HashCodeBuilder(98587969, 810426655).append(id).append(getHorarioInicio()).append(getHorarioFim()).toHashCode();
    }

    @Override
    public boolean equals(Object object) {
        if (object == null)
            return false;
        else {
            Horario horario = (Horario) object;
            boolean comparacaoHorarioInicio = getHorarioInicio().equalsIgnoreCase( horario.getHorarioInicio() );
            boolean comparacaoHorarioFim = getHorarioFim().equalsIgnoreCase( horario.getHorarioFim() );
            boolean comparacaoDiaSemana = getDiaSemana() == horario.getDiaSemana();;

            return comparacaoDiaSemana && comparacaoHorarioFim && comparacaoHorarioInicio;
        }
    }




}
