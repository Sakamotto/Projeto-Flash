package domain;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import java.io.Serializable;

/**
 * Created by danilo on 01/10/16.
 */
public class Professor {
    private String nome;
    private String cpf;
    private Endereco endereco;

    public Professor(){}


    public Professor(String nome, String cpf) {
        this.nome = nome;
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder()
                .append(nome)
                .append(cpf)
                .toHashCode();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        } else if (o instanceof Professor) {
            Professor other = (Professor) o;
            return new EqualsBuilder()
                    .append(nome, other.getNome())
                    .append(cpf, other.getCpf())
                    .isEquals();
        } else {
            return false;
        }
    }
}
