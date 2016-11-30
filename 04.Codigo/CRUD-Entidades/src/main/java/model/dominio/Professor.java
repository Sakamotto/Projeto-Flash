package model.dominio;


import com.thoughtworks.xstream.annotations.XStreamAlias;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@XStreamAlias("Professor")
public class Professor implements Cloneable {

    private Long id;

    private String nome;
    private String email;
    private String dataNascimento;
    private String rg;
    private Cpf cpf;
    private String matricula;
    private Endereco endereco;
    private Set<Disciplina> disciplinas = new HashSet<>();


    public Set<Disciplina> getDisciplinas() {
        return disciplinas;
    }

    public void setDisciplinas(Set<Disciplina> disciplinas) {
        this.disciplinas = disciplinas;
    }


    public Professor() {
        nome = "";
        matricula = "";
        cpf = new Cpf();
        email = "";
        dataNascimento = "";
        rg = "";

        endereco = new Endereco();
    }

    public Professor(String nome, String cpf) {
        this.nome = nome;
        matricula = "";
        this.cpf = new Cpf();
        setCpf(cpf, false);
        email = "";
        dataNascimento = "";
        rg = "";

        endereco = new Endereco();
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(String dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getCpf() {
        return cpf.getCpf();
    }

    public String getDecoratedCpf() {
       return cpf.cpfFormated();
    }

    public void setCpf(String cpf, boolean validar) {
        this.cpf.setCpf(cpf, validar);
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public Object clone() {
        Object obj = null;

        try {
            obj = super.clone();

            ( (Professor) obj).setEndereco( (Endereco) this.getEndereco().clone() );

        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }

        return obj;
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
        } else if (o instanceof Professor) {
            Professor other = (Professor) o;
            return new EqualsBuilder()
                    .append(getNome(), other.getNome())
                    .append(getCpf(), other.getCpf())
                    .isEquals();
        } else {
            return false;
        }
    }

}
