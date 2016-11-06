package application;

import controller.Resolvedor;
import domain.Alocacao;
import domain.Disciplina;
import domain.Horario;
import domain.HorarioBuilder;



import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class Main {


    public static void main(String[] args) {
        Resolvedor.benchMark();

//        AlocacaoHorario problema;
//
//
//        Horario horario01 = new HorarioBuilder(1)
//                .addDiaSemana(Horario.DiaSemana.SEGUNDA)
//                .addHorarioInicio(7, 30)
//                .addHorarioFim(9, 30)
//                .getHorario();
//
//
//        Horario horario02 = new HorarioBuilder(2)
//                .addDiaSemana(Horario.DiaSemana.SEGUNDA)
//                .addHorarioInicio(7, 30)
//                .addHorarioFim(9, 30)
//                .getHorario();
//
//        Horario horario03 = new HorarioBuilder(3)
//                .addDiaSemana(Horario.DiaSemana.QUARTA)
//                .addHorarioInicio(7, 30)
//                .addHorarioFim(9, 30)
//                .getHorario();
//
//        Horario horario04 = new HorarioBuilder(4)
//                .addDiaSemana(Horario.DiaSemana.QUINTA)
//                .addHorarioInicio(7, 30)
//                .addHorarioFim(9, 30)
//                .getHorario();
//
//        Horario horario05 = new HorarioBuilder(5)
//                .addDiaSemana(Horario.DiaSemana.SEXTA)
//                .addHorarioInicio(7, 30)
//                .addHorarioFim(9, 30)
//                .getHorario();
//
//
//        Horario horario06 = new HorarioBuilder(6)
//                .addDiaSemana(Horario.DiaSemana.QUINTA)
//                .addHorarioInicio(15, 30)
//                .addHorarioFim(17, 30)
//                .getHorario();
//
//
//        Horario horario07 = new HorarioBuilder(7)
//                .addDiaSemana(Horario.DiaSemana.QUINTA)
//                .addHorarioInicio(9, 40)
//                .addHorarioFim(11, 30)
//                .getHorario();
//
//
//        Disciplina disciplina01 = new Disciplina("Calculo 1", 1, 60);
//        Disciplina disciplina02 = new Disciplina("Sociologia 1", 1, 30);
//        Disciplina disciplina03 = new Disciplina("Metodologia da Pesquisa", 1, 30);
//        Disciplina disciplina04 = new Disciplina("FSI", 1, 30);
//        Disciplina disciplina05 = new Disciplina("Logica", 1, 30);
//        Disciplina disciplina06 = new Disciplina("Programacao 1", 1, 60);
//
//        Alocacao alocacao1 = new Alocacao( disciplina01 );
//
//        Alocacao alocacao2 = new Alocacao( disciplina02 );
//
//        Alocacao alocacao3 = new Alocacao( disciplina03 );
//
//        Alocacao alocacao4 = new Alocacao( disciplina04 );
//
//        Alocacao alocacao5 = new Alocacao( disciplina05 );
//
//        Alocacao alocacao6 = new Alocacao( disciplina06 );
//
//
//
//
//        problema = new AlocacaoHorario(
//                listAlocacao(alocacao1, alocacao2, alocacao3, alocacao4, alocacao5, alocacao6),
//                listHorarios(horario01, horario02, horario03, horario04, horario06, horario05, horario07)
//        );
//
//
//
//        AlocacaoHorario solucao = Resolvedor.resolver(problema, "solver/bruteForce_solverConfig.xml");
//
//        // printResultSolution(solucao);



    }


    private static List<Horario> listHorarios(Horario... hs) {
        ArrayList<Horario> horarios = new ArrayList<>();

        Collections.addAll(horarios, hs);

        return horarios;
    }

    private static List<Alocacao> listAlocacao(Alocacao... ds) {
        ArrayList<Alocacao> alocacao = new ArrayList<>();

        Collections.addAll(alocacao, ds);

        return alocacao;
    }


}
