package model.dominio;

/**
 * Created by danilo on 24/10/16.
 */
public class Disciplina {
    private String nome;
    private int cargaHoraria;
    private int periodo;
    private Curso curso;
    private String areaConhecimento;

    public Disciplina() {
        nome = "";
        cargaHoraria = 0;
        periodo = 0;
        curso = new Curso();
        areaConhecimento = "";
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

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public String getAreaConhecimento() {
        return areaConhecimento;
    }

    public void setAreaConhecimento(String areaConhecimento) {
        this.areaConhecimento = areaConhecimento;
    }
}
