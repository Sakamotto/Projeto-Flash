
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

CREATE SEQUENCE flash.endereco_endereco_id_seq_1;

CREATE TABLE flash.endereco (
                endereco_id INTEGER NOT NULL DEFAULT nextval('flash.endereco_endereco_id_seq_1'),
                rua VARCHAR NOT NULL,
                bairro VARCHAR NOT NULL,
                municipio VARCHAR NOT NULL,
                cep VARCHAR NOT NULL,
                CONSTRAINT endereco_pk PRIMARY KEY (endereco_id)
);


ALTER SEQUENCE flash.endereco_endereco_id_seq_1 OWNED BY flash.endereco.endereco_id;

CREATE SEQUENCE flash.professor_professor_id_seq;

CREATE TABLE flash.professor (
                professor_id INTEGER NOT NULL DEFAULT nextval('flash.professor_professor_id_seq'),
                nome VARCHAR NOT NULL,
                matricula VARCHAR NOT NULL,
                cpf VARCHAR,
                endereco_id INTEGER NOT NULL,
                CONSTRAINT professor_pk PRIMARY KEY (professor_id)
);


ALTER SEQUENCE flash.professor_professor_id_seq OWNED BY flash.professor.professor_id;

CREATE SEQUENCE flash.disciplina_disciplina_id_seq;

CREATE TABLE flash.disciplina (
                disciplina_id INTEGER NOT NULL DEFAULT nextval('flash.disciplina_disciplina_id_seq'),
                nome VARCHAR NOT NULL,
                carga_horaria INTEGER NOT NULL,
                periodo INTEGER NOT NULL,
                curso_id INTEGER NOT NULL,
                requisito_equivalencia_disciplina_id INTEGER,
                area_conhecimento_id INTEGER NOT NULL,
                professor_id INTEGER,
                CONSTRAINT disciplina_pk PRIMARY KEY (disciplina_id)
);


ALTER SEQUENCE flash.disciplina_disciplina_id_seq OWNED BY flash.disciplina.disciplina_id;

CREATE SEQUENCE flash.horario_horario_id_seq;

CREATE TABLE flash.horario (
                horario_id INTEGER NOT NULL DEFAULT nextval('flash.horario_horario_id_seq'),
                hora_inicio TIME NOT NULL,
                hora_fim TIME NOT NULL,
                disciplina_id INTEGER NOT NULL,
                dia_semana_id INTEGER NOT NULL,
                CONSTRAINT horario_pk PRIMARY KEY (horario_id)
);


ALTER SEQUENCE flash.horario_horario_id_seq OWNED BY flash.horario.horario_id;

ALTER TABLE flash.horario ADD CONSTRAINT dia_semana_horario_fk
FOREIGN KEY (dia_semana_id)
REFERENCES flash.dia_semana (dia_semana_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.disciplina ADD CONSTRAINT area_conhecimento_disciplina_fk
FOREIGN KEY (area_conhecimento_id)
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

ALTER TABLE flash.professor ADD CONSTRAINT endereco_professor_fk
FOREIGN KEY (endereco_id)
REFERENCES flash.endereco (endereco_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.disciplina ADD CONSTRAINT professor_disciplina_fk
FOREIGN KEY (professor_id)
REFERENCES flash.professor (professor_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.disciplina ADD CONSTRAINT disciplina_disciplina_fk
FOREIGN KEY (requisito_equivalencia_disciplina_id)
REFERENCES flash.disciplina (disciplina_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE flash.horario ADD CONSTRAINT disciplina_horario_fk
FOREIGN KEY (disciplina_id)
REFERENCES flash.disciplina (disciplina_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;




-- Inserção

INSERT INTO flash.area_conhecimento (descricao)
VALUES
('Matemática'),
('Ciência da Computação'),
('Física'),
('Química'),
('GeoCiências'),
('Oceanografia'),
('Engenharia de Materiais e Metalúrgica'),
('Engenharia Elétrica'),
('Engenharia Mecânica'),
('Engenharia Mecânica');

INSERT INTO flash.curso (nome, regime, duracao, sigla)
VALUES
('Bacharelado em Sistemas de Informação', 'Créditos', 2520, 'BSI'),
('Engenharia de Controle e Automação', 'Créditos', 3645, 'ECA');

INSERT INTO flash.dia_semana (nome_dia)
VALUES
('Domingo'),
('Segunda-feira'),
('Terça-feira'),
('Quarta-feira'),
('Quinta-feira'),
('Sexta-feira'),
('Sábado');