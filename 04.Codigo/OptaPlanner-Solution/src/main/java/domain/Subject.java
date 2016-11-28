package domain;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import model.dominio.Disciplina;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import java.util.List;


@XStreamAlias("Subject")
public class Subject extends Disciplina {

    private int period;
    private int workLoad;
    private List<String> preRequisite;

    public Subject() {}

    public Subject(String nome, int period, int workLoad) {
        setNome(nome);
        setPeriodo(period);
        setCargaHoraria(workLoad);

        this.period = period;
        this.workLoad = workLoad;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public int getWorkLoad() {
        return workLoad;
    }

    public void setWorkLoad(int workLoad) {
        this.workLoad = workLoad;
    }

    public List<String> getPreRequisite() {
        return preRequisite;
    }

    public void setPreRequisite(List<String> preRequisite) {
        this.preRequisite = preRequisite;
    }

    public int hashCode() {
        return new HashCodeBuilder()
                .append(getNome())
                .append(period)
                .append(workLoad)
                .toHashCode();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        } else if (o instanceof Subject) {
            Subject other = (Subject) o;
            return new EqualsBuilder()
                    .append(getNome(), other.getNome())
                    .append(period, other.getPeriod())
                    .append(workLoad, other.getWorkLoad())
                    .isEquals();
        } else {
            return false;
        }
    }
}
