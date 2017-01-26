package domain;

import model.dominio.Horario;

/**
 * Created by danilo on 15/10/16.
 */
public class ScheduleBuilder {

    private Horario schedule;

    public ScheduleBuilder(int id) {
        schedule = new Horario(id);
    }

    public ScheduleBuilder addDiaSemana(Horario.DiaSemana diaSemana) {
        schedule.setDiaSemana(diaSemana);
        return this;
    }

    public ScheduleBuilder addHorarioInicio(int init, int finish) {
        schedule.setHorarioInicio(init, finish);

        return this;
    }

    public ScheduleBuilder addHorarioFim(int init, int finish) {
        schedule.setHorarioFim(init, finish);

        return this;
    }

    public Horario getHorario() {
        return schedule;
    }
}
