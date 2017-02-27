package testes;

import domain.AlocacaoHorario;
import controller.Resolvedor;
import cucumber.api.java.pt.Dado;
import cucumber.api.java.pt.Entao;
import cucumber.api.java.pt.Quando;
import model.dominio.*;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * Created by Danilo de Oliveira on 15/11/16.
 */
public class HorariosProfessorConflitantes {

    private Alocacao alocacaoUm;
    private Alocacao alocacaoDois;
    private Alocacao alocacaoTres;

    private Professor professorUm = new Professor("Foo Bar", "99999988888");
    private Professor professorDois = new Professor("Professor Snape", "11122233344");

    private Disciplina disciplinaUm = new Disciplina("Calculo 1", 1, 60, 110, 5);
    private Disciplina disciplinaDois = new Disciplina("Logica", 1, 60, 110, 1);
    private Disciplina disciplinaTres = new Disciplina("Calculo 2", 2, 90, 110, 1);

    private Horario horarioUm = new Horario(1);
    private Horario horarioDois = new Horario(2);
    private Horario horarioTres = new Horario(3);

    private List<Alocacao> alocacoes = new ArrayList<>();
    private List<Horario> horarios;

    @Dado("^Existe um conjunto de professores alocados a um conjunto de disciplinas$")
    public void existe_um_conjunto_de_professores_alocados_a_um_conjunto_de_disciplinas() throws Throwable {
        alocacaoUm = new Alocacao(disciplinaUm, professorUm);
        alocacaoDois = new Alocacao(disciplinaDois, professorDois);
        alocacaoTres = new Alocacao(disciplinaTres, professorDois);

        alocacoes.add(alocacaoUm);
        alocacoes.add(alocacaoDois);
        alocacoes.add(alocacaoTres);
    }

    @Quando("^Eu alocar os horarios que geram conflito de horarios dos professores$")
    public void eu_alocar_os_horarios_que_geram_conflito_de_horarios_dos_professores() throws Throwable {
        horarioUm.setDiaSemana(DiaSemana.TERCA);
        horarioUm.setHorarioInicio(7, 30);
        horarioUm.setHorarioFim(9, 20);

        horarioDois.setDiaSemana(DiaSemana.TERCA);
        horarioDois.setHorarioInicio(7, 30);
        horarioDois.setHorarioFim(9, 20);

        horarioTres.setDiaSemana(DiaSemana.TERCA);
        horarioTres.setHorarioInicio(7, 30);
        horarioTres.setHorarioFim(9, 20);

        horarios = new ArrayList<>();

        horarios.add(horarioUm);
        horarios.add(horarioDois);
        horarios.add(horarioTres);

        AlocacaoHorario problema = new AlocacaoHorario(alocacoes, horarios);

        AlocacaoHorario solucao = Resolvedor.resolver("solver/tabuSearch_solverConfig.xml", problema);

        assertEquals(solucao.getScore().isFeasible(), false);
    }

    @Entao("^Enviar mensagem de conflito de horarios de professor$")
    public void enviar_mensagem_de_conflito_de_horarios_de_professor() throws Throwable {
        System.out.println("### Deu conflito! ###");
    }

    @Quando("^Alocar os horarios que nao geram conflito de horarios dos professores$")
    public void alocar_os_horarios_que_nao_geram_conflito_de_horarios_dos_professores() throws Throwable {
        horarioUm.setDiaSemana(DiaSemana.SEGUNDA);
        horarioUm.setHorarioInicio(7, 30);
        horarioUm.setHorarioFim(9, 20);

        horarioDois.setDiaSemana(DiaSemana.TERCA);
        horarioDois.setHorarioInicio(7, 30);
        horarioDois.setHorarioFim(9, 20);

        horarioTres.setDiaSemana(DiaSemana.TERCA);
        horarioTres.setHorarioInicio(7, 30);
        horarioTres.setHorarioFim(9, 20);

        horarios = new ArrayList<>();

        horarios.add(horarioUm);
        horarios.add(horarioDois);
        horarios.add(horarioTres);

        AlocacaoHorario problema = new AlocacaoHorario(alocacoes, horarios);

        AlocacaoHorario solucao = Resolvedor.resolver("solver/bruteForce_solverConfig.xml", problema);

        assertEquals(solucao.getScore().isFeasible(), true);
    }
}
