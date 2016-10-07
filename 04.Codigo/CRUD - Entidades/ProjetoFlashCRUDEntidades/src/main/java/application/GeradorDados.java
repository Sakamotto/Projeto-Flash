package application;

import com.github.javafaker.Faker;
import com.mifmif.common.regex.Generex;
import io.codearte.jfairy.Fairy;
import model.database.Conexao;
import model.database.PersistenciaProfessor;
import model.dominio.Endereco;
import model.dominio.Professor;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Random;

/**
 * Created by danilo on 07/10/16.
 */
public class GeradorDados {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {

        gerarProfessores(3000);


    }

    public static void gerarProfessores(int quantidade) throws SQLException, ClassNotFoundException {


        for(int i = 0 ; i < quantidade ; i++) {
            Professor p = new Professor();
            Endereco e = new Endereco();
            Fairy faker = Fairy.create();
            Faker faker2 = new Faker();

            p.setNome(faker.person().fullName());
            p.setEmail(faker.person().email());
            p.setDataNascimento(faker.person().dateOfBirth().toString());
            p.setRg(faker.person().nationalIdentityCardNumber());
            p.setCpf(gerarCpf());
            p.setMatricula(gerarMatricula());

            e.setBairro(faker.person().getAddress().getCity());
            e.setCep(faker.person().getAddress().getPostalCode());
            e.setMunicipio(faker2.address().state());
            e.setEndereco(faker2.address().streetAddress());
            e.setNumero(faker2.address().streetAddressNumber());

            p.setEndereco(e);

            PersistenciaProfessor.salvarProfessor(p);

        }

    }

    private static String gerarCpf() {
        Generex generex = new Generex("\\d{3}\\.\\d{3}\\.\\d{3}-\\d{2}");
        return generex.random();
    }

    private static String gerarMatricula() {
        Generex generex = new Generex("\\d{6}");
        return generex.random();
    }
}
