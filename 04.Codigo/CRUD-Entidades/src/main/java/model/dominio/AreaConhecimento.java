package model.dominio;

/**
 * Created by Danilo de Oliveira on 26/11/16.
 */
public class AreaConhecimento {

    private int id;
    private String descricao;

    public AreaConhecimento() {
    }

    public AreaConhecimento(String descricao) {
        this.descricao = descricao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
