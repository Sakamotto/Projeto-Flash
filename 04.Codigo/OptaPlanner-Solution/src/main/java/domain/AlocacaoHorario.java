package domain;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamConverter;
import model.dominio.Alocacao;
import model.dominio.Horario;
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
    private HardMediumSoftScore score = HardMediumSoftScore.valueOf(0, 0, 0);


    private List<Alocacao> alocacoes;
    private List<Horario> horarios;

    AlocacaoHorario(){}

    public AlocacaoHorario(List<Alocacao> alocacoes, List<Horario> horarios) {
        this.alocacoes = alocacoes;
        this.horarios = horarios;
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

        facts.addAll(horarios);

        return facts;
    }


    @PlanningEntityCollectionProperty
    public List<Alocacao> getAlocacoes() {
        return alocacoes;
    }

    @ValueRangeProvider(id = "Horario")
    public List<Horario> getHorarios() {
        return horarios;
    }
}
