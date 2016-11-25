package application;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamConverter;
import domain.Alocacao;
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
@XStreamAlias("AlocacaoHorario")
public class AlocacaoHorario implements Solution<HardMediumSoftScore> {


    @XStreamConverter(value = XStreamScoreConverter.class, types = {HardMediumSoftScoreDefinition.class})
    private HardMediumSoftScore score;

    private List<Alocacao> alocacoes;
    private List<Schedule> schedules;

    AlocacaoHorario(){}

    public AlocacaoHorario(List<Alocacao> alocacoes, List<Schedule> schedules) {
        this.alocacoes = alocacoes;
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
    public List<Alocacao> getAlocacoes() {
        return alocacoes;
    }

    @ValueRangeProvider(id = "schedule")
    public List<Schedule> getSchedules() {
        return schedules;
    }
}
