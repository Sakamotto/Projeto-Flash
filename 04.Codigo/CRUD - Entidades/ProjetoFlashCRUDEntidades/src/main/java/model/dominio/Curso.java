package model.dominio;

/**
 * Created by danilo on 24/10/16.
 */
public class Curso {
    private String nome;
    private String regime;
    private int duracao;
    private String sigla;

    public Curso() {
        nome = "";
        regime = "";
        duracao = 0;
        sigla = "";
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getRegime() {
        return regime;
    }

    public void setRegime(String regime) {
        this.regime = regime;
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
}
