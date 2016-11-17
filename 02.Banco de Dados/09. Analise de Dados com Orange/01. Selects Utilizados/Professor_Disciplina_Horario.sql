SET SCHEMA 'flash';

SELECT 
    professor.nome AS PROFESSOR_NOME,
    disciplina.nome AS DISCIPLINA_NOME,
    dia_semana.nome_dia AS DIA_SEMANA,
    horario.hora_inicio AS HORARIO_INICIO,
    horario.hora_fim AS HORARIO_FIM
FROM
    alocacao
INNER JOIN
    professor_disciplina
    ON alocacao.professor_disciplina_id = professor_disciplina.professor_disciplina_id
INNER JOIN
    professor
    ON professor_disciplina.professor_id = professor.professor_id
INNER JOIN
    disciplina
    ON professor_disciplina.disciplina_id = disciplina.disciplina_id
INNER JOIN
    horario
    ON alocacao.horario_id = horario.horario_id
INNER JOIN
    dia_semana
    ON alocacao.dia_semana_id = dia_semana.dia_semana_id;