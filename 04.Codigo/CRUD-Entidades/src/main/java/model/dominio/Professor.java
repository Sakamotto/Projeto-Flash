package model.dominio;


public class Professor implements Cloneable {

    private Long id;

    private String nome;
    private String email;
    private String dataNascimento;
    private String rg;
    private Cpf cpf;
    private String matricula;
    private Endereco endereco;

    public Professor() {
        nome = "";
        matricula = "";
        cpf = new Cpf();
        email = "";
        dataNascimento = "";
        rg = "";

        endereco = new Endereco();
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
        return cpf.getCpf();
    }

    public String getDecoratedCpf() {
       return cpf.cpfFormated();
    }

    public void setCpf(String cpf, boolean validar) {
        this.cpf.setCpf(cpf, validar);
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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
