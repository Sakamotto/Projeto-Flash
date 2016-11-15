package domain;


import com.thoughtworks.xstream.annotations.XStreamAlias;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.optaplanner.core.api.domain.entity.PlanningEntity;
import org.optaplanner.core.api.domain.variable.PlanningVariable;

@PlanningEntity
@XStreamAlias("Alocacao")
public class Alocacao {

    private Horario horario;
    private Disciplina disciplina;
    private Professor professor;



    public Alocacao() {}

    public Alocacao(Disciplina disciplinaParam) {
        disciplina = disciplinaParam;
    }


    @PlanningVariable(valueRangeProviderRefs = {"horario"})
    public Horario getHorario() {
        return horario;
    }

    public void setHorario(Horario horario) {
        this.horario = horario;
    }

    public Disciplina getDisciplina() {
        return disciplina;
    }

    public void setDisciplina(Disciplina disciplina) {
        this.disciplina = disciplina;
    }

    public Professor getProfessor() {
        return professor;
    }

    public void setProfessor(Professor professor) {
        this.professor = professor;
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder()
                .append(disciplina)
                .append(professor)
                .toHashCode();
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        } else if (o instanceof Alocacao) {
            Alocacao other = (Alocacao) o;
            return new EqualsBuilder()
                    .append(disciplina, other.getDisciplina())
                    .append(professor, other.getProfessor())
                    .isEquals();
        } else {
            return false;
        }
    }
}
