Feature: Disciplinas conflitantes

  Não deve haver duas aulas do mesmo período no mesmo horário.

  Scenario: Duas discplinas que conflitam
    Given Eu tenha um conjunto de discplinas em um periodo
    When Eu alocar o horario
    And houver conflito
    Then Enviar mensagem de erro de conflito de horario entre discplinas


  Scenario: Duas discplinas não conflitam
    Given Eu tenha um conjunto de discplinas em um periodo
    When Eu alocar o horario
    And não houver conflito
    Then Aloque o horario