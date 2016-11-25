package domain;

import java.util.HashMap;

/**
 * Created by danilo on 01/10/16.
 */
public class PreRequisito {
    private HashMap<String, Subject> disciplinasRequisito;

    public Subject getDisciplinaRequisito(String string) {
        return disciplinasRequisito.get(string);
    }

    public void setRequisito(String string, Subject subject) {
        disciplinasRequisito.put(string, subject);
    }
}
