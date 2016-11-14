set schema 'flash';
CREATE OR REPLACE FUNCTION historico_disciplinas() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO historico_disciplina(disciplina_id, nome, carga_horaria, periodo, curso_id, area_conhecimento_id)
	VALUES(OLD.disciplina_id, OLD.nome, OLD.carga_horaria, OLD.periodo, OLD.curso_id, OLD.area_conhecimento_id);
	RETURN NULL;
END 
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER historico_disciplinas
BEFORE UPDATE ON disciplina
FOR EACH ROW EXECUTE PROCEDURE historico_disciplinas();

/* CREATE TABLE flash.historico_disciplina(
	historico_disciplina_id SERIAL NOT NULL,
	disciplina_id INTEGER,
	nome VARCHAR,
	carga_horaria INTEGER, 
	periodo INTEGER, 
	curso_id INTEGER, 
	area_conhecimento_id INTEGER
);*/
