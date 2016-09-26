package br.com.ifes.theflash.domain;

/**
 * Created by cristian on 20/09/16.
 */
public class Espaco {

    private String bloco;
    private int numero;
    private TipoEspaco local;


    public String getBloco() {
        return bloco;
    }

    public void setBloco(String bloco) {
        this.bloco = bloco;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public TipoEspaco getLocal() {
        return local;
    }

    public void setLocal(TipoEspaco local) {
        this.local = local;
    }
}
