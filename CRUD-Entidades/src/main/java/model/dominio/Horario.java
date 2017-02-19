package model.dominio;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import javax.persistence.*;

/**
 * Created by cristian on 29/11/16.
 */

@XStreamAlias("Horario")
@Entity
@Table(name = "horario", schema = "flash")
public class Horario {

    public enum DiaSemana {

        DOMINGO(1), SEGUNDA(2), TERCA(3), QUARTA(4), QUINTA(5), SEXTA(6), SABADO(7);
        private int valor;

        DiaSemana(int valor){
            this.valor = valor;
        }

        public int getValor() {
            return valor;
        }

        public void setValor(int valor) {
            this.valor = valor;
        }
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "horario_id")
    private int id;

    @Column(name = "hora_inicio")
    private int horaInicio;

    @Column(name = "minuto_inicio")
    private int minutoInicio;

    @Column(name = "hora_fim")
    private int horaFim;

    @Column(name = "minuto_fim")
    private int minutoFim;

    @Transient
    private DiaSemana diaSemana;

    public Horario(){
        horaInicio = 0;
        minutoInicio = 0;
        horaFim = 0;
        minutoFim = 0;
    }

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
                return "Segunda-Feira";
            case TERCA:
                return "Terça-Feira";
            case QUARTA:
                return "Quarta-Feira";
            case QUINTA:
                return "Quinta-Feira";
            case SEXTA:
                return "Sexta-Feira";
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

    private String getStrHorario(int hour, int minute) {
        return hour + ":" + ( (minute < 10) ? "0" + minute : minute );
    }

    private String getHorario() {
        return toString();
    }

    @Override
    public String toString() {
        return getStrDiaSemana() + ", " + getHorarioInicio() + "-" + getHorarioFim();
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
        } else if (o instanceof Horario) {
            Horario other = (Horario) o;
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
