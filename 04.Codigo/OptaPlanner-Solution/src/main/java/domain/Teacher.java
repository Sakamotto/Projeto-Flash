package domain;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import model.dominio.Professor;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * Created by danilo on 01/10/16.
 */

@XStreamAlias("Teacher")
public class Teacher extends Professor {

    private String cpf;

    public Teacher(){}

    public Teacher(String nome, String cpf) {
        setNome(nome);
        setCpf(cpf, false);

        this.cpf = cpf;
    }

    @Override
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        setCpf(cpf, false);
        this.cpf = cpf;
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder()
                .append(getNome())
                .append(getCpf())
                .toHashCode();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        } else if (o instanceof Teacher) {
            Teacher other = (Teacher) o;
            return new EqualsBuilder()
                    .append(getNome(), other.getNome())
                    .append(getCpf(), other.getCpf())
                    .isEquals();
        } else {
            return false;
        }
    }
}
