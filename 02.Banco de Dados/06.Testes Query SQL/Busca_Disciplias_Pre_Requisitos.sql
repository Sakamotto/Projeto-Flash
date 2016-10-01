-- Essa consulta busca disciplinas que possuem uma determinada disciplina como pré-requisito.

SELECT
disciplina.nome AS DISCIPLINA

FROM flash.disciplina
INNER JOIN flash.requisito_disciplina
ON requisito_disciplina.disciplina_id = disciplina.disciplina_id

WHERE 

requisito_disciplina.disciplina_pre_requisito_id IN (
	SELECT disciplina.disciplina_id FROM flash.disciplina WHERE disciplina.nome ILIKE '%Sociologia%'
)