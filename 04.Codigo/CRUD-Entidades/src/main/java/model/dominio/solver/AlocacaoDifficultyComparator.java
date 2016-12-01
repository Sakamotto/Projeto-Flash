package model.dominio.solver;

import model.dominio.Alocacao;
import org.apache.commons.lang.builder.CompareToBuilder;

import java.util.Comparator;

/**
 * Created by cristian on 01/12/16.
 */
public class AlocacaoDifficultyComparator implements Comparator<Alocacao> {

    @Override
    public int compare(Alocacao alocacao1, Alocacao alocacao2) {
        return new CompareToBuilder()
                .append(alocacao1.getDisciplina().getPeriodo(), alocacao2.getDisciplina().getPeriodo())
                .toComparison();
    }
}
