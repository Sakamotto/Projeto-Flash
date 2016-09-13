
CREATE SEQUENCE projetoflash.curso_curso_id_seq;

CREATE TABLE projetoflash.curso (
                curso_id INTEGER NOT NULL DEFAULT nextval('projetoflash.curso_curso_id_seq'),
                nome VARCHAR NOT NULL,
                regime VARCHAR NOT NULL,
                duracao INTEGER NOT NULL,
                sigla VARCHAR NOT NULL,
                CONSTRAINT curso_pk PRIMARY KEY (curso_id)
);


ALTER SEQUENCE projetoflash.curso_curso_id_seq OWNED BY projetoflash.curso.curso_id;

CREATE SEQUENCE projetoflash.horario_horario_id_seq;

CREATE TABLE projetoflash.horario (
                horario_id INTEGER NOT NULL DEFAULT nextval('projetoflash.horario_horario_id_seq'),
                hora_inicio TIME NOT NULL,
                hora_fim TIME NOT NULL,
                data DATE NOT NULL,
                CONSTRAINT horario_pk PRIMARY KEY (horario_id)
);


ALTER SEQUENCE projetoflash.horario_horario_id_seq OWNED BY projetoflash.horario.horario_id;

CREATE SEQUENCE projetoflash.endereco_endereco_id_seq_1;

CREATE TABLE projetoflash.endereco (
                endereco_id INTEGER NOT NULL DEFAULT nextval('projetoflash.endereco_endereco_id_seq_1'),
                rua VARCHAR NOT NULL,
                bairro VARCHAR NOT NULL,
                municipio VARCHAR NOT NULL,
                cep VARCHAR NOT NULL,
                CONSTRAINT endereco_pk PRIMARY KEY (endereco_id)
);


ALTER SEQUENCE projetoflash.endereco_endereco_id_seq_1 OWNED BY projetoflash.endereco.endereco_id;

CREATE SEQUENCE projetoflash.espaco_espaco_id_seq;

CREATE TABLE projetoflash.espaco (
                espaco_id INTEGER NOT NULL DEFAULT nextval('projetoflash.espaco_espaco_id_seq'),
                tipo VARCHAR NOT NULL,
                bloco VARCHAR NOT NULL,
                numero INTEGER NOT NULL,
                CONSTRAINT espaco_pk PRIMARY KEY (espaco_id)
);


ALTER SEQUENCE projetoflash.espaco_espaco_id_seq OWNED BY projetoflash.espaco.espaco_id;

CREATE SEQUENCE projetoflash.professor_professor_id_seq;

CREATE TABLE projetoflash.professor (
                professor_id INTEGER NOT NULL DEFAULT nextval('projetoflash.professor_professor_id_seq'),
                nome VARCHAR NOT NULL,
                matricula VARCHAR NOT NULL,
                cpf VARCHAR,
                endereco_id INTEGER NOT NULL,
                CONSTRAINT professor_pk PRIMARY KEY (professor_id)
);


ALTER SEQUENCE projetoflash.professor_professor_id_seq OWNED BY projetoflash.professor.professor_id;

CREATE SEQUENCE projetoflash.area_conhecimento_area_conhecimento_id_seq;

CREATE TABLE projetoflash.area_conhecimento (
                area_conhecimento_id INTEGER NOT NULL DEFAULT nextval('projetoflash.area_conhecimento_area_conhecimento_id_seq'),
                descricao VARCHAR NOT NULL,
                professor_id INTEGER NOT NULL,
                sub_area_de_area_conhecimento_id INTEGER,
                CONSTRAINT area_conhecimento_pk PRIMARY KEY (area_conhecimento_id)
);


ALTER SEQUENCE projetoflash.area_conhecimento_area_conhecimento_id_seq OWNED BY projetoflash.area_conhecimento.area_conhecimento_id;

CREATE SEQUENCE projetoflash.disciplina_disciplina_id_seq;

CREATE TABLE projetoflash.disciplina (
                disciplina_id INTEGER NOT NULL DEFAULT nextval('projetoflash.disciplina_disciplina_id_seq'),
                area_conhecimento_id INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                carga_horaria INTEGER NOT NULL,
                periodo INTEGER NOT NULL,
                curso_id INTEGER NOT NULL,
                requisito_disciplina_id INTEGER,
                CONSTRAINT disciplina_pk PRIMARY KEY (disciplina_id, area_conhecimento_id)
);


ALTER SEQUENCE projetoflash.disciplina_disciplina_id_seq OWNED BY projetoflash.disciplina.disciplina_id;

CREATE SEQUENCE projetoflash.espaco_alocado_espaco_alocado_id_seq;

CREATE TABLE projetoflash.Espaco_alocado (
                espaco_alocado_id INTEGER NOT NULL DEFAULT nextval('projetoflash.espaco_alocado_espaco_alocado_id_seq'),
                professor_id INTEGER NOT NULL,
                horario_id INTEGER NOT NULL,
                espaco_id INTEGER NOT NULL,
                disciplina_id INTEGER NOT NULL,
                CONSTRAINT espaco_alocado_pk PRIMARY KEY (espaco_alocado_id)
);


ALTER SEQUENCE projetoflash.espaco_alocado_espaco_alocado_id_seq OWNED BY projetoflash.Espaco_alocado.espaco_alocado_id;

ALTER TABLE projetoflash.disciplina ADD CONSTRAINT curso_disciplina_fk
FOREIGN KEY (curso_id)
REFERENCES projetoflash.curso (curso_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projetoflash.Espaco_alocado ADD CONSTRAINT horario_espaco_alocado_fk
FOREIGN KEY (horario_id)
REFERENCES projetoflash.horario (horario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projetoflash.professor ADD CONSTRAINT endereco_professor_fk
FOREIGN KEY (endereco_id)
REFERENCES projetoflash.endereco (endereco_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projetoflash.Espaco_alocado ADD CONSTRAINT espaco_espaco_alocado_fk
FOREIGN KEY (espaco_id)
REFERENCES projetoflash.espaco (espaco_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projetoflash.Espaco_alocado ADD CONSTRAINT professor_espaco_alocado_fk
FOREIGN KEY (professor_id)
REFERENCES projetoflash.professor (professor_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projetoflash.area_conhecimento ADD CONSTRAINT professor_area_conhecimento_fk
FOREIGN KEY (professor_id)
REFERENCES projetoflash.professor (professor_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projetoflash.area_conhecimento ADD CONSTRAINT area_conhecimento_area_conhecimento_fk
FOREIGN KEY (sub_area_de_area_conhecimento_id)
REFERENCES projetoflash.area_conhecimento (area_conhecimento_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projetoflash.disciplina ADD CONSTRAINT area_conhecimento_disciplina_fk
FOREIGN KEY (area_conhecimento_id)
REFERENCES projetoflash.area_conhecimento (area_conhecimento_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projetoflash.Espaco_alocado ADD CONSTRAINT disciplina_espaco_alocado_fk
FOREIGN KEY (disciplina_id)
REFERENCES projetoflash.disciplina (disciplina_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projetoflash.disciplina ADD CONSTRAINT disciplina_disciplina_fk
FOREIGN KEY (requisito_disciplina_id)
REFERENCES projetoflash.disciplina (disciplina_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
