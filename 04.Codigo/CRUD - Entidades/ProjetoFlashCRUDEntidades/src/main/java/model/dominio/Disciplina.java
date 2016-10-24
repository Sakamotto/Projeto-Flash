package model.dominio;

import java.util.zip.CRC32;

/**
 * Created by danilo on 24/10/16.
 */
public class Disciplina implements Cloneable {
    private String nome;
    private String cargaHoraria;
    private String periodo;
    private Curso curso;
    private String areaConhecimento;

    public Disciplina() {
        nome = "";
        cargaHoraria = "";
        periodo = "";
        curso = new Curso();
        areaConhecimento = "";
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCargaHoraria() {
        return cargaHoraria;
    }

    public void setCargaHoraria(String cargaHoraria) {
        this.cargaHoraria = cargaHoraria;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
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

    public String getAreaConhecimento() {
        return areaConhecimento;
    }

    public void setAreaConhecimento(String areaConhecimento) {
        this.areaConhecimento = areaConhecimento;
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
}
