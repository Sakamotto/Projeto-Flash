package model.dominio;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by danilo on 24/10/16.
 */

@XStreamAlias("Disciplina")
@Entity(name = "disciplina")
public class Disciplina implements Cloneable {

    @Id
    @GeneratedValue
    @Column(name = "disciplina_id")
    private int id;

    @Column(name = "nome")
    private String nome;

    @Column(name = "carga_horaria_semanal")
    private int cargaHorariaSemanal;

    @Column(name = "quantidade_aulas_semanais")
    private int quantidadeAulasSemanais;

    @Column(name = "periodo")
    private int periodo;

    @ManyToOne
    @JoinColumn(name = "curso_id")
    private Curso curso;

    @ManyToMany(mappedBy = "disciplinas")
    private Set<Professor> professores = new HashSet<>();

    @ManyToMany()
    @JoinTable(
            name = "disciplina_requisito",
            joinColumns = @JoinColumn(name = "disciplina_id", referencedColumnName = "disciplina_id"),
            inverseJoinColumns = @JoinColumn(name = "disciplina_requisito_id", referencedColumnName = "disciplina_id")
    )
    private Set<Disciplina> disciplinasRequisito = new HashSet<>();


    public Disciplina() {
        nome = "";
        cargaHorariaSemanal = 0;
        periodo = 0;
        curso = new Curso();
    }

    public Disciplina(String nome, int periodo, int cargaHorariaSemanal, int quantidadeAulasSemanais) {
        this.nome = nome;
        this.cargaHorariaSemanal = cargaHorariaSemanal;
        this.quantidadeAulasSemanais = quantidadeAulasSemanais;
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

    public int getCargaHorariaSemanal() {
        return cargaHorariaSemanal;
    }

    public void setCargaHorariaSemanal(int cargaHorariaSemanal) {
        this.cargaHorariaSemanal = cargaHorariaSemanal;
    }

    public int getQuantidadeAulasSemanais() {
        return quantidadeAulasSemanais;
    }

    public void setQuantidadeAulasSemanais(int quantidadeAulasSemanais) {
        this.quantidadeAulasSemanais = quantidadeAulasSemanais;
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

    public void addDisciplinaRequisito(Disciplina disciplina) {
        disciplinasRequisito.add(disciplina);
    }

    public void removeDisciplinaRequisito(Disciplina disciplina) {
        disciplinasRequisito.remove(disciplina);
    }

    public List<Disciplina> getDisciplinasRequisito() {
        return new ArrayList<>(disciplinasRequisito);
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
                .append(getCargaHorariaSemanal())
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
                    .append(getCargaHorariaSemanal(), other.getCargaHorariaSemanal())
                    .append(getQuantidadeAulasSemanais(), other.getQuantidadeAulasSemanais())
                    .isEquals();
        } else {
            return false;
        }
    }
}
