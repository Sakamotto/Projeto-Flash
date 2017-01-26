# language: pt

Funcionalidade: Professor nao tendo duas alocacoes em um mesmo horario

  Um professor nao pode ter duas alocacoes no mesmo dia e no mesmo horario.

  Cenario: Um professor esta alocado em duas disciplinas em um mesmo dia e horario
    Dado Existe um conjunto de professores alocados a um conjunto de disciplinas
    Quando Eu alocar os horarios que geram conflito de horarios dos professores
    Entao Enviar mensagem de conflito de horarios de professor


  Cenario: Nenhum professor possui alocacoes em um mesmo dia e mesmo horario
    Dado Existe um conjunto de professores alocados a um conjunto de disciplinas
    Quando Alocar os horarios que nao geram conflito de horarios dos professores
    Entao Aloque o horario