package domain;

import java.util.HashMap;

/**
 * Created by danilo on 01/10/16.
 */
public class PreRequisite {
    private HashMap<String, Subject> subjectsPreRequisite;

    public Subject getSubjectPreRequisite(String string) {
        return subjectsPreRequisite.get(string);
    }

    public void setPreRequisite(String string, Subject subject) {
        subjectsPreRequisite.put(string, subject);
    }
}
