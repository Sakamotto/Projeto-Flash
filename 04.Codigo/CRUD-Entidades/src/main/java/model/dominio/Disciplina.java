package model.dominio;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.zip.CRC32;

/**
 * Created by danilo on 24/10/16.
 */
public class Disciplina implements Cloneable {

    private int id;
    private String nome;
    private int cargaHoraria;
    private int periodo;
    private Curso curso;
    private AreaConhecimento areaConhecimento;
    private Set<Professor> professores = new HashSet<>();


    public Disciplina() {
        nome = "";
        cargaHoraria = 0;
        periodo = 0;
        curso = new Curso();
        areaConhecimento = new AreaConhecimento();
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

    public AreaConhecimento getAreaConhecimento() {
        return areaConhecimento;
    }

    public void setAreaConhecimento(AreaConhecimento areaConhecimento) {
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
