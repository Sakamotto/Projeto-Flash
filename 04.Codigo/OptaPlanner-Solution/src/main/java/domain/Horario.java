package domain;

/**
 * Created by danilo on 01/10/16.
 */


public class Horario {

    public enum DiaSemana {DOMINGO, SEGUNDA, TERCA, QUARTA, QUINTA, SEXTA, SABADO}

    private int horaInicio, minutoInicio;
    private int horaFim, minutoFim;

    private DiaSemana diaSemana;

    public Horario() {}


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
    public boolean equals(Object object) {
        if (object == null)
            return false;
        else {
            Horario horario = (Horario) object;

            if ( !this.getHorarioInicio().equalsIgnoreCase( horario.getHorarioInicio() ) )
                return false;

            else if ( !this.getHorarioFim().equalsIgnoreCase( horario.getHorarioFim() ) )
                return false;

            else return this.getDiaSemana() == horario.getDiaSemana();
        }
    }




}
