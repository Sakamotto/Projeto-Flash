package testes;


import domain.AlocacaoHorario;
import controller.Resolvedor;
import cucumber.api.java.pt.Dado;
import cucumber.api.java.pt.Entao;
import cucumber.api.java.pt.Quando;
import domain.ScheduleBuilder;
import model.dominio.Alocacao;
import model.dominio.Disciplina;
import model.dominio.Horario;
import model.dominio.Professor;


import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;


/**
 * Created by Danilo de Oliveira on 14/11/16.
 */
public class IntervaloTresHoras {

    private List<Alocacao> alocacoes;
    private List<Horario> horarios;

    @Dado("^Eu tenha um conjunto de professores alocados a um conjunto de disciplinas$")
    public void eu_tenha_um_conjunto_de_professores_alocados_a_um_conjunto_de_disciplinas() throws Throwable {
        Professor professor = new Professor("Bruno R. G.", "12345678910");

        Disciplina disciplinaUm = new Disciplina("Calculo 1", 1, 90);
        Disciplina disciplinaDois = new Disciplina("Lógica", 1, 90);

        Alocacao alocacaoUm = new Alocacao(disciplinaUm);
        Alocacao alocacaoDois = new Alocacao(disciplinaDois);

        alocacaoUm.setProfessor(professor);
        alocacaoDois.setProfessor(professor);

        alocacoes = new ArrayList<>();

        alocacoes.add(alocacaoUm);
        alocacoes.add(alocacaoDois);

    }

    @Quando("^Eu alocar os horarios com intervalo maior que tres horas$")
    public void eu_alocar_os_horarios_com_intervalo_maior_que_tres_horas() throws Throwable {
        Horario horarioUm = new Horario(1);
        horarioUm.setDiaSemana(Horario.DiaSemana.SEGUNDA);
        horarioUm.setHorarioInicio(7, 30);
        horarioUm.setHorarioFim(9, 20);

        Horario horarioDois = new Horario(2);
        horarioDois.setDiaSemana(Horario.DiaSemana.SEGUNDA);
        horarioDois.setHorarioInicio(13, 20);
        horarioDois.setHorarioFim(15, 30);

        horarios = new ArrayList<>();

        horarios.add(horarioUm);
        horarios.add(horarioDois);

        AlocacaoHorario problema = new AlocacaoHorario(alocacoes, horarios);

        AlocacaoHorario solucao = Resolvedor.resolver("solver/bruteForce_solverConfig.xml", problema);

        assertEquals(solucao.getScore().isFeasible(), false);
    }

    @Entao("^Enviar mensagem de erro informando a quebra da regra$")
    public void enviar_mensagem_de_erro_informando_a_quebra_da_regra() throws Throwable {
        System.out.println("Existe um professor com um intervalo de 3 horas vagas entre horarios de aula.");
    }

    @Quando("^Eu alocar os sem intervalo maior ou igual a tres horas para todos os professores$")
    public void eu_alocar_os_sem_intervalo_maior_ou_igual_a_tres_horas_para_todos_os_professores() throws Throwable {
        Horario horarioUm = new ScheduleBuilder(1)
                .addDiaSemana(Horario.DiaSemana.SEGUNDA)
                .addHorarioInicio(7, 30)
                .addHorarioFim(9, 20)
                .getHorario();
        Horario horarioDois = new ScheduleBuilder(2)
                .addDiaSemana(Horario.DiaSemana.SEGUNDA)
                .addHorarioInicio(9, 40)
                .addHorarioFim(11, 30)
                .getHorario();

        horarios = new ArrayList<>();

        horarios.add(horarioUm);
        horarios.add(horarioDois);

        AlocacaoHorario problema = new AlocacaoHorario(alocacoes, horarios);

        AlocacaoHorario solucao = Resolvedor.resolver("solver/bruteForce_solverConfig.xml", problema);

        assertEquals(solucao.getScore().isFeasible(), true);

    }

    @Entao("^Aloque o horario$")
    public void aloque_o_horario() throws Throwable {
        System.out.println("Alcoado.");
    }

}
