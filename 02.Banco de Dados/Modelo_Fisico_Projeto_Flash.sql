
CREATE SEQUENCE public.curso_curso_id_seq_1;

CREATE TABLE public.curso (
                curso_id INTEGER NOT NULL DEFAULT nextval('public.curso_curso_id_seq_1'),
                nome VARCHAR NOT NULL,
                regime VARCHAR NOT NULL,
                duracao INTEGER NOT NULL,
                sigla VARCHAR NOT NULL,
                CONSTRAINT curso_pk PRIMARY KEY (curso_id)
);


ALTER SEQUENCE public.curso_curso_id_seq_1 OWNED BY public.curso.curso_id;

CREATE SEQUENCE public.horario_horario_id_seq;

CREATE TABLE public.horario (
                horario_id INTEGER NOT NULL DEFAULT nextval('public.horario_horario_id_seq'),
                hora_inicio TIME NOT NULL,
                hora_fim TIME NOT NULL,
                data DATE NOT NULL,
                CONSTRAINT horario_pk PRIMARY KEY (horario_id)
);


ALTER SEQUENCE public.horario_horario_id_seq OWNED BY public.horario.horario_id;

CREATE SEQUENCE public.endereco_endereco_id_seq_1;

CREATE TABLE public.endereco (
                endereco_id INTEGER NOT NULL DEFAULT nextval('public.endereco_endereco_id_seq_1'),
                rua VARCHAR NOT NULL,
                bairro VARCHAR NOT NULL,
                municipio VARCHAR NOT NULL,
                cep VARCHAR NOT NULL,
                CONSTRAINT endereco_pk PRIMARY KEY (endereco_id)
);


ALTER SEQUENCE public.endereco_endereco_id_seq_1 OWNED BY public.endereco.endereco_id;

CREATE SEQUENCE public.espaco_espaco_id_seq;

CREATE TABLE public.espaco (
                espaco_id INTEGER NOT NULL DEFAULT nextval('public.espaco_espaco_id_seq'),
                tipo VARCHAR NOT NULL,
                bloco VARCHAR NOT NULL,
                numero INTEGER NOT NULL,
                CONSTRAINT espaco_pk PRIMARY KEY (espaco_id)
);


ALTER SEQUENCE public.espaco_espaco_id_seq OWNED BY public.espaco.espaco_id;

CREATE SEQUENCE public.disciplina_disciplina_id_seq;

CREATE TABLE public.disciplina (
                disciplina_id INTEGER NOT NULL DEFAULT nextval('public.disciplina_disciplina_id_seq'),
                nome VARCHAR NOT NULL,
                carga_horaria INTEGER NOT NULL,
                periodo INTEGER NOT NULL,
                curso_id INTEGER NOT NULL,
                CONSTRAINT disciplina_pk PRIMARY KEY (disciplina_id)
);


ALTER SEQUENCE public.disciplina_disciplina_id_seq OWNED BY public.disciplina.disciplina_id;

CREATE SEQUENCE public.professor_professor_id_seq;

CREATE TABLE public.professor (
                professor_id INTEGER NOT NULL DEFAULT nextval('public.professor_professor_id_seq'),
                nome VARCHAR NOT NULL,
                matricula VARCHAR NOT NULL,
                cpf VARCHAR,
                endereco_id INTEGER NOT NULL,
                CONSTRAINT professor_pk PRIMARY KEY (professor_id)
);


ALTER SEQUENCE public.professor_professor_id_seq OWNED BY public.professor.professor_id;

CREATE SEQUENCE public.area_conhecimento_area_conhecimento_id_seq;

CREATE TABLE public.area_conhecimento (
                area_conhecimento_id INTEGER NOT NULL DEFAULT nextval('public.area_conhecimento_area_conhecimento_id_seq'),
                descricao VARCHAR NOT NULL,
                professor_id INTEGER NOT NULL,
                CONSTRAINT area_conhecimento_pk PRIMARY KEY (area_conhecimento_id)
);


ALTER SEQUENCE public.area_conhecimento_area_conhecimento_id_seq OWNED BY public.area_conhecimento.area_conhecimento_id;

CREATE SEQUENCE public.espaco_alocado_espaco_alocado_id_seq;

CREATE TABLE public.Espaco_alocado (
                espaco_alocado_id INTEGER NOT NULL DEFAULT nextval('public.espaco_alocado_espaco_alocado_id_seq'),
                professor_id INTEGER NOT NULL,
                horario_id INTEGER NOT NULL,
                espaco_id INTEGER NOT NULL,
                disciplina_id INTEGER NOT NULL,
                CONSTRAINT espaco_alocado_pk PRIMARY KEY (espaco_alocado_id)
);


ALTER SEQUENCE public.espaco_alocado_espaco_alocado_id_seq OWNED BY public.Espaco_alocado.espaco_alocado_id;

ALTER TABLE public.disciplina ADD CONSTRAINT curso_disciplina_fk
FOREIGN KEY (curso_id)
REFERENCES public.curso (curso_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Espaco_alocado ADD CONSTRAINT horario_espaco_alocado_fk
FOREIGN KEY (horario_id)
REFERENCES public.horario (horario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.professor ADD CONSTRAINT endereco_professor_fk
FOREIGN KEY (endereco_id)
REFERENCES public.endereco (endereco_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Espaco_alocado ADD CONSTRAINT espaco_espaco_alocado_fk
FOREIGN KEY (espaco_id)
REFERENCES public.espaco (espaco_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Espaco_alocado ADD CONSTRAINT disciplina_espaco_alocado_fk
FOREIGN KEY (disciplina_id)
REFERENCES public.disciplina (disciplina_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Espaco_alocado ADD CONSTRAINT professor_espaco_alocado_fk
FOREIGN KEY (professor_id)
REFERENCES public.professor (professor_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.area_conhecimento ADD CONSTRAINT professor_area_conhecimento_fk
FOREIGN KEY (professor_id)
REFERENCES public.professor (professor_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
