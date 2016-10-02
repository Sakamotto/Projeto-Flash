package domain;

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
        return nome.hashCode();
    }

    @Override
    public boolean equals(Object object) {
        if (object == null)
            return false;
        else
            return this.getNome().equals( ( (Disciplina) object).getNome() );
    }
}
