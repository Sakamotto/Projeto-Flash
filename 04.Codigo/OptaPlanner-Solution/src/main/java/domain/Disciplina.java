package domain;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import java.io.Serializable;
import java.util.List;


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

    @Override
    public int hashCode() {
        return new HashCodeBuilder(1450207409, -1692382659)
                .append(getNome()).toHashCode();
    }

    @Override
    public boolean equals(Object object) {
        if (object == null)
            return false;
        else{
            Disciplina paramDisciplina = (Disciplina) object;

            return new EqualsBuilder()
                    .append(nome, paramDisciplina.getNome())
                    .isEquals();
        }
    }
}
