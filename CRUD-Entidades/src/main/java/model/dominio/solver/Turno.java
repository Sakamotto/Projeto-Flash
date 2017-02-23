package model.dominio.solver;

/**
 * Created by danilo on 22/02/17.
 */
public enum Turno {
    MATUTINO(1), VESPERTINO(2), NOTURNO(3);

    private int valor;

    Turno(int valor) {
        this.valor = valor;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    @Override
    public String toString() {
        switch (valor) {
            case 1:
                return "Matutino";
            case 2:
                return "Vespertino";
            case 3:
                return "Noturno";
            default:
                return "";
        }
    }
}
