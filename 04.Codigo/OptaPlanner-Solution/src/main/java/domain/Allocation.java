package domain;


import com.thoughtworks.xstream.annotations.XStreamAlias;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.optaplanner.core.api.domain.entity.PlanningEntity;
import org.optaplanner.core.api.domain.variable.PlanningVariable;

@PlanningEntity
@XStreamAlias("Allocation")
public class Allocation {

    private Schedule schedule;
    private Subject subject;
    private Teacher teacher;


    public Allocation() {}

    public Allocation(Subject subject, Teacher teacher) {
        this.subject = subject;
        this.teacher = teacher;
    }

    public Allocation(Subject subjectParam) {
        subject = subjectParam;
    }


    @PlanningVariable(valueRangeProviderRefs = {"Schedule"})
    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder()
                .append(subject)
                .append(teacher)
                .toHashCode();
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        } else if (o instanceof Allocation) {
            Allocation other = (Allocation) o;
            return new EqualsBuilder()
                    .append(subject, other.getSubject())
                    .append(teacher, other.getTeacher())
                    .isEquals();
        } else {
            return false;
        }
    }
}
