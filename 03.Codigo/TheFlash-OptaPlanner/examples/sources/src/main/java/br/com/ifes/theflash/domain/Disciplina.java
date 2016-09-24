package br.com.ifes.theflash.domain;

/**
 * Created by cristian on 20/09/16.
 */
public class Disciplina {

    private String nome;
    private int cargaHoraria;
    private int periodoCorrespondente;
    private AreaConhecimento areaConhecimento;

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

    public int getPeriodoCorrespondente() {
        return periodoCorrespondente;
    }

    public void setPeriodoCorrespondente(int periodoCorrespondente) {
        this.periodoCorrespondente = periodoCorrespondente;
    }

    public AreaConhecimento getAreaConhecimento() {
        return areaConhecimento;
    }

    public void setAreaConhecimento(AreaConhecimento areaConhecimento) {
        this.areaConhecimento = areaConhecimento;
    }
}
