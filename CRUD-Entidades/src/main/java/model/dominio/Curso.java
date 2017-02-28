package model.dominio;

import javax.persistence.*;

/**
 * Created by danilo on 24/10/16.
 */
@Entity(name="curso")
public class Curso implements Cloneable {

    @Id
    @GeneratedValue
    @Column(name="curso_id")
    private int id;

    @Column(name="nome")
    private String nome;

    @Column(name="regime")
    private String regime;

    @Column(name="duracao")
    private int duracao;

    @Column(name="sigla")
    private String sigla;

    public Curso() {
        nome = "";
        regime = "";
        duracao = 0;
        sigla = "";
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

    @Override
    public Object clone() {
        Object obj = null;

        try {
            obj = super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }

        return obj;
    }

    @Override
    public String toString() {
        return nome;
    }
}
