---
--- Função para calcular a porcentagem de professore dão aula de manhã
---

SET SCHEMA 'flash';

CREATE OR REPLACE FUNCTION percent_prof_horario(horarios_id VARIADIC INT[]) RETURNS DECIMAL AS $$
    DECLARE 
        total DECIMAL;
        part DECIMAL;
    BEGIN
        total := (
                SELECT
                    COUNT(*)
                FROM professor p
                INNER JOIN professor_disciplina pd
                    ON(p.professor_id = pd.professor_id)
                INNER JOIN alocacao a
                    ON(a.professor_disciplina_id = pd.professor_disciplina_id)
            );

        part := (
                SELECT
                    COUNT(*)
                FROM professor p
                INNER JOIN professor_disciplina pd
                    ON(p.professor_id = pd.professor_id)
                INNER JOIN alocacao a
                    ON(a.professor_disciplina_id = pd.professor_disciplina_id)
                WHERE a.horario_id = ANY(horarios)
            );

        RETURN ((part / total) * 100);
    END;

$$ LANGUAGE PLPGSQL;
