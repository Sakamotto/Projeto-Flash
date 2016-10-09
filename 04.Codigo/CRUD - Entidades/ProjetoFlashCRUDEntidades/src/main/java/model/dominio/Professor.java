package model.dominio;


public class Professor implements Cloneable {

    private String nome, matricula, cpf, email, dataNascimento, rg;
    private Endereco endereco;

    public Professor() {
        this.nome = "";
        this.matricula = "";
        this.cpf = "";
        this.email = "";
        this.dataNascimento = "";
        this.rg = "";

        this.endereco = new Endereco();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(String dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getCpf() {
        return cpf;
    }

    public String getDecoratedCpf() {
        if (cpf.equals(""))
            return "";
        else
            return this.cpf.substring(0, 3) + "." + this.cpf.substring(3, 6) + "." + this.cpf.substring(6, 9) + "-" + this.cpf.substring(9, 11);
    }

    public void setCpf(String cpf, boolean validar) {
        if ( validaCpf(cpf) && validar)
            this.cpf = cpf;
        else if (!validar)
            this.cpf = cpf;
        else
            this.cpf = null;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    @Override
    public Object clone() {
        Object obj = null;

        try {
            obj = super.clone();

            ( (Professor) obj).setEndereco( (Endereco) this.getEndereco().clone() );

        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }

        return obj;
    }

    private boolean validaCpf(String cpf) {
        int sumVerificadorUm = 0,
            sumVerificadorDois = 0;
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
