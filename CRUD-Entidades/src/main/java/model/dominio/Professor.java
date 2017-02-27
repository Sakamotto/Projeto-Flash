package model.dominio;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@XStreamAlias("Professor")
@Entity(name = "professor")
public class Professor implements Cloneable {

    @Id
    @GeneratedValue
    @Column(name = "professor_id")
    private Long id;

    @Column(name = "nome")
    private String nome;

    @Column(name = "email")
    private String email;

    @Column(name = "data_nascimento")
    private String dataNascimento;

    @Column(name = "rg")
    private String rg;

    @Column(name = "cpf")
    private String cpf;

    @Column(name = "matricula")
    private String matricula;

    @ManyToMany()
    @JoinTable(
            name = "professor_disciplina",
            joinColumns = @JoinColumn(name = "professor_id", referencedColumnName = "professor_id"),
            inverseJoinColumns = @JoinColumn(name = "disciplina_id", referencedColumnName = "disciplina_id")
    )
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
        cpf = "";
        email = "";
        dataNascimento = "";
        rg = "";
    }

    public Professor(String nome, String cpf) {
        this.nome = nome;
        matricula = "";
        this.cpf = "";
        setCpf(cpf, false);
        email = "";
        dataNascimento = "";
        rg = "";
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
        return cpf;
    }

    public String getDecoratedCpf() {
       return cpf;
    }

    public void setCpf(String cpf, boolean validar) {
        this.cpf = cpf;
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
