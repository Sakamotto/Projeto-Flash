package teste.passos;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import model.dominio.Professor;

import static org.junit.Assert.assertEquals;

public class TesteCPF {
    private String cpfInput;
    private Professor professor;

    @Given("^Eu entro com o CPF \"(.*)\"$")
    public void testaCpf(String cpf) {
        cpfInput = cpf;
    }

    @When("^Eu quero validar$")
    public void validaCpf() {
        professor = new Professor();
        professor.setCpf(cpfInput, true);
    }

    @Then("^O cpf eh invalido$")
    public void resultadoValidacaoInvalido() {
        assertEquals(professor.getCpf(), "");
    }

    @Then("^O cpf eh valido$")
    public void resultadoValidacaoValido() {
        assertEquals(professor.getCpf(), cpfInput);
    }

}
