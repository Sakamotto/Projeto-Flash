package domain;

import java.io.Serializable;
import java.util.HashMap;

/**
 * Created by danilo on 01/10/16.
 */
public class PreRequisito {
    private HashMap<String, Disciplina> disciplinasRequisito;

    public Disciplina getDisciplinaRequisito(String string) {
        return disciplinasRequisito.get(string);
    }

    public void setRequisito(String string, Disciplina disciplina) {
        disciplinasRequisito.put(string, disciplina);
    }
}
