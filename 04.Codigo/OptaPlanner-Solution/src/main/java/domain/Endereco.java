package domain;

/**
 * Created by danilo on 01/10/16.
 */
public class Endereco {
    private String bairro;
    private String logradouro;
    private String numero;
    private String cep;

    public Endereco() {}

    public Endereco(String bairro, String logradouro, String numero) {
        this.bairro = bairro;
        this.logradouro = logradouro;
        this.numero = numero;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }
}
