package model.dominio;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by danilo on 24/10/16.
 */

@XStreamAlias("Disciplina")
@Entity
@Table(name = "disciplina")
public class Disciplina implements Cloneable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "disciplina_id")
    private int id;

    @Column(name = "nome")
    private String nome;

    @Column(name = "carga_horaria")
    private int cargaHoraria;

    @Column(name = "periodo")
    private int periodo;

    @ManyToOne
    @JoinColumn(name = "curso_id")
    private Curso curso;

    @ManyToMany(mappedBy = "disciplinas")
    private Set<Professor> professores = new HashSet<>();


    public Disciplina() {
        nome = "";
        cargaHoraria = 0;
        periodo = 0;
        curso = new Curso();
    }

    public Disciplina(String nome, int periodo, int cargaHoraria) {
        this.nome = nome;
        this.cargaHoraria = cargaHoraria;
        this.periodo = periodo;
        curso = new Curso();
    }

    public Set<Professor> getProfessores() {
        return professores;
    }

    public void setProfessores(Set<Professor> professores) {
        this.professores = professores;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getCargaHoraria() {
        return cargaHoraria;
    }

    public void setCargaHoraria(int cargaHoraria) {
        this.cargaHoraria = cargaHoraria;
    }

    public int getPeriodo() {
        return periodo;
    }

    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    public Curso getCurso() {
        return curso;
    }

    public String getCursoSigla() {
        return curso.getSigla();
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public String getSiglaCurso() {
        return curso.getSigla();
    }

    @Override
    public Object clone() {
        Object obj = null;

        try {
            obj = super.clone();

            ( (Disciplina) obj).setCurso( (Curso) this.getCurso().clone() );

        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }

        return obj;
    }

    @Override
    public String toString() {
        return nome;
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder()
                .append(getNome())
                .append(getPeriodo())
                .append(getCargaHoraria())
                .toHashCode();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        } else if (o instanceof Disciplina) {
            Disciplina other = (Disciplina) o;
            return new EqualsBuilder()
                    .append(getNome(), other.getNome())
                    .append(getPeriodo(), other.getPeriodo())
                    .append(getCargaHoraria(), other.getCargaHoraria())
                    .isEquals();
        } else {
            return false;
        }
    }
}
