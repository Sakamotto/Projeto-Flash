Feature: Validar CPF

  Esse valida CPF realiza o algoritmo de validacao de CPF.

  Scenario: CPF Invalido
    Given Eu entro com o CPF "15622874786"
    When Eu quero validar
    Then O cpf eh invalido


  Scenario: CPF Valido
    Given Eu entro com o CPF "15622874785"
    When Eu quero validar
    Then O cpf eh valido