package domain;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import java.io.Serializable;
import java.util.List;


@XStreamAlias("Disciplina")
public class Disciplina {

    private String nome;
    private int periodo;
    private int cargaHorariaSemanal;
    private List<String> preRequisitos;

    public Disciplina() {}

    public Disciplina(String nome, int periodo, int cargaHorariaSemanal) {
        this.nome = nome;
        this.periodo = periodo;
        this.cargaHorariaSemanal = cargaHorariaSemanal;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getPeriodo() {
        return periodo;
    }

    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    public int getCargaHorariaSemanal() {
        return cargaHorariaSemanal;
    }

    public void setCargaHorariaSemanal(int cargaHorariaSemanal) {
        this.cargaHorariaSemanal = cargaHorariaSemanal;
    }

    public List<String> getPreRequisitos() {
        return preRequisitos;
    }

    public void setPreRequisitos(List<String> preRequisitos) {
        this.preRequisitos = preRequisitos;
    }

    public int hashCode() {
        return new HashCodeBuilder()
                .append(nome)
                .append(periodo)
                .append(cargaHorariaSemanal)
                .toHashCode();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        } else if (o instanceof Disciplina) {
            Disciplina other = (Disciplina) o;
            return new EqualsBuilder()
                    .append(nome, other.getNome())
                    .append(periodo, other.getPeriodo())
                    .append(cargaHorariaSemanal, other.getCargaHorariaSemanal())
                    .isEquals();
        } else {
            return false;
        }
    }
}
