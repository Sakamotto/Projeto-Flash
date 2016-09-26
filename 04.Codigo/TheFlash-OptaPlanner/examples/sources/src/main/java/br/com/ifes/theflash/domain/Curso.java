package br.com.ifes.theflash.domain;

/**
 * Created by cristian on 20/09/16.
 */
public class Curso {

    private String nome;
    private int duracao;
    private String sigla;
    private GrauInstrucao grauInstrucao;
    private AreaConhecimento areaConhecimento;
    private Regime regime;


    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getDuracao() {
        return duracao;
    }

    public void setDuracao(int duracao) {
        this.duracao = duracao;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public GrauInstrucao getGrauInstrucao() {
        return grauInstrucao;
    }

    public void setGrauInstrucao(GrauInstrucao grauInstrucao) {
        this.grauInstrucao = grauInstrucao;
    }

    public AreaConhecimento getAreaConhecimento() {
        return areaConhecimento;
    }

    public void setAreaConhecimento(AreaConhecimento areaConhecimento) {
        this.areaConhecimento = areaConhecimento;
    }

    public Regime getRegime() {
        return regime;
    }

    public void setRegime(Regime regime) {
        this.regime = regime;
    }
}
