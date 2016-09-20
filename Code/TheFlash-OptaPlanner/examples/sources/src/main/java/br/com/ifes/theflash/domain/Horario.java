package br.com.ifes.theflash.domain;

/**
 * Created by cristian on 20/09/16.
 */
public class Horario {

    private String horaEntrada;
    private String horaSaida;
    private DiasDaSemana dia;


    public String getHoraEntrada() {
        return horaEntrada;
    }

    public void setHoraEntrada(String horaEntrada) {
        this.horaEntrada = horaEntrada;
    }

    public String getHoraSaida() {
        return horaSaida;
    }

    public void setHoraSaida(String horaSaida) {
        this.horaSaida = horaSaida;
    }

    public DiasDaSemana getDia() {
        return dia;
    }

    public void setDia(DiasDaSemana dia) {
        this.dia = dia;
    }
}
