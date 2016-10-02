import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamImplicit;
import domain.Alocacao;
import domain.Disciplina;
import domain.Horario;
import org.optaplanner.core.api.domain.solution.PlanningEntityCollectionProperty;
import org.optaplanner.core.api.domain.solution.PlanningSolution;
import org.optaplanner.core.api.domain.solution.Solution;
import org.optaplanner.core.api.domain.valuerange.ValueRangeProvider;
import org.optaplanner.core.api.score.buildin.hardmediumsoft.HardMediumSoftScore;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


@PlanningSolution
@XStreamAlias("alocacaoHorarios")
public class AlocacaoHorario implements Solution<HardMediumSoftScore>{


    private HardMediumSoftScore score;

    @XStreamImplicit(itemFieldName = "alocacao")
    private List<Alocacao> alocacoes;

    @XStreamImplicit(itemFieldName = "horario")
    private List<Horario> horarios;

    public AlocacaoHorario(){}

    public AlocacaoHorario(List<Alocacao> alocacoes, List<Horario> horarios) {
        this.alocacoes = alocacoes;
        this.horarios = horarios;
    }

    @Override
    public HardMediumSoftScore getScore() {
        return this.score;
    }

    @Override
    public void setScore(HardMediumSoftScore hardMediumSoftScore) {
        this.score = hardMediumSoftScore;
    }

    @Override
    public Collection<?> getProblemFacts() {
        List<Object> facts = new ArrayList<>();

        facts.addAll(this.horarios);

        return facts;
    }


    @PlanningEntityCollectionProperty
    public List<Alocacao> getAlocacoes() {
        return alocacoes;
    }

    @ValueRangeProvider(id = "horarios")
    public List<Horario> getHorarios() {
        return horarios;
    }
}
