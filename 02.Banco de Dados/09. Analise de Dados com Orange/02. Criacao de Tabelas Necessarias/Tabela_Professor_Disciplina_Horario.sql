SET SCHEMA 'public';

CREATE TABLE orange_professor_disciplina_horario AS (

	SELECT
	    professor.professor_id AS PROFESSOR_ID,
	    professor.nome AS PROFESSOR_NOME,
	    disciplina.disciplina_id AS DISCIPLINA_ID,
	    disciplina.nome AS DISCIPLINA_NOME,
	    dia_semana.dia_semana_id AS DIA_SEMANA_ID,
	    dia_semana.nome_dia AS DIA_SEMANA,
	    horario.horario_id AS HORARIO_ID,
	    horario.hora_inicio AS HORARIO_INICIO,
	    horario.hora_fim AS HORARIO_FIM
	FROM
	    flash.alocacao
	INNER JOIN
	    flash.professor_disciplina
	    ON alocacao.professor_disciplina_id = professor_disciplina.professor_disciplina_id
	INNER JOIN
	    flash.professor
	    ON professor_disciplina.professor_id = professor.professor_id
	INNER JOIN
	    flash.disciplina
	    ON professor_disciplina.disciplina_id = disciplina.disciplina_id
	INNER JOIN
	    flash.horario
	    ON alocacao.horario_id = horario.horario_id
	INNER JOIN
	    flash.dia_semana
	    ON alocacao.dia_semana_id = dia_semana.dia_semana_id

)