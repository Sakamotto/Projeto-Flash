package model.dominio;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import model.dominio.solver.Turno;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import javax.persistence.*;

/**
 * Created by cristian on 29/11/16.
 */

@XStreamAlias("Horario")
@Entity
@Table(name = "horario")
public class Horario {

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

    @Column(name = "dia_semana")
    private DiaSemana diaSemana;

    @Column(name = "turno")
    private Turno turno;

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
        return diaSemana.toString();
    }

    public Turno getTurno() {
        return turno;
    }

    public void setTurno(Turno turno) {
        this.turno = turno;
    }

    public String getStrTurno() {
        return turno.toString();
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
