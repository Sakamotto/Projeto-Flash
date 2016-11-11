set schema 'flash';
--- Assertion #1
CREATE OR REPLACE FUNCTION horarios_unicos() RETURNS TRIGGER AS $$
	BEGIN
		IF EXISTS (
			SELECT
			    *
			FROM horario h
			WHERE h.hora_fim = NEW.hora_fim
			    AND NEW.hora_inicio = h.hora_inicio
		) THEN
			RAISE EXCEPTION '%,% Esse registro já existe! ', NEW.hora_inicio, NEW.hora_fim;
		END IF;

		RETURN NEW;
	END;
$$ LANGUAGE PLPGSQL;

--- Assertion #2

CREATE TRIGGER horarios_unicos BEFORE INSERT OR UPDATE ON horario
	FOR EACH ROW EXECUTE PROCEDURE horarios_unicos();

CREATE OR REPLACE FUNCTION not_matriculas_iguais() RETURNS TRIGGER AS $$
	BEGIN
		IF EXISTS (SELECT matricula FROM professor WHERE matricula = NEW.matricula) THEN
			RAISE EXCEPTION 'A matrícula % já existe!', NEW.matricula;
		END IF;
		RETURN NULL;
	END
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER not_matriculas_iguais
AFTER INSERT OR UPDATE ON flash.professor
FOR EACH ROW EXECUTE PROCEDURE not_matriculas_iguais();

