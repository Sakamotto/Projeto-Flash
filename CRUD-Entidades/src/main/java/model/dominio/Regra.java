package model.dominio;

import javax.persistence.*;

/**
 * Created by danilo on 01/04/17.
 */
@Entity(name = "regra")
public class Regra {

    public enum TipoRegra {Soft, Medium, Hard}

    @Id
    @GeneratedValue
    @Column(name = "regra_id")
    private Long id;

    @Column(name = "descricao")
    private String descricao;

    @Column(name = "penalidade")
    private int penalidade;

    @Column(name = "tipo_regra")
    private TipoRegra tipoRegra;

    @Column(name = "ativada")
    private boolean ativada;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public boolean isAtivada() {
        return ativada;
    }

    public void setAtivada(boolean ativada) {
        this.ativada = ativada;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getPenalidade() {
        return penalidade;
    }

    public void setPenalidade(int penalidade) {
        this.penalidade = penalidade;
    }

    public TipoRegra getTipoRegra() {
        return tipoRegra;
    }

    public void setTipoRegra(TipoRegra tipoRegra) {
        this.tipoRegra = tipoRegra;
    }

    public String getEstado() {
        return (ativada) ? "Ativada" : "Desativada";
    }
}
