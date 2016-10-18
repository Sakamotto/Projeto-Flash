package domain;

import java.io.Serializable;

/**
 * Created by danilo on 15/10/16.
 */
public class HorarioBuilder {

    Horario horario;

    public HorarioBuilder(int id) {
        horario = new Horario(id);
    }

    public HorarioBuilder addDiaSemana( Horario.DiaSemana diaSemana) {
        horario.setDiaSemana(diaSemana);
        return this;
    }

    public HorarioBuilder addHorarioInicio( int inicio, int fim ) {
        horario.setHorarioInicio(inicio, fim);

        return this;
    }

    public HorarioBuilder addHorarioFim( int inicio, int fim ) {
        horario.setHorarioFim(inicio, fim);

        return this;
    }

    public Horario getHorario() {
        return horario;
    }
}
