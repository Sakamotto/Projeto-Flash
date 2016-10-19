package application;

import com.github.javafaker.Faker;
import com.mifmif.common.regex.Generex;
import io.codearte.jfairy.Fairy;
import model.database.PersistenciaProfessor;
import model.dominio.Endereco;
import model.dominio.Professor;

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
            boolean professorSalvoComSucesso;

            p.setNome(faker.person().fullName());
            p.setEmail(faker.person().email());
            p.setDataNascimento(faker.person().dateOfBirth().toString());
            p.setRg(faker.person().nationalIdentityCardNumber());
            p.setCpf(gerarCpf(), true);
            p.setMatricula(gerarMatricula());

            e.setBairro(faker.person().getAddress().getCity());
            e.setCep(faker.person().getAddress().getPostalCode());
            e.setMunicipio(faker2.address().state());
            e.setEndereco(faker2.address().streetAddress());
            e.setNumero(faker2.address().streetAddressNumber());

            p.setEndereco(e);

            professorSalvoComSucesso = PersistenciaProfessor.salvarProfessor(p);

            if( !professorSalvoComSucesso )
                i--;

        }

    }

    private static String gerarCpf() {
        int sumVerificadorUm = 0,
            sumVerificadorDois = 0;
        int m = 11, n = 10;
        String cpf = "";
        Random random = new Random();

        for(int i = 0 ; i < 10 ; i++) {

            if (n > 1 && m > 2) {
                int valorSortido = random.nextInt(10);
                cpf += valorSortido;

                sumVerificadorUm += valorSortido * n;
                sumVerificadorDois += valorSortido * m;

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

                cpf += sumVerificadorUm;
                cpf += sumVerificadorDois;
            }
        }

        System.out.println(cpf);

        return cpf;
    }

    private static String gerarMatricula() {
        Generex generex = new Generex("\\d{6}");
        return generex.random();
    }
}
