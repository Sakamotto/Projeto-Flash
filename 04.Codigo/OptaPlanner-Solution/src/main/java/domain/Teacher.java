package domain;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * Created by danilo on 01/10/16.
 */

@XStreamAlias("Teacher")
public class Teacher {
    private String name;
    private String cpf;
    private Address address;

    public Teacher(){}


    public Teacher(String name, String cpf) {
        this.name = name;
        this.cpf = cpf;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder()
                .append(name)
                .append(cpf)
                .toHashCode();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        } else if (o instanceof Teacher) {
            Teacher other = (Teacher) o;
            return new EqualsBuilder()
                    .append(name, other.getName())
                    .append(cpf, other.getCpf())
                    .isEquals();
        } else {
            return false;
        }
    }
}
