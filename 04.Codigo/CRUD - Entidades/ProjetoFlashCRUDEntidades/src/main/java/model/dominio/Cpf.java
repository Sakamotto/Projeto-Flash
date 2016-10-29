package model.dominio;

/**
 * Created by danilo on 23/10/16.
 */
public class Cpf {
    private String cpf;

    public Cpf(){
        cpf = "";
    }

    public String getCpf() {
        return cpf;
    }

    public String getCpfFormated() {
        String strCpf = cpf;

        if (!strCpf.equals(""))
            strCpf = strCpf.substring(0, 3) + "." + strCpf.substring(3, 6) + "." + strCpf.substring(6, 9) + "-" + strCpf.substring(9, 11);

        return strCpf;
    }

    public void setCpf(String cpf, boolean validar) {
        if (validar) {
            if (validaCpf(cpf))
                this.cpf = cpf;
        }
        else
            this.cpf = cpf;

    }

    public boolean validaCpf(String cpf) {
        int sumVerificadorUm = 0;
        int sumVerificadorDois = 0;
        int m = 11, n = 10;
        boolean cpfValido;

        cpfValido = cpf.length() == 11;

        for(int i = 0 ; (i < cpf.length() - 1 ) && cpfValido ; i++) {

            if (n > 1 && m > 2) {
                sumVerificadorUm += (Integer.parseInt(cpf.substring(i, i + 1)) * n);
                sumVerificadorDois += (Integer.parseInt(cpf.substring(i, i + 1)) * m);
                m--;
                n--;
            }
            else {
                sumVerificadorUm = (sumVerificadorUm * 10) % 11;

                if (sumVerificadorUm >= 10)
                    sumVerificadorUm = 0;

                sumVerificadorDois += sumVerificadorUm * 2;
                sumVerificadorDois = (sumVerificadorDois * 10) % 11;

                if (sumVerificadorDois >= 10)
                    sumVerificadorDois = 0;

            }
        }

        cpfValido = Integer.parseInt(cpf.substring(9, 10)) == sumVerificadorUm;
        cpfValido = cpfValido && Integer.parseInt(cpf.substring(10, 11)) == sumVerificadorDois;

        return cpfValido;
    }
}
