package domain;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import java.util.List;


@XStreamAlias("Subject")
public class Subject {

    private String name;
    private int period;
    private int workLoad;
    private List<String> preRequisite;

    public Subject() {}

    public Subject(String name, int period, int workLoad) {
        this.name = name;
        this.period = period;
        this.workLoad = workLoad;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
                .append(name)
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
                    .append(name, other.getName())
                    .append(period, other.getPeriod())
                    .append(workLoad, other.getWorkLoad())
                    .isEquals();
        } else {
            return false;
        }
    }
}
