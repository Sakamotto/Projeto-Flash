package model.dominio;

/**
 * Created by danilo on 24/09/16.
 */
public class ProfessorFakeFactory {
    public enum Tipo {
        FAKE,
        VAZIO
    }

    public static Professor getProfessorFake (Tipo tipo) {
        String municipio, bairro, endereco, numero, cep, nome, cpf, matricula;

        Professor professorObj = new Professor();
        Endereco enderecoObj = new Endereco();

        if (tipo == Tipo.FAKE){
            nome = "Danilo de Oliveira";
            cpf = "123.456.789-97";
            matricula = "987654321";
            municipio = "Serra";
            bairro = "Morada de Laranjeiras";
            endereco = "Rua Amaralina";
            numero = "22";
            cep = "29166-822";

        }
        else {
            nome = "";
            cpf = "";
            matricula = "";
            municipio = "";
            bairro = "";
            endereco = "";
            numero = "";
            cep = "";
        }

        enderecoObj.setMunicipio(municipio);
        enderecoObj.setBairro(bairro);
        enderecoObj.setEndereco(endereco);
        enderecoObj.setNumero(numero);
        enderecoObj.setCep(cep);

        professorObj.setEndereco(enderecoObj);
        professorObj.setNome(nome);
        professorObj.setCpf(cpf);
        professorObj.setMatricula(matricula);

        return professorObj;
    }

}
