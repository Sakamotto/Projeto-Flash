package application;

import com.github.javafaker.Faker;
import com.mifmif.common.regex.Generex;
import io.codearte.jfairy.Fairy;
import model.DAO.ProfessorDAO;
import model.DAO.ProfessorDAOImpl;
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

        gerarProfessores(5);


    }

    public static void gerarProfessores(int quantidade) throws SQLException, ClassNotFoundException {


        for(int i = 0 ; i < quantidade ; i++) {
            Professor p = new Professor();
            Endereco e = new Endereco();
            Faker faker2 = new Faker();
            Fairy faker = Fairy.create();
            boolean professorSalvoComSucesso;

            p.setNome(faker.person().fullName().replace("'", ""));
            p.setEmail(faker.person().email().replace("'", ""));
            p.setDataNascimento(faker.person().dateOfBirth().toString().replace("'", ""));
            p.setRg(faker.person().nationalIdentityCardNumber().replace("'", ""));
            p.setCpf(gerarCpf(), true);
            p.setMatricula(gerarMatricula());

            e.setBairro(faker.person().getAddress().getCity().replace("'", ""));
            e.setCep(faker.person().getAddress().getPostalCode().replace("'", ""));
            e.setMunicipio(faker2.address().state().replace("'", ""));
            e.setEndereco(faker2.address().streetAddress().replace("'", ""));
            e.setNumero(Integer.parseInt(faker2.address().streetAddressNumber().replace("'", "")));

            p.setEndereco(e);

            // professorSalvoComSucesso = PersistenciaProfessor.save(p);

            ProfessorDAO professorDAO = new ProfessorDAOImpl();

            p.setDataNascimento("2014-10-11");

            professorDAO.inserir(p);


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
