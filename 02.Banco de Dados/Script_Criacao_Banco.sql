
CREATE SEQUENCE flash.tipo_espaco_tipo_id_seq;

CREATE TABLE flash.tipo_espaco (
                tipo_id INTEGER NOT NULL DEFAULT nextval('flash.tipo_espaco_tipo_id_seq'),
                descricao VARCHAR NOT NULL,
                CONSTRAINT tipo_espaco_pk PRIMARY KEY (tipo_id)
);


ALTER SEQUENCE flash.tipo_espaco_tipo_id_seq OWNED BY flash.tipo_espaco.tipo_id;

CREATE SEQUENCE flash.espaco_espaco_id_seq;

CREATE TABLE flash.espaco (
                espaco_id INTEGER NOT NULL DEFAULT nextval('flash.espaco_espaco_id_seq'),
                bloco VARCHAR NOT NULL,
                numero INTEGER NOT NULL,
                tipo_id INTEGER NOT NULL,
                CONSTRAINT espaco_pk PRIMARY KEY (espaco_id)
);


ALTER SEQUENCE flash.espaco_espaco_id_seq OWNED BY flash.espaco.espaco_id;

CREATE SEQUENCE flash.dia_semana_dia_semana_id_seq_1;

CREATE TABLE flash.dia_semana (
                dia_semana_id INTEGER NOT NULL DEFAULT nextval('flash.dia_semana_dia_semana_id_seq_1'),
                nome_dia VARCHAR NOT NULL,
                CONSTRAINT dia_semana_id PRIMARY KEY (dia_semana_id)
);


ALTER SEQUENCE flash.dia_semana_dia_semana_id_seq_1 OWNED BY flash.dia_semana.dia_semana_id;

CREATE SEQUENCE flash.area_conhecimento_area_conhecimento_id_seq_1;

CREATE TABLE flash.area_conhecimento (
                area_conhecimento_id INTEGER NOT NULL DEFAULT nextval('flash.area_conhecimento_area_conhecimento_id_seq_1'),
                descricao VARCHAR NOT NULL,
                CONSTRAINT area_conhecimento_pk PRIMARY KEY (area_conhecimento_id)
);


ALTER SEQUENCE flash.area_conhecimento_area_conhecimento_id_seq_1 OWNED BY flash.area_conhecimento.area_conhecimento_id;

CREATE SEQUENCE flash.area_conhecimento_area_conhecimento_id_seq_1_1;

CREATE TABLE flash.sub_area (
                area_conhecimento_id INTEGER NOT NULL DEFAULT nextval('flash.area_conhecimento_area_conhecimento_id_seq_1_1'),
                sub_area_conhecimento_id INTEGER NOT NULL,
                CONSTRAINT sub_area_pk PRIMARY KEY (area_conhecimento_id, sub_area_conhecimento_id)
);


ALTER SEQUENCE flash.area_conhecimento_area_conhecimento_id_seq_1_1 OWNED BY flash.sub_area.area_conhecimento_id;

CREATE SEQUENCE flash.curso_curso_id_seq_1;

CREATE TABLE flash.curso (
                curso_id INTEGER NOT NULL DEFAULT nextval('flash.curso_curso_id_seq_1'),
                nome VARCHAR NOT NULL,
                regime VARCHAR NOT NULL,
                duracao INTEGER NOT NULL,
                sigla VARCHAR NOT NULL,
                CONSTRAINT curso_pk PRIMARY KEY (curso_id)
);


ALTER SEQUENCE flash.curso_curso_id_seq_1 OWNED BY flash.curso.curso_id;

CREATE SEQUENCE flash.horario_horario_id_seq;

CREATE TABLE flash.horario (
                horario_id INTEGER NOT NULL DEFAULT nextval('flash.horario_horario_id_seq'),
                hora_inicio TIME NOT NULL,
                hora_fim TIME NOT NULL,
                CONSTRAINT horario_pk PRIMARY KEY (horario_id)
);


ALTER SEQUENCE flash.horario_horario_id_seq OWNED BY flash.horario.horario_id;

CREATE SEQUENCE flash.endereco_endereco_id_seq_1;

CREATE TABLE flash.endereco (
                endereco_id INTEGER NOT NULL DEFAULT nextval('flash.endereco_endereco_id_seq_1'),
                municipio VARCHAR NOT NULL,
                bairro VARCHAR NOT NULL,
                endereco VARCHAR NOT NULL,
                numero INTEGER NOT NULL,
                cep VARCHAR NOT NULL,
                CONSTRAINT endereco_pk PRIMARY KEY (endereco_id)
);


ALTER SEQUENCE flash.endereco_endereco_id_seq_1 OWNED BY flash.endereco.endereco_id;

CREATE SEQUENCE flash.disciplina_disciplina_id_seq;

CREATE TABLE flash.disciplina (
                disciplina_id INTEGER NOT NULL DEFAULT nextval('flash.disciplina_disciplina_id_seq'),
                nome VARCHAR NOT NULL,
                carga_horaria INTEGER NOT NULL,
                periodo INTEGER NOT NULL,
                curso_id INTEGER NOT NULL,
                area_conhecimento_id INTEGER NOT NULL,
                CONSTRAINT disciplina_pk PRIMARY KEY (disciplina_id)
);


ALTER SEQUENCE flash.disciplina_disciplina_id_seq OWNED BY flash.disciplina.disciplina_id;

CREATE TABLE flash.requisito_curso (
                disciplina_id INTEGER NOT NULL,
                periodo INTEGER NOT NULL,
                CONSTRAINT requisito_curso_pk PRIMARY KEY (disciplina_id, periodo)
);


CREATE TABLE flash.requisito_disciplina (
                disciplina_id INTEGER NOT NULL,
                disciplina_pre_requisito_id INTEGER NOT NULL,
                CONSTRAINT requisito_disciplina_pk PRIMARY KEY (disciplina_id, disciplina_pre_requisito_id)
);


CREATE SEQUENCE flash.professor_professor_id_seq;

CREATE TABLE flash.professor (
                professor_id INTEGER NOT NULL DEFAULT nextval('flash.professor_professor_id_seq'),
                nome VARCHAR NOT NULL,
                email VARCHAR,
                data_nascimento DATE,
                rg VARCHAR,
                cpf VARCHAR,
                matricula VARCHAR NOT NULL,
                endereco_id INTEGER NOT NULL,
                CONSTRAINT professor_pk PRIMARY KEY (professor_id)
);


ALTER SEQUENCE flash.professor_professor_id_seq OWNED BY flash.professor.professor_id;

CREATE SEQUENCE flash.professor_disciplina_professor_disciplina_id_seq_1;

CREATE TABLE flash.professor_disciplina (
                professor_disciplina_id INTEGER NOT NULL DEFAULT nextval('flash.professor_disciplina_professor_disciplina_id_seq_1'),
                professor_id INTEGER NOT NULL,
                disciplina_id INTEGER NOT NULL,
                CONSTRAINT professor_disciplina_pk PRIMARY KEY (professor_disciplina_id)
);


ALTER SEQUENCE flash.professor_disciplina_professor_disciplina_id_seq_1 OWNED BY flash.professor_disciplina.professor_disciplina_id;

CREATE SEQUENCE flash.alocacao_alocacao_id_seq;

CREATE TABLE flash.alocacao (
                alocacao_id INTEGER NOT NULL DEFAULT nextval('flash.alocacao_alocacao_id_seq'),
                horario_id INTEGER NOT NULL,
                dia_semana_id INTEGER NOT NULL,
                espaco_id INTEGER NOT NULL,
                professor_disciplina_id INTEGER NOT NULL,
                CONSTRAINT alocacao_pk PRIMARY KEY (alocacao_id)
);


ALTER SEQUENCE flash.alocacao_alocacao_id_seq OWNED BY flash.alocacao.alocacao_id;

ALTER TABLE flash.espaco ADD CONSTRAINT tipo_espaco_fk
FOREIGN KEY (tipo_id)
REFERENCES flash.tipo_espaco (tipo_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.alocacao ADD CONSTRAINT espaco_alocacao_fk
FOREIGN KEY (espaco_id)
REFERENCES flash.espaco (espaco_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.alocacao ADD CONSTRAINT dia_semana_alocacao_fk
FOREIGN KEY (dia_semana_id)
REFERENCES flash.dia_semana (dia_semana_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.disciplina ADD CONSTRAINT area_conhecimento_disciplina_fk
FOREIGN KEY (area_conhecimento_id)
REFERENCES flash.area_conhecimento (area_conhecimento_id)
ON DELETE NO ACTION
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE flash.sub_area ADD CONSTRAINT area_conhecimento_sub_area_fk
FOREIGN KEY (area_conhecimento_id)
REFERENCES flash.area_conhecimento (area_conhecimento_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.sub_area ADD CONSTRAINT area_conhecimento_sub_area_fk1
FOREIGN KEY (sub_area_conhecimento_id)
REFERENCES flash.area_conhecimento (area_conhecimento_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.disciplina ADD CONSTRAINT curso_disciplina_fk
FOREIGN KEY (curso_id)
REFERENCES flash.curso (curso_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.alocacao ADD CONSTRAINT horario_alocacao_fk
FOREIGN KEY (horario_id)
REFERENCES flash.horario (horario_id)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE flash.professor ADD CONSTRAINT endereco_professor_fk
FOREIGN KEY (endereco_id)
REFERENCES flash.endereco (endereco_id)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE flash.requisito_disciplina ADD CONSTRAINT disciplina_requisito_fk
FOREIGN KEY (disciplina_id)
REFERENCES flash.disciplina (disciplina_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.requisito_disciplina ADD CONSTRAINT disciplina_requisito_fk1
FOREIGN KEY (disciplina_pre_requisito_id)
REFERENCES flash.disciplina (disciplina_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.requisito_curso ADD CONSTRAINT disciplina_requisito_curso_fk
FOREIGN KEY (disciplina_id)
REFERENCES flash.disciplina (disciplina_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.professor_disciplina ADD CONSTRAINT disciplina_professor_disciplina_fk
FOREIGN KEY (disciplina_id)
REFERENCES flash.disciplina (disciplina_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.professor_disciplina ADD CONSTRAINT professor_professor_disciplina_fk
FOREIGN KEY (professor_id)
REFERENCES flash.professor (professor_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.alocacao ADD CONSTRAINT professor_disciplina_alocacao_fk
FOREIGN KEY (professor_disciplina_id)
REFERENCES flash.professor_disciplina (professor_disciplina_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
