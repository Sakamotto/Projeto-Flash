# language: pt

Funcionalidade: Intervalo entre aulas de um professor menor que tres horas.

  Um professor não deve ter um intervalo maior que tres horas entre duas disciplinas em um mesmo dia.

  Cenario: Horario de intervalo maior ou igual a tres horas.
    Dado Eu tenha um conjunto de professores alocados a um conjunto de disciplinas
    Quando Eu alocar os horarios com intervalo maior que tres horas
    Entao Enviar mensagem de erro informando a quebra da regra


  Cenario: Horarios que nao possuem intervalo maior ou igual a 3 horas.
    Dado Eu tenha um conjunto de professores alocados a um conjunto de disciplinas
    Quando Eu alocar os sem intervalo maior ou igual a tres horas para todos os professores
    Entao Aloque o horario