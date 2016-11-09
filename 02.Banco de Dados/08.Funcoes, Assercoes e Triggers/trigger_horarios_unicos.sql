set schema 'flash';

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

CREATE TRIGGER horarios_unicos BEFORE INSERT OR UPDATE ON horario
	FOR EACH ROW EXECUTE PROCEDURE horarios_unicos();

