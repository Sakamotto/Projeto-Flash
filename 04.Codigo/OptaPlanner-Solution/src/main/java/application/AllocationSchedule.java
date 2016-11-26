package application;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamConverter;
import domain.Allocation;
import domain.Schedule;
import org.optaplanner.core.api.domain.solution.PlanningEntityCollectionProperty;
import org.optaplanner.core.api.domain.solution.PlanningSolution;
import org.optaplanner.core.api.domain.solution.Solution;
import org.optaplanner.core.api.domain.valuerange.ValueRangeProvider;
import org.optaplanner.core.api.score.buildin.hardmediumsoft.HardMediumSoftScore;
import org.optaplanner.core.impl.score.buildin.hardmediumsoft.HardMediumSoftScoreDefinition;
import org.optaplanner.persistence.xstream.impl.score.XStreamScoreConverter;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


@PlanningSolution
@XStreamAlias("AllocationSchedule")
public class AllocationSchedule implements Solution<HardMediumSoftScore> {


    @XStreamConverter(value = XStreamScoreConverter.class, types = {HardMediumSoftScoreDefinition.class})
    private HardMediumSoftScore score;

    private List<Allocation> allocations;
    private List<Schedule> schedules;

    AllocationSchedule(){}

    public AllocationSchedule(List<Allocation> allocations, List<Schedule> schedules) {
        this.allocations = allocations;
        this.schedules = schedules;
    }

    @Override
    public HardMediumSoftScore getScore() {
        return score;
    }

    @Override
    public void setScore(HardMediumSoftScore score) {
        this.score = score;
    }

    @Override
    public Collection<? extends Object> getProblemFacts() {
        List<Object> facts = new ArrayList<>();

        facts.addAll(schedules);

        return facts;
    }


    @PlanningEntityCollectionProperty
    public List<Allocation> getAllocations() {
        return allocations;
    }

    @ValueRangeProvider(id = "Schedule")
    public List<Schedule> getSchedules() {
        return schedules;
    }
}
