# language: pt
Funcionalidade: Disciplinas conflitantes

  Não deve haver duas aulas do mesmo período no mesmo horário.

  Cenario: Duas discplinas que conflitam
    Dado Eu tenha um conjunto de discplinas em um periodo
    Quando Eu alocar o horario
    E houver conflito
    Entao Enviar mensagem de erro de conflito de horario entre discplinas


  Cenario: Duas discplinas não conflitam
    Dado Eu tenha um conjunto de discplinas em um periodo
    Quando Eu alocar o horario
    E nao houver conflito
    Entao Aloque o horario