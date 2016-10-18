package domain;

import java.io.Serializable;

/**
 * Created by danilo on 01/10/16.
 */
public class Professor {
    private String nome;
    private int cpf;
    private Endereco endereco;

    public Professor(){}


    public Professor(String nome, int cpf) {
        this.nome = nome;
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getCpf() {
        return cpf;
    }

    public void setCpf(int cpf) {
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
        return Integer.hashCode(this.cpf);
    }

    @Override
    public boolean equals(Object object) {
        if (object == null)
            return false;
        else
            return this.cpf == ( (Professor) object ).getCpf();
    }
}
