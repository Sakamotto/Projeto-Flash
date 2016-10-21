--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.8
-- Dumped by pg_dump version 9.4.8
-- Started on 2016-10-21 17:45:39 BRST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 27736)
-- Name: flash; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA flash;


ALTER SCHEMA flash OWNER TO postgres;

SET search_path = flash, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 200 (class 1259 OID 28178)
-- Name: alocacao; Type: TABLE; Schema: flash; Owner: postgres; Tablespace: 
--

CREATE TABLE alocacao (
    alocacao_id integer NOT NULL,
    horario_id integer NOT NULL,
    dia_semana_id integer NOT NULL,
    espaco_id integer NOT NULL,
    professor_disciplina_id integer NOT NULL
);


ALTER TABLE alocacao OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 28176)
-- Name: alocacao_alocacao_id_seq; Type: SEQUENCE; Schema: flash; Owner: postgres
--

CREATE SEQUENCE alocacao_alocacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alocacao_alocacao_id_seq OWNER TO postgres;

--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 199
-- Name: alocacao_alocacao_id_seq; Type: SEQUENCE OWNED BY; Schema: flash; Owner: postgres
--

ALTER SEQUENCE alocacao_alocacao_id_seq OWNED BY alocacao.alocacao_id;


--
-- TOC entry 174 (class 1259 OID 27737)
-- Name: alocacao_id_seq; Type: SEQUENCE; Schema: flash; Owner: postgres
--

CREATE SEQUENCE alocacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alocacao_id_seq OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 27743)
-- Name: area_conhecimento; Type: TABLE; Schema: flash; Owner: postgres; Tablespace: 
--

CREATE TABLE area_conhecimento (
    area_conhecimento_id integer NOT NULL,
    descricao character varying NOT NULL
);


ALTER TABLE area_conhecimento OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 27749)
-- Name: area_conhecimento_area_conhecimento_id_seq_1; Type: SEQUENCE; Schema: flash; Owner: postgres
--

CREATE SEQUENCE area_conhecimento_area_conhecimento_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE area_conhecimento_area_conhecimento_id_seq_1 OWNER TO postgres;

--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 176
-- Name: area_conhecimento_area_conhecimento_id_seq_1; Type: SEQUENCE OWNED BY; Schema: flash; Owner: postgres
--

ALTER SEQUENCE area_conhecimento_area_conhecimento_id_seq_1 OWNED BY area_conhecimento.area_conhecimento_id;


--
-- TOC entry 177 (class 1259 OID 27751)
-- Name: curso; Type: TABLE; Schema: flash; Owner: postgres; Tablespace: 
--

CREATE TABLE curso (
    curso_id integer NOT NULL,
    nome character varying NOT NULL,
    regime character varying NOT NULL,
    duracao integer NOT NULL,
    sigla character varying NOT NULL
);


ALTER TABLE curso OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 27757)
-- Name: curso_curso_id_seq_1; Type: SEQUENCE; Schema: flash; Owner: postgres
--

CREATE SEQUENCE curso_curso_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE curso_curso_id_seq_1 OWNER TO postgres;

--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 178
-- Name: curso_curso_id_seq_1; Type: SEQUENCE OWNED BY; Schema: flash; Owner: postgres
--

ALTER SEQUENCE curso_curso_id_seq_1 OWNED BY curso.curso_id;


--
-- TOC entry 179 (class 1259 OID 27759)
-- Name: dia_semana; Type: TABLE; Schema: flash; Owner: postgres; Tablespace: 
--

CREATE TABLE dia_semana (
    dia_semana_id integer NOT NULL,
    nome_dia character varying NOT NULL
);


ALTER TABLE dia_semana OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 27765)
-- Name: dia_semana_dia_semana_id_seq_1; Type: SEQUENCE; Schema: flash; Owner: postgres
--

CREATE SEQUENCE dia_semana_dia_semana_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dia_semana_dia_semana_id_seq_1 OWNER TO postgres;

--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 180
-- Name: dia_semana_dia_semana_id_seq_1; Type: SEQUENCE OWNED BY; Schema: flash; Owner: postgres
--

ALTER SEQUENCE dia_semana_dia_semana_id_seq_1 OWNED BY dia_semana.dia_semana_id;


--
-- TOC entry 181 (class 1259 OID 27767)
-- Name: disciplina; Type: TABLE; Schema: flash; Owner: postgres; Tablespace: 
--

CREATE TABLE disciplina (
    disciplina_id integer NOT NULL,
    nome character varying NOT NULL,
    carga_horaria integer NOT NULL,
    periodo integer NOT NULL,
    curso_id integer NOT NULL,
    area_conhecimento_id integer NOT NULL
);


ALTER TABLE disciplina OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 27773)
-- Name: disciplina_disciplina_id_seq; Type: SEQUENCE; Schema: flash; Owner: postgres
--

CREATE SEQUENCE disciplina_disciplina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE disciplina_disciplina_id_seq OWNER TO postgres;

--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 182
-- Name: disciplina_disciplina_id_seq; Type: SEQUENCE OWNED BY; Schema: flash; Owner: postgres
--

ALTER SEQUENCE disciplina_disciplina_id_seq OWNED BY disciplina.disciplina_id;


--
-- TOC entry 183 (class 1259 OID 27775)
-- Name: endereco; Type: TABLE; Schema: flash; Owner: postgres; Tablespace: 
--

CREATE TABLE endereco (
    endereco_id integer NOT NULL,
    municipio character varying NOT NULL,
    bairro character varying NOT NULL,
    endereco character varying NOT NULL,
    numero integer NOT NULL,
    cep character varying NOT NULL
);


ALTER TABLE endereco OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 27781)
-- Name: endereco_endereco_id_seq_1; Type: SEQUENCE; Schema: flash; Owner: postgres
--

CREATE SEQUENCE endereco_endereco_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE endereco_endereco_id_seq_1 OWNER TO postgres;

--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 184
-- Name: endereco_endereco_id_seq_1; Type: SEQUENCE OWNED BY; Schema: flash; Owner: postgres
--

ALTER SEQUENCE endereco_endereco_id_seq_1 OWNED BY endereco.endereco_id;


--
-- TOC entry 185 (class 1259 OID 27783)
-- Name: espaco; Type: TABLE; Schema: flash; Owner: postgres; Tablespace: 
--

CREATE TABLE espaco (
    espaco_id integer NOT NULL,
    bloco character varying NOT NULL,
    numero integer NOT NULL,
    tipo_id integer NOT NULL
);


ALTER TABLE espaco OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 28149)
-- Name: horario; Type: TABLE; Schema: flash; Owner: postgres; Tablespace: 
--

CREATE TABLE horario (
    horario_id integer NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fim time without time zone NOT NULL
);


ALTER TABLE horario OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 28147)
-- Name: horario_horario_id_seq; Type: SEQUENCE; Schema: flash; Owner: postgres
--

CREATE SEQUENCE horario_horario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE horario_horario_id_seq OWNER TO postgres;

--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 195
-- Name: horario_horario_id_seq; Type: SEQUENCE OWNED BY; Schema: flash; Owner: postgres
--

ALTER SEQUENCE horario_horario_id_seq OWNED BY horario.horario_id;


--
-- TOC entry 186 (class 1259 OID 27794)
-- Name: professor; Type: TABLE; Schema: flash; Owner: postgres; Tablespace: 
--

CREATE TABLE professor (
    professor_id integer NOT NULL,
    nome character varying NOT NULL,
    email character varying,
    data_nascimento date,
    rg character varying,
    cpf character varying,
    matricula character varying NOT NULL,
    endereco_id integer NOT NULL
);


ALTER TABLE professor OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 28158)
-- Name: professor_disciplina_professor_disciplina_id_seq_1; Type: SEQUENCE; Schema: flash; Owner: postgres
--

CREATE SEQUENCE professor_disciplina_professor_disciplina_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE professor_disciplina_professor_disciplina_id_seq_1 OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 28160)
-- Name: professor_disciplina; Type: TABLE; Schema: flash; Owner: postgres; Tablespace: 
--

CREATE TABLE professor_disciplina (
    professor_disciplina_id integer DEFAULT nextval('professor_disciplina_professor_disciplina_id_seq_1'::regclass) NOT NULL,
    professor_id integer NOT NULL,
    disciplina_id integer NOT NULL
);


ALTER TABLE professor_disciplina OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 27800)
-- Name: professor_professor_id_seq; Type: SEQUENCE; Schema: flash; Owner: postgres
--

CREATE SEQUENCE professor_professor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE professor_professor_id_seq OWNER TO postgres;

--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 187
-- Name: professor_professor_id_seq; Type: SEQUENCE OWNED BY; Schema: flash; Owner: postgres
--

ALTER SEQUENCE professor_professor_id_seq OWNED BY professor.professor_id;


--
-- TOC entry 188 (class 1259 OID 27802)
-- Name: requisito_curso; Type: TABLE; Schema: flash; Owner: postgres; Tablespace: 
--

CREATE TABLE requisito_curso (
    disciplina_id integer NOT NULL,
    periodo integer NOT NULL
);


ALTER TABLE requisito_curso OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 27805)
-- Name: requisito_disciplina; Type: TABLE; Schema: flash; Owner: postgres; Tablespace: 
--

CREATE TABLE requisito_disciplina (
    disciplina_id integer NOT NULL,
    disciplina_pre_requisito_id integer NOT NULL
);


ALTER TABLE requisito_disciplina OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 27808)
-- Name: sub_area; Type: TABLE; Schema: flash; Owner: postgres; Tablespace: 
--

CREATE TABLE sub_area (
    area_conhecimento_id integer NOT NULL,
    sub_area_conhecimento_id integer NOT NULL
);


ALTER TABLE sub_area OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 27811)
-- Name: tipo_espaco; Type: TABLE; Schema: flash; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_espaco (
    tipo_id integer NOT NULL,
    descricao character varying NOT NULL
);


ALTER TABLE tipo_espaco OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 27817)
-- Name: tipo_espaco_tipo_id_seq; Type: SEQUENCE; Schema: flash; Owner: postgres
--

CREATE SEQUENCE tipo_espaco_tipo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_espaco_tipo_id_seq OWNER TO postgres;

--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 192
-- Name: tipo_espaco_tipo_id_seq; Type: SEQUENCE OWNED BY; Schema: flash; Owner: postgres
--

ALTER SEQUENCE tipo_espaco_tipo_id_seq OWNED BY tipo_espaco.tipo_id;


--
-- TOC entry 2016 (class 2604 OID 28181)
-- Name: alocacao_id; Type: DEFAULT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY alocacao ALTER COLUMN alocacao_id SET DEFAULT nextval('alocacao_alocacao_id_seq'::regclass);


--
-- TOC entry 2007 (class 2604 OID 27824)
-- Name: area_conhecimento_id; Type: DEFAULT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY area_conhecimento ALTER COLUMN area_conhecimento_id SET DEFAULT nextval('area_conhecimento_area_conhecimento_id_seq_1'::regclass);


--
-- TOC entry 2008 (class 2604 OID 27825)
-- Name: curso_id; Type: DEFAULT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY curso ALTER COLUMN curso_id SET DEFAULT nextval('curso_curso_id_seq_1'::regclass);


--
-- TOC entry 2009 (class 2604 OID 27826)
-- Name: dia_semana_id; Type: DEFAULT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY dia_semana ALTER COLUMN dia_semana_id SET DEFAULT nextval('dia_semana_dia_semana_id_seq_1'::regclass);


--
-- TOC entry 2010 (class 2604 OID 27827)
-- Name: disciplina_id; Type: DEFAULT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY disciplina ALTER COLUMN disciplina_id SET DEFAULT nextval('disciplina_disciplina_id_seq'::regclass);


--
-- TOC entry 2011 (class 2604 OID 27828)
-- Name: endereco_id; Type: DEFAULT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY endereco ALTER COLUMN endereco_id SET DEFAULT nextval('endereco_endereco_id_seq_1'::regclass);


--
-- TOC entry 2014 (class 2604 OID 28152)
-- Name: horario_id; Type: DEFAULT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY horario ALTER COLUMN horario_id SET DEFAULT nextval('horario_horario_id_seq'::regclass);


--
-- TOC entry 2012 (class 2604 OID 27830)
-- Name: professor_id; Type: DEFAULT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY professor ALTER COLUMN professor_id SET DEFAULT nextval('professor_professor_id_seq'::regclass);


--
-- TOC entry 2013 (class 2604 OID 27831)
-- Name: tipo_id; Type: DEFAULT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY tipo_espaco ALTER COLUMN tipo_id SET DEFAULT nextval('tipo_espaco_tipo_id_seq'::regclass);


--
-- TOC entry 2193 (class 0 OID 28178)
-- Dependencies: 200
-- Data for Name: alocacao; Type: TABLE DATA; Schema: flash; Owner: postgres
--



--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 199
-- Name: alocacao_alocacao_id_seq; Type: SEQUENCE SET; Schema: flash; Owner: postgres
--

SELECT pg_catalog.setval('alocacao_alocacao_id_seq', 1, false);


--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 174
-- Name: alocacao_id_seq; Type: SEQUENCE SET; Schema: flash; Owner: postgres
--

SELECT pg_catalog.setval('alocacao_id_seq', 1500000, true);


--
-- TOC entry 2170 (class 0 OID 27743)
-- Dependencies: 175
-- Data for Name: area_conhecimento; Type: TABLE DATA; Schema: flash; Owner: postgres
--

INSERT INTO area_conhecimento VALUES (1, 'Ciências Exatas e da Terra');
INSERT INTO area_conhecimento VALUES (2, 'Matemática');
INSERT INTO area_conhecimento VALUES (3, 'Álgebra');
INSERT INTO area_conhecimento VALUES (4, 'Conjuntos');
INSERT INTO area_conhecimento VALUES (5, 'Lógica Matemática');
INSERT INTO area_conhecimento VALUES (6, 'Teoria dos Números');
INSERT INTO area_conhecimento VALUES (7, 'Grupos de Álgebra Não-Comutaviva');
INSERT INTO area_conhecimento VALUES (8, 'Álgebra Comutativa');
INSERT INTO area_conhecimento VALUES (9, 'Geometria Algébrica');
INSERT INTO area_conhecimento VALUES (10, 'Análise');
INSERT INTO area_conhecimento VALUES (11, 'Análise Complexa');
INSERT INTO area_conhecimento VALUES (12, 'Análise Funcional');
INSERT INTO area_conhecimento VALUES (13, 'Análise Funcional Não-Linear');
INSERT INTO area_conhecimento VALUES (14, 'Equações Diferenciais Ordinárias');
INSERT INTO area_conhecimento VALUES (15, 'Equações Diferenciais Parciais');
INSERT INTO area_conhecimento VALUES (16, 'Equações Diferenciais Funcionais');
INSERT INTO area_conhecimento VALUES (17, 'Geometria e Topologia');
INSERT INTO area_conhecimento VALUES (18, 'Geometria Diferencial');
INSERT INTO area_conhecimento VALUES (19, 'Topologia Algébrica');
INSERT INTO area_conhecimento VALUES (20, 'Topologia das Variedades');
INSERT INTO area_conhecimento VALUES (21, 'Sistemas Dinâmicos');
INSERT INTO area_conhecimento VALUES (22, 'Teoria das Singularidades e Teoria das Catástrofes');
INSERT INTO area_conhecimento VALUES (23, 'Teoria das Folheações');
INSERT INTO area_conhecimento VALUES (24, 'Matemática Aplicada');
INSERT INTO area_conhecimento VALUES (25, 'Física Matemática');
INSERT INTO area_conhecimento VALUES (26, 'Análise Numérica');
INSERT INTO area_conhecimento VALUES (27, 'Matemática Discreta e Combinatória');
INSERT INTO area_conhecimento VALUES (28, 'Probabilidade e Estatística');
INSERT INTO area_conhecimento VALUES (29, 'Probabilidade');
INSERT INTO area_conhecimento VALUES (30, 'Teoria Geral e Fundamentos da Probabilidade');
INSERT INTO area_conhecimento VALUES (31, 'Teoria Geral e Processos Estocásticos');
INSERT INTO area_conhecimento VALUES (32, 'Teoremas de Limite');
INSERT INTO area_conhecimento VALUES (33, 'Processos Markovianos');
INSERT INTO area_conhecimento VALUES (34, 'Análise Estocástica');
INSERT INTO area_conhecimento VALUES (35, 'Processos Estocásticos Especiais');
INSERT INTO area_conhecimento VALUES (36, 'Estatística');
INSERT INTO area_conhecimento VALUES (37, 'Fundamentos da Estatística');
INSERT INTO area_conhecimento VALUES (38, 'Inferência Paramétrica');
INSERT INTO area_conhecimento VALUES (39, 'Inferência Não-Paramétrica');
INSERT INTO area_conhecimento VALUES (40, 'Inferência em Processos Estocásticos');
INSERT INTO area_conhecimento VALUES (41, 'Análise Multivariada');
INSERT INTO area_conhecimento VALUES (42, 'Regressão e Correlação');
INSERT INTO area_conhecimento VALUES (43, 'Planejamento de Experimentos');
INSERT INTO area_conhecimento VALUES (44, 'Análise de Dados');
INSERT INTO area_conhecimento VALUES (45, 'Probabilidade e Estatística Aplicadas');
INSERT INTO area_conhecimento VALUES (46, 'Ciência da Computação');
INSERT INTO area_conhecimento VALUES (47, 'Teoria da Computação');
INSERT INTO area_conhecimento VALUES (48, 'Computabilidade e Modelos de Computação');
INSERT INTO area_conhecimento VALUES (49, 'Linguagem Formais e Autômatos');
INSERT INTO area_conhecimento VALUES (50, 'Análise de Algoritmos e Complexidade de Computação');
INSERT INTO area_conhecimento VALUES (51, 'Lógicas e Semântica de Programas');
INSERT INTO area_conhecimento VALUES (52, 'Matemática da Computação');
INSERT INTO area_conhecimento VALUES (53, 'Matemática Simbólica');
INSERT INTO area_conhecimento VALUES (54, 'Modelos Analíticos e de Simulação');
INSERT INTO area_conhecimento VALUES (55, 'Metodologia e Técnicas da Computação');
INSERT INTO area_conhecimento VALUES (56, 'Linguagens de Programação');
INSERT INTO area_conhecimento VALUES (57, 'Engenharia de Software');
INSERT INTO area_conhecimento VALUES (58, 'Banco de Dados');
INSERT INTO area_conhecimento VALUES (59, 'Sistemas de Informação');
INSERT INTO area_conhecimento VALUES (60, 'Processamento Gráfico (Graphics)');
INSERT INTO area_conhecimento VALUES (61, 'Sistemas de Computação');
INSERT INTO area_conhecimento VALUES (62, 'Hardware');
INSERT INTO area_conhecimento VALUES (63, 'Arquitetura de Sistemas de Computação');
INSERT INTO area_conhecimento VALUES (64, 'Software Básico');
INSERT INTO area_conhecimento VALUES (65, 'Teleinformática');
INSERT INTO area_conhecimento VALUES (66, 'Astronomia');
INSERT INTO area_conhecimento VALUES (67, 'Astronomia de Posição e Mecânica Celeste');
INSERT INTO area_conhecimento VALUES (68, 'Astronomia Fundamental');
INSERT INTO area_conhecimento VALUES (69, 'Astronomia Dinâmica');
INSERT INTO area_conhecimento VALUES (70, 'Astrofísica Estelar');
INSERT INTO area_conhecimento VALUES (71, 'Astrofísica do Meio Interestelar');
INSERT INTO area_conhecimento VALUES (72, 'Meio Interestelar');
INSERT INTO area_conhecimento VALUES (73, 'Nebulosa');
INSERT INTO area_conhecimento VALUES (74, 'Astrofísica Extragalactica');
INSERT INTO area_conhecimento VALUES (75, 'Galáxias');
INSERT INTO area_conhecimento VALUES (76, 'Aglomerados de Galáxias');
INSERT INTO area_conhecimento VALUES (77, 'Quasares');
INSERT INTO area_conhecimento VALUES (78, 'Cosmologia');
INSERT INTO area_conhecimento VALUES (79, 'Astrofísica do Sistema Solar');
INSERT INTO area_conhecimento VALUES (80, 'Física Solar');
INSERT INTO area_conhecimento VALUES (81, 'Movimento da Terra');
INSERT INTO area_conhecimento VALUES (82, 'Sistema Planetário');
INSERT INTO area_conhecimento VALUES (83, 'Instrumentação Astronômica');
INSERT INTO area_conhecimento VALUES (84, 'Astronomia Ótica');
INSERT INTO area_conhecimento VALUES (85, 'Radioastronomia');
INSERT INTO area_conhecimento VALUES (86, 'Astronomia Espacial');
INSERT INTO area_conhecimento VALUES (87, 'Processamento de Dados Astronômicos');
INSERT INTO area_conhecimento VALUES (88, 'Física');
INSERT INTO area_conhecimento VALUES (89, 'Física Geral');
INSERT INTO area_conhecimento VALUES (90, 'Métodos Matemáticos da Física');
INSERT INTO area_conhecimento VALUES (91, 'Física Clássica e Física Quântica; Mecânica e Campos');
INSERT INTO area_conhecimento VALUES (92, 'Relatividade e Gravitação');
INSERT INTO area_conhecimento VALUES (93, 'Física Estatística e Termodinâmica');
INSERT INTO area_conhecimento VALUES (94, 'Metrologia, Técnicas Gerais de Laboratório, Sistema de Instrumentação');
INSERT INTO area_conhecimento VALUES (95, 'Instrumentação Específica de Uso Geral em Física');
INSERT INTO area_conhecimento VALUES (96, 'Áreas Clássicas de Fenomenologia e suas Aplicações');
INSERT INTO area_conhecimento VALUES (97, 'Eletricidade e Magnetismo; Campos e Partículas Carregadas');
INSERT INTO area_conhecimento VALUES (98, 'Ótica');
INSERT INTO area_conhecimento VALUES (99, 'Acústica');
INSERT INTO area_conhecimento VALUES (100, 'Transferência de Calor; Processos Térmicos e Termodinâmicos');
INSERT INTO area_conhecimento VALUES (101, 'Mecânica, Elasticidade e Reologia');
INSERT INTO area_conhecimento VALUES (102, 'Dinâmica dos Fluídos');
INSERT INTO area_conhecimento VALUES (103, 'Física das Partículas Elementares e Campos');
INSERT INTO area_conhecimento VALUES (104, 'Teoria Geral de Partículas e Campos');
INSERT INTO area_conhecimento VALUES (105, 'Teorias Específicas e Modelos de Interação; Sistemática de Partículas; Raios Cósmicos');
INSERT INTO area_conhecimento VALUES (106, 'Reações Específicas e Fenomiologia de Partículas');
INSERT INTO area_conhecimento VALUES (107, 'Propriedades de Partículas Específicas e Ressonâncias');
INSERT INTO area_conhecimento VALUES (108, 'Física Nuclear');
INSERT INTO area_conhecimento VALUES (109, 'Estrutura Nuclear');
INSERT INTO area_conhecimento VALUES (110, 'Desintegração Nuclear e Radioatividade');
INSERT INTO area_conhecimento VALUES (111, 'Reações Nucleares e Espalhamento Geral');
INSERT INTO area_conhecimento VALUES (112, 'Reações Nucleares e Espalhamento (Reações Específicas)');
INSERT INTO area_conhecimento VALUES (113, 'Propriedades de Núcleos Específicos');
INSERT INTO area_conhecimento VALUES (114, 'Métodos Experimentais e Instrumentação para Partículas Elementares e Física Nuclear');
INSERT INTO area_conhecimento VALUES (115, 'Física Atômica e Molecular');
INSERT INTO area_conhecimento VALUES (116, 'Estrutura Eletrônica de Átomos e Moléculas; Teoria');
INSERT INTO area_conhecimento VALUES (117, 'Espectros Atômicos e Integração de Fótons');
INSERT INTO area_conhecimento VALUES (118, 'Espectros Moleculares e Interações de Fótons com Moléculas');
INSERT INTO area_conhecimento VALUES (119, 'Processos de Colisão e Interações de Átomos e Moléculas');
INSERT INTO area_conhecimento VALUES (120, 'Inf. sobre Átomos e Moléculas Obtidos Experimentalmente; Instrumentação e Técnicas');
INSERT INTO area_conhecimento VALUES (121, 'Estudos de Átomos e Moléculas Especiais');
INSERT INTO area_conhecimento VALUES (122, 'Física dos Fluídos, Física de Plasmas e Descargas Elétricas');
INSERT INTO area_conhecimento VALUES (250, 'Genética Animal');
INSERT INTO area_conhecimento VALUES (123, 'Cinética e Teoria de Transporte de Fluídos; Propriedades Físicas de Gases');
INSERT INTO area_conhecimento VALUES (124, 'Física de Plasmas e Descargas Elétricas');
INSERT INTO area_conhecimento VALUES (125, 'Física da Matéria Condensada');
INSERT INTO area_conhecimento VALUES (126, 'Estrutura de Líquidos e Sólidos; Cristalografia');
INSERT INTO area_conhecimento VALUES (127, 'Propriedades Mecânicas e Acústicas da Matéria Condensada');
INSERT INTO area_conhecimento VALUES (128, 'Dinâmica da Rede e Estatística de Cristais');
INSERT INTO area_conhecimento VALUES (129, 'Equação de Estado, Equilíbrio de Fases e Transições de Fase');
INSERT INTO area_conhecimento VALUES (130, 'Propriedades Térmicas da Matéria Condensada');
INSERT INTO area_conhecimento VALUES (131, 'Propriedades de Transportes de Matéria Condensada (Não Eletrônica)');
INSERT INTO area_conhecimento VALUES (132, 'Campos Quânticos e Sólidos, Hélio, Líquido, Sólido');
INSERT INTO area_conhecimento VALUES (133, 'Superfícies e Interfaces; Películas e Filamentos');
INSERT INTO area_conhecimento VALUES (134, 'Estados Eletrônicos');
INSERT INTO area_conhecimento VALUES (135, 'Transp. Eletrônicos e Prop. Elétricas de Superfícies; Interfaces e Películas');
INSERT INTO area_conhecimento VALUES (136, 'Estruturas Eletrônicas e Propriedades Elétricas de Superfícies; Interf. e Partículas');
INSERT INTO area_conhecimento VALUES (137, 'Supercondutividade');
INSERT INTO area_conhecimento VALUES (138, 'Materiais Magnéticos e Propriedades Magnéticas');
INSERT INTO area_conhecimento VALUES (139, 'Ressonância Mag. e Relax. na Mat. Condens; Efeitos Mosbauer; Corr. Ang. Pertubada');
INSERT INTO area_conhecimento VALUES (140, 'Materiais Dielétricos e Propriedades Dielétricas');
INSERT INTO area_conhecimento VALUES (141, 'Prop. Óticas e Espectrosc. da Mat. Condens; Outras Inter. da Mat. com Rad. e Part.');
INSERT INTO area_conhecimento VALUES (142, 'Emissão Eletrônica e Iônica por Líquidos e Sólidos; Fenômenos de Impacto');
INSERT INTO area_conhecimento VALUES (143, 'Química');
INSERT INTO area_conhecimento VALUES (144, 'Química Orgânica');
INSERT INTO area_conhecimento VALUES (145, 'Estrutura, Conformação e Estereoquímica');
INSERT INTO area_conhecimento VALUES (146, 'Síntese Orgânica');
INSERT INTO area_conhecimento VALUES (147, 'Físico-Química Orgânica');
INSERT INTO area_conhecimento VALUES (148, 'Fotoquímica Orgânica');
INSERT INTO area_conhecimento VALUES (149, 'Química dos Produtos Naturais');
INSERT INTO area_conhecimento VALUES (150, 'Evolução, Sistemática e Ecologia Química');
INSERT INTO area_conhecimento VALUES (151, 'Polímeros e Colóides');
INSERT INTO area_conhecimento VALUES (152, 'Química Inorgânica');
INSERT INTO area_conhecimento VALUES (153, 'Campos de Coordenação');
INSERT INTO area_conhecimento VALUES (154, 'Não-Metais e Seus Compostos');
INSERT INTO area_conhecimento VALUES (155, 'Compostos Organo-Metálicos');
INSERT INTO area_conhecimento VALUES (156, 'Determinação de Estrutura de Compostos Inorgânicos');
INSERT INTO area_conhecimento VALUES (157, 'Foto-Química Inorgânica');
INSERT INTO area_conhecimento VALUES (158, 'Físico Química Inorgânica');
INSERT INTO area_conhecimento VALUES (159, 'Química Bio-Inorgânica');
INSERT INTO area_conhecimento VALUES (160, 'Físico-Química');
INSERT INTO area_conhecimento VALUES (161, 'Cinética Química e Catálise');
INSERT INTO area_conhecimento VALUES (162, 'Eletroquímica');
INSERT INTO area_conhecimento VALUES (163, 'Espectroscopia');
INSERT INTO area_conhecimento VALUES (164, 'Química de Interfaces');
INSERT INTO area_conhecimento VALUES (165, 'Química do Estado Condensado');
INSERT INTO area_conhecimento VALUES (166, 'Química Nuclear e Radioquímica');
INSERT INTO area_conhecimento VALUES (167, 'Química Teórica');
INSERT INTO area_conhecimento VALUES (168, 'Termodinâmica Química');
INSERT INTO area_conhecimento VALUES (169, 'Química Analítica');
INSERT INTO area_conhecimento VALUES (170, 'Separação');
INSERT INTO area_conhecimento VALUES (171, 'Métodos Óticos de Análise');
INSERT INTO area_conhecimento VALUES (172, 'Eletroanalítica');
INSERT INTO area_conhecimento VALUES (173, 'Gravimetria');
INSERT INTO area_conhecimento VALUES (174, 'Titimetria');
INSERT INTO area_conhecimento VALUES (175, 'Instrumentação Analítica');
INSERT INTO area_conhecimento VALUES (176, 'Análise de Traços e Química Ambiental');
INSERT INTO area_conhecimento VALUES (177, 'Geociências');
INSERT INTO area_conhecimento VALUES (178, 'Geologia');
INSERT INTO area_conhecimento VALUES (179, 'Mineralogia');
INSERT INTO area_conhecimento VALUES (180, 'Petrologia');
INSERT INTO area_conhecimento VALUES (181, 'Geoquímica');
INSERT INTO area_conhecimento VALUES (182, 'Geologia Regional');
INSERT INTO area_conhecimento VALUES (183, 'Geotectônica');
INSERT INTO area_conhecimento VALUES (184, 'Geocronologia');
INSERT INTO area_conhecimento VALUES (185, 'Cartografia Geológica');
INSERT INTO area_conhecimento VALUES (186, 'Metalogenia');
INSERT INTO area_conhecimento VALUES (187, 'Hidrogeologia');
INSERT INTO area_conhecimento VALUES (188, 'Prospecção Mineral');
INSERT INTO area_conhecimento VALUES (189, 'Sedimentologia');
INSERT INTO area_conhecimento VALUES (190, 'Paleontologia Estratigráfica');
INSERT INTO area_conhecimento VALUES (191, 'Estratigrafia');
INSERT INTO area_conhecimento VALUES (192, 'Geologia Ambiental');
INSERT INTO area_conhecimento VALUES (193, 'Geofísica');
INSERT INTO area_conhecimento VALUES (194, 'Geomagnetismo');
INSERT INTO area_conhecimento VALUES (195, 'Sismologia');
INSERT INTO area_conhecimento VALUES (196, 'Geotermia e Fluxo Térmico');
INSERT INTO area_conhecimento VALUES (197, 'Propriedades Físicas das Rochas');
INSERT INTO area_conhecimento VALUES (198, 'Geofísica Nuclear');
INSERT INTO area_conhecimento VALUES (199, 'Sensoriamento Remoto');
INSERT INTO area_conhecimento VALUES (200, 'Aeronomia');
INSERT INTO area_conhecimento VALUES (201, 'Desenvolvimento de Instrumentação Geofísica');
INSERT INTO area_conhecimento VALUES (202, 'Geofísica Aplicada');
INSERT INTO area_conhecimento VALUES (203, 'Meteorologia');
INSERT INTO area_conhecimento VALUES (204, 'Meteorologia Dinâmica');
INSERT INTO area_conhecimento VALUES (205, 'Meteorologia Sinótica');
INSERT INTO area_conhecimento VALUES (206, 'Meteorologia Física');
INSERT INTO area_conhecimento VALUES (207, 'Química da Atmosfera');
INSERT INTO area_conhecimento VALUES (208, 'Instrumentação Meteorológica');
INSERT INTO area_conhecimento VALUES (209, 'Climatologia');
INSERT INTO area_conhecimento VALUES (210, 'Micrometeorologia');
INSERT INTO area_conhecimento VALUES (211, 'Sensoriamento Remoto da Atmosfera');
INSERT INTO area_conhecimento VALUES (212, 'Meteorologia Aplicada');
INSERT INTO area_conhecimento VALUES (213, 'Geodésia');
INSERT INTO area_conhecimento VALUES (214, 'Geodésia Física');
INSERT INTO area_conhecimento VALUES (215, 'Geodésia Geométrica');
INSERT INTO area_conhecimento VALUES (216, 'Geodésia Celeste');
INSERT INTO area_conhecimento VALUES (217, 'Fotogrametria');
INSERT INTO area_conhecimento VALUES (218, 'Cartografia Básica');
INSERT INTO area_conhecimento VALUES (219, 'Geografia Física');
INSERT INTO area_conhecimento VALUES (220, 'Geomorfologia');
INSERT INTO area_conhecimento VALUES (221, 'Climatologia Geográfica');
INSERT INTO area_conhecimento VALUES (222, 'Pedologia');
INSERT INTO area_conhecimento VALUES (223, 'Hidrogeografia');
INSERT INTO area_conhecimento VALUES (224, 'Geoecologia');
INSERT INTO area_conhecimento VALUES (225, 'Fotogeografia (Físico-Ecológica)');
INSERT INTO area_conhecimento VALUES (226, 'Geocartografia');
INSERT INTO area_conhecimento VALUES (227, 'Oceanografia');
INSERT INTO area_conhecimento VALUES (228, 'Oceanografia Biológica');
INSERT INTO area_conhecimento VALUES (229, 'Interação entre os Organismos Marinhos e os Parâmetros Ambientais');
INSERT INTO area_conhecimento VALUES (230, 'Oceanografia Física');
INSERT INTO area_conhecimento VALUES (231, 'Variáveis Físicas da Água do Mar');
INSERT INTO area_conhecimento VALUES (232, 'Movimento da Água do Mar');
INSERT INTO area_conhecimento VALUES (233, 'Origem das Massas de Água');
INSERT INTO area_conhecimento VALUES (234, 'Interação do Oceano com o Leito do Mar');
INSERT INTO area_conhecimento VALUES (235, 'Interação do Oceano com a Atmosfera');
INSERT INTO area_conhecimento VALUES (236, 'Oceanografia Química');
INSERT INTO area_conhecimento VALUES (237, 'Propriedades Químicas da Água do Mar');
INSERT INTO area_conhecimento VALUES (238, 'Interações Químico-Biológicas/Geológicas das Substâncias Químicas da Água do Mar');
INSERT INTO area_conhecimento VALUES (239, 'Oceanografia Geológica');
INSERT INTO area_conhecimento VALUES (240, 'Geomorfologia Submarina');
INSERT INTO area_conhecimento VALUES (241, 'Sedimentologia Marinha');
INSERT INTO area_conhecimento VALUES (242, 'Geofísica Marinha');
INSERT INTO area_conhecimento VALUES (243, 'Geoquímica Marinha');
INSERT INTO area_conhecimento VALUES (244, 'Ciências Biológicas');
INSERT INTO area_conhecimento VALUES (245, 'Biologia Geral');
INSERT INTO area_conhecimento VALUES (246, 'Genética');
INSERT INTO area_conhecimento VALUES (247, 'Genética Quantitativa');
INSERT INTO area_conhecimento VALUES (248, 'Genética Molecular e de Microorganismos');
INSERT INTO area_conhecimento VALUES (249, 'Genética Vegetal');
INSERT INTO area_conhecimento VALUES (251, 'Genética Humana e Médica');
INSERT INTO area_conhecimento VALUES (252, 'Mutagenese');
INSERT INTO area_conhecimento VALUES (253, 'Botânica');
INSERT INTO area_conhecimento VALUES (254, 'Paleobotânica');
INSERT INTO area_conhecimento VALUES (255, 'Morfologia Vegetal');
INSERT INTO area_conhecimento VALUES (256, 'Morfologia Externa');
INSERT INTO area_conhecimento VALUES (257, 'Citologia Vegetal');
INSERT INTO area_conhecimento VALUES (258, 'Anatomia Vegetal');
INSERT INTO area_conhecimento VALUES (259, 'Palinologia');
INSERT INTO area_conhecimento VALUES (260, 'Fisiologia Vegetal');
INSERT INTO area_conhecimento VALUES (261, 'Nutrição e Crescimento Vegetal');
INSERT INTO area_conhecimento VALUES (262, 'Reprodução Vegetal');
INSERT INTO area_conhecimento VALUES (263, 'Ecofisiologia Vegetal');
INSERT INTO area_conhecimento VALUES (264, 'Taxonomia Vegetal');
INSERT INTO area_conhecimento VALUES (265, 'Taxonomia de Criptógamos');
INSERT INTO area_conhecimento VALUES (266, 'Taxonomia de Fanerógamos');
INSERT INTO area_conhecimento VALUES (267, 'Fitogeografia');
INSERT INTO area_conhecimento VALUES (268, 'Botânica Aplicada');
INSERT INTO area_conhecimento VALUES (269, 'Zoologia');
INSERT INTO area_conhecimento VALUES (270, 'Paleozoologia');
INSERT INTO area_conhecimento VALUES (271, 'Morfologia dos Grupos Recentes');
INSERT INTO area_conhecimento VALUES (272, 'Fisiologia dos Grupos Recentes');
INSERT INTO area_conhecimento VALUES (273, 'Comportamento Animal');
INSERT INTO area_conhecimento VALUES (274, 'Taxonomia dos Grupos Recentes');
INSERT INTO area_conhecimento VALUES (275, 'Zoologia Aplicada');
INSERT INTO area_conhecimento VALUES (276, 'Conservação das Espécies Animais');
INSERT INTO area_conhecimento VALUES (277, 'Utilização dos Animais');
INSERT INTO area_conhecimento VALUES (278, 'Controle Populacional de Animais');
INSERT INTO area_conhecimento VALUES (279, 'Ecologia');
INSERT INTO area_conhecimento VALUES (280, 'Ecologia Teórica');
INSERT INTO area_conhecimento VALUES (281, 'Ecologia de Ecossistemas');
INSERT INTO area_conhecimento VALUES (282, 'Ecologia Aplicada');
INSERT INTO area_conhecimento VALUES (283, 'Morfologia');
INSERT INTO area_conhecimento VALUES (284, 'Citologia e Biologia Celular');
INSERT INTO area_conhecimento VALUES (285, 'Embriologia');
INSERT INTO area_conhecimento VALUES (286, 'Histologia');
INSERT INTO area_conhecimento VALUES (287, 'Anatomia');
INSERT INTO area_conhecimento VALUES (288, 'Anatomia Humana');
INSERT INTO area_conhecimento VALUES (289, 'Anatomia Animal');
INSERT INTO area_conhecimento VALUES (290, 'Fisiologia');
INSERT INTO area_conhecimento VALUES (291, 'Fisiologia Geral');
INSERT INTO area_conhecimento VALUES (292, 'Fisiologia de Órgãos e Sistemas');
INSERT INTO area_conhecimento VALUES (293, 'Neurofisiologia');
INSERT INTO area_conhecimento VALUES (294, 'Fisiologia Cardiovascular');
INSERT INTO area_conhecimento VALUES (295, 'Fisiologia da Respiração');
INSERT INTO area_conhecimento VALUES (296, 'Fisiologia Renal');
INSERT INTO area_conhecimento VALUES (297, 'Fisiologia Endócrina');
INSERT INTO area_conhecimento VALUES (298, 'Fisiologia da Digestão');
INSERT INTO area_conhecimento VALUES (299, 'Cinesiologia');
INSERT INTO area_conhecimento VALUES (300, 'Fisiologia do Esforço');
INSERT INTO area_conhecimento VALUES (301, 'Fisiologia Comparada');
INSERT INTO area_conhecimento VALUES (302, 'Bioquímica');
INSERT INTO area_conhecimento VALUES (303, 'Química de Macromoléculas');
INSERT INTO area_conhecimento VALUES (304, 'Proteínas');
INSERT INTO area_conhecimento VALUES (305, 'Lipídeos');
INSERT INTO area_conhecimento VALUES (306, 'Glicídeos');
INSERT INTO area_conhecimento VALUES (307, 'Bioquímica dos Microorganismos');
INSERT INTO area_conhecimento VALUES (308, 'Metabolismo e Bioenergética');
INSERT INTO area_conhecimento VALUES (309, 'Biologia Molecular');
INSERT INTO area_conhecimento VALUES (310, 'Enzimologia');
INSERT INTO area_conhecimento VALUES (311, 'Biofísica');
INSERT INTO area_conhecimento VALUES (312, 'Biofísica Molecular');
INSERT INTO area_conhecimento VALUES (313, 'Biofísica Celular');
INSERT INTO area_conhecimento VALUES (314, 'Biofísica de Processos e Sistemas');
INSERT INTO area_conhecimento VALUES (315, 'Radiologia e Fotobiologia');
INSERT INTO area_conhecimento VALUES (316, 'Farmacologia');
INSERT INTO area_conhecimento VALUES (317, 'Farmacologia Geral');
INSERT INTO area_conhecimento VALUES (318, 'Farmacocinética');
INSERT INTO area_conhecimento VALUES (319, 'Biodisponibilidade');
INSERT INTO area_conhecimento VALUES (320, 'Farmacologia Autonômica');
INSERT INTO area_conhecimento VALUES (321, 'Neuropsicofarmacologia');
INSERT INTO area_conhecimento VALUES (322, 'Farmacologia Cardiorenal');
INSERT INTO area_conhecimento VALUES (323, 'Farmacologia Bioquímica e Molecular');
INSERT INTO area_conhecimento VALUES (324, 'Etnofarmacologia');
INSERT INTO area_conhecimento VALUES (325, 'Toxicologia');
INSERT INTO area_conhecimento VALUES (326, 'Farmacologia Clínica');
INSERT INTO area_conhecimento VALUES (327, 'Imunologia');
INSERT INTO area_conhecimento VALUES (328, 'Imunoquímica');
INSERT INTO area_conhecimento VALUES (329, 'Imunologia Celular');
INSERT INTO area_conhecimento VALUES (330, 'Imunogenética');
INSERT INTO area_conhecimento VALUES (331, 'Imunologia Aplicada');
INSERT INTO area_conhecimento VALUES (332, 'Microbiologia');
INSERT INTO area_conhecimento VALUES (333, 'Biologia e Fisiologia dos Microorganismos');
INSERT INTO area_conhecimento VALUES (334, 'Virologia');
INSERT INTO area_conhecimento VALUES (335, 'Bacterologia');
INSERT INTO area_conhecimento VALUES (336, 'Micologia');
INSERT INTO area_conhecimento VALUES (337, 'Microbiologia Aplicada');
INSERT INTO area_conhecimento VALUES (338, 'Microbiologia Médica');
INSERT INTO area_conhecimento VALUES (339, 'Microbiologia Industrial e de Fermentação');
INSERT INTO area_conhecimento VALUES (340, 'Parasitologia');
INSERT INTO area_conhecimento VALUES (341, 'Protozoologia de Parasitos');
INSERT INTO area_conhecimento VALUES (342, 'Protozoologia Parasitária Humana');
INSERT INTO area_conhecimento VALUES (343, 'Protozoologia Parasitária Animal');
INSERT INTO area_conhecimento VALUES (344, 'Helmintologia de Parasitos');
INSERT INTO area_conhecimento VALUES (345, 'Helmintologia Humana');
INSERT INTO area_conhecimento VALUES (346, 'Helmintologia Animal');
INSERT INTO area_conhecimento VALUES (347, 'Entomologia e Malacologia de Parasitos e Vetores');
INSERT INTO area_conhecimento VALUES (348, 'Engenharias');
INSERT INTO area_conhecimento VALUES (349, 'Engenharia Civil');
INSERT INTO area_conhecimento VALUES (350, 'Construção Civil');
INSERT INTO area_conhecimento VALUES (351, 'Materiais e Componentes de Construção');
INSERT INTO area_conhecimento VALUES (352, 'Processos Construtivos');
INSERT INTO area_conhecimento VALUES (353, 'Instalações Prediais');
INSERT INTO area_conhecimento VALUES (354, 'Estruturas');
INSERT INTO area_conhecimento VALUES (355, 'Estruturas de Concreto');
INSERT INTO area_conhecimento VALUES (356, 'Estruturas de Madeiras');
INSERT INTO area_conhecimento VALUES (357, 'Estruturas Metálicas');
INSERT INTO area_conhecimento VALUES (358, 'Mecânica das Estruturas');
INSERT INTO area_conhecimento VALUES (359, 'Geotécnica');
INSERT INTO area_conhecimento VALUES (360, 'Fundações e Escavações');
INSERT INTO area_conhecimento VALUES (361, 'Mecânicas das Rochas');
INSERT INTO area_conhecimento VALUES (362, 'Mecânicas dos Solos');
INSERT INTO area_conhecimento VALUES (363, 'Obras de Terra e Enrocamento');
INSERT INTO area_conhecimento VALUES (364, 'Pavimentos');
INSERT INTO area_conhecimento VALUES (365, 'Engenharia Hidráulica');
INSERT INTO area_conhecimento VALUES (366, 'Hidráulica');
INSERT INTO area_conhecimento VALUES (367, 'Hidrologia');
INSERT INTO area_conhecimento VALUES (368, 'Infra-Estrutura de Transportes');
INSERT INTO area_conhecimento VALUES (369, 'Aeroportos; Projeto e Construção');
INSERT INTO area_conhecimento VALUES (370, 'Ferrovias; Projetos e Construção');
INSERT INTO area_conhecimento VALUES (371, 'Portos e Vias Nevegáveis; Projeto e Construção');
INSERT INTO area_conhecimento VALUES (372, 'Rodovias; Projeto e Construção');
INSERT INTO area_conhecimento VALUES (373, 'Engenharia de Minas');
INSERT INTO area_conhecimento VALUES (374, 'Pesquisa Mineral');
INSERT INTO area_conhecimento VALUES (375, 'Caracterização do Minério');
INSERT INTO area_conhecimento VALUES (376, 'Dimensionamento de Jazidas');
INSERT INTO area_conhecimento VALUES (377, 'Lavra');
INSERT INTO area_conhecimento VALUES (378, 'Lavra a Céu Aberto');
INSERT INTO area_conhecimento VALUES (379, 'Lavra de Mina Subterrânea');
INSERT INTO area_conhecimento VALUES (380, 'Equipamentos de Lavra');
INSERT INTO area_conhecimento VALUES (381, 'Tratamento de Minérios');
INSERT INTO area_conhecimento VALUES (382, 'Métodos de Concentração e Enriquecimento de Minérios');
INSERT INTO area_conhecimento VALUES (383, 'Equipamentos de Beneficiamento de Minérios');
INSERT INTO area_conhecimento VALUES (384, 'Engenharia de Materiais e Metalúrgica');
INSERT INTO area_conhecimento VALUES (385, 'Instalações e Equipamentos Metalúrgicos');
INSERT INTO area_conhecimento VALUES (386, 'Instalações Metalúrgicas');
INSERT INTO area_conhecimento VALUES (387, 'Equipamentos Metalúrgicos');
INSERT INTO area_conhecimento VALUES (388, 'Metalurgia Extrativa');
INSERT INTO area_conhecimento VALUES (389, 'Aglomeração');
INSERT INTO area_conhecimento VALUES (390, 'Eletrometalurgia');
INSERT INTO area_conhecimento VALUES (391, 'Hidrometalurgia');
INSERT INTO area_conhecimento VALUES (392, 'Pirometalurgia');
INSERT INTO area_conhecimento VALUES (393, 'Metalurgia de Transformação');
INSERT INTO area_conhecimento VALUES (394, 'Conformação Mecânica');
INSERT INTO area_conhecimento VALUES (395, 'Fundição');
INSERT INTO area_conhecimento VALUES (396, 'Metalurgia de Pó');
INSERT INTO area_conhecimento VALUES (397, 'Recobrimentos');
INSERT INTO area_conhecimento VALUES (398, 'Soldagem');
INSERT INTO area_conhecimento VALUES (399, 'Tratamentos Térmicos, Mecânicos e Químicos');
INSERT INTO area_conhecimento VALUES (400, 'Usinagem');
INSERT INTO area_conhecimento VALUES (401, 'Metalurgia Física');
INSERT INTO area_conhecimento VALUES (402, 'Estrutura dos Metais e Ligas');
INSERT INTO area_conhecimento VALUES (403, 'Propriedades Físicas dos Metais e Ligas');
INSERT INTO area_conhecimento VALUES (404, 'Propriedades Mecânicas dos Metais e Ligas');
INSERT INTO area_conhecimento VALUES (405, 'Transformação de Fases');
INSERT INTO area_conhecimento VALUES (406, 'Corrosão');
INSERT INTO area_conhecimento VALUES (407, 'Materiais Não-Metálicos');
INSERT INTO area_conhecimento VALUES (408, 'Extração e Transformação de Materiais');
INSERT INTO area_conhecimento VALUES (409, 'Cerâmicos');
INSERT INTO area_conhecimento VALUES (410, 'Materiais Conjugados Não-Metálicos');
INSERT INTO area_conhecimento VALUES (411, 'Polímeros, Aplicações');
INSERT INTO area_conhecimento VALUES (412, 'Engenharia Elétrica');
INSERT INTO area_conhecimento VALUES (413, 'Materiais Elétricos');
INSERT INTO area_conhecimento VALUES (414, 'Materiais Condutores');
INSERT INTO area_conhecimento VALUES (415, 'Materiais e Componentes Semicondutores');
INSERT INTO area_conhecimento VALUES (416, 'Materiais e Dispositivos Supercondutores');
INSERT INTO area_conhecimento VALUES (417, 'Materiais Dielétricos, Piezoelétricos e Ferroelétricos');
INSERT INTO area_conhecimento VALUES (418, 'Materiais e Componentes Eletroóticos e Magnetoóticos, Materiais Fotoelétricos');
INSERT INTO area_conhecimento VALUES (419, 'Materiais e Dispositivos Magnéticos');
INSERT INTO area_conhecimento VALUES (420, 'Medidas Elétricas, Magnéticas e Eletrônicas; Instrumentação');
INSERT INTO area_conhecimento VALUES (421, 'Medidas Elétricas');
INSERT INTO area_conhecimento VALUES (422, 'Medidas Magnéticas');
INSERT INTO area_conhecimento VALUES (423, 'Instrumentação Eletromecânica');
INSERT INTO area_conhecimento VALUES (424, 'Instrumentação Eletrônica');
INSERT INTO area_conhecimento VALUES (425, 'Sistemas Eletrônicos de Medida e de Controle');
INSERT INTO area_conhecimento VALUES (426, 'Circuitos Elétricos, Magnéticos e Eletrônicos');
INSERT INTO area_conhecimento VALUES (427, 'Teoria Geral dos Circuitos Elétricos');
INSERT INTO area_conhecimento VALUES (428, 'Circuitos Lineares e Não-Lineares');
INSERT INTO area_conhecimento VALUES (429, 'Circuitos Eletrônicos');
INSERT INTO area_conhecimento VALUES (430, 'Circuitos Magnéticos , Magnetismos e Eletromagnetismos');
INSERT INTO area_conhecimento VALUES (431, 'Sistemas Elétricos de Potência');
INSERT INTO area_conhecimento VALUES (432, 'Geração da Energia Elétrica');
INSERT INTO area_conhecimento VALUES (433, 'Transmissão da Energia Elétrica, Distribuição da Energia Elétrica');
INSERT INTO area_conhecimento VALUES (434, 'Conversão e Retificação da Energia Elétrica');
INSERT INTO area_conhecimento VALUES (435, 'Medição, Controle, Correção e Proteção de Sistemas Elétricos  de Potência');
INSERT INTO area_conhecimento VALUES (436, 'Máquinas Elétricas e Dispositivos de Potência');
INSERT INTO area_conhecimento VALUES (437, 'Instalações Elétricas e Industriais');
INSERT INTO area_conhecimento VALUES (438, 'Eletrônica Industrial, Sistemas e Controles Eletrônicos');
INSERT INTO area_conhecimento VALUES (439, 'Eletrônica Industrial');
INSERT INTO area_conhecimento VALUES (440, 'Automação Eletrônica de Processos Elétricos e Industriais');
INSERT INTO area_conhecimento VALUES (441, 'Controle de Processos Eletrônicos, Retroalimentação');
INSERT INTO area_conhecimento VALUES (442, 'Telecomunicações');
INSERT INTO area_conhecimento VALUES (443, 'Teoria Eletromagnetica, Microondas, Propagação de Ondas, Antenas');
INSERT INTO area_conhecimento VALUES (444, 'Radionavegação e Radioastronomia');
INSERT INTO area_conhecimento VALUES (445, 'Sistemas deTelecomunicações');
INSERT INTO area_conhecimento VALUES (446, 'Engenharia Mecânica');
INSERT INTO area_conhecimento VALUES (447, 'Fenômenos de Transporte');
INSERT INTO area_conhecimento VALUES (448, 'Transferência de Calor');
INSERT INTO area_conhecimento VALUES (449, 'Mecânica dos Fluídos');
INSERT INTO area_conhecimento VALUES (450, 'Dinâmica dos Gases');
INSERT INTO area_conhecimento VALUES (451, 'Princípios Variacionais e Métodos Numéricos');
INSERT INTO area_conhecimento VALUES (452, 'Engenharia Térmica');
INSERT INTO area_conhecimento VALUES (453, 'Termodinâmica');
INSERT INTO area_conhecimento VALUES (454, 'Controle Ambiental');
INSERT INTO area_conhecimento VALUES (455, 'Aproveitamento da Energia');
INSERT INTO area_conhecimento VALUES (456, 'Mecânica dos Sólidos');
INSERT INTO area_conhecimento VALUES (457, 'Mecânica dos Corpos Sólidos, Elásticos e Plásticos');
INSERT INTO area_conhecimento VALUES (458, 'Dinâmica dos Corpos Rígidos, Elásticos e Plásticos');
INSERT INTO area_conhecimento VALUES (459, 'Análise de Tensões');
INSERT INTO area_conhecimento VALUES (460, 'Termoelasticidade');
INSERT INTO area_conhecimento VALUES (461, 'Projetos de Máquinas');
INSERT INTO area_conhecimento VALUES (462, 'Teoria dos Mecanismos');
INSERT INTO area_conhecimento VALUES (463, 'Estática e Dinâmica Aplicada');
INSERT INTO area_conhecimento VALUES (464, 'Elementos de Máquinas');
INSERT INTO area_conhecimento VALUES (465, 'Fundamentos Gerais de Projetos das Máquinas');
INSERT INTO area_conhecimento VALUES (466, 'Máquinas, Motores e Equipamentos');
INSERT INTO area_conhecimento VALUES (467, 'Métodos de Síntese e Otimização Aplicados ao Projeto Mecânico');
INSERT INTO area_conhecimento VALUES (468, 'Controle de Sistemas Mecânicos');
INSERT INTO area_conhecimento VALUES (469, 'Aproveitamento de Energia');
INSERT INTO area_conhecimento VALUES (470, 'Processos de Fabricação');
INSERT INTO area_conhecimento VALUES (471, 'Matrizes e Ferramentas');
INSERT INTO area_conhecimento VALUES (472, 'Maquinas de Usinagem e Conformação');
INSERT INTO area_conhecimento VALUES (473, 'Controle Numérico');
INSERT INTO area_conhecimento VALUES (474, 'Robotização');
INSERT INTO area_conhecimento VALUES (475, 'Processos de Fabricação, Seleção Econômica');
INSERT INTO area_conhecimento VALUES (476, 'Engenharia Química');
INSERT INTO area_conhecimento VALUES (477, 'Processos Industriais de Engenharia Química');
INSERT INTO area_conhecimento VALUES (478, 'Processos Bioquímicos');
INSERT INTO area_conhecimento VALUES (479, 'Processos Orgânicos');
INSERT INTO area_conhecimento VALUES (480, 'Processos Inorgânicos');
INSERT INTO area_conhecimento VALUES (481, 'Operações Industriais e Equipamentos para Engenharia Química');
INSERT INTO area_conhecimento VALUES (482, 'Reatores Químicos');
INSERT INTO area_conhecimento VALUES (483, 'Operações Características de Processos Bioquímicos');
INSERT INTO area_conhecimento VALUES (484, 'Operações de Separação e Mistura');
INSERT INTO area_conhecimento VALUES (485, 'Tecnologia Química');
INSERT INTO area_conhecimento VALUES (486, 'Balanços Globais de Matéria e Energia');
INSERT INTO area_conhecimento VALUES (487, 'Água');
INSERT INTO area_conhecimento VALUES (488, 'Álcool');
INSERT INTO area_conhecimento VALUES (489, 'Alimentos');
INSERT INTO area_conhecimento VALUES (490, 'Borrachas');
INSERT INTO area_conhecimento VALUES (491, 'Carvão');
INSERT INTO area_conhecimento VALUES (492, 'Cerâmica');
INSERT INTO area_conhecimento VALUES (493, 'Cimento');
INSERT INTO area_conhecimento VALUES (494, 'Couro');
INSERT INTO area_conhecimento VALUES (495, 'Detergentes');
INSERT INTO area_conhecimento VALUES (496, 'Fertilizantes');
INSERT INTO area_conhecimento VALUES (497, 'Medicamentos');
INSERT INTO area_conhecimento VALUES (498, 'Metais Não-Ferrosos');
INSERT INTO area_conhecimento VALUES (499, 'Óleos');
INSERT INTO area_conhecimento VALUES (500, 'Papel e Celulose');
INSERT INTO area_conhecimento VALUES (501, 'Petróleo e Petroquímica');
INSERT INTO area_conhecimento VALUES (502, 'Polímeros');
INSERT INTO area_conhecimento VALUES (503, 'Produtos Naturais');
INSERT INTO area_conhecimento VALUES (504, 'Têxteis');
INSERT INTO area_conhecimento VALUES (505, 'Tratamentos e Aproveitamento de Rejeitos');
INSERT INTO area_conhecimento VALUES (506, 'Xisto');
INSERT INTO area_conhecimento VALUES (507, 'Engenharia Sanitária');
INSERT INTO area_conhecimento VALUES (508, 'Recursos Hídricos');
INSERT INTO area_conhecimento VALUES (509, 'Planejamento Integrado dos Recursos Hídricos');
INSERT INTO area_conhecimento VALUES (510, 'Tecnologia e Problemas Sanitários de Irrigação');
INSERT INTO area_conhecimento VALUES (511, 'Águas Subterráneas e Poços Profundos');
INSERT INTO area_conhecimento VALUES (512, 'Controle de Enchentes e de Barragens');
INSERT INTO area_conhecimento VALUES (513, 'Tratamento de Águas de Abastecimento e Residuárias');
INSERT INTO area_conhecimento VALUES (514, 'Química Sanitária');
INSERT INTO area_conhecimento VALUES (515, 'Processos Simplificados de Tratamento de Águas');
INSERT INTO area_conhecimento VALUES (635, 'Aviões');
INSERT INTO area_conhecimento VALUES (516, 'Técnicas Convencionais de Tratamento de Águas');
INSERT INTO area_conhecimento VALUES (517, 'Técnicas Avançadas de Tratamento de Águas');
INSERT INTO area_conhecimento VALUES (518, 'Estudos e Caracterização de Efluentes Industriais');
INSERT INTO area_conhecimento VALUES (519, 'Layout de Processos Industriais');
INSERT INTO area_conhecimento VALUES (520, 'Resíduos Radioativos');
INSERT INTO area_conhecimento VALUES (521, 'Saneamento Básico');
INSERT INTO area_conhecimento VALUES (522, 'Técnicas de Abastecimento da Água');
INSERT INTO area_conhecimento VALUES (523, 'Drenagem de Águas Residuárias');
INSERT INTO area_conhecimento VALUES (524, 'Drenagem Urbana de Águas Pluviais');
INSERT INTO area_conhecimento VALUES (525, 'Residuos Sólidos, Domésticos e Industriais');
INSERT INTO area_conhecimento VALUES (526, 'Limpeza Pública');
INSERT INTO area_conhecimento VALUES (527, 'Instalações Hidráulico-Sanitárias');
INSERT INTO area_conhecimento VALUES (528, 'Saneamento Ambiental');
INSERT INTO area_conhecimento VALUES (529, 'Ecologia Aplicada a Engenharia Sanitária');
INSERT INTO area_conhecimento VALUES (530, 'Microbiologia Aplicada e Engenharia Sanitária');
INSERT INTO area_conhecimento VALUES (531, 'Parasitologia Aplicada a Engenharia Sanitária');
INSERT INTO area_conhecimento VALUES (532, 'Qualidade do Ar, das Águas e do Solo');
INSERT INTO area_conhecimento VALUES (533, 'Controle da Poluição');
INSERT INTO area_conhecimento VALUES (534, 'Legislação Ambiental');
INSERT INTO area_conhecimento VALUES (535, 'Engenharia de Produção');
INSERT INTO area_conhecimento VALUES (536, 'Gerência de Produção');
INSERT INTO area_conhecimento VALUES (537, 'Planejamento de Instalações Industriais');
INSERT INTO area_conhecimento VALUES (538, 'Planejamento, Projeto e Controle de Sistemas de Produção');
INSERT INTO area_conhecimento VALUES (539, 'Higiene e Segurança do Trabalho');
INSERT INTO area_conhecimento VALUES (540, 'Suprimentos');
INSERT INTO area_conhecimento VALUES (541, 'Garantia de Controle de Qualidade');
INSERT INTO area_conhecimento VALUES (542, 'Pesquisa Operacional');
INSERT INTO area_conhecimento VALUES (543, 'Processos Estocásticos e Teoria das Filas');
INSERT INTO area_conhecimento VALUES (544, 'Programação Linear, Não-Linear, Mista e Dinâmica');
INSERT INTO area_conhecimento VALUES (545, 'Séries Temporais');
INSERT INTO area_conhecimento VALUES (546, 'Teoria dos Grafos');
INSERT INTO area_conhecimento VALUES (547, 'Teoria dos Jogos');
INSERT INTO area_conhecimento VALUES (548, 'Engenharia do Produto');
INSERT INTO area_conhecimento VALUES (549, 'Ergonomia');
INSERT INTO area_conhecimento VALUES (550, 'Metodologia de Projeto do Produto');
INSERT INTO area_conhecimento VALUES (551, 'Processos de Trabalho');
INSERT INTO area_conhecimento VALUES (552, 'Gerência do Projeto e do Produto');
INSERT INTO area_conhecimento VALUES (553, 'Desenvolvimento de Produto');
INSERT INTO area_conhecimento VALUES (554, 'Engenharia Econômica');
INSERT INTO area_conhecimento VALUES (555, 'Estudo de Mercado');
INSERT INTO area_conhecimento VALUES (556, 'Localização Industrial');
INSERT INTO area_conhecimento VALUES (557, 'Análise de Custos');
INSERT INTO area_conhecimento VALUES (558, 'Economia de Tecnologia');
INSERT INTO area_conhecimento VALUES (559, 'Vida Econômica dos Equipamentos');
INSERT INTO area_conhecimento VALUES (560, 'Avaliação de Projetos');
INSERT INTO area_conhecimento VALUES (561, 'Engenharia Nuclear');
INSERT INTO area_conhecimento VALUES (562, 'Aplicações de Radioisótopos');
INSERT INTO area_conhecimento VALUES (563, 'Produção de Radioisótopos');
INSERT INTO area_conhecimento VALUES (564, 'Aplicações Industriais de Radioisótopos');
INSERT INTO area_conhecimento VALUES (565, 'Instrumentação para Medida e Controle de Radiação');
INSERT INTO area_conhecimento VALUES (566, 'Fusão Controlada');
INSERT INTO area_conhecimento VALUES (567, 'Processos Industriais da Fusão Controlada');
INSERT INTO area_conhecimento VALUES (568, 'Problemas Tecnológicos da Fusão Controlada');
INSERT INTO area_conhecimento VALUES (569, 'Combustível Nuclear');
INSERT INTO area_conhecimento VALUES (570, 'Extração de Combustível Nuclear');
INSERT INTO area_conhecimento VALUES (571, 'Conversão, Enriquecimento e Fabricação de Combustível Nuclear');
INSERT INTO area_conhecimento VALUES (572, 'Reprocessamento de Combustível Nuclear');
INSERT INTO area_conhecimento VALUES (573, 'Rejeitos de Combustível Nuclear');
INSERT INTO area_conhecimento VALUES (574, 'Tecnologia dos Reatores');
INSERT INTO area_conhecimento VALUES (575, 'Núcleo do Reator');
INSERT INTO area_conhecimento VALUES (576, 'Materiais Nucleares e Blindagem de Reatores');
INSERT INTO area_conhecimento VALUES (577, 'Transferência de Calor em Reatores');
INSERT INTO area_conhecimento VALUES (578, 'Geração e Integração com Sistemas Elétricos  em Reatores');
INSERT INTO area_conhecimento VALUES (579, 'Instrumentação para Operação e Controle de Reatores');
INSERT INTO area_conhecimento VALUES (580, 'Segurança, Localização e Licenciamento de Reatores');
INSERT INTO area_conhecimento VALUES (581, 'Aspectos Econômicos de Reatores');
INSERT INTO area_conhecimento VALUES (582, 'Engenharia de Transportes');
INSERT INTO area_conhecimento VALUES (583, 'Planejamento de Transportes');
INSERT INTO area_conhecimento VALUES (584, 'Planejamento e Organização do Sistema de Transporte');
INSERT INTO area_conhecimento VALUES (585, 'Economia dos Transportes');
INSERT INTO area_conhecimento VALUES (586, 'Veículos e Equipamentos de Controle');
INSERT INTO area_conhecimento VALUES (587, 'Vias de Transporte');
INSERT INTO area_conhecimento VALUES (588, 'Veículos de Transportes');
INSERT INTO area_conhecimento VALUES (589, 'Estação de Transporte');
INSERT INTO area_conhecimento VALUES (590, 'Equipamentos Auxiliares e Controles');
INSERT INTO area_conhecimento VALUES (591, 'Operações de Transportes');
INSERT INTO area_conhecimento VALUES (592, 'Engenharia de Tráfego');
INSERT INTO area_conhecimento VALUES (593, 'Capacidade de Vias de Transporte');
INSERT INTO area_conhecimento VALUES (594, 'Operação de Sistemas de Transporte');
INSERT INTO area_conhecimento VALUES (595, 'Engenharia Naval e Oceânica');
INSERT INTO area_conhecimento VALUES (596, 'Hidrodinâmica de Navios e Sistemas Oceânicos');
INSERT INTO area_conhecimento VALUES (597, 'Resistência Hidrodinâmica');
INSERT INTO area_conhecimento VALUES (598, 'Propulsão de Navios');
INSERT INTO area_conhecimento VALUES (599, 'Estruturas Navais e Oceânicas');
INSERT INTO area_conhecimento VALUES (600, 'Análise Teórica e Experimental de Estrutura');
INSERT INTO area_conhecimento VALUES (601, 'Dinâmica Estrutural Naval e Oceânica');
INSERT INTO area_conhecimento VALUES (602, 'Síntese Estrutural Naval e Oceânica');
INSERT INTO area_conhecimento VALUES (603, 'Máquinas Marítimas');
INSERT INTO area_conhecimento VALUES (604, 'Análise de Sistemas Propulsores');
INSERT INTO area_conhecimento VALUES (605, 'Controle e Automação de Sistemas Propulsores');
INSERT INTO area_conhecimento VALUES (606, 'Equipamentos Auxiliares do Sistema Propulsivo');
INSERT INTO area_conhecimento VALUES (607, 'Motor de Propulsão');
INSERT INTO area_conhecimento VALUES (608, 'Projeto de Navios e de Sistemas Oceânicos');
INSERT INTO area_conhecimento VALUES (609, 'Projetos de Navios');
INSERT INTO area_conhecimento VALUES (610, 'Projetos de Sistemas Oceânicos Fixos e Semi-Fixos');
INSERT INTO area_conhecimento VALUES (611, 'Projetos de Embarcações Não-Convencionais');
INSERT INTO area_conhecimento VALUES (612, 'Tecnologia de Construção Naval e de Sistemas Oceânicos');
INSERT INTO area_conhecimento VALUES (613, 'Métodos de Fabricação de Navios e Sistemas Oceânicos');
INSERT INTO area_conhecimento VALUES (614, 'Soldagem de Estruturas Navais e Oceânicos');
INSERT INTO area_conhecimento VALUES (615, 'Custos de Construção Naval');
INSERT INTO area_conhecimento VALUES (616, 'Normatização e Certificação de Qualidade de Navios');
INSERT INTO area_conhecimento VALUES (617, 'Engenharia Aeroespacial');
INSERT INTO area_conhecimento VALUES (618, 'Aerodinâmica');
INSERT INTO area_conhecimento VALUES (619, 'Aerodinâmica de Aeronaves Espaciais');
INSERT INTO area_conhecimento VALUES (620, 'Aerodinâmica dos Processos Geofísicos e Interplanetários');
INSERT INTO area_conhecimento VALUES (621, 'Dinâmica de Vôo');
INSERT INTO area_conhecimento VALUES (622, 'Trajetórias e Órbitas');
INSERT INTO area_conhecimento VALUES (623, 'Estabilidade e Controle');
INSERT INTO area_conhecimento VALUES (624, 'Estruturas Aeroespaciais');
INSERT INTO area_conhecimento VALUES (625, 'Aeroelasticicidade');
INSERT INTO area_conhecimento VALUES (626, 'Fadiga');
INSERT INTO area_conhecimento VALUES (627, 'Projeto de Estruturas Aeroespaciais');
INSERT INTO area_conhecimento VALUES (628, 'Materiais e Processos para Engenharia Aeronáutica e Aeroespacial');
INSERT INTO area_conhecimento VALUES (629, 'Propulsão Aeroespacial');
INSERT INTO area_conhecimento VALUES (630, 'Combustão e Escoamento com Reações Químicas');
INSERT INTO area_conhecimento VALUES (631, 'Propulsão de Foguetes');
INSERT INTO area_conhecimento VALUES (632, 'Máquinas de Fluxo');
INSERT INTO area_conhecimento VALUES (633, 'Motores Alternativos');
INSERT INTO area_conhecimento VALUES (634, 'Sistemas Aeroespaciais');
INSERT INTO area_conhecimento VALUES (636, 'Foguetes');
INSERT INTO area_conhecimento VALUES (637, 'Helicópteros');
INSERT INTO area_conhecimento VALUES (638, 'Hovercraft');
INSERT INTO area_conhecimento VALUES (639, 'Satélites e Outros Dispositivos Aeroespaciais');
INSERT INTO area_conhecimento VALUES (640, 'Normatização e Certificação de Qualidade de Aeronaves e Componentes');
INSERT INTO area_conhecimento VALUES (641, 'Manutenção de Sistemas Aeroespaciais');
INSERT INTO area_conhecimento VALUES (642, 'Engenharia Biomédica');
INSERT INTO area_conhecimento VALUES (643, 'Bioengenharia');
INSERT INTO area_conhecimento VALUES (644, 'Processamento de Sinais Biológicos');
INSERT INTO area_conhecimento VALUES (645, 'Modelagem de Fenômenos Biológicos');
INSERT INTO area_conhecimento VALUES (646, 'Modelagem de Sistemas Biológicos');
INSERT INTO area_conhecimento VALUES (647, 'Engenharia Médica');
INSERT INTO area_conhecimento VALUES (648, 'Biomateriais e Materiais Biocompatíveis');
INSERT INTO area_conhecimento VALUES (649, 'Transdutores para Aplicações Biomédicas');
INSERT INTO area_conhecimento VALUES (650, 'Instrumentação Odontológica e Médico-Hospitalar');
INSERT INTO area_conhecimento VALUES (651, 'Tecnologia de Próteses');
INSERT INTO area_conhecimento VALUES (652, 'Ciências da Saúde');
INSERT INTO area_conhecimento VALUES (653, 'Medicina');
INSERT INTO area_conhecimento VALUES (654, 'Clínica Médica');
INSERT INTO area_conhecimento VALUES (655, 'Angiologia');
INSERT INTO area_conhecimento VALUES (656, 'Dermatologia');
INSERT INTO area_conhecimento VALUES (657, 'Alergologia e Imunologia Clínica');
INSERT INTO area_conhecimento VALUES (658, 'Cancerologia');
INSERT INTO area_conhecimento VALUES (659, 'Hematologia');
INSERT INTO area_conhecimento VALUES (660, 'Endocrinologia');
INSERT INTO area_conhecimento VALUES (661, 'Neurologia');
INSERT INTO area_conhecimento VALUES (662, 'Pediatria');
INSERT INTO area_conhecimento VALUES (663, 'Doenças Infecciosas e Parasitárias');
INSERT INTO area_conhecimento VALUES (664, 'Cardiologia');
INSERT INTO area_conhecimento VALUES (665, 'Gastroenterologia');
INSERT INTO area_conhecimento VALUES (666, 'Pneumologia');
INSERT INTO area_conhecimento VALUES (667, 'Nefrologia');
INSERT INTO area_conhecimento VALUES (668, 'Reumatologia');
INSERT INTO area_conhecimento VALUES (669, 'Ginecologia e Obstetrícia');
INSERT INTO area_conhecimento VALUES (670, 'Fisiatria');
INSERT INTO area_conhecimento VALUES (671, 'Oftalmologia');
INSERT INTO area_conhecimento VALUES (672, 'Ortopedia');
INSERT INTO area_conhecimento VALUES (673, 'Cirurgia');
INSERT INTO area_conhecimento VALUES (674, 'Cirurgia Plástica e Restauradora');
INSERT INTO area_conhecimento VALUES (675, 'Cirurgia Otorrinolaringológica');
INSERT INTO area_conhecimento VALUES (676, 'Cirurgia Oftalmológica');
INSERT INTO area_conhecimento VALUES (677, 'Cirurgia Cardiovascular');
INSERT INTO area_conhecimento VALUES (678, 'Cirurgia Toráxica');
INSERT INTO area_conhecimento VALUES (679, 'Cirurgia Gastroenterologia');
INSERT INTO area_conhecimento VALUES (680, 'Cirurgia Pediátrica');
INSERT INTO area_conhecimento VALUES (681, 'Neurocirurgia');
INSERT INTO area_conhecimento VALUES (682, 'Cirurgia Urológica');
INSERT INTO area_conhecimento VALUES (683, 'Cirurgia Proctológica');
INSERT INTO area_conhecimento VALUES (684, 'Cirurgia Ortopédica');
INSERT INTO area_conhecimento VALUES (685, 'Cirurgia Traumatológica');
INSERT INTO area_conhecimento VALUES (686, 'Anestesiologia');
INSERT INTO area_conhecimento VALUES (687, 'Cirurgia Experimental');
INSERT INTO area_conhecimento VALUES (688, 'Saúde Materno-Infantil');
INSERT INTO area_conhecimento VALUES (689, 'Psiquiatria');
INSERT INTO area_conhecimento VALUES (690, 'Anatomia Patológica e Patologia Clínica');
INSERT INTO area_conhecimento VALUES (691, 'Radiologia Médica');
INSERT INTO area_conhecimento VALUES (692, 'Medicina Legal e Deontologia');
INSERT INTO area_conhecimento VALUES (693, 'Odontologia');
INSERT INTO area_conhecimento VALUES (694, 'Clínica Odontológica');
INSERT INTO area_conhecimento VALUES (695, 'Cirurgia Buco-Maxilo-Facial');
INSERT INTO area_conhecimento VALUES (696, 'Ortodontia');
INSERT INTO area_conhecimento VALUES (697, 'Odontopediatria');
INSERT INTO area_conhecimento VALUES (698, 'Periodontia');
INSERT INTO area_conhecimento VALUES (699, 'Endodontia');
INSERT INTO area_conhecimento VALUES (700, 'Radiologia Odontológica');
INSERT INTO area_conhecimento VALUES (701, 'Odontologia Social e Preventiva');
INSERT INTO area_conhecimento VALUES (702, 'Materiais Odontológicos');
INSERT INTO area_conhecimento VALUES (703, 'Farmácia');
INSERT INTO area_conhecimento VALUES (704, 'Farmacotecnia');
INSERT INTO area_conhecimento VALUES (705, 'Farmacognosia');
INSERT INTO area_conhecimento VALUES (706, 'Análise Toxicológica');
INSERT INTO area_conhecimento VALUES (707, 'Análise e Controle de Medicamentos');
INSERT INTO area_conhecimento VALUES (708, 'Bromatologia');
INSERT INTO area_conhecimento VALUES (709, 'Enfermagem');
INSERT INTO area_conhecimento VALUES (710, 'Enfermagem Médico-Cirúrgica');
INSERT INTO area_conhecimento VALUES (711, 'Enfermagem Obstétrica');
INSERT INTO area_conhecimento VALUES (712, 'Enfermagem Pediátrica');
INSERT INTO area_conhecimento VALUES (713, 'Enfermagem Psiquiátrica');
INSERT INTO area_conhecimento VALUES (714, 'Enfermagem de Doenças Contagiosas');
INSERT INTO area_conhecimento VALUES (715, 'Enfermagem de Saúde Pública');
INSERT INTO area_conhecimento VALUES (716, 'Nutrição');
INSERT INTO area_conhecimento VALUES (717, 'Bioquímica da Nutrição');
INSERT INTO area_conhecimento VALUES (718, 'Dietética');
INSERT INTO area_conhecimento VALUES (719, 'Análise Nutricional de População');
INSERT INTO area_conhecimento VALUES (720, 'Desnutrição e Desenvolvimento Fisiológico');
INSERT INTO area_conhecimento VALUES (721, 'Saúde Coletiva');
INSERT INTO area_conhecimento VALUES (722, 'Epidemiologia');
INSERT INTO area_conhecimento VALUES (723, 'Saúde Pública');
INSERT INTO area_conhecimento VALUES (724, 'Medicina Preventiva');
INSERT INTO area_conhecimento VALUES (725, 'Fonoaudiologia');
INSERT INTO area_conhecimento VALUES (726, 'Fisioterapia e Terapia Ocupacional');
INSERT INTO area_conhecimento VALUES (727, 'Educação Física');
INSERT INTO area_conhecimento VALUES (728, 'Ciências Agrárias');
INSERT INTO area_conhecimento VALUES (729, 'Agronomia');
INSERT INTO area_conhecimento VALUES (730, 'Ciência do Solo');
INSERT INTO area_conhecimento VALUES (731, 'Gênese, Morfologia e Classificação dos Solos');
INSERT INTO area_conhecimento VALUES (732, 'Física do Solo');
INSERT INTO area_conhecimento VALUES (733, 'Química do Solo');
INSERT INTO area_conhecimento VALUES (734, 'Microbiologia e Bioquímica do Solo');
INSERT INTO area_conhecimento VALUES (735, 'Fertilidade do Solo e Adubação');
INSERT INTO area_conhecimento VALUES (736, 'Manejo e Conservação do Solo');
INSERT INTO area_conhecimento VALUES (737, 'Fitossanidade');
INSERT INTO area_conhecimento VALUES (738, 'Fitopatologia');
INSERT INTO area_conhecimento VALUES (739, 'Entomologia Agrícola');
INSERT INTO area_conhecimento VALUES (740, 'Parasitologia Agrícola');
INSERT INTO area_conhecimento VALUES (741, 'Microbiologia Agrícola');
INSERT INTO area_conhecimento VALUES (742, 'Defesa Fitossanitária');
INSERT INTO area_conhecimento VALUES (743, 'Fitotecnia');
INSERT INTO area_conhecimento VALUES (744, 'Manejo e Tratos Culturais');
INSERT INTO area_conhecimento VALUES (745, 'Mecanização Agrícola');
INSERT INTO area_conhecimento VALUES (746, 'Produção e Beneficiamento de Sementes');
INSERT INTO area_conhecimento VALUES (747, 'Produção de Mudas');
INSERT INTO area_conhecimento VALUES (748, 'Melhoramento Vegetal');
INSERT INTO area_conhecimento VALUES (749, 'Fisiologia de Plantas Cultivadas');
INSERT INTO area_conhecimento VALUES (750, 'Matologia');
INSERT INTO area_conhecimento VALUES (751, 'Floricultura, Parques e Jardins');
INSERT INTO area_conhecimento VALUES (752, 'Floricultura');
INSERT INTO area_conhecimento VALUES (753, 'Parques e Jardins');
INSERT INTO area_conhecimento VALUES (754, 'Arborização de Vias Públicas');
INSERT INTO area_conhecimento VALUES (755, 'Agrometeorologia');
INSERT INTO area_conhecimento VALUES (756, 'Extensão Rural');
INSERT INTO area_conhecimento VALUES (757, 'Recursos Florestais e Engenharia Florestal');
INSERT INTO area_conhecimento VALUES (758, 'Silvicultura');
INSERT INTO area_conhecimento VALUES (759, 'Dendrologia');
INSERT INTO area_conhecimento VALUES (760, 'Florestamento e Reflorestamento');
INSERT INTO area_conhecimento VALUES (761, 'Genética e Melhoramento Florestal');
INSERT INTO area_conhecimento VALUES (762, 'Sementes Florestais');
INSERT INTO area_conhecimento VALUES (763, 'Nutrição Florestal');
INSERT INTO area_conhecimento VALUES (764, 'Fisiologia Florestal');
INSERT INTO area_conhecimento VALUES (765, 'Solos Florestais');
INSERT INTO area_conhecimento VALUES (766, 'Proteção Florestal');
INSERT INTO area_conhecimento VALUES (767, 'Manejo Florestal');
INSERT INTO area_conhecimento VALUES (768, 'Economia Florestal');
INSERT INTO area_conhecimento VALUES (769, 'Política e Legislação Florestal');
INSERT INTO area_conhecimento VALUES (770, 'Administração Florestal');
INSERT INTO area_conhecimento VALUES (771, 'Dendrometria e Inventário Florestal');
INSERT INTO area_conhecimento VALUES (772, 'Fotointerpretação Florestal');
INSERT INTO area_conhecimento VALUES (773, 'Ordenamento Florestal');
INSERT INTO area_conhecimento VALUES (774, 'Técnicas e Operações Florestais');
INSERT INTO area_conhecimento VALUES (775, 'Exploração Florestal');
INSERT INTO area_conhecimento VALUES (776, 'Mecanização Florestal');
INSERT INTO area_conhecimento VALUES (777, 'Tecnologia e Utilização de Produtos Florestais');
INSERT INTO area_conhecimento VALUES (778, 'Anatomia e Identificação de Produtos Florestais');
INSERT INTO area_conhecimento VALUES (779, 'Propriedades Fisico-Mecânicas da Madeira');
INSERT INTO area_conhecimento VALUES (780, 'Relações Água-Madeira e Secagem');
INSERT INTO area_conhecimento VALUES (781, 'Tratamento da Madeira');
INSERT INTO area_conhecimento VALUES (782, 'Processamento Mecânico da Madeira');
INSERT INTO area_conhecimento VALUES (783, 'Química da Madeira');
INSERT INTO area_conhecimento VALUES (784, 'Resinas de Madeiras');
INSERT INTO area_conhecimento VALUES (785, 'Tecnologia de Celulose e Papel');
INSERT INTO area_conhecimento VALUES (786, 'Tecnologia de Chapas');
INSERT INTO area_conhecimento VALUES (787, 'Conservação da Natureza');
INSERT INTO area_conhecimento VALUES (788, 'Hidrologia Florestal');
INSERT INTO area_conhecimento VALUES (789, 'Conservação de Áreas Silvestres');
INSERT INTO area_conhecimento VALUES (790, 'Conservação de Bacias Hidrográficas');
INSERT INTO area_conhecimento VALUES (791, 'Recuperação de Areas Degradadas');
INSERT INTO area_conhecimento VALUES (792, 'Energia de Biomassa Florestal');
INSERT INTO area_conhecimento VALUES (793, 'Engenharia Agrícola');
INSERT INTO area_conhecimento VALUES (794, 'Máquinas e Implementos Agrícolas');
INSERT INTO area_conhecimento VALUES (795, 'Engenharia de Água e Solo');
INSERT INTO area_conhecimento VALUES (796, 'Irrigação e Drenagem');
INSERT INTO area_conhecimento VALUES (797, 'Conservação de Solo e Água');
INSERT INTO area_conhecimento VALUES (798, 'Engenharia de Processamento de Produtos Agrícolas');
INSERT INTO area_conhecimento VALUES (799, 'Pré-Processamento de Produtos Agrícolas');
INSERT INTO area_conhecimento VALUES (800, 'Armazenamento de Produtos Agrícolas');
INSERT INTO area_conhecimento VALUES (801, 'Transferência de Produtos Agrícolas');
INSERT INTO area_conhecimento VALUES (802, 'Construções Rurais e Ambiência');
INSERT INTO area_conhecimento VALUES (803, 'Assentamento Rural');
INSERT INTO area_conhecimento VALUES (804, 'Engenharia de Construções Rurais');
INSERT INTO area_conhecimento VALUES (805, 'Saneamento Rural');
INSERT INTO area_conhecimento VALUES (806, 'Energização Rural');
INSERT INTO area_conhecimento VALUES (807, 'Zootecnia');
INSERT INTO area_conhecimento VALUES (808, 'Ecologia dos Animais Domésticos e Etologia');
INSERT INTO area_conhecimento VALUES (809, 'Genética e Melhoramento dos Animais Domésticos');
INSERT INTO area_conhecimento VALUES (810, 'Nutrição e Alimentação Animal');
INSERT INTO area_conhecimento VALUES (811, 'Exigências Nutricionais dos Animais');
INSERT INTO area_conhecimento VALUES (812, 'Avaliação de Alimentos para Animais');
INSERT INTO area_conhecimento VALUES (813, 'Conservação de Alimentos para Animais');
INSERT INTO area_conhecimento VALUES (814, 'Pastagem e Forragicultura');
INSERT INTO area_conhecimento VALUES (815, 'Avaliação, Produção e Conservação de Forragens');
INSERT INTO area_conhecimento VALUES (816, 'Manejo e Conservação de Pastagens');
INSERT INTO area_conhecimento VALUES (817, 'Fisiologia de Plantas Forrageiras');
INSERT INTO area_conhecimento VALUES (818, 'Melhoramento de Plantas Forrageiras e Produção de Sementes');
INSERT INTO area_conhecimento VALUES (819, 'Toxicologia e Plantas Tóxicas');
INSERT INTO area_conhecimento VALUES (820, 'Produção Animal');
INSERT INTO area_conhecimento VALUES (821, 'Criação de Animais');
INSERT INTO area_conhecimento VALUES (822, 'Manejo de Animais');
INSERT INTO area_conhecimento VALUES (823, 'Instalações para Produção Animal');
INSERT INTO area_conhecimento VALUES (824, 'Medicina Veterinária');
INSERT INTO area_conhecimento VALUES (825, 'Clínica e Cirurgia Animal');
INSERT INTO area_conhecimento VALUES (826, 'Anestesiologia Animal');
INSERT INTO area_conhecimento VALUES (827, 'Técnica Cirúrgica Animal');
INSERT INTO area_conhecimento VALUES (828, 'Radiologia de Animais');
INSERT INTO area_conhecimento VALUES (829, 'Farmacologia e Terapêutica Animal');
INSERT INTO area_conhecimento VALUES (830, 'Obstetrícia Animal');
INSERT INTO area_conhecimento VALUES (831, 'Clínica Veterinária');
INSERT INTO area_conhecimento VALUES (832, 'Clínica Cirúrgica Animal');
INSERT INTO area_conhecimento VALUES (833, 'Toxicologia Animal');
INSERT INTO area_conhecimento VALUES (834, 'Medicina Veterinária Preventiva');
INSERT INTO area_conhecimento VALUES (835, 'Epidemiologia Animal');
INSERT INTO area_conhecimento VALUES (836, 'Saneamento Aplicado a Saúde do Homem');
INSERT INTO area_conhecimento VALUES (837, 'Doenças Infecciosas de Animais');
INSERT INTO area_conhecimento VALUES (838, 'Doenças Parasitárias de Animais');
INSERT INTO area_conhecimento VALUES (839, 'Saúde Animal (Programas Sanitários)');
INSERT INTO area_conhecimento VALUES (840, 'Patologia Animal');
INSERT INTO area_conhecimento VALUES (841, 'Patologia Aviária');
INSERT INTO area_conhecimento VALUES (842, 'Anatomia Patologia Animal');
INSERT INTO area_conhecimento VALUES (843, 'Patologia Clínica Animal');
INSERT INTO area_conhecimento VALUES (844, 'Reprodução Animal');
INSERT INTO area_conhecimento VALUES (845, 'Ginecologia e Andrologia Animal');
INSERT INTO area_conhecimento VALUES (846, 'Inseminação Artificial Animal');
INSERT INTO area_conhecimento VALUES (847, 'Fisiopatologia da Reprodução Animal');
INSERT INTO area_conhecimento VALUES (848, 'Inspeção de Produtos de Origem Animal');
INSERT INTO area_conhecimento VALUES (849, 'Recursos Pesqueiros e Engenharia de Pesca');
INSERT INTO area_conhecimento VALUES (850, 'Recursos Pesqueiros Marinhos');
INSERT INTO area_conhecimento VALUES (851, 'Fatores Abióticos do Mar');
INSERT INTO area_conhecimento VALUES (852, 'Avaliação de Estoques Pesqueiros Marinhos');
INSERT INTO area_conhecimento VALUES (853, 'Exploração Pesqueira Marinha');
INSERT INTO area_conhecimento VALUES (854, 'Manejo e Conservação de Recursos Pesqueiros Marinhos');
INSERT INTO area_conhecimento VALUES (855, 'Recursos Pesqueiros de Águas Interiores');
INSERT INTO area_conhecimento VALUES (856, 'Fatores Abióticos de Águas Interiores');
INSERT INTO area_conhecimento VALUES (857, 'Avaliação de Estoques Pesqueiros de Águas Interiores');
INSERT INTO area_conhecimento VALUES (858, 'Explotação Pesqueira de Águas Interiores');
INSERT INTO area_conhecimento VALUES (859, 'Manejo e Conservação de Recursos Pesqueiros de Águas Interiores');
INSERT INTO area_conhecimento VALUES (860, 'Aqüicultura');
INSERT INTO area_conhecimento VALUES (861, 'Maricultura');
INSERT INTO area_conhecimento VALUES (862, 'Carcinocultura');
INSERT INTO area_conhecimento VALUES (863, 'Ostreicultura');
INSERT INTO area_conhecimento VALUES (864, 'Piscicultura');
INSERT INTO area_conhecimento VALUES (865, 'Engenharia de Pesca');
INSERT INTO area_conhecimento VALUES (866, 'Ciência e Tecnologia de Alimentos');
INSERT INTO area_conhecimento VALUES (867, 'Ciência de Alimentos');
INSERT INTO area_conhecimento VALUES (868, 'Valor Nutritivo de Alimentos');
INSERT INTO area_conhecimento VALUES (869, 'Química, Física, Fisico-Química e Bioquímica dos Alim. e das Mat-Primas Alimentares');
INSERT INTO area_conhecimento VALUES (870, 'Microbiologia de Alimentos');
INSERT INTO area_conhecimento VALUES (871, 'Fisiologia Pós-Colheita');
INSERT INTO area_conhecimento VALUES (872, 'Toxicidade e Resíduos de Pesticidas em Alimentos');
INSERT INTO area_conhecimento VALUES (873, 'Avaliação e Controle de Qualidade de Alimentos');
INSERT INTO area_conhecimento VALUES (874, 'Padrões, Legislação e Fiscalização de Alimentos');
INSERT INTO area_conhecimento VALUES (875, 'Tecnologia de Alimentos');
INSERT INTO area_conhecimento VALUES (876, 'Tecnologia de Produtos de Origem Animal');
INSERT INTO area_conhecimento VALUES (877, 'Tecnologia de Produtos de Origem Vegetal');
INSERT INTO area_conhecimento VALUES (878, 'Tecnologia das Bebidas');
INSERT INTO area_conhecimento VALUES (879, 'Tecnologia de Alimentos Dietéticos e Nutricionais');
INSERT INTO area_conhecimento VALUES (880, 'Aproveitamento de Subprodutos');
INSERT INTO area_conhecimento VALUES (881, 'Embalagens de Produtos Alimentares');
INSERT INTO area_conhecimento VALUES (882, 'Engenharia de Alimentos');
INSERT INTO area_conhecimento VALUES (883, 'Instalações Industriais de Produção de Alimentos');
INSERT INTO area_conhecimento VALUES (884, 'Armazenamento de Alimentos');
INSERT INTO area_conhecimento VALUES (885, 'Ciências Sociais Aplicadas');
INSERT INTO area_conhecimento VALUES (886, 'Direito');
INSERT INTO area_conhecimento VALUES (887, 'Teoria do Direito');
INSERT INTO area_conhecimento VALUES (888, 'Teoria Geral do Direito');
INSERT INTO area_conhecimento VALUES (889, 'Teoria Geral do Processo');
INSERT INTO area_conhecimento VALUES (890, 'Teoria do Estado');
INSERT INTO area_conhecimento VALUES (891, 'História do Direito');
INSERT INTO area_conhecimento VALUES (892, 'Filosofia do Direito');
INSERT INTO area_conhecimento VALUES (893, 'Lógica Jurídica');
INSERT INTO area_conhecimento VALUES (894, 'Sociologia Jurídica');
INSERT INTO area_conhecimento VALUES (895, 'Antropologia Jurídica');
INSERT INTO area_conhecimento VALUES (896, 'Direito Público');
INSERT INTO area_conhecimento VALUES (897, 'Direito Tributário');
INSERT INTO area_conhecimento VALUES (898, 'Direito Penal');
INSERT INTO area_conhecimento VALUES (899, 'Direito Processual Penal');
INSERT INTO area_conhecimento VALUES (900, 'Direito Processual Civil');
INSERT INTO area_conhecimento VALUES (901, 'Direito Constitucional');
INSERT INTO area_conhecimento VALUES (902, 'Direito Administrativo');
INSERT INTO area_conhecimento VALUES (903, 'Direito Internacional Público');
INSERT INTO area_conhecimento VALUES (904, 'Direito Privado');
INSERT INTO area_conhecimento VALUES (905, 'Direito Civil');
INSERT INTO area_conhecimento VALUES (906, 'Direito Comercial');
INSERT INTO area_conhecimento VALUES (907, 'Direito do Trabalho');
INSERT INTO area_conhecimento VALUES (908, 'Direito Internacional Privado');
INSERT INTO area_conhecimento VALUES (909, 'Direitos Especiais');
INSERT INTO area_conhecimento VALUES (910, 'Administração');
INSERT INTO area_conhecimento VALUES (911, 'Administração de Empresas');
INSERT INTO area_conhecimento VALUES (912, 'Administração da Produção');
INSERT INTO area_conhecimento VALUES (913, 'Administração Financeira');
INSERT INTO area_conhecimento VALUES (914, 'Mercadologia');
INSERT INTO area_conhecimento VALUES (915, 'Negócios Internacionais');
INSERT INTO area_conhecimento VALUES (916, 'Administração de Recursos Humanos');
INSERT INTO area_conhecimento VALUES (917, 'Administração Pública');
INSERT INTO area_conhecimento VALUES (918, 'Contabilidade e Finanças Públicas');
INSERT INTO area_conhecimento VALUES (919, 'Organizações Públicas');
INSERT INTO area_conhecimento VALUES (920, 'Política e Planejamento Governamentais');
INSERT INTO area_conhecimento VALUES (921, 'Administração de Pessoal');
INSERT INTO area_conhecimento VALUES (922, 'Planejamento em Ciência e Tecnologia');
INSERT INTO area_conhecimento VALUES (923, 'Administração de Setores Específicos');
INSERT INTO area_conhecimento VALUES (924, 'Ciências Contábeis');
INSERT INTO area_conhecimento VALUES (925, 'Economia');
INSERT INTO area_conhecimento VALUES (926, 'Teoria Econômica');
INSERT INTO area_conhecimento VALUES (927, 'Economia Geral');
INSERT INTO area_conhecimento VALUES (928, 'Teoria Geral da Economia');
INSERT INTO area_conhecimento VALUES (929, 'História do Pensamento Econômico');
INSERT INTO area_conhecimento VALUES (930, 'História Econômica');
INSERT INTO area_conhecimento VALUES (931, 'Sistemas Econômicos');
INSERT INTO area_conhecimento VALUES (932, 'Métodos Quantitativos em Economia');
INSERT INTO area_conhecimento VALUES (933, 'Métodos e Modelos Matemáticos, Econométricos e Estatísticos');
INSERT INTO area_conhecimento VALUES (934, 'Estatística Sócio-Econômica');
INSERT INTO area_conhecimento VALUES (935, 'Contabilidade Nacional');
INSERT INTO area_conhecimento VALUES (936, 'Economia Matemática');
INSERT INTO area_conhecimento VALUES (937, 'Economia Monetária e Fiscal');
INSERT INTO area_conhecimento VALUES (938, 'Teoria Monetária e Financeira');
INSERT INTO area_conhecimento VALUES (939, 'Instituições Monetárias e Financeiras do Brasil');
INSERT INTO area_conhecimento VALUES (940, 'Finanças Públicas Internas');
INSERT INTO area_conhecimento VALUES (941, 'Política Fiscal do Brasil');
INSERT INTO area_conhecimento VALUES (942, 'Crescimento, Flutuações e Planejamento Econômico');
INSERT INTO area_conhecimento VALUES (943, 'Crescimento e Desenvolvimento Econômico');
INSERT INTO area_conhecimento VALUES (944, 'Teoria e Política de Planejamento Econômico');
INSERT INTO area_conhecimento VALUES (945, 'Flutuações Cíclicas e Projeções Econômicas');
INSERT INTO area_conhecimento VALUES (946, 'Inflação');
INSERT INTO area_conhecimento VALUES (947, 'Economia Internacional');
INSERT INTO area_conhecimento VALUES (948, 'Teoria do Comércio Internacional');
INSERT INTO area_conhecimento VALUES (949, 'Relações do Comércio; Política Comercial; Integração Econômica');
INSERT INTO area_conhecimento VALUES (950, 'Balanço de Pagamentos; Finanças Internacionais');
INSERT INTO area_conhecimento VALUES (951, 'Investimentos Internacionais e Ajuda Externa');
INSERT INTO area_conhecimento VALUES (952, 'Economia dos Recursos Humanos');
INSERT INTO area_conhecimento VALUES (953, 'Treinamento e Alocação de Mão-de-Obra; Oferta de Mão-de-Obra e Força de Trabalho');
INSERT INTO area_conhecimento VALUES (954, 'Mercado de Trabalho; Política do Governo');
INSERT INTO area_conhecimento VALUES (955, 'Sindicatos, Dissídios Coletivos, Relações de Emprego (Empregador/Empregado)');
INSERT INTO area_conhecimento VALUES (956, 'Capital Humano');
INSERT INTO area_conhecimento VALUES (957, 'Demografia Econômica');
INSERT INTO area_conhecimento VALUES (958, 'Economia Industrial');
INSERT INTO area_conhecimento VALUES (959, 'Organização Industrial e  Estudos Industriais');
INSERT INTO area_conhecimento VALUES (960, 'Mudança Tecnológica');
INSERT INTO area_conhecimento VALUES (961, 'Economia do Bem-Estar Social');
INSERT INTO area_conhecimento VALUES (962, 'Economia dos Programas de Bem-Estar Social');
INSERT INTO area_conhecimento VALUES (963, 'Economia do Consumidor');
INSERT INTO area_conhecimento VALUES (964, 'Economia Regional e Urbana');
INSERT INTO area_conhecimento VALUES (965, 'Economia Regional');
INSERT INTO area_conhecimento VALUES (966, 'Economia Urbana');
INSERT INTO area_conhecimento VALUES (967, 'Renda e Tributação');
INSERT INTO area_conhecimento VALUES (968, 'Economias Agrária e dos Recursos Naturais');
INSERT INTO area_conhecimento VALUES (969, 'Economia Agrária');
INSERT INTO area_conhecimento VALUES (970, 'Economia dos Recursos Naturais');
INSERT INTO area_conhecimento VALUES (971, 'Arquitetura e Urbanismo');
INSERT INTO area_conhecimento VALUES (972, 'Fundamentos de Arquitetura e Urbanismo');
INSERT INTO area_conhecimento VALUES (973, 'História da Arquitetura e Urbanismo');
INSERT INTO area_conhecimento VALUES (974, 'Teoria da Arquitetura');
INSERT INTO area_conhecimento VALUES (975, 'História do Urbanismo');
INSERT INTO area_conhecimento VALUES (976, 'Teoria do Urbanismo');
INSERT INTO area_conhecimento VALUES (977, 'Projeto de Arquitetura e Urbanismo');
INSERT INTO area_conhecimento VALUES (978, 'Planejamento e Projetos da Edificação');
INSERT INTO area_conhecimento VALUES (979, 'Planejamento e Projeto do Espaço Urbano');
INSERT INTO area_conhecimento VALUES (980, 'Planejamento e Projeto do Equipamento');
INSERT INTO area_conhecimento VALUES (981, 'Tecnologia de Arquitetura e Urbanismo');
INSERT INTO area_conhecimento VALUES (982, 'Adequação Ambiental');
INSERT INTO area_conhecimento VALUES (983, 'Paisagismo');
INSERT INTO area_conhecimento VALUES (984, 'Desenvolvimento Histórico do Paisagismo');
INSERT INTO area_conhecimento VALUES (985, 'Conceituação de Paisagísmo e Metodologia do Paisagismo');
INSERT INTO area_conhecimento VALUES (986, 'Estudos de Organização do Espaço Exterior');
INSERT INTO area_conhecimento VALUES (987, 'Projetos de Espaços Livres Urbanos');
INSERT INTO area_conhecimento VALUES (988, 'Planejamento Urbano e Regional');
INSERT INTO area_conhecimento VALUES (989, 'Fundamentos do Planejamento Urbano e Regional');
INSERT INTO area_conhecimento VALUES (990, 'Teoria do Planejamento Urbano e Regional');
INSERT INTO area_conhecimento VALUES (991, 'Teoria da Urbanização');
INSERT INTO area_conhecimento VALUES (992, 'Política Urbana');
INSERT INTO area_conhecimento VALUES (993, 'História Urbana');
INSERT INTO area_conhecimento VALUES (994, 'Métodos e Técnicas do Planejamento Urbano e Regional');
INSERT INTO area_conhecimento VALUES (995, 'Informação, Cadastro e Mapeamento');
INSERT INTO area_conhecimento VALUES (996, 'Técnica de Previsão Urbana e Regional');
INSERT INTO area_conhecimento VALUES (997, 'Técnicas de Análise e Avaliação Urbana e Regional');
INSERT INTO area_conhecimento VALUES (998, 'Técnicas de Planejamento e Projeto Urbanos e Regionais');
INSERT INTO area_conhecimento VALUES (999, 'Serviços Urbanos e Regionais');
INSERT INTO area_conhecimento VALUES (1000, 'Administração Municipal e Urbana');
INSERT INTO area_conhecimento VALUES (1001, 'Estudos da Habitação');
INSERT INTO area_conhecimento VALUES (1002, 'Aspectos Sociais do Planejamento Urbano e Regional');
INSERT INTO area_conhecimento VALUES (1003, 'Aspectos Econômicos do Planejamento Urbano e Regional');
INSERT INTO area_conhecimento VALUES (1004, 'Aspectos Físico-Ambientais do Planejamento Urbano e Regional');
INSERT INTO area_conhecimento VALUES (1005, 'Serviços Comunitários');
INSERT INTO area_conhecimento VALUES (1006, 'Infra-Estruturas Urbanas e Regionais');
INSERT INTO area_conhecimento VALUES (1007, 'Transporte e Tráfego Urbano e Regional');
INSERT INTO area_conhecimento VALUES (1008, 'Legislação Urbana e Regional');
INSERT INTO area_conhecimento VALUES (1009, 'Demografia');
INSERT INTO area_conhecimento VALUES (1010, 'Distribuição Espacial');
INSERT INTO area_conhecimento VALUES (1011, 'Distribuição Espacial Geral');
INSERT INTO area_conhecimento VALUES (1012, 'Distribuição Espacial Urbana');
INSERT INTO area_conhecimento VALUES (1013, 'Distribuição Espacial Rural');
INSERT INTO area_conhecimento VALUES (1014, 'Tendência Populacional');
INSERT INTO area_conhecimento VALUES (1015, 'Tendências Passadas');
INSERT INTO area_conhecimento VALUES (1016, 'Taxas e Estimativas Correntes');
INSERT INTO area_conhecimento VALUES (1017, 'Projeções');
INSERT INTO area_conhecimento VALUES (1018, 'Componentes da Dinâmica Demográfica');
INSERT INTO area_conhecimento VALUES (1019, 'Fecundidade');
INSERT INTO area_conhecimento VALUES (1020, 'Mortalidade');
INSERT INTO area_conhecimento VALUES (1021, 'Migração');
INSERT INTO area_conhecimento VALUES (1022, 'Nupcialidade e Família');
INSERT INTO area_conhecimento VALUES (1023, 'Casamento e Divórcio');
INSERT INTO area_conhecimento VALUES (1024, 'Família e Reprodução');
INSERT INTO area_conhecimento VALUES (1025, 'Demografia Histórica');
INSERT INTO area_conhecimento VALUES (1026, 'Natalidade, Mortalidade, Migração');
INSERT INTO area_conhecimento VALUES (1027, 'Métodos e Técnicas de Demografia Histórica');
INSERT INTO area_conhecimento VALUES (1028, 'Política Pública e População');
INSERT INTO area_conhecimento VALUES (1029, 'Política Populacional');
INSERT INTO area_conhecimento VALUES (1030, 'Políticas de Redistribuição de População');
INSERT INTO area_conhecimento VALUES (1031, 'Políticas de Planejamento Familiar');
INSERT INTO area_conhecimento VALUES (1032, 'Fontes de Dados Demográficos');
INSERT INTO area_conhecimento VALUES (1033, 'Ciência da Informação');
INSERT INTO area_conhecimento VALUES (1034, 'Teoria da Informação');
INSERT INTO area_conhecimento VALUES (1035, 'Teoria Geral da Informação');
INSERT INTO area_conhecimento VALUES (1036, 'Processos da Comunicação');
INSERT INTO area_conhecimento VALUES (1037, 'Representação da Informação');
INSERT INTO area_conhecimento VALUES (1038, 'Biblioteconomia');
INSERT INTO area_conhecimento VALUES (1039, 'Teoria da Classificação');
INSERT INTO area_conhecimento VALUES (1040, 'Métodos Quantitativos. Bibliometria');
INSERT INTO area_conhecimento VALUES (1041, 'Técnicas de Recuperação de Informação');
INSERT INTO area_conhecimento VALUES (1042, 'Processos de Disseminação da Informação');
INSERT INTO area_conhecimento VALUES (1043, 'Arquivologia');
INSERT INTO area_conhecimento VALUES (1044, 'Organização de Arquivos');
INSERT INTO area_conhecimento VALUES (1045, 'Museologia');
INSERT INTO area_conhecimento VALUES (1046, 'Comunicação');
INSERT INTO area_conhecimento VALUES (1047, 'Teoria da Comunicação');
INSERT INTO area_conhecimento VALUES (1048, 'Jornalismo e Editoração');
INSERT INTO area_conhecimento VALUES (1049, 'Teoria e Ética do Jornalismo');
INSERT INTO area_conhecimento VALUES (1050, 'Organização Editorial de Jornais');
INSERT INTO area_conhecimento VALUES (1051, 'Organização Comercial de Jornais');
INSERT INTO area_conhecimento VALUES (1052, 'Jornalismo Especializado (Comunitário, Rural, Empresarial, Científico)');
INSERT INTO area_conhecimento VALUES (1053, 'Rádio e Televisão');
INSERT INTO area_conhecimento VALUES (1054, 'Radiodifusão');
INSERT INTO area_conhecimento VALUES (1055, 'Videodifusão');
INSERT INTO area_conhecimento VALUES (1056, 'Relações Públicas e Propaganda');
INSERT INTO area_conhecimento VALUES (1057, 'Comunicação Visual');
INSERT INTO area_conhecimento VALUES (1058, 'Serviço Social');
INSERT INTO area_conhecimento VALUES (1059, 'Fundamentos do Serviço Social');
INSERT INTO area_conhecimento VALUES (1060, 'Serviço Social Aplicado');
INSERT INTO area_conhecimento VALUES (1061, 'Serviço Social do Trabalho');
INSERT INTO area_conhecimento VALUES (1062, 'Serviço Social da Educação');
INSERT INTO area_conhecimento VALUES (1063, 'Serviço Social do Menor');
INSERT INTO area_conhecimento VALUES (1064, 'Serviço Social da Saúde');
INSERT INTO area_conhecimento VALUES (1065, 'Serviço Social da Habitação');
INSERT INTO area_conhecimento VALUES (1066, 'Economia Doméstica');
INSERT INTO area_conhecimento VALUES (1067, 'Desenho Industrial');
INSERT INTO area_conhecimento VALUES (1068, 'Programação Visual');
INSERT INTO area_conhecimento VALUES (1069, 'Desenho de Produto');
INSERT INTO area_conhecimento VALUES (1070, 'Turismo');
INSERT INTO area_conhecimento VALUES (1071, 'Ciências Humanas');
INSERT INTO area_conhecimento VALUES (1072, 'Filosofia');
INSERT INTO area_conhecimento VALUES (1073, 'História da Filosofia');
INSERT INTO area_conhecimento VALUES (1074, 'Metafísica');
INSERT INTO area_conhecimento VALUES (1075, 'Lógica');
INSERT INTO area_conhecimento VALUES (1076, 'Ética');
INSERT INTO area_conhecimento VALUES (1077, 'Epistemologia');
INSERT INTO area_conhecimento VALUES (1078, 'Filosofia Brasileira');
INSERT INTO area_conhecimento VALUES (1079, 'Sociologia');
INSERT INTO area_conhecimento VALUES (1080, 'Fundamentos da Sociologia');
INSERT INTO area_conhecimento VALUES (1081, 'Teoria Sociológica');
INSERT INTO area_conhecimento VALUES (1082, 'História da Sociologia');
INSERT INTO area_conhecimento VALUES (1083, 'Sociologia do Conhecimento');
INSERT INTO area_conhecimento VALUES (1084, 'Sociologia do Desenvolvimento');
INSERT INTO area_conhecimento VALUES (1085, 'Sociologia Urbana');
INSERT INTO area_conhecimento VALUES (1086, 'Sociologia Rural');
INSERT INTO area_conhecimento VALUES (1087, 'Sociologia da Saúde');
INSERT INTO area_conhecimento VALUES (1088, 'Outras Sociologias Específicas');
INSERT INTO area_conhecimento VALUES (1089, 'Antropologia');
INSERT INTO area_conhecimento VALUES (1090, 'Teoria Antropológica');
INSERT INTO area_conhecimento VALUES (1091, 'Etnologia Indígena');
INSERT INTO area_conhecimento VALUES (1092, 'Antropologia Urbana');
INSERT INTO area_conhecimento VALUES (1093, 'Antropologia Rural');
INSERT INTO area_conhecimento VALUES (1094, 'Antropologia das Populações Afro-Brasileiras');
INSERT INTO area_conhecimento VALUES (1095, 'Arqueologia');
INSERT INTO area_conhecimento VALUES (1096, 'Teoria e Método em Arqueologia');
INSERT INTO area_conhecimento VALUES (1097, 'Arqueologia Pré-Histórica');
INSERT INTO area_conhecimento VALUES (1098, 'Arqueologia Histórica');
INSERT INTO area_conhecimento VALUES (1099, 'História');
INSERT INTO area_conhecimento VALUES (1100, 'Teoria e Filosofia da História');
INSERT INTO area_conhecimento VALUES (1101, 'História Antiga e Medieval');
INSERT INTO area_conhecimento VALUES (1102, 'História Moderna e Contemporânea');
INSERT INTO area_conhecimento VALUES (1103, 'História da América');
INSERT INTO area_conhecimento VALUES (1104, 'História dos Estados Unidos');
INSERT INTO area_conhecimento VALUES (1105, 'História Latino-Americana');
INSERT INTO area_conhecimento VALUES (1106, 'História do Brasil');
INSERT INTO area_conhecimento VALUES (1107, 'História do Brasil Colônia');
INSERT INTO area_conhecimento VALUES (1108, 'História do Brasil Império');
INSERT INTO area_conhecimento VALUES (1109, 'História do Brasil República');
INSERT INTO area_conhecimento VALUES (1110, 'História Regional do Brasil');
INSERT INTO area_conhecimento VALUES (1111, 'História das Ciências');
INSERT INTO area_conhecimento VALUES (1112, 'Geografia');
INSERT INTO area_conhecimento VALUES (1113, 'Geografia Humana');
INSERT INTO area_conhecimento VALUES (1114, 'Geografia da População');
INSERT INTO area_conhecimento VALUES (1115, 'Geografia Agrária');
INSERT INTO area_conhecimento VALUES (1116, 'Geografia Urbana');
INSERT INTO area_conhecimento VALUES (1117, 'Geografia Econômica');
INSERT INTO area_conhecimento VALUES (1118, 'Geografia Política');
INSERT INTO area_conhecimento VALUES (1119, 'Geografia Regional');
INSERT INTO area_conhecimento VALUES (1120, 'Teoria do Desenvolvimento Regional');
INSERT INTO area_conhecimento VALUES (1121, 'Regionalização');
INSERT INTO area_conhecimento VALUES (1122, 'Análise Regional');
INSERT INTO area_conhecimento VALUES (1123, 'Psicologia');
INSERT INTO area_conhecimento VALUES (1124, 'Fundamentos e Medidas da Psicologia');
INSERT INTO area_conhecimento VALUES (1125, 'História, Teorias e Sistemas em Psicologia');
INSERT INTO area_conhecimento VALUES (1126, 'Metodologia, Instrumentação e Equipamento em Psicologia');
INSERT INTO area_conhecimento VALUES (1127, 'Construção e Validade de Testes, Escalas e Outras Medidas Psicológicas');
INSERT INTO area_conhecimento VALUES (1128, 'Técnicas de Processamento Estatístico, Matemático e Computacional em Psicologia');
INSERT INTO area_conhecimento VALUES (1129, 'Psicologia Experimental');
INSERT INTO area_conhecimento VALUES (1130, 'Processos Perceptuais e Motores');
INSERT INTO area_conhecimento VALUES (1131, 'Processos de Aprendizagem, Memória e Motivação');
INSERT INTO area_conhecimento VALUES (1132, 'Processos Cognitivos e Atencionais');
INSERT INTO area_conhecimento VALUES (1133, 'Estados Subjetivos e Emoção');
INSERT INTO area_conhecimento VALUES (1134, 'Psicologia Fisiológica');
INSERT INTO area_conhecimento VALUES (1135, 'Neurologia, Eletrofisiologia e Comportamento');
INSERT INTO area_conhecimento VALUES (1136, 'Processos Psico-Fisiológicos');
INSERT INTO area_conhecimento VALUES (1137, 'Estimulação Elétrica e com Drogas; Comportamento');
INSERT INTO area_conhecimento VALUES (1138, 'Psicobiologia');
INSERT INTO area_conhecimento VALUES (1139, 'Psicologia Comparativa');
INSERT INTO area_conhecimento VALUES (1140, 'Estudos Naturalísticos do Comportamento Animal');
INSERT INTO area_conhecimento VALUES (1141, 'Mecanismos Instintivos e Processos Sociais em Animais');
INSERT INTO area_conhecimento VALUES (1142, 'Psicologia Social');
INSERT INTO area_conhecimento VALUES (1143, 'Relações Interpessoais');
INSERT INTO area_conhecimento VALUES (1144, 'Processos Grupais e de Comunicação');
INSERT INTO area_conhecimento VALUES (1145, 'Papéis e Estruturas Sociais; Indivíduo');
INSERT INTO area_conhecimento VALUES (1146, 'Psicologia Cognitiva');
INSERT INTO area_conhecimento VALUES (1147, 'Psicologia do Desenvolvimento Humano');
INSERT INTO area_conhecimento VALUES (1148, 'Processos Perceptuais e Cognitivos; Desenvolvimento');
INSERT INTO area_conhecimento VALUES (1149, 'Desenvolvimento Social e da Personalidade');
INSERT INTO area_conhecimento VALUES (1150, 'Psicologia do Ensino e da Aprendizagem');
INSERT INTO area_conhecimento VALUES (1151, 'Planejamento Institucional');
INSERT INTO area_conhecimento VALUES (1152, 'Programação de Condições de Ensino');
INSERT INTO area_conhecimento VALUES (1153, 'Treinamento de Pessoal');
INSERT INTO area_conhecimento VALUES (1154, 'Aprendizagem e Desempenho Acadêmicos');
INSERT INTO area_conhecimento VALUES (1155, 'Ensino e Aprendizagem na Sala de Aula');
INSERT INTO area_conhecimento VALUES (1156, 'Psicologia do Trabalho e Organizacional');
INSERT INTO area_conhecimento VALUES (1157, 'Análise Institucional');
INSERT INTO area_conhecimento VALUES (1158, 'Recrutamento e Seleção de Pessoal');
INSERT INTO area_conhecimento VALUES (1159, 'Treinamento e Avaliação');
INSERT INTO area_conhecimento VALUES (1160, 'Fatores Humanos no Trabalho');
INSERT INTO area_conhecimento VALUES (1161, 'Planejamento Ambiental e Comportamento Humano');
INSERT INTO area_conhecimento VALUES (1162, 'Tratamento e Prevenção Psicológica');
INSERT INTO area_conhecimento VALUES (1163, 'Intervenção Terapêutica');
INSERT INTO area_conhecimento VALUES (1164, 'Programas de Atendimento Comunitário');
INSERT INTO area_conhecimento VALUES (1165, 'Treinamento e Reabilitação');
INSERT INTO area_conhecimento VALUES (1166, 'Desvios da Conduta');
INSERT INTO area_conhecimento VALUES (1167, 'Distúrbios da Linguagem');
INSERT INTO area_conhecimento VALUES (1168, 'Distúrbios Psicossomáticos');
INSERT INTO area_conhecimento VALUES (1169, 'Educação');
INSERT INTO area_conhecimento VALUES (1170, 'Fundamentos da Educação');
INSERT INTO area_conhecimento VALUES (1171, 'Filosofia da Educação');
INSERT INTO area_conhecimento VALUES (1172, 'História da Educação');
INSERT INTO area_conhecimento VALUES (1173, 'Sociologia da Educação');
INSERT INTO area_conhecimento VALUES (1174, 'Antropologia Educacional');
INSERT INTO area_conhecimento VALUES (1175, 'Economia da Educação');
INSERT INTO area_conhecimento VALUES (1176, 'Psicologia Educacional');
INSERT INTO area_conhecimento VALUES (1177, 'Administração Educacional');
INSERT INTO area_conhecimento VALUES (1178, 'Administração de Sistemas Educacionais');
INSERT INTO area_conhecimento VALUES (1179, 'Administração de Unidades Educativas');
INSERT INTO area_conhecimento VALUES (1180, 'Planejamento e Avaliação Educacional');
INSERT INTO area_conhecimento VALUES (1181, 'Política Educacional');
INSERT INTO area_conhecimento VALUES (1182, 'Planejamento Educacional');
INSERT INTO area_conhecimento VALUES (1183, 'Avaliação de Sistemas, Instituições, Planos e Programas Educacionais');
INSERT INTO area_conhecimento VALUES (1184, 'Ensino-Aprendizagem');
INSERT INTO area_conhecimento VALUES (1185, 'Teorias da Instrução');
INSERT INTO area_conhecimento VALUES (1186, 'Métodos e Técnicas de Ensino');
INSERT INTO area_conhecimento VALUES (1187, 'Tecnologia Educacional');
INSERT INTO area_conhecimento VALUES (1188, 'Avaliação da Aprendizagem');
INSERT INTO area_conhecimento VALUES (1189, 'Currículo');
INSERT INTO area_conhecimento VALUES (1190, 'Teoria Geral de Planejamento e Desenvolvimento Curricular');
INSERT INTO area_conhecimento VALUES (1191, 'Currículos Específicos para Níveis e Tipos de Educação');
INSERT INTO area_conhecimento VALUES (1192, 'Orientação e Aconselhamento');
INSERT INTO area_conhecimento VALUES (1193, 'Orientação Educacional');
INSERT INTO area_conhecimento VALUES (1194, 'Orientação Vocacional');
INSERT INTO area_conhecimento VALUES (1195, 'Tópicos Específicos de Educação');
INSERT INTO area_conhecimento VALUES (1196, 'Educação de Adultos');
INSERT INTO area_conhecimento VALUES (1197, 'Educação Permanente');
INSERT INTO area_conhecimento VALUES (1198, 'Educação Rural');
INSERT INTO area_conhecimento VALUES (1199, 'Educação em Periferias Urbanas');
INSERT INTO area_conhecimento VALUES (1200, 'Educação Especial');
INSERT INTO area_conhecimento VALUES (1201, 'Educação Pré-Escolar');
INSERT INTO area_conhecimento VALUES (1202, 'Ensino Profissionalizante');
INSERT INTO area_conhecimento VALUES (1203, 'Ciência Política');
INSERT INTO area_conhecimento VALUES (1204, 'Teoria Política');
INSERT INTO area_conhecimento VALUES (1205, 'Teoria Política Clássica');
INSERT INTO area_conhecimento VALUES (1206, 'Teoria Política Medieval');
INSERT INTO area_conhecimento VALUES (1207, 'Teoria Política Moderna');
INSERT INTO area_conhecimento VALUES (1208, 'Teoria Política Contemporânea');
INSERT INTO area_conhecimento VALUES (1209, 'Estado e Governo');
INSERT INTO area_conhecimento VALUES (1210, 'Estrutura e Transformação do Estado');
INSERT INTO area_conhecimento VALUES (1211, 'Sistemas Governamentais Comparados');
INSERT INTO area_conhecimento VALUES (1212, 'Relações Intergovernamentais');
INSERT INTO area_conhecimento VALUES (1213, 'Estudos do Poder Local');
INSERT INTO area_conhecimento VALUES (1214, 'Instituições Governamentais Específicas');
INSERT INTO area_conhecimento VALUES (1215, 'Comportamento Político');
INSERT INTO area_conhecimento VALUES (1216, 'Estudos Eleitorais e Partidos Políticos');
INSERT INTO area_conhecimento VALUES (1217, 'Atitude e Ideologias Políticas');
INSERT INTO area_conhecimento VALUES (1218, 'Conflitos e Coalizões Políticas');
INSERT INTO area_conhecimento VALUES (1219, 'Comportamento Legislativo');
INSERT INTO area_conhecimento VALUES (1220, 'Classes Sociais e Grupos de Interesse');
INSERT INTO area_conhecimento VALUES (1221, 'Políticas Públicas');
INSERT INTO area_conhecimento VALUES (1222, 'Análise do Processo Decisório');
INSERT INTO area_conhecimento VALUES (1223, 'Técnicas de Antecipação');
INSERT INTO area_conhecimento VALUES (1224, 'Política Internacional');
INSERT INTO area_conhecimento VALUES (1225, 'Política Externa do Brasil');
INSERT INTO area_conhecimento VALUES (1226, 'Organizações Internacionais');
INSERT INTO area_conhecimento VALUES (1227, 'Integração Internacional, Conflito, Guerra e Paz');
INSERT INTO area_conhecimento VALUES (1228, 'Relações Internacionais, Bilaterais e Multilaterais');
INSERT INTO area_conhecimento VALUES (1229, 'Teologia');
INSERT INTO area_conhecimento VALUES (1230, 'História da Teologia');
INSERT INTO area_conhecimento VALUES (1231, 'Teologia Moral');
INSERT INTO area_conhecimento VALUES (1232, 'Teologia Sistemática');
INSERT INTO area_conhecimento VALUES (1233, 'Teologia Pastoral');
INSERT INTO area_conhecimento VALUES (1234, 'Lingüística, Letras e Artes');
INSERT INTO area_conhecimento VALUES (1235, 'Lingüística');
INSERT INTO area_conhecimento VALUES (1236, 'Teoria e Análise Lingüística');
INSERT INTO area_conhecimento VALUES (1237, 'Filosofia da Linguagem');
INSERT INTO area_conhecimento VALUES (1238, 'Lingüística Histórica');
INSERT INTO area_conhecimento VALUES (1239, 'Sociolingüística e Dialetologia');
INSERT INTO area_conhecimento VALUES (1240, 'Psicolingüística');
INSERT INTO area_conhecimento VALUES (1241, 'Lingüística Aplicada');
INSERT INTO area_conhecimento VALUES (1242, 'Letras');
INSERT INTO area_conhecimento VALUES (1243, 'Língua Portuguesa');
INSERT INTO area_conhecimento VALUES (1244, 'Línguas Estrangeiras Modernas');
INSERT INTO area_conhecimento VALUES (1245, 'Línguas Clássicas');
INSERT INTO area_conhecimento VALUES (1246, 'Línguas Indígenas');
INSERT INTO area_conhecimento VALUES (1247, 'Teoria Literária');
INSERT INTO area_conhecimento VALUES (1248, 'Literatura Brasileira');
INSERT INTO area_conhecimento VALUES (1249, 'Outras Literaturas Vernáculas');
INSERT INTO area_conhecimento VALUES (1250, 'Literaturas Estrangeiras Modernas');
INSERT INTO area_conhecimento VALUES (1251, 'Literaturas Clássicas');
INSERT INTO area_conhecimento VALUES (1252, 'Literatura Comparada');
INSERT INTO area_conhecimento VALUES (1253, 'Artes');
INSERT INTO area_conhecimento VALUES (1254, 'Fundamentos e Crítica das Artes');
INSERT INTO area_conhecimento VALUES (1255, 'Teoria da Arte');
INSERT INTO area_conhecimento VALUES (1256, 'História da Arte');
INSERT INTO area_conhecimento VALUES (1257, 'Crítica da Arte');
INSERT INTO area_conhecimento VALUES (1258, 'Artes Plásticas');
INSERT INTO area_conhecimento VALUES (1259, 'Pintura');
INSERT INTO area_conhecimento VALUES (1260, 'Desenho');
INSERT INTO area_conhecimento VALUES (1261, 'Gravura');
INSERT INTO area_conhecimento VALUES (1262, 'Escultura');
INSERT INTO area_conhecimento VALUES (1263, 'Tecelagem');
INSERT INTO area_conhecimento VALUES (1264, 'Música');
INSERT INTO area_conhecimento VALUES (1265, 'Regência');
INSERT INTO area_conhecimento VALUES (1266, 'Instrumentação Musical');
INSERT INTO area_conhecimento VALUES (1267, 'Composição Musical');
INSERT INTO area_conhecimento VALUES (1268, 'Canto');
INSERT INTO area_conhecimento VALUES (1269, 'Dança');
INSERT INTO area_conhecimento VALUES (1270, 'Execução da Dança');
INSERT INTO area_conhecimento VALUES (1271, 'Coreografia');
INSERT INTO area_conhecimento VALUES (1272, 'Teatro');
INSERT INTO area_conhecimento VALUES (1273, 'Dramaturgia');
INSERT INTO area_conhecimento VALUES (1274, 'Direção Teatral');
INSERT INTO area_conhecimento VALUES (1275, 'Cenografia');
INSERT INTO area_conhecimento VALUES (1276, 'Interpretação Teatral');
INSERT INTO area_conhecimento VALUES (1277, 'Ópera');
INSERT INTO area_conhecimento VALUES (1278, 'Fotografia');
INSERT INTO area_conhecimento VALUES (1279, 'Cinema');
INSERT INTO area_conhecimento VALUES (1280, 'Administração e Produção de Filmes');
INSERT INTO area_conhecimento VALUES (1281, 'Roteiro e Direção Cinematográficos');
INSERT INTO area_conhecimento VALUES (1282, 'Técnicas de Registro e Processamento de Filmes');
INSERT INTO area_conhecimento VALUES (1283, 'Interpretação Cinematográfica');
INSERT INTO area_conhecimento VALUES (1284, 'Artes do Vídeo');
INSERT INTO area_conhecimento VALUES (1285, 'Educação Artística');
INSERT INTO area_conhecimento VALUES (1286, 'Outros');
INSERT INTO area_conhecimento VALUES (1287, 'Administração Hospitalar');
INSERT INTO area_conhecimento VALUES (1288, 'Administração Rural');
INSERT INTO area_conhecimento VALUES (1289, 'Carreira Militar');
INSERT INTO area_conhecimento VALUES (1290, 'Carreira Religiosa');
INSERT INTO area_conhecimento VALUES (1291, 'Ciências');
INSERT INTO area_conhecimento VALUES (1292, 'Biomedicina');
INSERT INTO area_conhecimento VALUES (1293, 'Ciências Atuarias');
INSERT INTO area_conhecimento VALUES (1294, 'Ciências Sociais');
INSERT INTO area_conhecimento VALUES (1295, 'Decoração');
INSERT INTO area_conhecimento VALUES (1296, 'Desenho de Moda');
INSERT INTO area_conhecimento VALUES (1297, 'Desenho de Projetos');
INSERT INTO area_conhecimento VALUES (1298, 'Diplomacia');
INSERT INTO area_conhecimento VALUES (1299, 'Engenharia de Agrimensura');
INSERT INTO area_conhecimento VALUES (1300, 'Engenharia Cartografica');
INSERT INTO area_conhecimento VALUES (1301, 'Engenharia de Armamentos');
INSERT INTO area_conhecimento VALUES (1302, 'Engenharia Mecatrônica');
INSERT INTO area_conhecimento VALUES (1303, 'Engenharia Textil');
INSERT INTO area_conhecimento VALUES (1304, 'Estudos Sociais');
INSERT INTO area_conhecimento VALUES (1305, 'Historia Natural');
INSERT INTO area_conhecimento VALUES (1306, 'Química Industrial');
INSERT INTO area_conhecimento VALUES (1307, 'Relações Internacionais');
INSERT INTO area_conhecimento VALUES (1308, 'Relações Públicas');
INSERT INTO area_conhecimento VALUES (1309, 'Secretariado Executivo');
INSERT INTO area_conhecimento VALUES (1310, 'Multidisciplinar');
INSERT INTO area_conhecimento VALUES (1311, 'Programação e Linguagem');
INSERT INTO area_conhecimento VALUES (1312, 'Fundamentos Computação');
INSERT INTO area_conhecimento VALUES (1313, 'Programação e Linguagem');
INSERT INTO area_conhecimento VALUES (1314, 'Redes e Internet');
INSERT INTO area_conhecimento VALUES (1315, 'Formação Complementar');
INSERT INTO area_conhecimento VALUES (1316, 'Formação Suplementar');
INSERT INTO area_conhecimento VALUES (1317, 'Flexibilização Curricular');


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 176
-- Name: area_conhecimento_area_conhecimento_id_seq_1; Type: SEQUENCE SET; Schema: flash; Owner: postgres
--

SELECT pg_catalog.setval('area_conhecimento_area_conhecimento_id_seq_1', 1317, true);


--
-- TOC entry 2172 (class 0 OID 27751)
-- Dependencies: 177
-- Data for Name: curso; Type: TABLE DATA; Schema: flash; Owner: postgres
--

INSERT INTO curso VALUES (1, 'Bacharelado em Sistemas de Informação', 'Créditos', 2520, 'BSI');
INSERT INTO curso VALUES (2, 'Engenharia de Controle e Automação', 'Créditos', 3645, 'ECA');
INSERT INTO curso VALUES (3, 'Geografia                                      ', 'Créditos', 6317, 'G');
INSERT INTO curso VALUES (4, 'Educação                                       ', 'Créditos', 2467, 'E');
INSERT INTO curso VALUES (5, 'Química de Produtos Naturais                   ', 'Créditos', 6674, 'QPN');
INSERT INTO curso VALUES (6, 'Ciência de Alimentos                           ', 'Créditos', 3139, 'CA');
INSERT INTO curso VALUES (7, 'Biologia de Água Doce e Pesca Interior         ', 'Créditos', 8741, 'BDPI');
INSERT INTO curso VALUES (8, 'Ciências Biológicas (Botânica)                 ', 'Créditos', 4227, 'CB');
INSERT INTO curso VALUES (9, 'Biologia (Ecologia)                            ', 'Créditos', 3090, 'B');
INSERT INTO curso VALUES (10, 'Ciências Biológicas (Entomologia)              ', 'Créditos', 8349, 'CB');
INSERT INTO curso VALUES (11, 'Ciências de Florestas Tropicais                ', 'Créditos', 7732, 'CFT');
INSERT INTO curso VALUES (12, 'Planejamento do Desenvolvimento                ', 'Créditos', 5472, 'PD');
INSERT INTO curso VALUES (13, 'Direito (Direito Público)                      ', 'Créditos', 2702, 'DP');
INSERT INTO curso VALUES (14, 'Engenharia Elétrica                            ', 'Créditos', 7142, 'EE');
INSERT INTO curso VALUES (15, 'Ciências Biológicas                            ', 'Créditos', 299, 'CB');
INSERT INTO curso VALUES (16, 'Física                                         ', 'Créditos', 2812, 'F');
INSERT INTO curso VALUES (17, 'Química                                        ', 'Créditos', 165, 'Q');
INSERT INTO curso VALUES (18, 'Letras (Lingüística e Teoria Literária)        ', 'Créditos', 3000, 'LTL');
INSERT INTO curso VALUES (19, 'Psicologia (Teoria e Pesquisa do Comportamento)', 'Créditos', 8907, 'PPC');
INSERT INTO curso VALUES (20, 'Engenharia Química                             ', 'Créditos', 6767, 'EQ');
INSERT INTO curso VALUES (21, 'Antropologia                                   ', 'Créditos', 2987, 'A');
INSERT INTO curso VALUES (22, 'Medicina Tropical                              ', 'Créditos', 5837, 'MT');
INSERT INTO curso VALUES (23, 'Geofísica                                      ', 'Créditos', 944, 'G');
INSERT INTO curso VALUES (24, 'Geologia e Geoquímica                          ', 'Créditos', 1391, 'GG');
INSERT INTO curso VALUES (25, 'Engenharia Mecânica                            ', 'Créditos', 8935, 'EM');
INSERT INTO curso VALUES (26, 'Desenvolvimento Sustentável do Trópico Úmido   ', 'Créditos', 9847, 'DST');
INSERT INTO curso VALUES (27, 'Ciência Animal                                 ', 'Créditos', 7732, 'CA');
INSERT INTO curso VALUES (28, 'Zoologia                                       ', 'Créditos', 5506, 'Z');
INSERT INTO curso VALUES (29, 'Agronomia                                      ', 'Créditos', 1951, 'A');
INSERT INTO curso VALUES (30, 'Ciências Florestais                            ', 'Créditos', 2135, 'CF');
INSERT INTO curso VALUES (31, 'Educacao                                       ', 'Créditos', 5474, 'E');
INSERT INTO curso VALUES (32, 'Políticas Públicas                             ', 'Créditos', 2278, 'PP');
INSERT INTO curso VALUES (33, 'Química                                        ', 'Créditos', 5976, 'Q');
INSERT INTO curso VALUES (34, 'Engenharia de Eletricidade                     ', 'Créditos', 6, 'EE');
INSERT INTO curso VALUES (35, 'Educação                                       ', 'Créditos', 9446, 'E');
INSERT INTO curso VALUES (36, 'Educação                                       ', 'Créditos', 9442, 'E');
INSERT INTO curso VALUES (37, 'Física                                         ', 'Créditos', 6095, 'F');
INSERT INTO curso VALUES (38, 'Matemática                                     ', 'Créditos', 8100, 'M');
INSERT INTO curso VALUES (39, 'Química Orgânica                               ', 'Créditos', 3150, 'QO');
INSERT INTO curso VALUES (40, 'Química Inorgânica                             ', 'Créditos', 7343, 'QI');
INSERT INTO curso VALUES (41, 'Bioquímica                                     ', 'Créditos', 2533, 'B');
INSERT INTO curso VALUES (42, 'Farmacologia                                   ', 'Créditos', 3310, 'F');
INSERT INTO curso VALUES (43, 'Sociologia                                     ', 'Créditos', 5404, 'S');
INSERT INTO curso VALUES (44, 'Economia                                       ', 'Créditos', 6338, 'E');
INSERT INTO curso VALUES (45, 'Engenharia Civil (Recursos Hídricos)           ', 'Créditos', 1505, 'ECH');
INSERT INTO curso VALUES (46, 'Direito (Direito e Desenvolvimento)            ', 'Créditos', 6690, 'DD');
INSERT INTO curso VALUES (47, 'Agronomia (Fitotecnia)                         ', 'Créditos', 3191, 'A');
INSERT INTO curso VALUES (48, 'Agronomia (Solos e Nutrição de Plantas)        ', 'Créditos', 7912, 'ANP');
INSERT INTO curso VALUES (49, 'Agronomia (Irrigação e Drenagem)               ', 'Créditos', 1915, 'AD');
INSERT INTO curso VALUES (50, 'Economia Rural                                 ', 'Créditos', 1734, 'ER');
INSERT INTO curso VALUES (51, 'Zootecnia                                      ', 'Créditos', 8946, 'Z');
INSERT INTO curso VALUES (52, 'Tecnologia de Alimentos                        ', 'Créditos', 53, 'TA');
INSERT INTO curso VALUES (53, 'Letras                                         ', 'Créditos', 1143, 'L');
INSERT INTO curso VALUES (54, 'Patologia                                      ', 'Créditos', 9156, 'P');
INSERT INTO curso VALUES (55, 'Engenharia de Pesca                            ', 'Créditos', 7864, 'EP');
INSERT INTO curso VALUES (56, 'Enfermagem                                     ', 'Créditos', 8028, 'E');
INSERT INTO curso VALUES (57, 'Cirurgia                                       ', 'Créditos', 7225, 'C');
INSERT INTO curso VALUES (58, 'Lingüística                                    ', 'Créditos', 2519, 'L');
INSERT INTO curso VALUES (59, 'Saúde Pública                                  ', 'Créditos', 6587, 'SP');
INSERT INTO curso VALUES (60, 'Geologia                                       ', 'Créditos', 2568, 'G');
INSERT INTO curso VALUES (61, 'Desenvolvimento e Meio Ambiente                ', 'Créditos', 8012, 'DMA');
INSERT INTO curso VALUES (62, 'Medicina (Clínica Médica)                      ', 'Créditos', 6120, 'MM');
INSERT INTO curso VALUES (63, 'Ciência da Computação                          ', 'Créditos', 1962, 'CC');
INSERT INTO curso VALUES (64, 'Ciências Veterinárias                          ', 'Créditos', 1737, 'CV');
INSERT INTO curso VALUES (65, 'Saúde Pública                                  ', 'Créditos', 6569, 'SP');
INSERT INTO curso VALUES (66, 'Educação                                       ', 'Créditos', 7970, 'E');
INSERT INTO curso VALUES (67, 'Psicobiologia                                  ', 'Créditos', 806, 'P');
INSERT INTO curso VALUES (68, 'Ciências Sociais                               ', 'Créditos', 1784, 'CS');
INSERT INTO curso VALUES (69, 'Patologia Oral                                 ', 'Créditos', 6080, 'PO');
INSERT INTO curso VALUES (70, 'Odontologia Social                             ', 'Créditos', 558, 'OS');
INSERT INTO curso VALUES (71, 'Administração                                  ', 'Créditos', 5471, 'A');
INSERT INTO curso VALUES (72, 'Engenharia Elétrica                            ', 'Créditos', 5655, 'EE');
INSERT INTO curso VALUES (73, 'Engenharia Mecânica                            ', 'Créditos', 2030, 'EM');
INSERT INTO curso VALUES (74, 'Física                                         ', 'Créditos', 3266, 'F');
INSERT INTO curso VALUES (75, 'Engenharia Química                             ', 'Créditos', 145, 'EQ');
INSERT INTO curso VALUES (76, 'Química                                        ', 'Créditos', 3919, 'Q');
INSERT INTO curso VALUES (77, 'Estudos da Linguagem                           ', 'Créditos', 4990, 'EL');
INSERT INTO curso VALUES (78, 'Clínicas Odontológicas                         ', 'Créditos', 9483, 'CO');
INSERT INTO curso VALUES (79, 'Geociências                                    ', 'Créditos', 1246, 'G');
INSERT INTO curso VALUES (80, 'Geodinâmica e Geofísica                        ', 'Créditos', 3927, 'GG');
INSERT INTO curso VALUES (81, 'Fitotecnia                                     ', 'Créditos', 4332, 'F');
INSERT INTO curso VALUES (82, 'Educação                                       ', 'Créditos', 2941, 'E');
INSERT INTO curso VALUES (83, 'Física                                         ', 'Créditos', 6446, 'F');
INSERT INTO curso VALUES (84, 'Meteorologia                                   ', 'Créditos', 7051, 'M');
INSERT INTO curso VALUES (85, 'Sociologia [J. Pessoa]                         ', 'Créditos', 5503, 'SP');
INSERT INTO curso VALUES (86, 'Filosofia                                      ', 'Créditos', 9730, 'F');
INSERT INTO curso VALUES (87, 'Psicologia (Psicologia Social)                 ', 'Créditos', 8132, 'PS');
INSERT INTO curso VALUES (88, 'Engenharia Biomédica                           ', 'Créditos', 7438, 'EB');
INSERT INTO curso VALUES (89, 'Engenharia Civil                               ', 'Créditos', 6907, 'EC');
INSERT INTO curso VALUES (90, 'Engenharia Elétrica                            ', 'Créditos', 136, 'EE');
INSERT INTO curso VALUES (91, 'Engenharia Mecânica [J. Pessoa]                ', 'Créditos', 8508, 'EMP');
INSERT INTO curso VALUES (92, 'Engenharia de Produção                         ', 'Créditos', 8921, 'EP');
INSERT INTO curso VALUES (93, 'Engenharia Química [C. Grande]                 ', 'Créditos', 6171, 'EQG');
INSERT INTO curso VALUES (94, 'Informática                                    ', 'Créditos', 2237, 'I');
INSERT INTO curso VALUES (95, 'Produtos Naturais e Sintéticos Bioativos       ', 'Créditos', 7532, 'PNSB');
INSERT INTO curso VALUES (96, 'Enfermagem                                     ', 'Créditos', 4351, 'E');
INSERT INTO curso VALUES (97, 'Administração                                  ', 'Créditos', 6503, 'A');
INSERT INTO curso VALUES (98, 'Ciência da Informação                          ', 'Créditos', 332, 'CI');
INSERT INTO curso VALUES (99, 'Serviço Social                                 ', 'Créditos', 7382, 'SS');
INSERT INTO curso VALUES (100, 'Agronomia [Areia]                              ', 'Créditos', 7238, 'A');
INSERT INTO curso VALUES (101, 'Manejo de Solo e Água [Areia]                  ', 'Créditos', 6166, 'MS');
INSERT INTO curso VALUES (102, 'Economia Rural [C. Grande]                     ', 'Créditos', 5626, 'ERG');
INSERT INTO curso VALUES (103, 'Sociologia Rural                               ', 'Créditos', 6532, 'SR');
INSERT INTO curso VALUES (104, 'Zootecnia [Areia]                              ', 'Créditos', 1011, 'Z');
INSERT INTO curso VALUES (105, 'Ciência e Tecnologia de Alimentos              ', 'Créditos', 1081, 'CTA');
INSERT INTO curso VALUES (106, 'Letras                                         ', 'Créditos', 6140, 'L');
INSERT INTO curso VALUES (107, 'Economia [J. Pessoa]                           ', 'Créditos', 7792, 'EP');
INSERT INTO curso VALUES (108, 'Engenharia Mecânica [C. Grande]                ', 'Créditos', 3607, 'EMG');
INSERT INTO curso VALUES (109, 'Ciências Biológicas (Zoologia)                 ', 'Créditos', 1942, 'CB');
INSERT INTO curso VALUES (110, 'Química                                        ', 'Créditos', 7506, 'Q');
INSERT INTO curso VALUES (111, 'Genética                                       ', 'Créditos', 6716, 'G');
INSERT INTO curso VALUES (112, 'Engenharia de Minas                            ', 'Créditos', 7230, 'EM');
INSERT INTO curso VALUES (113, 'Odontologia (Diagnóstico Bucal)                ', 'Créditos', 1353, 'OB');
INSERT INTO curso VALUES (114, 'Matemática                                     ', 'Créditos', 6942, 'M');
INSERT INTO curso VALUES (115, 'Engenharia Civil [C. Grande]                   ', 'Créditos', 2506, 'ECG');
INSERT INTO curso VALUES (116, 'Engenharia Química                             ', 'Créditos', 3902, 'EQ');
INSERT INTO curso VALUES (117, 'Engenharia Agrícola                            ', 'Créditos', 6123, 'EA');
INSERT INTO curso VALUES (118, 'Educação                                       ', 'Créditos', 6751, 'E');
INSERT INTO curso VALUES (119, 'Física                                         ', 'Créditos', 1272, 'F');
INSERT INTO curso VALUES (120, 'Matemática                                     ', 'Créditos', 5877, 'M');
INSERT INTO curso VALUES (121, 'Ciência da Computação                          ', 'Créditos', 1608, 'CC');
INSERT INTO curso VALUES (122, 'Geociências                                    ', 'Créditos', 1202, 'G');
INSERT INTO curso VALUES (123, 'Biofísica                                      ', 'Créditos', 7641, 'B');
INSERT INTO curso VALUES (124, 'Bioquímica                                     ', 'Créditos', 2793, 'B');
INSERT INTO curso VALUES (125, 'Biologia de Fungos                             ', 'Créditos', 4811, 'BF');
INSERT INTO curso VALUES (126, 'Ciências Biológicas (Fisiologia)               ', 'Créditos', 8011, 'CB');
INSERT INTO curso VALUES (127, 'Sociologia                                     ', 'Créditos', 3275, 'S');
INSERT INTO curso VALUES (128, 'Antropologia                                   ', 'Créditos', 9389, 'A');
INSERT INTO curso VALUES (129, 'Filosofia                                      ', 'Créditos', 7973, 'F');
INSERT INTO curso VALUES (130, 'História                                       ', 'Créditos', 7379, 'H');
INSERT INTO curso VALUES (131, 'Geografia                                      ', 'Créditos', 6239, 'G');
INSERT INTO curso VALUES (132, 'Economia                                       ', 'Créditos', 1326, 'E');
INSERT INTO curso VALUES (133, 'Psicologia (Psicologia Cognitiva)              ', 'Créditos', 9473, 'PC');
INSERT INTO curso VALUES (134, 'Engenharia Elétrica                            ', 'Créditos', 5650, 'EE');
INSERT INTO curso VALUES (135, 'Tecnologias Energéticas Nucleares              ', 'Créditos', 7481, 'TEN');
INSERT INTO curso VALUES (136, 'Medicina (Anatomia Patológica)                 ', 'Créditos', 9053, 'MP');
INSERT INTO curso VALUES (137, 'Cirurgia                                       ', 'Créditos', 681, 'C');
INSERT INTO curso VALUES (138, 'Medicina Tropical                              ', 'Créditos', 35, 'MT');
INSERT INTO curso VALUES (139, 'Medicina (Pediatria)                           ', 'Créditos', 9499, 'M');
INSERT INTO curso VALUES (140, 'Ciências Farmacêuticas                         ', 'Créditos', 4844, 'CF');
INSERT INTO curso VALUES (141, 'Nutrição                                       ', 'Créditos', 1552, 'N');
INSERT INTO curso VALUES (142, 'Direito                                        ', 'Créditos', 3288, 'D');
INSERT INTO curso VALUES (143, 'Desenvolvimento Urbano                         ', 'Créditos', 9955, 'DU');
INSERT INTO curso VALUES (144, 'Serviço Social                                 ', 'Créditos', 3987, 'SS');
INSERT INTO curso VALUES (145, 'Letras                                         ', 'Créditos', 248, 'L');
INSERT INTO curso VALUES (146, 'Ciência Política                               ', 'Créditos', 9518, 'CP');
INSERT INTO curso VALUES (147, 'Oceanografia                                   ', 'Créditos', 644, 'O');
INSERT INTO curso VALUES (148, 'Química                                        ', 'Créditos', 2345, 'Q');
INSERT INTO curso VALUES (149, 'Genética                                       ', 'Créditos', 6123, 'G');
INSERT INTO curso VALUES (150, 'Biologia Vegetal                               ', 'Créditos', 4974, 'BV');
INSERT INTO curso VALUES (151, 'Medicina Interna                               ', 'Créditos', 8369, 'MI');
INSERT INTO curso VALUES (152, 'Engenharia Civil                               ', 'Créditos', 8270, 'EC');
INSERT INTO curso VALUES (153, 'Biologia Animal                                ', 'Créditos', 7327, 'BA');
INSERT INTO curso VALUES (154, 'Medicina                                       ', 'Créditos', 4905, 'M');
INSERT INTO curso VALUES (155, 'Neuro-Psiquiatria                              ', 'Créditos', 8580, 'N');
INSERT INTO curso VALUES (156, 'Engenharia Química                             ', 'Créditos', 4240, 'EQ');
INSERT INTO curso VALUES (157, 'Ciências Biológicas                            ', 'Créditos', 1178, 'CB');
INSERT INTO curso VALUES (158, 'Administração                                  ', 'Créditos', 1206, 'A');
INSERT INTO curso VALUES (159, 'Biotecnologia de Produtos Bioativos            ', 'Créditos', 944, 'BPB');
INSERT INTO curso VALUES (160, 'Botânica                                       ', 'Créditos', 9054, 'B');
INSERT INTO curso VALUES (161, 'Agronomia (Fitossanidade)                      ', 'Créditos', 1167, 'A');
INSERT INTO curso VALUES (162, 'Agronomia (Ciência do Solo)                    ', 'Créditos', 2239, 'AS');
INSERT INTO curso VALUES (163, 'Administração Rural e Comunicação Rural        ', 'Créditos', 7457, 'ARCR');
INSERT INTO curso VALUES (164, 'Medicina Veterinária                           ', 'Créditos', 3184, 'MV');
INSERT INTO curso VALUES (165, 'Zootecnia                                      ', 'Créditos', 576, 'Z');
INSERT INTO curso VALUES (166, 'Odontologia (Odontopediatria)                  ', 'Créditos', 1327, 'O');
INSERT INTO curso VALUES (167, 'Odontologia (Dentística e Endodontia)          ', 'Créditos', 3664, 'OE');
INSERT INTO curso VALUES (168, 'Odontologia Preventiva e Social                ', 'Créditos', 6368, 'OPS');
INSERT INTO curso VALUES (169, 'Saúde Materno Infantil                         ', 'Créditos', 4768, 'SMI');
INSERT INTO curso VALUES (170, 'Letras e Lingüística                           ', 'Créditos', 5339, 'LL');
INSERT INTO curso VALUES (171, 'Física da Matéria Condensada                   ', 'Créditos', 2290, 'FMC');
INSERT INTO curso VALUES (172, 'Química e Biotecnologia                        ', 'Créditos', 2747, 'QB');
INSERT INTO curso VALUES (173, 'Administração                                  ', 'Créditos', 6535, 'A');
INSERT INTO curso VALUES (174, 'Geografia                                      ', 'Créditos', 62, 'G');
INSERT INTO curso VALUES (175, 'Educação                                       ', 'Créditos', 3545, 'E');
INSERT INTO curso VALUES (176, 'Educação                                       ', 'Créditos', 1294, 'E');
INSERT INTO curso VALUES (177, 'Física                                         ', 'Créditos', 5303, 'F');
INSERT INTO curso VALUES (178, 'Matemática                                     ', 'Créditos', 9684, 'M');
INSERT INTO curso VALUES (179, 'Química                                        ', 'Créditos', 9467, 'Q');
INSERT INTO curso VALUES (180, 'Geologia                                       ', 'Créditos', 3629, 'G');
INSERT INTO curso VALUES (181, 'Geoquímica e Meio Ambiente                     ', 'Créditos', 2688, 'GMA');
INSERT INTO curso VALUES (182, 'Geofísica                                      ', 'Créditos', 5807, 'G');
INSERT INTO curso VALUES (183, 'Biologia (Botânica)                            ', 'Créditos', 7860, 'B');
INSERT INTO curso VALUES (184, 'Economia                                       ', 'Créditos', 317, 'E');
INSERT INTO curso VALUES (185, 'Patologia Humana                               ', 'Créditos', 5629, 'PH');
INSERT INTO curso VALUES (186, 'Medicina                                       ', 'Créditos', 7867, 'M');
INSERT INTO curso VALUES (187, 'Saúde Coletiva                                 ', 'Créditos', 1135, 'SC');
INSERT INTO curso VALUES (188, 'Enfermagem                                     ', 'Créditos', 9629, 'E');
INSERT INTO curso VALUES (189, 'Direito                                        ', 'Créditos', 3940, 'D');
INSERT INTO curso VALUES (190, 'Ciências Agrárias                              ', 'Créditos', 7198, 'CA');
INSERT INTO curso VALUES (191, 'Letras e Lingüística                           ', 'Créditos', 3, 'LL');
INSERT INTO curso VALUES (192, 'Arquitetura e Urbanismo                        ', 'Créditos', 8288, 'AU');
INSERT INTO curso VALUES (193, 'Administração                                  ', 'Créditos', 3008, 'A');
INSERT INTO curso VALUES (194, 'Engenharia Química                             ', 'Créditos', 9681, 'EQ');
INSERT INTO curso VALUES (195, 'História                                       ', 'Créditos', 8184, 'H');
INSERT INTO curso VALUES (196, 'Ciências Sociais                               ', 'Créditos', 9777, 'CS');
INSERT INTO curso VALUES (197, 'Comunicação e Cultura Contemporânea            ', 'Créditos', 3047, 'CCC');
INSERT INTO curso VALUES (198, 'Imunologia                                     ', 'Créditos', 1209, 'I');
INSERT INTO curso VALUES (199, 'Música                                         ', 'Créditos', 9280, 'M');
INSERT INTO curso VALUES (200, 'Odontologia                                    ', 'Créditos', 7189, 'O');
INSERT INTO curso VALUES (201, 'Geografia                                      ', 'Créditos', 9172, 'G');
INSERT INTO curso VALUES (202, 'Nutrição                                       ', 'Créditos', 7751, 'N');
INSERT INTO curso VALUES (203, 'Educação                                       ', 'Créditos', 7818, 'E');
INSERT INTO curso VALUES (204, 'Ciências Fisiológicas                          ', 'Créditos', 6550, 'CF');
INSERT INTO curso VALUES (205, 'Engenharia Ambiental                           ', 'Créditos', 2933, 'EA');
INSERT INTO curso VALUES (206, 'Engenharia Elétrica                            ', 'Créditos', 8741, 'EE');
INSERT INTO curso VALUES (207, 'Física                                         ', 'Créditos', 7758, 'F');
INSERT INTO curso VALUES (208, 'Psicologia                                     ', 'Créditos', 1392, 'P');
INSERT INTO curso VALUES (209, 'Informática                                    ', 'Créditos', 1571, 'I');
INSERT INTO curso VALUES (210, 'Economia                                       ', 'Créditos', 8321, 'E');
INSERT INTO curso VALUES (211, 'Doenças Infecciosas                            ', 'Créditos', 2259, 'DI');
INSERT INTO curso VALUES (212, 'Engenharia Mecânica                            ', 'Créditos', 255, 'EM');
INSERT INTO curso VALUES (213, 'Educação                                       ', 'Créditos', 3983, 'E');
INSERT INTO curso VALUES (214, 'Física                                         ', 'Créditos', 6657, 'F');
INSERT INTO curso VALUES (215, 'Matemática                                     ', 'Créditos', 1303, 'M');
INSERT INTO curso VALUES (216, 'Engenharia de Sistemas e Computação            ', 'Créditos', 7056, 'ESC');
INSERT INTO curso VALUES (217, 'Estatística                                    ', 'Créditos', 3589, 'E');
INSERT INTO curso VALUES (218, 'Química Orgânica                               ', 'Créditos', 3157, 'QO');
INSERT INTO curso VALUES (219, 'Matemática Aplicada                            ', 'Créditos', 7687, 'MA');
INSERT INTO curso VALUES (220, 'Ciência e Tecnologia de Polímeros              ', 'Créditos', 8938, 'CTP');
INSERT INTO curso VALUES (221, 'Química de Produtos Naturais                   ', 'Créditos', 4505, 'QPN');
INSERT INTO curso VALUES (222, 'Físico-Química                                 ', 'Créditos', 239, 'F');
INSERT INTO curso VALUES (223, 'Geologia                                       ', 'Créditos', 292, 'G');
INSERT INTO curso VALUES (224, 'Ciências Biológicas (Biofísica)                ', 'Créditos', 5472, 'CB');
INSERT INTO curso VALUES (225, 'Bioquímica                                     ', 'Créditos', 2965, 'B');
INSERT INTO curso VALUES (226, 'Ciências Biológicas (Botânica)                 ', 'Créditos', 1707, 'CB');
INSERT INTO curso VALUES (227, 'Ciências Biológicas (Farmac. e Terap. Experimen', 'Créditos', 9522, 'CBTE');
INSERT INTO curso VALUES (228, 'Ciências Biológicas (Genética)                 ', 'Créditos', 6669, 'CB');
INSERT INTO curso VALUES (229, 'Ciências (Microbiologia)                       ', 'Créditos', 5634, 'C');
INSERT INTO curso VALUES (230, 'Ciências Biológicas (Zoologia)                 ', 'Créditos', 3325, 'CB');
INSERT INTO curso VALUES (231, 'Sociologia e Antropologia                      ', 'Créditos', 4718, 'SA');
INSERT INTO curso VALUES (232, 'Antropologia Social                            ', 'Créditos', 4039, 'AS');
INSERT INTO curso VALUES (233, 'Filosofia                                      ', 'Créditos', 9739, 'F');
INSERT INTO curso VALUES (234, 'História                                       ', 'Créditos', 740, 'H');
INSERT INTO curso VALUES (235, 'Geografia                                      ', 'Créditos', 1785, 'G');
INSERT INTO curso VALUES (236, 'Economia da Industria e da Tecnologia          ', 'Créditos', 6450, 'EIT');
INSERT INTO curso VALUES (237, 'Engenharia Biomédica                           ', 'Créditos', 6083, 'EB');
INSERT INTO curso VALUES (238, 'Engenharia Civil                               ', 'Créditos', 9249, 'EC');
INSERT INTO curso VALUES (239, 'Engenharia Elétrica                            ', 'Créditos', 143, 'EE');
INSERT INTO curso VALUES (240, 'Engenharia Mecânica                            ', 'Créditos', 2930, 'EM');
INSERT INTO curso VALUES (241, 'Engenharia Metalúrgica e de Materiais          ', 'Créditos', 1219, 'EMM');
INSERT INTO curso VALUES (242, 'Engenharia Oceânica                            ', 'Créditos', 1472, 'EO');
INSERT INTO curso VALUES (243, 'Engenharia Nuclear                             ', 'Créditos', 808, 'EN');
INSERT INTO curso VALUES (244, 'Engenharia (Pesq. Operac. e Gerenc. de Produção', 'Créditos', 6943, 'EOGP');
INSERT INTO curso VALUES (245, 'Engenharia Química                             ', 'Créditos', 6538, 'EQ');
INSERT INTO curso VALUES (246, 'Tecnologia de Processos Químicos e Bioquímicos ', 'Créditos', 2571, 'TPQB');
INSERT INTO curso VALUES (247, 'Engenharia de Transportes                      ', 'Créditos', 5463, 'ET');
INSERT INTO curso VALUES (248, 'Medicina (Anatomia Patológica)                 ', 'Créditos', 8136, 'MP');
INSERT INTO curso VALUES (249, 'Medicina (Cardiologia)                         ', 'Créditos', 7926, 'M');
INSERT INTO curso VALUES (250, 'Medicina (Cirurgia Geral)                      ', 'Créditos', 6355, 'MG');
INSERT INTO curso VALUES (251, 'Medicina (Dermatologia)                        ', 'Créditos', 5887, 'M');
INSERT INTO curso VALUES (252, 'Medicina (Endocrinologia)                      ', 'Créditos', 620, 'M');
INSERT INTO curso VALUES (253, 'Medicina (Gastroenterologia)                   ', 'Créditos', 3357, 'M');
INSERT INTO curso VALUES (254, 'Clínica Médica                                 ', 'Créditos', 3999, 'CM');
INSERT INTO curso VALUES (255, 'Medicina (Doenças Infecciosas e Parasitárias)  ', 'Créditos', 8865, 'MIP');
INSERT INTO curso VALUES (256, 'Nefrologia                                     ', 'Créditos', 374, 'N');
INSERT INTO curso VALUES (257, 'Medicina (Ortopedia e Traumatologia)           ', 'Créditos', 8717, 'MT');
INSERT INTO curso VALUES (258, 'Psiquiatria e Saúde Mental                     ', 'Créditos', 280, 'PSM');
INSERT INTO curso VALUES (259, 'Medicina (Radiologia)                          ', 'Créditos', 467, 'M');
INSERT INTO curso VALUES (260, 'Odontologia (Ortodontia)                       ', 'Créditos', 6115, 'O');
INSERT INTO curso VALUES (261, 'Enfermagem                                     ', 'Créditos', 7270, 'E');
INSERT INTO curso VALUES (262, 'Administração                                  ', 'Créditos', 9788, 'A');
INSERT INTO curso VALUES (263, 'Comunicação                                    ', 'Créditos', 8034, 'C');
INSERT INTO curso VALUES (264, 'Planejamento Urbano e Regional                 ', 'Créditos', 220, 'PUR');
INSERT INTO curso VALUES (265, 'Serviço Social                                 ', 'Créditos', 4797, 'SS');
INSERT INTO curso VALUES (266, 'Lingüística                                    ', 'Créditos', 3612, 'L');
INSERT INTO curso VALUES (267, 'Letras (Letras Clássicas)                      ', 'Créditos', 8513, 'LC');
INSERT INTO curso VALUES (268, 'Letras (Letras Vernáculas)                     ', 'Créditos', 7765, 'LV');
INSERT INTO curso VALUES (269, 'Letras (Ciência da Literatura)                 ', 'Créditos', 1526, 'LL');
INSERT INTO curso VALUES (270, 'Música                                         ', 'Créditos', 7795, 'M');
INSERT INTO curso VALUES (271, 'Otorrinolaringologia                           ', 'Créditos', 5676, 'O');
INSERT INTO curso VALUES (272, 'Oftalmologia                                   ', 'Créditos', 5023, 'O');
INSERT INTO curso VALUES (273, 'Odontologia (Periodontia)                      ', 'Créditos', 3103, 'O');
INSERT INTO curso VALUES (274, 'Odontologia (Odontopediatria)                  ', 'Créditos', 7245, 'O');
INSERT INTO curso VALUES (275, 'Nutrição                                       ', 'Créditos', 5139, 'N');
INSERT INTO curso VALUES (276, 'Interdisciplinar de Lingüística Aplicada       ', 'Créditos', 1149, 'ILA');
INSERT INTO curso VALUES (277, 'Letras Neolatinas                              ', 'Créditos', 9986, 'LN');
INSERT INTO curso VALUES (278, 'Química Biológica                              ', 'Créditos', 7769, 'QB');
INSERT INTO curso VALUES (279, 'Arquitetura                                    ', 'Créditos', 8803, 'A');
INSERT INTO curso VALUES (280, 'Artes Visuais                                  ', 'Créditos', 4591, 'AV');
INSERT INTO curso VALUES (281, 'Ciência da Informação                          ', 'Créditos', 4706, 'CI');
INSERT INTO curso VALUES (282, 'Ecologia                                       ', 'Créditos', 8956, 'E');
INSERT INTO curso VALUES (283, 'Teoria Psicanalítica                           ', 'Créditos', 5043, 'TP');
INSERT INTO curso VALUES (284, 'Psicologia                                     ', 'Créditos', 2673, 'P');
INSERT INTO curso VALUES (285, 'Ciências Farmacêuticas                         ', 'Créditos', 7244, 'CF');
INSERT INTO curso VALUES (286, 'Biotecnologia Vegetal                          ', 'Créditos', 6618, 'BV');
INSERT INTO curso VALUES (287, 'Psicossociologia de Comunid. e Ecologia Social ', 'Créditos', 8518, 'PCES');
INSERT INTO curso VALUES (288, 'Planejamento Energético                        ', 'Créditos', 3712, 'PE');
INSERT INTO curso VALUES (289, 'Urbanismo                                      ', 'Créditos', 1966, 'U');
INSERT INTO curso VALUES (290, 'Química Inorgânica                             ', 'Créditos', 996, 'QI');
INSERT INTO curso VALUES (291, 'Ciências Morfológicas                          ', 'Créditos', 7794, 'CM');
INSERT INTO curso VALUES (292, 'Química Orgânica                               ', 'Créditos', 1631, 'QO');
INSERT INTO curso VALUES (293, 'Agronomia (Ciência do Solo)                    ', 'Créditos', 2187, 'AS');
INSERT INTO curso VALUES (294, 'Ciências Veterinárias                          ', 'Créditos', 4673, 'CV');
INSERT INTO curso VALUES (295, 'Ciência e Tecnologia de Alimentos              ', 'Créditos', 6923, 'CTA');
INSERT INTO curso VALUES (296, 'Desenvolvimento, Agricultura e Sociedade       ', 'Créditos', 6481, 'DAS');
INSERT INTO curso VALUES (297, 'Microbiologia Veterinária                      ', 'Créditos', 2667, 'MV');
INSERT INTO curso VALUES (298, 'Medicina Veterinária                           ', 'Créditos', 1914, 'MV');
INSERT INTO curso VALUES (299, 'Fitotecnia                                     ', 'Créditos', 4593, 'F');
INSERT INTO curso VALUES (300, 'Ciências Ambientais e Florestais               ', 'Créditos', 7664, 'CAF');
INSERT INTO curso VALUES (301, 'Biologia Animal                                ', 'Créditos', 5754, 'BA');
INSERT INTO curso VALUES (302, 'Educação                                       ', 'Créditos', 5888, 'E');
INSERT INTO curso VALUES (303, 'Física                                         ', 'Créditos', 7125, 'F');
INSERT INTO curso VALUES (304, 'Matemática                                     ', 'Créditos', 378, 'M');
INSERT INTO curso VALUES (305, 'Geociências (Geoquímica)                       ', 'Créditos', 7488, 'G');
INSERT INTO curso VALUES (306, 'História                                       ', 'Créditos', 477, 'H');
INSERT INTO curso VALUES (307, 'Engenharia Civil                               ', 'Créditos', 7243, 'EC');
INSERT INTO curso VALUES (308, 'Patologia (Anatomia Patológica)                ', 'Créditos', 7301, 'PP');
INSERT INTO curso VALUES (309, 'Medicina (Cirurgia Gastroenterológica)         ', 'Créditos', 7592, 'MG');
INSERT INTO curso VALUES (310, 'Medicina (Cirurgia Torácica)                   ', 'Créditos', 902, 'MT');
INSERT INTO curso VALUES (311, 'Medicina (Dermatologia)                        ', 'Créditos', 1115, 'M');
INSERT INTO curso VALUES (312, 'Medicina (Pneumologia)                         ', 'Créditos', 1623, 'M');
INSERT INTO curso VALUES (313, 'Medicina (Pediatria)                           ', 'Créditos', 1950, 'M');
INSERT INTO curso VALUES (314, 'Odontologia (Odontologia Social)               ', 'Créditos', 5451, 'OS');
INSERT INTO curso VALUES (315, 'Medicina Veterinária (Hig. Veter. Proc. Tecn. P', 'Créditos', 9486, 'MVVP');
INSERT INTO curso VALUES (316, 'Letras                                         ', 'Créditos', 2162, 'L');
INSERT INTO curso VALUES (317, 'Patologia Experimental                         ', 'Créditos', 8056, 'PE');
INSERT INTO curso VALUES (318, 'Patologia Buco-Dental                          ', 'Créditos', 2828, 'PB');
INSERT INTO curso VALUES (319, 'Engenharia de Produção                         ', 'Créditos', 4880, 'EP');
INSERT INTO curso VALUES (320, 'Medicina (Cardiologia)                         ', 'Créditos', 7032, 'M');
INSERT INTO curso VALUES (321, 'Economia                                       ', 'Créditos', 859, 'E');
INSERT INTO curso VALUES (322, 'Medicina Veterinária (Patologia Veterinária)   ', 'Créditos', 5904, 'MVV');
INSERT INTO curso VALUES (323, 'Medicina Veterinária (Cir. e Clínica Veterinári', 'Créditos', 1214, 'MVCV');
INSERT INTO curso VALUES (324, 'Medicina (Neurologia)                          ', 'Créditos', 2524, 'M');
INSERT INTO curso VALUES (325, 'Administracao                                  ', 'Créditos', 7746, 'A');
INSERT INTO curso VALUES (326, 'Química Orgânica                               ', 'Créditos', 9211, 'QO');
INSERT INTO curso VALUES (327, 'Geologia e Geofísica Marinha                   ', 'Créditos', 6207, 'GGM');
INSERT INTO curso VALUES (328, 'Medicina (Doenças Infecciosas e Parasitárias)  ', 'Créditos', 6267, 'MIP');
INSERT INTO curso VALUES (329, 'Antropologia                                   ', 'Créditos', 8542, 'A');
INSERT INTO curso VALUES (330, 'Engenharia Metalúrgica                         ', 'Créditos', 3471, 'EM');
INSERT INTO curso VALUES (331, 'Ciência Política                               ', 'Créditos', 8859, 'CP');
INSERT INTO curso VALUES (332, 'Ciência da Computação                          ', 'Créditos', 714, 'CC');
INSERT INTO curso VALUES (333, 'Computação Aplicada e Automação                ', 'Créditos', 6852, 'CAA');
INSERT INTO curso VALUES (334, 'Engenharia Mecânica                            ', 'Créditos', 2374, 'EM');
INSERT INTO curso VALUES (335, 'Ciência Ambiental                              ', 'Créditos', 8401, 'CA');
INSERT INTO curso VALUES (336, 'Biologia Marinha                               ', 'Créditos', 3560, 'BM');
INSERT INTO curso VALUES (337, 'Biologia (Biociências Nucleares)               ', 'Créditos', 7675, 'BN');
INSERT INTO curso VALUES (338, 'Medicina (Cardiologia)                         ', 'Créditos', 9597, 'M');
INSERT INTO curso VALUES (339, 'Medicina (Endocrinologia)                      ', 'Créditos', 6305, 'M');
INSERT INTO curso VALUES (340, 'Saúde Coletiva                                 ', 'Créditos', 8419, 'SC');
INSERT INTO curso VALUES (341, 'Medicina (Nefrologia)                          ', 'Créditos', 6590, 'M');
INSERT INTO curso VALUES (342, 'Educação                                       ', 'Créditos', 1586, 'E');
INSERT INTO curso VALUES (343, 'Odontologia                                    ', 'Créditos', 9749, 'O');
INSERT INTO curso VALUES (344, 'Letras                                         ', 'Créditos', 4104, 'L');
INSERT INTO curso VALUES (345, 'Medicina (Urologia)                            ', 'Créditos', 7757, 'M');
INSERT INTO curso VALUES (346, 'Psicologia Social                              ', 'Créditos', 4203, 'PS');
INSERT INTO curso VALUES (347, 'Ciências Contábeis                             ', 'Créditos', 8888, 'CC');
INSERT INTO curso VALUES (348, 'Direito                                        ', 'Créditos', 5990, 'D');
INSERT INTO curso VALUES (349, 'Filosofia                                      ', 'Créditos', 8153, 'F');
INSERT INTO curso VALUES (350, 'Morfologia                                     ', 'Créditos', 7207, 'M');
INSERT INTO curso VALUES (351, 'Microbiologia                                  ', 'Créditos', 5575, 'M');
INSERT INTO curso VALUES (352, 'Modelagem Computacional                        ', 'Créditos', 7947, 'MC');
INSERT INTO curso VALUES (353, 'Análise de Bacias: Form. Preenc. e Tect. Modifi', 'Créditos', 2660, 'ABFP');
INSERT INTO curso VALUES (354, 'Educação                                       ', 'Créditos', 2696, 'E');
INSERT INTO curso VALUES (355, 'Física                                         ', 'Créditos', 3803, 'F');
INSERT INTO curso VALUES (356, 'Matemática                                     ', 'Créditos', 3960, 'M');
INSERT INTO curso VALUES (357, 'Informática                                    ', 'Créditos', 5292, 'I');
INSERT INTO curso VALUES (358, 'Química (Química Analítica Inorgânica)         ', 'Créditos', 252, 'QAI');
INSERT INTO curso VALUES (359, 'Filosofia                                      ', 'Créditos', 1700, 'F');
INSERT INTO curso VALUES (360, 'Teologia                                       ', 'Créditos', 2343, 'T');
INSERT INTO curso VALUES (361, 'Economia                                       ', 'Créditos', 3767, 'E');
INSERT INTO curso VALUES (362, 'Psicologia (Psicologia Clínica)                ', 'Créditos', 6553, 'PC');
INSERT INTO curso VALUES (363, 'Engenharia Civil                               ', 'Créditos', 1968, 'EC');
INSERT INTO curso VALUES (364, 'Engenharia Elétrica                            ', 'Créditos', 7751, 'EE');
INSERT INTO curso VALUES (365, 'Engenharia Mecânica                            ', 'Créditos', 2502, 'EM');
INSERT INTO curso VALUES (366, 'Engenharia Metalúrgica                         ', 'Créditos', 2335, 'EM');
INSERT INTO curso VALUES (367, 'Engenharia de Produção                         ', 'Créditos', 517, 'EP');
INSERT INTO curso VALUES (368, 'Medicina (Endocrinologia)                      ', 'Créditos', 5491, 'M');
INSERT INTO curso VALUES (369, 'Administração de Empresas                      ', 'Créditos', 5857, 'AE');
INSERT INTO curso VALUES (370, 'Direito                                        ', 'Créditos', 7939, 'D');
INSERT INTO curso VALUES (371, 'Serviço Social                                 ', 'Créditos', 2632, 'SS');
INSERT INTO curso VALUES (372, 'Letras                                         ', 'Créditos', 9039, 'L');
INSERT INTO curso VALUES (373, 'História Social da Cultura                     ', 'Créditos', 8776, 'HSC');
INSERT INTO curso VALUES (374, 'Relações Internacionais                        ', 'Créditos', 4627, 'RI');
INSERT INTO curso VALUES (375, 'Filosofia                                      ', 'Créditos', 8094, 'F');
INSERT INTO curso VALUES (376, 'Psicologia (Psicologia Social)                 ', 'Créditos', 8771, 'PS');
INSERT INTO curso VALUES (377, 'Direito                                        ', 'Créditos', 9981, 'D');
INSERT INTO curso VALUES (378, 'Educação Física                                ', 'Créditos', 7308, 'EF');
INSERT INTO curso VALUES (379, 'Química                                        ', 'Créditos', 844, 'Q');
INSERT INTO curso VALUES (380, 'Engenharia Elétrica                            ', 'Créditos', 438, 'EE');
INSERT INTO curso VALUES (381, 'Engenharia Mecânica                            ', 'Créditos', 8872, 'EM');
INSERT INTO curso VALUES (382, 'Ciência dos Materiais                          ', 'Créditos', 4223, 'CM');
INSERT INTO curso VALUES (383, 'Engenharia Nuclear                             ', 'Créditos', 7325, 'EN');
INSERT INTO curso VALUES (384, 'Sistemas e Computação                          ', 'Créditos', 4053, 'SC');
INSERT INTO curso VALUES (385, 'Engenharia de Transportes                      ', 'Créditos', 146, 'ET');
INSERT INTO curso VALUES (386, 'Matemática                                     ', 'Créditos', 8481, 'M');
INSERT INTO curso VALUES (387, 'Física                                         ', 'Créditos', 1200, 'F');
INSERT INTO curso VALUES (388, 'Biologia Parasitária                           ', 'Créditos', 533, 'BP');
INSERT INTO curso VALUES (389, 'Saúde Pública                                  ', 'Créditos', 1459, 'SP');
INSERT INTO curso VALUES (390, 'Medicina Tropical                              ', 'Créditos', 9885, 'MT');
INSERT INTO curso VALUES (391, 'Biologia Celular e Molecular                   ', 'Créditos', 2518, 'BCM');
INSERT INTO curso VALUES (392, 'Saúde da Criança e da Mulher                   ', 'Créditos', 7354, 'SCM');
INSERT INTO curso VALUES (393, 'Economia                                       ', 'Créditos', 5446, 'E');
INSERT INTO curso VALUES (394, 'Administração Pública                          ', 'Créditos', 8368, 'AP');
INSERT INTO curso VALUES (395, 'Sociologia                                     ', 'Créditos', 1750, 'S');
INSERT INTO curso VALUES (396, 'Ciência Política (Ciência Política e Sociologia', 'Créditos', 1552, 'CPPS');
INSERT INTO curso VALUES (397, 'Astronomia                                     ', 'Créditos', 4475, 'A');
INSERT INTO curso VALUES (398, 'Geofísica                                      ', 'Créditos', 9548, 'G');
INSERT INTO curso VALUES (399, 'Música                                         ', 'Créditos', 3820, 'M');
INSERT INTO curso VALUES (400, 'Educação Matemática                            ', 'Créditos', 5579, 'EM');
INSERT INTO curso VALUES (401, 'Educação                                       ', 'Créditos', 3683, 'E');
INSERT INTO curso VALUES (402, 'Enfermagem                                     ', 'Créditos', 6466, 'E');
INSERT INTO curso VALUES (403, 'Memória Social e Documento                     ', 'Créditos', 2759, 'MSD');
INSERT INTO curso VALUES (404, 'Teatro                                         ', 'Créditos', 2857, 'T');
INSERT INTO curso VALUES (405, 'Música                                         ', 'Créditos', 1385, 'M');
INSERT INTO curso VALUES (406, 'Tecnologia                                     ', 'Créditos', 5169, 'T');
INSERT INTO curso VALUES (407, 'Biociências e Biotecnologia                    ', 'Créditos', 9319, 'BB');
INSERT INTO curso VALUES (408, 'Educação                                       ', 'Créditos', 5266, 'E');
INSERT INTO curso VALUES (409, 'Física                                         ', 'Créditos', 4525, 'F');
INSERT INTO curso VALUES (410, 'Matemática                                     ', 'Créditos', 8844, 'M');
INSERT INTO curso VALUES (411, 'Ciência da Computação                          ', 'Créditos', 234, 'CC');
INSERT INTO curso VALUES (412, 'Química                                        ', 'Créditos', 9951, 'Q');
INSERT INTO curso VALUES (413, 'Bioquímica e Imunologia                        ', 'Créditos', 1005, 'BI');
INSERT INTO curso VALUES (414, 'Ciências Biológicas (Fisiologia e Farmacologia)', 'Créditos', 4167, 'CBF');
INSERT INTO curso VALUES (415, 'Ciências Biológicas (Microbiologia)            ', 'Créditos', 1093, 'CB');
INSERT INTO curso VALUES (416, 'Biologia Celular                               ', 'Créditos', 4888, 'BC');
INSERT INTO curso VALUES (417, 'Parasitologia                                  ', 'Créditos', 9896, 'P');
INSERT INTO curso VALUES (418, 'Ciência Política                               ', 'Créditos', 4995, 'CP');
INSERT INTO curso VALUES (419, 'Filosofia                                      ', 'Créditos', 500, 'F');
INSERT INTO curso VALUES (420, 'Economia                                       ', 'Créditos', 3728, 'E');
INSERT INTO curso VALUES (421, 'Saneamento, Meio Ambiente e Recursos Hídricos  ', 'Créditos', 9282, 'SMAR');
INSERT INTO curso VALUES (422, 'Engenharia Elétrica                            ', 'Créditos', 2971, 'EE');
INSERT INTO curso VALUES (423, 'Engenharia Mecânica                            ', 'Créditos', 6121, 'EM');
INSERT INTO curso VALUES (424, 'Engenharia Metalúrgica e de Minas              ', 'Créditos', 4495, 'EMM');
INSERT INTO curso VALUES (425, 'Ciências Técnicas Nucleares                    ', 'Créditos', 492, 'CTN');
INSERT INTO curso VALUES (426, 'Patologia                                      ', 'Créditos', 7891, 'P');
INSERT INTO curso VALUES (427, 'Cirurgia                                       ', 'Créditos', 2743, 'C');
INSERT INTO curso VALUES (428, 'Medicina (Dermatologia)                        ', 'Créditos', 8483, 'M');
INSERT INTO curso VALUES (429, 'Medicina (Medicina Tropical)                   ', 'Créditos', 3350, 'MT');
INSERT INTO curso VALUES (430, 'Oftalmologia                                   ', 'Créditos', 2262, 'O');
INSERT INTO curso VALUES (431, 'Odontologia                                    ', 'Créditos', 6610, 'O');
INSERT INTO curso VALUES (432, 'Administração                                  ', 'Créditos', 553, 'A');
INSERT INTO curso VALUES (433, 'Direito                                        ', 'Créditos', 8930, 'D');
INSERT INTO curso VALUES (434, 'Ciência da Informação                          ', 'Créditos', 6000, 'CI');
INSERT INTO curso VALUES (435, 'Zootecnia                                      ', 'Créditos', 3176, 'Z');
INSERT INTO curso VALUES (436, 'Medicina Veterinária                           ', 'Créditos', 9799, 'MV');
INSERT INTO curso VALUES (437, 'Ciência de Alimentos                           ', 'Créditos', 6963, 'CA');
INSERT INTO curso VALUES (438, 'Sociologia                                     ', 'Créditos', 2521, 'S');
INSERT INTO curso VALUES (439, 'Demografia                                     ', 'Créditos', 1296, 'D');
INSERT INTO curso VALUES (440, 'Medicina (Pediatria)                           ', 'Créditos', 2545, 'M');
INSERT INTO curso VALUES (441, 'Ecologia (Conservação e Manejo da Vida Silvestr', 'Créditos', 288, 'EMVS');
INSERT INTO curso VALUES (442, 'Geografia                                      ', 'Créditos', 8292, 'G');
INSERT INTO curso VALUES (443, 'Engenharia de Estruturas                       ', 'Créditos', 3279, 'EE');
INSERT INTO curso VALUES (444, 'Geologia                                       ', 'Créditos', 3963, 'G');
INSERT INTO curso VALUES (445, 'Educação Física                                ', 'Créditos', 9260, 'EF');
INSERT INTO curso VALUES (446, 'Psicologia                                     ', 'Créditos', 4029, 'P');
INSERT INTO curso VALUES (447, 'Ciência Animal                                 ', 'Créditos', 6727, 'CA');
INSERT INTO curso VALUES (448, 'História                                       ', 'Créditos', 3861, 'H');
INSERT INTO curso VALUES (449, 'Engenharia Química                             ', 'Créditos', 2145, 'EQ');
INSERT INTO curso VALUES (450, 'Saúde Pública                                  ', 'Créditos', 960, 'SP');
INSERT INTO curso VALUES (451, 'Enfermagem                                     ', 'Créditos', 6392, 'E');
INSERT INTO curso VALUES (452, 'Sociologia e Política                          ', 'Créditos', 2780, 'SP');
INSERT INTO curso VALUES (453, 'Medicina (Gastroenterologia)                   ', 'Créditos', 7861, 'M');
INSERT INTO curso VALUES (454, 'Arquitetura                                    ', 'Créditos', 4132, 'A');
INSERT INTO curso VALUES (455, 'Estudos Lingüísticos                           ', 'Créditos', 7198, 'EL');
INSERT INTO curso VALUES (456, 'Estudos Literários                             ', 'Créditos', 2816, 'EL');
INSERT INTO curso VALUES (457, 'Fitotecnia (Produção Vegetal)                  ', 'Créditos', 1449, 'FV');
INSERT INTO curso VALUES (458, 'Agronomia (Fitopatologia)                      ', 'Créditos', 3716, 'A');
INSERT INTO curso VALUES (459, 'Microbiologia Agrícola                         ', 'Créditos', 7628, 'MA');
INSERT INTO curso VALUES (460, 'Genética e Melhoramento                        ', 'Créditos', 2385, 'GM');
INSERT INTO curso VALUES (461, 'Ciências Agrárias (Fisiologia Vegetal)         ', 'Créditos', 3413, 'CAV');
INSERT INTO curso VALUES (462, 'Engenharia Agrícola                            ', 'Créditos', 5394, 'EA');
INSERT INTO curso VALUES (463, 'Agronomia (Solos e Nutrição de Plantas)        ', 'Créditos', 7620, 'ANP');
INSERT INTO curso VALUES (464, 'Extensão Rural                                 ', 'Créditos', 1656, 'ER');
INSERT INTO curso VALUES (465, 'Economia Aplicada                              ', 'Créditos', 301, 'EA');
INSERT INTO curso VALUES (466, 'Zootecnia                                      ', 'Créditos', 9173, 'Z');
INSERT INTO curso VALUES (467, 'Ciência Florestal                              ', 'Créditos', 6808, 'CF');
INSERT INTO curso VALUES (468, 'Ciência e Tecnologia de Alimentos              ', 'Créditos', 1602, 'CTA');
INSERT INTO curso VALUES (469, 'Agronomia (Meteorologia Agrícola)              ', 'Créditos', 6147, 'AA');
INSERT INTO curso VALUES (470, 'Agroquímica                                    ', 'Créditos', 2356, 'A');
INSERT INTO curso VALUES (471, 'Entomologia                                    ', 'Créditos', 464, 'E');
INSERT INTO curso VALUES (472, 'Engenharia Civil                               ', 'Créditos', 4137, 'EC');
INSERT INTO curso VALUES (473, 'Economia Doméstica                             ', 'Créditos', 7355, 'ED');
INSERT INTO curso VALUES (474, 'Medicina Veterinária                           ', 'Créditos', 1782, 'MV');
INSERT INTO curso VALUES (475, 'Botânica                                       ', 'Créditos', 9255, 'B');
INSERT INTO curso VALUES (476, 'Engenharia Elétrica                            ', 'Créditos', 579, 'EE');
INSERT INTO curso VALUES (477, 'Engenharia Mecânica                            ', 'Créditos', 6390, 'EM');
INSERT INTO curso VALUES (478, 'Engenharia de Produção                         ', 'Créditos', 3965, 'EP');
INSERT INTO curso VALUES (479, 'Agronomia (Fitotecnia)                         ', 'Créditos', 6635, 'A');
INSERT INTO curso VALUES (480, 'Agronomia (Solos e Nutrição de Plantas)        ', 'Créditos', 6638, 'ANP');
INSERT INTO curso VALUES (481, 'Administração                                  ', 'Créditos', 3801, 'A');
INSERT INTO curso VALUES (482, 'Zootecnia                                      ', 'Créditos', 7604, 'Z');
INSERT INTO curso VALUES (483, 'Ciência dos Alimentos                          ', 'Créditos', 4301, 'CA');
INSERT INTO curso VALUES (484, 'Agronomia (Genética e Melhoramento de Plantas) ', 'Créditos', 1392, 'AMP');
INSERT INTO curso VALUES (485, 'Agronomia (Entomologia)                        ', 'Créditos', 7466, 'A');
INSERT INTO curso VALUES (486, 'Agronomia (Fisiologia Vegetal)                 ', 'Créditos', 1309, 'AV');
INSERT INTO curso VALUES (487, 'Engenharia Agrícola                            ', 'Créditos', 8422, 'EA');
INSERT INTO curso VALUES (488, 'Engenharia Florestal                           ', 'Créditos', 5359, 'EF');
INSERT INTO curso VALUES (489, 'Agronomia (Estatística e Experimentação Agropec', 'Créditos', 996, 'AEA');
INSERT INTO curso VALUES (490, 'Agronomia (Agroquímica e Agrobioquímica)       ', 'Créditos', 8973, 'AA');
INSERT INTO curso VALUES (491, 'Agronomia (Fitopatologia)                      ', 'Créditos', 9167, 'A');
INSERT INTO curso VALUES (492, 'Filosofia                                      ', 'Créditos', 7704, 'F');
INSERT INTO curso VALUES (493, 'Letras                                         ', 'Créditos', 2727, 'L');
INSERT INTO curso VALUES (494, 'Ciências Biológicas (Zoologia)                 ', 'Créditos', 2152, 'CB');
INSERT INTO curso VALUES (495, 'Ciência da Religião                            ', 'Créditos', 4441, 'CR');
INSERT INTO curso VALUES (496, 'Educação                                       ', 'Créditos', 1080, 'E');
INSERT INTO curso VALUES (497, 'Engenharia Elétrica                            ', 'Créditos', 4898, 'EE');
INSERT INTO curso VALUES (498, 'Engenharia Mecânica                            ', 'Créditos', 9988, 'EM');
INSERT INTO curso VALUES (499, 'Educação                                       ', 'Créditos', 270, 'E');
INSERT INTO curso VALUES (500, 'Imunologia e Parasitologia Aplicadas           ', 'Créditos', 4749, 'IPA');
INSERT INTO curso VALUES (501, 'Engenharia Química                             ', 'Créditos', 8197, 'EQ');
INSERT INTO curso VALUES (502, 'Genética e Bioquímica                          ', 'Créditos', 1730, 'GB');
INSERT INTO curso VALUES (503, 'Lingüística                                    ', 'Créditos', 1999, 'L');
INSERT INTO curso VALUES (504, 'Desenvolvimento Econômico                      ', 'Créditos', 523, 'DE');
INSERT INTO curso VALUES (505, 'Geografia                                      ', 'Créditos', 7160, 'G');
INSERT INTO curso VALUES (506, 'Evolução Crustal e Recursos Naturais           ', 'Créditos', 8650, 'ECRN');
INSERT INTO curso VALUES (507, 'Engenharia Civil                               ', 'Créditos', 9709, 'EC');
INSERT INTO curso VALUES (508, 'Engenharia Mineral                             ', 'Créditos', 9865, 'EM');
INSERT INTO curso VALUES (509, 'Letras                                         ', 'Créditos', 1718, 'L');
INSERT INTO curso VALUES (510, 'Tratamento da Informação Espacial              ', 'Créditos', 1379, 'TIE');
INSERT INTO curso VALUES (511, 'Odontologia                                    ', 'Créditos', 573, 'O');
INSERT INTO curso VALUES (512, 'Patologia                                      ', 'Créditos', 1667, 'P');
INSERT INTO curso VALUES (513, 'Tecnologia                                     ', 'Créditos', 366, 'T');
INSERT INTO curso VALUES (514, 'Educação                                       ', 'Créditos', 5005, 'E');
INSERT INTO curso VALUES (515, 'Educação Especial (Educ. do Indivíduo Especial)', 'Créditos', 2993, 'EEIE');
INSERT INTO curso VALUES (516, 'Ecologia e Recursos Naturais                   ', 'Créditos', 8955, 'ERN');
INSERT INTO curso VALUES (517, 'Ciência e Engenharia dos Materiais             ', 'Créditos', 3428, 'CEM');
INSERT INTO curso VALUES (518, 'Química                                        ', 'Créditos', 8396, 'Q');
INSERT INTO curso VALUES (519, 'Engenharia Química                             ', 'Créditos', 7654, 'EQ');
INSERT INTO curso VALUES (520, 'Matemática                                     ', 'Créditos', 8631, 'M');
INSERT INTO curso VALUES (521, 'Ciências da Computação                         ', 'Créditos', 3282, 'CC');
INSERT INTO curso VALUES (522, 'Ciências Sociais                               ', 'Créditos', 4655, 'CS');
INSERT INTO curso VALUES (523, 'Filosofia                                      ', 'Créditos', 4447, 'F');
INSERT INTO curso VALUES (524, 'Física                                         ', 'Créditos', 2081, 'F');
INSERT INTO curso VALUES (525, 'Genética e Evolução                            ', 'Créditos', 1839, 'GE');
INSERT INTO curso VALUES (526, 'Engenharia de Produção                         ', 'Créditos', 7485, 'EP');
INSERT INTO curso VALUES (527, 'Ciências Fisiológicas                          ', 'Créditos', 3764, 'CF');
INSERT INTO curso VALUES (528, 'Engenharia Urbana                              ', 'Créditos', 449, 'EU');
INSERT INTO curso VALUES (529, 'Fisioterapia                                   ', 'Créditos', 3502, 'F');
INSERT INTO curso VALUES (530, 'Educação                                       ', 'Créditos', 2466, 'E');
INSERT INTO curso VALUES (531, 'Física [Sp-Capital]                            ', 'Créditos', 9445, 'F');
INSERT INTO curso VALUES (532, 'Ensino Ciências (Modalidade Física e Química)  ', 'Créditos', 110, 'ECFQ');
INSERT INTO curso VALUES (533, 'Astronomia                                     ', 'Créditos', 8327, 'A');
INSERT INTO curso VALUES (534, 'Matemática [Sp-Capital]                        ', 'Créditos', 9111, 'M');
INSERT INTO curso VALUES (535, 'Matemática Aplicada [Sp-Capital]               ', 'Créditos', 5471, 'MA');
INSERT INTO curso VALUES (536, 'Estatística                                    ', 'Créditos', 262, 'E');
INSERT INTO curso VALUES (537, 'Química (Química Inorgânica)                   ', 'Créditos', 4876, 'QI');
INSERT INTO curso VALUES (538, 'Química Orgânica                               ', 'Créditos', 1290, 'QO');
INSERT INTO curso VALUES (539, 'Química (Química Analítica) [Sp-Capital]       ', 'Créditos', 7557, 'QA');
INSERT INTO curso VALUES (540, 'Química (Físico-Química)                       ', 'Créditos', 6152, 'Q');
INSERT INTO curso VALUES (541, 'Geociências (Mineralogia e Petrologia)         ', 'Créditos', 4516, 'GP');
INSERT INTO curso VALUES (542, 'Oceanografia (Oceanografia Física)             ', 'Créditos', 6671, 'OF');
INSERT INTO curso VALUES (543, 'Geofísica                                      ', 'Créditos', 5352, 'G');
INSERT INTO curso VALUES (544, 'Ciências Biológicas (Bioquímica)               ', 'Créditos', 8666, 'CB');
INSERT INTO curso VALUES (545, 'Ciências Biológicas (Botânica)                 ', 'Créditos', 5135, 'CB');
INSERT INTO curso VALUES (546, 'Farmacologia                                   ', 'Créditos', 591, 'F');
INSERT INTO curso VALUES (547, 'Ciências Biológicas (Biologia Genética)        ', 'Créditos', 2671, 'CBG');
INSERT INTO curso VALUES (548, 'Ciências Biológicas (Microbiologia)            ', 'Créditos', 6769, 'CB');
INSERT INTO curso VALUES (549, 'Ciências (Anatomia Funcional: Estrutura e Ultra', 'Créditos', 7967, 'CFEU');
INSERT INTO curso VALUES (550, 'Ciências (Biologia Celular e Tecidual)         ', 'Créditos', 3179, 'CCT');
INSERT INTO curso VALUES (551, 'Oceanografia (Oceanografia Biológica)          ', 'Créditos', 1780, 'OB');
INSERT INTO curso VALUES (552, 'Ciências (Biologia da Relação Patógeno-Hospedei', 'Créditos', 4205, 'CRP');
INSERT INTO curso VALUES (553, 'Ciências Biológicas (Zoologia)                 ', 'Créditos', 3472, 'CB');
INSERT INTO curso VALUES (554, 'Sociologia                                     ', 'Créditos', 8044, 'S');
INSERT INTO curso VALUES (555, 'Ciência Social (Antropologia Social)           ', 'Créditos', 3249, 'CSS');
INSERT INTO curso VALUES (556, 'Ciência Política                               ', 'Créditos', 8284, 'CP');
INSERT INTO curso VALUES (557, 'Filosofia                                      ', 'Créditos', 325, 'F');
INSERT INTO curso VALUES (558, 'História Social                                ', 'Créditos', 5796, 'HS');
INSERT INTO curso VALUES (559, 'História Econômica                             ', 'Créditos', 2866, 'HE');
INSERT INTO curso VALUES (560, 'Geografia (Geografia Física)                   ', 'Créditos', 2078, 'GF');
INSERT INTO curso VALUES (561, 'Geografia (Geografia Humana)                   ', 'Créditos', 1966, 'GH');
INSERT INTO curso VALUES (562, 'Economia                                       ', 'Créditos', 6762, 'E');
INSERT INTO curso VALUES (563, 'Psicologia (Psicologia Experimental)           ', 'Créditos', 9581, 'PE');
INSERT INTO curso VALUES (564, 'Psicologia Escolar e do Desenvolvimento Humano ', 'Créditos', 1462, 'PEDH');
INSERT INTO curso VALUES (565, 'Psicologia Clínica                             ', 'Créditos', 7652, 'PC');
INSERT INTO curso VALUES (566, 'Psicologia Social                              ', 'Créditos', 6663, 'PS');
INSERT INTO curso VALUES (567, 'Engenharia Elétrica [Sp-Capital]               ', 'Créditos', 1902, 'EE');
INSERT INTO curso VALUES (568, 'Engenharia Mecânica [Sp-Capital]               ', 'Créditos', 491, 'EM');
INSERT INTO curso VALUES (569, 'Medicina Veterinária (Reprodução Animal)       ', 'Créditos', 4611, 'MVA');
INSERT INTO curso VALUES (570, 'Engenharia Metalúrgica [Sp-Capital]            ', 'Créditos', 9275, 'EM');
INSERT INTO curso VALUES (571, 'Engenharia Naval                               ', 'Créditos', 2619, 'EN');
INSERT INTO curso VALUES (572, 'Tecnologia Nuclear                             ', 'Créditos', 4771, 'TN');
INSERT INTO curso VALUES (573, 'Engenharia (Engenharia de Produção)            ', 'Créditos', 5188, 'EP');
INSERT INTO curso VALUES (574, 'Engenharia Química                             ', 'Créditos', 2106, 'EQ');
INSERT INTO curso VALUES (575, 'Engenharia de Transportes [Sp-Capital]         ', 'Créditos', 5735, 'ET');
INSERT INTO curso VALUES (576, 'Patologia                                      ', 'Créditos', 6122, 'P');
INSERT INTO curso VALUES (577, 'Patologia Experimental e Comparada             ', 'Créditos', 2548, 'PEC');
INSERT INTO curso VALUES (578, 'Medicina (Clínica Cirúrgica) [Sp-Capital]      ', 'Créditos', 5018, 'MC');
INSERT INTO curso VALUES (579, 'Medicina (Dermatologia)                        ', 'Créditos', 9902, 'M');
INSERT INTO curso VALUES (580, 'Alergia e Imunopatologia                       ', 'Créditos', 3023, 'AI');
INSERT INTO curso VALUES (581, 'Endocrinologia                                 ', 'Créditos', 3964, 'E');
INSERT INTO curso VALUES (582, 'Gastroenterologia Clínica                      ', 'Créditos', 6736, 'GC');
INSERT INTO curso VALUES (583, 'Medicina (Obstetrícia e Ginecologia)           ', 'Créditos', 6669, 'MG');
INSERT INTO curso VALUES (584, 'Medicina (Hematologia)                         ', 'Créditos', 7943, 'M');
INSERT INTO curso VALUES (585, 'Medicina (Medicina Preventiva) [Sp-Capital]    ', 'Créditos', 6095, 'MP');
INSERT INTO curso VALUES (586, 'Saúde Pública                                  ', 'Créditos', 9943, 'SP');
INSERT INTO curso VALUES (587, 'Doenças Infecciosas e Parasitárias             ', 'Créditos', 612, 'DIP');
INSERT INTO curso VALUES (588, 'Neurologia                                     ', 'Créditos', 3682, 'N');
INSERT INTO curso VALUES (589, 'Otorrinolaringologia                           ', 'Créditos', 9665, 'O');
INSERT INTO curso VALUES (590, 'Medicina (Pediatria) [Sp-Capital]              ', 'Créditos', 5378, 'M');
INSERT INTO curso VALUES (591, 'Psiquiatria                                    ', 'Créditos', 8981, 'P');
INSERT INTO curso VALUES (592, 'Medicina (Reumatologia)                        ', 'Créditos', 8759, 'M');
INSERT INTO curso VALUES (593, 'Odontologia (Ortodontia) [Sp-Capital]          ', 'Créditos', 7923, 'O');
INSERT INTO curso VALUES (594, 'Odontologia (Odontopediatria) [Sp-Capital]     ', 'Créditos', 7822, 'O');
INSERT INTO curso VALUES (595, 'Tecnologia Bioquímico-Farmacêutica             ', 'Créditos', 7128, 'TB');
INSERT INTO curso VALUES (596, 'Farmácia (Análises Clínicas)                   ', 'Créditos', 7189, 'FC');
INSERT INTO curso VALUES (597, 'Toxicologia e Análises Toxicológicas           ', 'Créditos', 1306, 'TAT');
INSERT INTO curso VALUES (598, 'Fármacos e Medicamentos [Sp-Capital]           ', 'Créditos', 760, 'FM');
INSERT INTO curso VALUES (599, 'Toxicologia                                    ', 'Créditos', 4730, 'T');
INSERT INTO curso VALUES (600, 'Enfermagem                                     ', 'Créditos', 988, 'E');
INSERT INTO curso VALUES (601, 'Educação Física                                ', 'Créditos', 638, 'EF');
INSERT INTO curso VALUES (602, 'Administração                                  ', 'Créditos', 6395, 'A');
INSERT INTO curso VALUES (603, 'Controladoria e Contabilidade                  ', 'Créditos', 5065, 'CC');
INSERT INTO curso VALUES (604, 'Ciências da Comunicação                        ', 'Créditos', 6543, 'CC');
INSERT INTO curso VALUES (605, 'Arquitetura e Urbanismo [Sp-Capital]           ', 'Créditos', 3517, 'AU');
INSERT INTO curso VALUES (606, 'Nutrição Animal                                ', 'Créditos', 7398, 'NA');
INSERT INTO curso VALUES (607, 'Anatomia dos Animais Domésticos                ', 'Créditos', 6023, 'AAD');
INSERT INTO curso VALUES (608, 'Ciência dos Alimentos [Sp-Capital]             ', 'Créditos', 6202, 'CA');
INSERT INTO curso VALUES (609, 'Lingüística                                    ', 'Créditos', 2790, 'L');
INSERT INTO curso VALUES (610, 'Letras (Língua e Literatura Italiana)          ', 'Créditos', 9012, 'LLI');
INSERT INTO curso VALUES (611, 'Letras (Língua e Literatura Alemã)             ', 'Créditos', 5271, 'LLA');
INSERT INTO curso VALUES (612, 'Letras (Letras Clássicas)                      ', 'Créditos', 4049, 'LC');
INSERT INTO curso VALUES (613, 'Filologia e Língua Portuguesa                  ', 'Créditos', 8116, 'FLP');
INSERT INTO curso VALUES (614, 'Letras (Língua e Literatura Francesa)          ', 'Créditos', 5452, 'LLF');
INSERT INTO curso VALUES (615, 'Estudos Linguísticos e Literários em Inglês    ', 'Créditos', 6551, 'ELLI');
INSERT INTO curso VALUES (616, 'Literatura Brasileira                          ', 'Créditos', 5780, 'LB');
INSERT INTO curso VALUES (617, 'Letras (Literatura Portuguesa)                 ', 'Créditos', 4624, 'LP');
INSERT INTO curso VALUES (618, 'Letras (Teoria Literária e Literatura Comparada', 'Créditos', 5414, 'LLLC');
INSERT INTO curso VALUES (619, 'Letras (Língua Espanhola e Literaturas Espanhol', 'Créditos', 1066, 'LELE');
INSERT INTO curso VALUES (620, 'Artes                                          ', 'Créditos', 5380, 'A');
INSERT INTO curso VALUES (621, 'Ortopedia e Traumatologia                      ', 'Créditos', 29, 'OT');
INSERT INTO curso VALUES (622, 'Ecologia                                       ', 'Créditos', 9064, 'E');
INSERT INTO curso VALUES (623, 'Nefrologia                                     ', 'Créditos', 5634, 'N');
INSERT INTO curso VALUES (624, 'Pneumologia                                    ', 'Créditos', 8279, 'P');
INSERT INTO curso VALUES (625, 'Direito                                        ', 'Créditos', 4207, 'D');
INSERT INTO curso VALUES (626, 'Enfermagem (Interunidades)                     ', 'Créditos', 2575, 'E');
INSERT INTO curso VALUES (627, 'Imunologia [Sp-Capital]                        ', 'Créditos', 6759, 'I');
INSERT INTO curso VALUES (628, 'Oftalmologia [Sp-Capital]                      ', 'Créditos', 452, 'O');
INSERT INTO curso VALUES (629, 'Epidemiologia Experimental Aplicada A Zoonoses ', 'Créditos', 9148, 'EEAA');
INSERT INTO curso VALUES (630, 'Meteorologia                                   ', 'Créditos', 7051, 'M');
INSERT INTO curso VALUES (631, 'Cardiologia                                    ', 'Créditos', 5157, 'C');
INSERT INTO curso VALUES (632, 'Geociências (Recursos Minerais e Hidrogeologia)', 'Créditos', 1178, 'GMH');
INSERT INTO curso VALUES (633, 'Geociências (Geoquímica e Geotectônica)        ', 'Créditos', 6253, 'GG');
INSERT INTO curso VALUES (634, 'Geociências (Geologia Sedimentar)              ', 'Créditos', 9643, 'GS');
INSERT INTO curso VALUES (635, 'Urologia                                       ', 'Créditos', 8477, 'U');
INSERT INTO curso VALUES (636, 'Engenharia Civil [Sp-Capital]                  ', 'Créditos', 3206, 'EC');
INSERT INTO curso VALUES (637, 'Engenharia Mineral                             ', 'Créditos', 1841, 'EM');
INSERT INTO curso VALUES (638, 'Anestesiologia                                 ', 'Créditos', 4070, 'A');
INSERT INTO curso VALUES (639, 'Radiologia                                     ', 'Créditos', 4486, 'R');
INSERT INTO curso VALUES (640, 'Integração da América Latina                   ', 'Créditos', 5910, 'IAL');
INSERT INTO curso VALUES (641, 'Língua Hebraica, Literatura e Cultura Judaica  ', 'Créditos', 8956, 'LHLC');
INSERT INTO curso VALUES (642, 'Odontologia (Endodontia) [Sp-Capital]          ', 'Créditos', 8215, 'O');
INSERT INTO curso VALUES (643, 'Odontologia (Periodontia) [Sp-Capital]         ', 'Créditos', 2134, 'O');
INSERT INTO curso VALUES (644, 'Odontologia (Diagnóstico Bucal) [Sp-Capital]   ', 'Créditos', 4374, 'OB');
INSERT INTO curso VALUES (645, 'Odontologia (Patologia Bucal) [Sp-Capital]     ', 'Créditos', 2106, 'OB');
INSERT INTO curso VALUES (646, 'Odontologia (Prótese Dentária)                 ', 'Créditos', 5159, 'OD');
INSERT INTO curso VALUES (647, 'Odontologia (Dentística) [Sp-Capital]          ', 'Créditos', 1861, 'O');
INSERT INTO curso VALUES (648, 'Odontologia (Clínica Integrada)                ', 'Créditos', 8902, 'OI');
INSERT INTO curso VALUES (649, 'Ciência Ambiental                              ', 'Créditos', 3350, 'CA');
INSERT INTO curso VALUES (650, 'Odontologia (Materiais Dentários)              ', 'Créditos', 4537, 'OD');
INSERT INTO curso VALUES (651, 'Interunidades em Energia                       ', 'Créditos', 124, 'IE');
INSERT INTO curso VALUES (652, 'Clínica Veterinária                            ', 'Créditos', 735, 'CV');
INSERT INTO curso VALUES (653, 'Arqueologia                                    ', 'Créditos', 2795, 'A');
INSERT INTO curso VALUES (654, 'Ciências (Medicina Legal)                      ', 'Créditos', 2590, 'CL');
INSERT INTO curso VALUES (655, 'Medicina (Cirurgia do Aparelho Digestivo)      ', 'Créditos', 4880, 'MAD');
INSERT INTO curso VALUES (656, 'Oncologia                                      ', 'Créditos', 781, 'O');
INSERT INTO curso VALUES (657, 'Medicina Veterinária                           ', 'Créditos', 2714, 'MV');
INSERT INTO curso VALUES (658, 'Biotecnologia                                  ', 'Créditos', 9875, 'B');
INSERT INTO curso VALUES (659, 'Medicina (Cirurgia Torácica e Cardiovascular)  ', 'Créditos', 185, 'MTC');
INSERT INTO curso VALUES (660, 'Psicologia (Neurociências e Comportamento)     ', 'Créditos', 8902, 'PC');
INSERT INTO curso VALUES (661, 'Nutrição Humana Aplicada                       ', 'Créditos', 5, 'NHA');
INSERT INTO curso VALUES (662, 'Zootecnia (Qualidade e Produtividade Animal)   ', 'Créditos', 4182, 'ZPA');
INSERT INTO curso VALUES (663, 'Odontologia (Deontologia e Odontologia Legal)  ', 'Créditos', 6319, 'OOL');
INSERT INTO curso VALUES (664, 'Letras (Est. Comp. de Liter. de Língua Portugue', 'Créditos', 4226, 'LCLL');
INSERT INTO curso VALUES (665, 'Medicina (Emergências Clínicas)                ', 'Créditos', 7849, 'MC');
INSERT INTO curso VALUES (666, 'Ciências (Fisiologia Geral)                    ', 'Créditos', 3519, 'CG');
INSERT INTO curso VALUES (667, 'Ciências (Fisiologia Humana)                   ', 'Créditos', 2470, 'CH');
INSERT INTO curso VALUES (668, 'Ciências Biológicas (Bioestatística) [Rib. Pret', 'Créditos', 5468, 'CBP');
INSERT INTO curso VALUES (669, 'Bioquímica [Rib. Preto]                        ', 'Créditos', 6813, 'BP');
INSERT INTO curso VALUES (670, 'Ciências Biológicas (Farmacologia) [Rib. Preto]', 'Créditos', 8305, 'CBP');
INSERT INTO curso VALUES (671, 'Fisiologia [Rib. Preto]                        ', 'Créditos', 9308, 'FP');
INSERT INTO curso VALUES (672, 'Ciências Biológicas (Genética) [Rib. Preto]    ', 'Créditos', 6034, 'CBP');
INSERT INTO curso VALUES (673, 'Biologia Celular e Molecular                   ', 'Créditos', 6903, 'BCM');
INSERT INTO curso VALUES (674, 'Patologia Humana [Rib.Preto]                   ', 'Créditos', 5888, 'PH');
INSERT INTO curso VALUES (675, 'Medicina (Clínica Cirúrgica) [Rib. Preto]      ', 'Créditos', 4141, 'MCP');
INSERT INTO curso VALUES (676, 'Medicina (Tocoginecologia) [Rib.Preto]         ', 'Créditos', 1352, 'M');
INSERT INTO curso VALUES (677, 'Medicina (Clínica Médica) [Rib. Preto]         ', 'Créditos', 3010, 'MMP');
INSERT INTO curso VALUES (678, 'Saúde na Comunidae                             ', 'Créditos', 8655, 'SC');
INSERT INTO curso VALUES (679, 'Medicina (Neurologia) [Rib.Preto]              ', 'Créditos', 1311, 'M');
INSERT INTO curso VALUES (680, 'Oftalmologia [Rib.Preto]                       ', 'Créditos', 5909, 'O');
INSERT INTO curso VALUES (681, 'Medicina (Ortopedia e Traumatologia) [Rib.Preto', 'Créditos', 8334, 'MT');
INSERT INTO curso VALUES (682, 'Medicina (Pediatria) [Rib.Preto]               ', 'Créditos', 7849, 'M');
INSERT INTO curso VALUES (683, 'Enfermagem Psiquiátrica [Rib. Preto]           ', 'Créditos', 2995, 'EPP');
INSERT INTO curso VALUES (684, 'Enfermagem Fundamental [Rib. Preto]            ', 'Créditos', 1022, 'EFP');
INSERT INTO curso VALUES (685, 'Entomologia [Rib. Preto]                       ', 'Créditos', 937, 'EP');
INSERT INTO curso VALUES (686, 'Odontologia (Reabilitação Oral) [Rib.Preto]    ', 'Créditos', 5009, 'OO');
INSERT INTO curso VALUES (687, 'Psicobiologia [Rib.Preto]                      ', 'Créditos', 3932, 'P');
INSERT INTO curso VALUES (688, 'Física Aplicada à Medicina e Biologia [Rib. Pre', 'Créditos', 7586, 'FAMB');
INSERT INTO curso VALUES (689, 'Ciências Farmacêuticas [Rib. Preto]            ', 'Créditos', 6014, 'CFP');
INSERT INTO curso VALUES (690, 'Imunologia Básica e Aplicada [Rib. Preto]      ', 'Créditos', 253, 'IBAP');
INSERT INTO curso VALUES (691, 'Enfermagem em Saúde Pública [Rib. Preto]       ', 'Créditos', 3340, 'ESPP');
INSERT INTO curso VALUES (692, 'Medicina (Otorrinolaringologia) [Rib.Preto]    ', 'Créditos', 6888, 'M');
INSERT INTO curso VALUES (693, 'Medicina (Saúde Mental) [Rib.Preto]            ', 'Créditos', 4736, 'MM');
INSERT INTO curso VALUES (694, 'Química [Rib.Preto]                            ', 'Créditos', 9987, 'Q');
INSERT INTO curso VALUES (695, 'Entomologia [Esalq]                            ', 'Créditos', 4558, 'E');
INSERT INTO curso VALUES (696, 'Agronomia (Fitopatologia) [Esalq]              ', 'Créditos', 8035, 'A');
INSERT INTO curso VALUES (697, 'Fitotecnia [Esalq]                             ', 'Créditos', 5941, 'F');
INSERT INTO curso VALUES (698, 'Agronomia (Genética e Melhoramento de Plantas) ', 'Créditos', 2496, 'AMP');
INSERT INTO curso VALUES (699, 'Agronomia (Microbiologia Agrícola) [Esalq]     ', 'Créditos', 6741, 'AA');
INSERT INTO curso VALUES (700, 'Agronomia (Solos e Nutrição de Plantas) [Esalq]', 'Créditos', 5618, 'ANP');
INSERT INTO curso VALUES (701, 'Irrigação e Drenagem [Esalq]                   ', 'Créditos', 2565, 'ID');
INSERT INTO curso VALUES (702, 'Agronomia (Estatística e Experimentação Agronôm', 'Créditos', 5773, 'AEA');
INSERT INTO curso VALUES (703, 'Agronomia ( Física do Ambiente Agrícola ) Esalq', 'Créditos', 2247, 'AFAA');
INSERT INTO curso VALUES (704, 'Ciências (Economia Aplicada) [Esalq]           ', 'Créditos', 6963, 'CA');
INSERT INTO curso VALUES (705, 'Ciência Animal e Pastagens [Esalq]             ', 'Créditos', 4399, 'CAP');
INSERT INTO curso VALUES (706, 'Ciências Florestais [Esalq]                    ', 'Créditos', 9597, 'CF');
INSERT INTO curso VALUES (707, 'Ciência e Tecnologia de Alimentos [Esalq]      ', 'Créditos', 3402, 'CTA');
INSERT INTO curso VALUES (708, 'Fisiologia Bioquímica de Plantas [Esalq]       ', 'Créditos', 9551, 'FBP');
INSERT INTO curso VALUES (709, 'Máquinas Agrícolas [Esalq]                     ', 'Créditos', 6865, 'MA');
INSERT INTO curso VALUES (710, 'Ciência e Tecnologia de Madeiras [Esalq]       ', 'Créditos', 4832, 'CTM');
INSERT INTO curso VALUES (711, 'Física [S.Carlos]                              ', 'Créditos', 7738, 'F');
INSERT INTO curso VALUES (712, 'Matemática [S.Carlos]                          ', 'Créditos', 2609, 'M');
INSERT INTO curso VALUES (713, 'Ciência da Computação e Matemática Computaciona', 'Créditos', 1940, 'CCMC');
INSERT INTO curso VALUES (714, 'Físico-Química [S. Carlos]                     ', 'Créditos', 3091, 'FC');
INSERT INTO curso VALUES (715, 'Bioengenharia [S.Carlos]                       ', 'Créditos', 9142, 'B');
INSERT INTO curso VALUES (716, 'Engenharia Civil (Engenharia de Estruturas) [S.', 'Créditos', 7561, 'ECE');
INSERT INTO curso VALUES (717, 'Engenharia Hidráulica e Saneamento [S.Carlos]  ', 'Créditos', 6067, 'EHS');
INSERT INTO curso VALUES (718, 'Geotecnia [S.Carlos]                           ', 'Créditos', 9176, 'G');
INSERT INTO curso VALUES (719, 'Engenharia Elétrica [S. Carlos]                ', 'Créditos', 6543, 'EEC');
INSERT INTO curso VALUES (720, 'Engenharia Mecânica [S. Carlos]                ', 'Créditos', 7943, 'EMC');
INSERT INTO curso VALUES (721, 'Engenharia Metalúrgica [S. Carlos]             ', 'Créditos', 2723, 'EMC');
INSERT INTO curso VALUES (722, 'Engenharia de Transportes [S.Carlos]           ', 'Créditos', 8597, 'ET');
INSERT INTO curso VALUES (723, 'Arquitetura [S.Carlos]                         ', 'Créditos', 7046, 'A');
INSERT INTO curso VALUES (724, 'Química (Química Analítica) [S.Carlos]         ', 'Créditos', 7897, 'QA');
INSERT INTO curso VALUES (725, 'Ciências da Engenharia Ambiental [S.Carlos]    ', 'Créditos', 20, 'CEA');
INSERT INTO curso VALUES (726, 'Ciência e Engenharia de Materiais [S.Carlos]   ', 'Créditos', 6168, 'CEM');
INSERT INTO curso VALUES (727, 'Engenharia de produção                         ', 'Créditos', 1083, 'E');
INSERT INTO curso VALUES (728, 'Odontologia (Dentística) [Bauru]               ', 'Créditos', 6501, 'O');
INSERT INTO curso VALUES (729, 'Odontologia (Estomatologia) [Bauru]            ', 'Créditos', 8426, 'O');
INSERT INTO curso VALUES (730, 'Odontologia (Odontopediatria) [Bauru]          ', 'Créditos', 3719, 'O');
INSERT INTO curso VALUES (731, 'Odontologia (Ortodontia) [Bauru]               ', 'Créditos', 6573, 'O');
INSERT INTO curso VALUES (732, 'Odontologia (Reabilitação Oral) [Bauru]        ', 'Créditos', 9815, 'OO');
INSERT INTO curso VALUES (733, 'Odontologia (Periodontia) [Bauru]              ', 'Créditos', 544, 'O');
INSERT INTO curso VALUES (734, 'Odontologia (Endodontia) [Bauru]               ', 'Créditos', 9212, 'O');
INSERT INTO curso VALUES (735, 'Odontologia (Patologia Bucal) [Bauru]          ', 'Créditos', 8830, 'OB');
INSERT INTO curso VALUES (736, 'Educação                                       ', 'Créditos', 1031, 'E');
INSERT INTO curso VALUES (737, 'Física                                         ', 'Créditos', 5573, 'F');
INSERT INTO curso VALUES (738, 'Matemática                                     ', 'Créditos', 8798, 'M');
INSERT INTO curso VALUES (739, 'Matemática Aplicada                            ', 'Créditos', 3319, 'MA');
INSERT INTO curso VALUES (740, 'Ciência da Computação                          ', 'Créditos', 3022, 'CC');
INSERT INTO curso VALUES (741, 'Estatística                                    ', 'Créditos', 1877, 'E');
INSERT INTO curso VALUES (742, 'Química                                        ', 'Créditos', 8903, 'Q');
INSERT INTO curso VALUES (743, 'Biologia Vegetal                               ', 'Créditos', 2677, 'BV');
INSERT INTO curso VALUES (744, 'Ecologia                                       ', 'Créditos', 7470, 'E');
INSERT INTO curso VALUES (745, 'Ciências Biológicas (Fisiologia)               ', 'Créditos', 7280, 'CB');
INSERT INTO curso VALUES (746, 'Biologia (Imunologia)                          ', 'Créditos', 5597, 'B');
INSERT INTO curso VALUES (747, 'Biologia e Patologia Buco-Dental [Piracicaba]  ', 'Créditos', 4359, 'BPB');
INSERT INTO curso VALUES (748, 'Sociologia                                     ', 'Créditos', 6075, 'S');
INSERT INTO curso VALUES (749, 'Antropologia Social                            ', 'Créditos', 7864, 'AS');
INSERT INTO curso VALUES (750, 'Ciência Política                               ', 'Créditos', 2054, 'CP');
INSERT INTO curso VALUES (751, 'Lógica e Filosofia da Ciência                  ', 'Créditos', 1361, 'LFC');
INSERT INTO curso VALUES (752, 'História                                       ', 'Créditos', 6509, 'H');
INSERT INTO curso VALUES (753, 'Economia                                       ', 'Créditos', 6181, 'E');
INSERT INTO curso VALUES (754, 'Engenharia Elétrica                            ', 'Créditos', 1623, 'EE');
INSERT INTO curso VALUES (755, 'Engenharia Mecânica                            ', 'Créditos', 8770, 'EM');
INSERT INTO curso VALUES (756, 'Ciências Médicas                               ', 'Créditos', 8195, 'CM');
INSERT INTO curso VALUES (757, 'Genética e Biologia Molecular                  ', 'Créditos', 4511, 'GBM');
INSERT INTO curso VALUES (758, 'Engenharia Agrícola                            ', 'Créditos', 7689, 'EA');
INSERT INTO curso VALUES (759, 'Ciência de Alimentos                           ', 'Créditos', 7299, 'CA');
INSERT INTO curso VALUES (760, 'Tecnologia de Alimentos                        ', 'Créditos', 8165, 'TA');
INSERT INTO curso VALUES (761, 'Engenharia de Alimentos                        ', 'Créditos', 6571, 'EA');
INSERT INTO curso VALUES (762, 'Lingüística                                    ', 'Créditos', 7630, 'L');
INSERT INTO curso VALUES (763, 'TEORIA E HISTÓRIA LITERÁRIA                    ', 'Créditos', 4565, 'TEHL');
INSERT INTO curso VALUES (764, 'Odontologia [Piracicaba]                       ', 'Créditos', 1148, 'O');
INSERT INTO curso VALUES (765, 'Biologia Celular e estrutural                  ', 'Créditos', 2633, 'BC');
INSERT INTO curso VALUES (766, 'Engenharia Química                             ', 'Créditos', 8568, 'EQ');
INSERT INTO curso VALUES (767, 'Materiais Dentários [Piracicaba]               ', 'Créditos', 4235, 'MD');
INSERT INTO curso VALUES (768, 'Radiologia Odontologica [Piracicaba]           ', 'Créditos', 5163, 'RO');
INSERT INTO curso VALUES (769, 'Geociências                                    ', 'Créditos', 8770, 'G');
INSERT INTO curso VALUES (770, 'Ciências Sociais                               ', 'Créditos', 2814, 'CS');
INSERT INTO curso VALUES (771, 'Biologia Funcional e Molecular                 ', 'Créditos', 7806, 'BFM');
INSERT INTO curso VALUES (772, 'Engenharia Civil                               ', 'Créditos', 4155, 'EC');
INSERT INTO curso VALUES (773, 'Alimentos e Nutrição                           ', 'Créditos', 1155, 'AN');
INSERT INTO curso VALUES (774, 'Lingüística Aplicada                           ', 'Créditos', 1987, 'LA');
INSERT INTO curso VALUES (775, 'Multimeios                                     ', 'Créditos', 3864, 'M');
INSERT INTO curso VALUES (776, 'Educação Física                                ', 'Créditos', 9294, 'EF');
INSERT INTO curso VALUES (777, 'Política Científica e Tecnológica              ', 'Créditos', 3876, 'PCT');
INSERT INTO curso VALUES (778, 'Engenharia de Petróleo                         ', 'Créditos', 3076, 'EP');
INSERT INTO curso VALUES (779, 'Planejamento de Sistemas Energéticos/Área Inter', 'Créditos', 5535, 'PSEI');
INSERT INTO curso VALUES (780, 'Farmacologia                                   ', 'Créditos', 779, 'F');
INSERT INTO curso VALUES (781, 'Parasitologia                                  ', 'Créditos', 9282, 'P');
INSERT INTO curso VALUES (782, 'Odontologia (Fisiologia e Biofísica do Sist. Es', 'Créditos', 2604, 'OBSE');
INSERT INTO curso VALUES (783, 'Pediatria                                      ', 'Créditos', 2289, 'P');
INSERT INTO curso VALUES (784, 'Odontologia Legal e Deontologia [Piracicaba]   ', 'Créditos', 2560, 'OLD');
INSERT INTO curso VALUES (785, 'Saúde Mental                                   ', 'Créditos', 7916, 'SM');
INSERT INTO curso VALUES (786, 'Saúde Coletiva                                 ', 'Créditos', 2654, 'SC');
INSERT INTO curso VALUES (787, 'Artes                                          ', 'Créditos', 5983, 'A');
INSERT INTO curso VALUES (788, 'Demografia                                     ', 'Créditos', 1055, 'D');
INSERT INTO curso VALUES (789, 'Tocoginecologia                                ', 'Créditos', 6682, 'T');
INSERT INTO curso VALUES (790, 'Cirurgia                                       ', 'Créditos', 6319, 'C');
INSERT INTO curso VALUES (791, 'Clínica Odontológica [Piracicaba]              ', 'Créditos', 5999, 'CO');
INSERT INTO curso VALUES (792, 'Clínica Médica                                 ', 'Créditos', 7591, 'CM');
INSERT INTO curso VALUES (793, 'Filosofia                                      ', 'Créditos', 6872, 'F');
INSERT INTO curso VALUES (794, 'Ciências Biológicas (Morfologia)               ', 'Créditos', 8073, 'CB');
INSERT INTO curso VALUES (795, 'Ciências Biológicas (Microbiologia)            ', 'Créditos', 2536, 'CB');
INSERT INTO curso VALUES (796, 'Agronomia (Produção Vegetal) [Jaboticabal]     ', 'Créditos', 1479, 'AV');
INSERT INTO curso VALUES (797, 'Zootecnia (Produção Animal) [Jaboticabal]      ', 'Créditos', 1101, 'ZA');
INSERT INTO curso VALUES (798, 'Ciências Biológicas (Zoologia) [Rio Claro]     ', 'Créditos', 5231, 'CBC');
INSERT INTO curso VALUES (799, 'Geografia [Rio Claro]                          ', 'Créditos', 8528, 'GC');
INSERT INTO curso VALUES (800, 'Ciências Biológicas (Biologia Vegetal) [Rio Cla', 'Créditos', 9267, 'CBVC');
INSERT INTO curso VALUES (801, 'Odontologia (Dentística Restauradora) [Araraqua', 'Créditos', 9530, 'OR');
INSERT INTO curso VALUES (802, 'Letras (Lingüística e Língua Portuguesa) [Arara', 'Créditos', 3615, 'LLP');
INSERT INTO curso VALUES (803, 'Odontologia (Odontopediatria) [Araraquara]     ', 'Créditos', 9543, 'O');
INSERT INTO curso VALUES (804, 'Ciências Biológicas (Zoologia) [Botucatu]      ', 'Créditos', 7938, 'CB');
INSERT INTO curso VALUES (805, 'Letras [Sjrp]                                  ', 'Créditos', 8449, 'L');
INSERT INTO curso VALUES (806, 'Letras (Estudos Literários) [Araraquara]       ', 'Créditos', 7030, 'LL');
INSERT INTO curso VALUES (807, 'Sociologia [Araraquara]                        ', 'Créditos', 9298, 'S');
INSERT INTO curso VALUES (808, 'História [Assis]                               ', 'Créditos', 771, 'H');
INSERT INTO curso VALUES (809, 'Letras [Assis]                                 ', 'Créditos', 7317, 'L');
INSERT INTO curso VALUES (810, 'Agronomia (Energia na Agricultura) [Botucatu]  ', 'Créditos', 1218, 'AA');
INSERT INTO curso VALUES (811, 'Medicina Veterinária [Botucatu]                ', 'Créditos', 5871, 'MV');
INSERT INTO curso VALUES (812, 'Ciências Biológicas (Genética) [Sjrp]          ', 'Créditos', 5980, 'CB');
INSERT INTO curso VALUES (813, 'Ciências Biológicas (Anatomia) [Botucatu]      ', 'Créditos', 6132, 'CB');
INSERT INTO curso VALUES (814, 'Ciências Biológicas (Botânica) [Botucatu]      ', 'Créditos', 105, 'CB');
INSERT INTO curso VALUES (815, 'Ciências Biológicas (Genética) [Botucatu]      ', 'Créditos', 9529, 'CB');
INSERT INTO curso VALUES (816, 'Engenharia Mecânica [Guaratinguetá]            ', 'Créditos', 8834, 'EM');
INSERT INTO curso VALUES (817, 'Agronomia (Genética e Melhoramento de Plantas) ', 'Créditos', 4092, 'AMP');
INSERT INTO curso VALUES (818, 'Zootecnia (Melhoramento Genético Animal) [Jabot', 'Créditos', 2849, 'ZGA');
INSERT INTO curso VALUES (819, 'Educação Matemática [Rio Claro]                ', 'Créditos', 4662, 'EMC');
INSERT INTO curso VALUES (820, 'Agronomia (Proteção de Plantas) [Botucatu]     ', 'Créditos', 8184, 'AP');
INSERT INTO curso VALUES (821, 'Geociências (Geociências e Meio Ambiente) [Rio ', 'Créditos', 8636, 'GMA');
INSERT INTO curso VALUES (822, 'Agronomia (Entomologia Agrícola) [Jaboticabal] ', 'Créditos', 4724, 'AA');
INSERT INTO curso VALUES (823, 'Agronomia (Irrigação e Drenagem) [Botucatu]    ', 'Créditos', 8509, 'AD');
INSERT INTO curso VALUES (824, 'Agronomia (Agricultura) [Botucatu]             ', 'Créditos', 9789, 'A');
INSERT INTO curso VALUES (825, 'Educação [Marília]                             ', 'Créditos', 662, 'E');
INSERT INTO curso VALUES (826, 'Ciências Biológicas (Microbiologia Aplicada) [R', 'Créditos', 516, 'CBA');
INSERT INTO curso VALUES (827, 'Odontologia (Prótese Buco-Maxilo Facial) [S.J.C', 'Créditos', 9449, 'OBF');
INSERT INTO curso VALUES (828, 'Ciências Biológicas (Biologia Celular e Molecul', 'Créditos', 7295, 'CBCM');
INSERT INTO curso VALUES (829, 'Ciências Matemática [Sjrp]                     ', 'Créditos', 9923, 'CM');
INSERT INTO curso VALUES (830, 'Zootecnia (Nutrição e Produção Animal) [Botucat', 'Créditos', 4944, 'ZPA');
INSERT INTO curso VALUES (831, 'Aquicultura [Jaboticabal]                      ', 'Créditos', 7607, 'A');
INSERT INTO curso VALUES (832, 'Agronomia (Produção e Tecnologia de Sementes) [', 'Créditos', 9847, 'ATS');
INSERT INTO curso VALUES (833, 'Física [Guararatinguetá]                       ', 'Créditos', 8654, 'F');
INSERT INTO curso VALUES (834, 'Medicina Veterinária (Patologia Animal) [Jaboti', 'Créditos', 6763, 'MVA');
INSERT INTO curso VALUES (835, 'Alimentos e Nutrição [Araraquara]              ', 'Créditos', 8740, 'AN');
INSERT INTO curso VALUES (836, 'Patologia [Botucatu]                           ', 'Créditos', 5660, 'P');
INSERT INTO curso VALUES (837, 'Medicina Veterinária (Medicina Veterinária Prev', 'Créditos', 956, 'MVVP');
INSERT INTO curso VALUES (838, 'Odontologia (Ortodontia) [Araraquara]          ', 'Créditos', 6113, 'O');
INSERT INTO curso VALUES (839, 'Odontologia (Periodontia) [Araraquara]         ', 'Créditos', 3176, 'O');
INSERT INTO curso VALUES (840, 'Odontologia (Endodontia) [Araraquara]          ', 'Créditos', 4894, 'O');
INSERT INTO curso VALUES (841, 'Ciências da Motricidade [Rio Claro]            ', 'Créditos', 9015, 'CMC');
INSERT INTO curso VALUES (842, 'Artes                                          ', 'Créditos', 3167, 'A');
INSERT INTO curso VALUES (843, 'Doenças Tropicais [Botucatu]                   ', 'Créditos', 3626, 'DT');
INSERT INTO curso VALUES (844, 'Engenharia Elétrica [Ilha Solteira]            ', 'Créditos', 5490, 'EES');
INSERT INTO curso VALUES (845, 'Serviço Social [Franca]                        ', 'Créditos', 7424, 'SS');
INSERT INTO curso VALUES (846, 'Biofísica Molecular [Sjrp]                     ', 'Créditos', 6474, 'BM');
INSERT INTO curso VALUES (847, 'Cirurgia Veterinária [Jaboticabal]             ', 'Créditos', 5452, 'CV');
INSERT INTO curso VALUES (848, 'Odontologia (Odontologia Restauradora) [S.J.Cam', 'Créditos', 5389, 'OR');
INSERT INTO curso VALUES (849, 'Química [Araraquara]                           ', 'Créditos', 4381, 'Q');
INSERT INTO curso VALUES (850, 'Odontologia (Odontologia Preventiva e Social) [', 'Créditos', 4339, 'OPS');
INSERT INTO curso VALUES (851, 'Educação                                       ', 'Créditos', 6820, 'E');
INSERT INTO curso VALUES (852, 'Educação (Psicologia da Educação)              ', 'Créditos', 8404, 'EE');
INSERT INTO curso VALUES (853, 'Educação (Currículo)                           ', 'Créditos', 2597, 'E');
INSERT INTO curso VALUES (854, 'Educação Matemática                            ', 'Créditos', 4968, 'EM');
INSERT INTO curso VALUES (855, 'Ciências Sociais                               ', 'Créditos', 4548, 'CS');
INSERT INTO curso VALUES (856, 'Filosofia                                      ', 'Créditos', 9520, 'F');
INSERT INTO curso VALUES (857, 'Ciências da Religião                           ', 'Créditos', 960, 'CR');
INSERT INTO curso VALUES (858, 'História                                       ', 'Créditos', 8372, 'H');
INSERT INTO curso VALUES (859, 'Economia                                       ', 'Créditos', 3839, 'E');
INSERT INTO curso VALUES (860, 'Psicologia (Psicologia Social)                 ', 'Créditos', 8662, 'PS');
INSERT INTO curso VALUES (861, 'Psicologia (Psicologia Clínica)                ', 'Créditos', 2227, 'PC');
INSERT INTO curso VALUES (862, 'Administração                                  ', 'Créditos', 9287, 'A');
INSERT INTO curso VALUES (863, 'Ciências Contábeis e Atuariais                 ', 'Créditos', 720, 'CCA');
INSERT INTO curso VALUES (864, 'Direito                                        ', 'Créditos', 9501, 'D');
INSERT INTO curso VALUES (865, 'Serviço Social                                 ', 'Créditos', 3168, 'SS');
INSERT INTO curso VALUES (866, 'Comunicação e Semiótica                        ', 'Créditos', 2024, 'CS');
INSERT INTO curso VALUES (867, 'Língua Portuguesa                              ', 'Créditos', 4387, 'LP');
INSERT INTO curso VALUES (868, 'Lingüística Aplicada ao Ensino de Línguas      ', 'Créditos', 3295, 'LAEL');
INSERT INTO curso VALUES (869, 'Fonoaudiologia                                 ', 'Créditos', 1159, 'F');
INSERT INTO curso VALUES (870, 'Filosofia                                      ', 'Créditos', 3935, 'F');
INSERT INTO curso VALUES (871, 'Psicologia                                     ', 'Créditos', 7328, 'P');
INSERT INTO curso VALUES (872, 'Biblioteconomia e Ciência da Informação        ', 'Créditos', 4154, 'BCI');
INSERT INTO curso VALUES (873, 'Educação                                       ', 'Créditos', 8710, 'E');
INSERT INTO curso VALUES (874, 'Educação                                       ', 'Créditos', 3278, 'E');
INSERT INTO curso VALUES (875, 'Ciências Biológicas (Biologia Molecular)       ', 'Créditos', 9178, 'CBM');
INSERT INTO curso VALUES (876, 'Farmacologia                                   ', 'Créditos', 5157, 'F');
INSERT INTO curso VALUES (877, 'Microbiologia e Imunologia                     ', 'Créditos', 6621, 'MI');
INSERT INTO curso VALUES (878, 'Patologia                                      ', 'Créditos', 7854, 'P');
INSERT INTO curso VALUES (879, 'Medicina (Cardiologia)                         ', 'Créditos', 5256, 'M');
INSERT INTO curso VALUES (880, 'Medicina (Neurocirurgia)                       ', 'Créditos', 7937, 'M');
INSERT INTO curso VALUES (881, 'Medicina (Gastroenterologia Cirúrgica)         ', 'Créditos', 3673, 'MC');
INSERT INTO curso VALUES (882, 'Medicina (Cirurgia Cardiovascular)             ', 'Créditos', 5000, 'MC');
INSERT INTO curso VALUES (883, 'Medicina (Endocrinologia Clínica)              ', 'Créditos', 98, 'MC');
INSERT INTO curso VALUES (884, 'Gastroenterologia                              ', 'Créditos', 4150, 'G');
INSERT INTO curso VALUES (885, 'Medicina (Obstetrícia)                         ', 'Créditos', 1485, 'M');
INSERT INTO curso VALUES (886, 'Medicina (Ginecologia)                         ', 'Créditos', 7087, 'M');
INSERT INTO curso VALUES (887, 'Medicina (Hematologia)                         ', 'Créditos', 4382, 'M');
INSERT INTO curso VALUES (888, 'Medicina (Nefrologia)                          ', 'Créditos', 2287, 'M');
INSERT INTO curso VALUES (889, 'Medicina (Neurologia)                          ', 'Créditos', 7244, 'M');
INSERT INTO curso VALUES (890, 'Medicina (Otorrinolaringologia)                ', 'Créditos', 2869, 'M');
INSERT INTO curso VALUES (891, 'Medicina (Pediatria)                           ', 'Créditos', 8689, 'M');
INSERT INTO curso VALUES (892, 'Medicina (Pneumologia)                         ', 'Créditos', 8778, 'M');
INSERT INTO curso VALUES (893, 'Medicina (Urologia)                            ', 'Créditos', 5200, 'M');
INSERT INTO curso VALUES (894, 'Medicina (Dermatologia)                        ', 'Créditos', 4685, 'M');
INSERT INTO curso VALUES (895, 'Medicina (Oftalmologia)                        ', 'Créditos', 1537, 'M');
INSERT INTO curso VALUES (896, 'Distúrbios da Comunicação Humana (Fonoaudiologi', 'Créditos', 4060, 'DCH');
INSERT INTO curso VALUES (897, 'Técnicas Operatórias e Cirurgia Experimental   ', 'Créditos', 5837, 'TOCE');
INSERT INTO curso VALUES (898, 'Medicina (Radiologia Clinica)                  ', 'Créditos', 8672, 'MC');
INSERT INTO curso VALUES (899, 'Doenças Infecciosas e Parasitárias             ', 'Créditos', 5681, 'DIP');
INSERT INTO curso VALUES (900, 'Reumatologia                                   ', 'Créditos', 661, 'R');
INSERT INTO curso VALUES (901, 'Psiquiatria e Psicologia Médica                ', 'Créditos', 8609, 'PPM');
INSERT INTO curso VALUES (902, 'Psicobiologia                                  ', 'Créditos', 1072, 'P');
INSERT INTO curso VALUES (903, 'Morfologia                                     ', 'Créditos', 4976, 'M');
INSERT INTO curso VALUES (904, 'Enfermagem                                     ', 'Créditos', 9246, 'E');
INSERT INTO curso VALUES (905, 'Ortopedia e Traumatologia                      ', 'Créditos', 969, 'OT');
INSERT INTO curso VALUES (906, 'Cirurgia Plástica Reparadora                   ', 'Créditos', 7185, 'CPR');
INSERT INTO curso VALUES (907, 'Epidemiologia                                  ', 'Créditos', 6004, 'E');
INSERT INTO curso VALUES (908, 'Nutrição                                       ', 'Créditos', 2736, 'N');
INSERT INTO curso VALUES (909, 'Reabilitação                                   ', 'Créditos', 4142, 'R');
INSERT INTO curso VALUES (910, 'Cirurgia Pediátrica                            ', 'Créditos', 5704, 'CP');
INSERT INTO curso VALUES (911, 'Computação Aplicada                            ', 'Créditos', 432, 'CA');
INSERT INTO curso VALUES (912, 'Meteorologia                                   ', 'Créditos', 9237, 'M');
INSERT INTO curso VALUES (913, 'Sensoriamento Remoto                           ', 'Créditos', 8338, 'SR');
INSERT INTO curso VALUES (914, 'Astrofísica                                    ', 'Créditos', 4562, 'A');
INSERT INTO curso VALUES (915, 'Engenharia e Tecnologia Espaciais              ', 'Créditos', 5317, 'ETE');
INSERT INTO curso VALUES (916, 'Geofísica Espacial                             ', 'Créditos', 7867, 'GE');
INSERT INTO curso VALUES (917, 'Física                                         ', 'Créditos', 549, 'F');
INSERT INTO curso VALUES (918, 'Engenharia Eletrônica e Computação             ', 'Créditos', 1555, 'EEC');
INSERT INTO curso VALUES (919, 'Engenharia Aeronáutica e Mecânica              ', 'Créditos', 6097, 'EAM');
INSERT INTO curso VALUES (920, 'Engenharia de Infra-Estrutura Aeronáutica      ', 'Créditos', 3179, 'EIA');
INSERT INTO curso VALUES (921, 'Administração de Empresas                      ', 'Créditos', 4299, 'AE');
INSERT INTO curso VALUES (922, 'Economia de Empresas                           ', 'Créditos', 4562, 'EE');
INSERT INTO curso VALUES (923, 'Administração Pública e Governo                ', 'Créditos', 6886, 'APG');
INSERT INTO curso VALUES (924, 'Física (IFT)                                   ', 'Créditos', 7130, 'F');
INSERT INTO curso VALUES (925, 'Medicina (Gastroenterologia)                   ', 'Créditos', 5967, 'M');
INSERT INTO curso VALUES (926, 'Ciências da Religião                           ', 'Créditos', 5944, 'CR');
INSERT INTO curso VALUES (927, 'Psicologia da Saúde                            ', 'Créditos', 2322, 'PS');
INSERT INTO curso VALUES (928, 'Comunicação Social                             ', 'Créditos', 1483, 'CS');
INSERT INTO curso VALUES (929, 'Administração                                  ', 'Créditos', 3360, 'A');
INSERT INTO curso VALUES (930, 'Odontologia                                    ', 'Créditos', 6048, 'O');
INSERT INTO curso VALUES (931, 'Medicina (Cirurgia)                            ', 'Créditos', 383, 'M');
INSERT INTO curso VALUES (932, 'Medicina (Clínica Médica)                      ', 'Créditos', 9300, 'MM');
INSERT INTO curso VALUES (933, 'Medicina (Tocoginecologia)                     ', 'Créditos', 1335, 'M');
INSERT INTO curso VALUES (934, 'Medicina (Pediatria)                           ', 'Créditos', 553, 'M');
INSERT INTO curso VALUES (935, 'Medicina (Otorrinolaringologia)                ', 'Créditos', 4052, 'M');
INSERT INTO curso VALUES (936, 'Odontologia                                    ', 'Créditos', 8796, 'O');
INSERT INTO curso VALUES (937, 'Ciências (Energia Nuclear na Agricultura) [Cena', 'Créditos', 8409, 'CNA');
INSERT INTO curso VALUES (938, 'Engenharia Elétrica                            ', 'Créditos', 700, 'EE');
INSERT INTO curso VALUES (939, 'Engenharia de Materiais                        ', 'Créditos', 3962, 'EM');
INSERT INTO curso VALUES (940, 'Biotecnologia Industrial                       ', 'Créditos', 6113, 'BI');
INSERT INTO curso VALUES (941, 'Ciências da Saúde                              ', 'Créditos', 5417, 'CS');
INSERT INTO curso VALUES (942, 'Educação                                       ', 'Créditos', 3178, 'E');
INSERT INTO curso VALUES (943, 'Direito                                        ', 'Créditos', 6718, 'D');
INSERT INTO curso VALUES (944, 'Medicina (Gastroenterologia Cirúrgica)         ', 'Créditos', 2764, 'MC');
INSERT INTO curso VALUES (945, 'Medicina (Cirurgia de Cabeça e Pescoço)        ', 'Créditos', 5305, 'MCP');
INSERT INTO curso VALUES (946, 'Odontologia (Cirurgia e Traumatologia Buco-Maxi', 'Créditos', 7245, 'OTB');
INSERT INTO curso VALUES (947, 'Odontologia (Odontopediatria) [Araçatuba]      ', 'Créditos', 4881, 'O');
INSERT INTO curso VALUES (948, 'Biotecnologia [Araraquara]                     ', 'Créditos', 982, 'B');
INSERT INTO curso VALUES (949, 'Educação Escolar [Araraquara]                  ', 'Créditos', 3610, 'EE');
INSERT INTO curso VALUES (950, 'Cirurgia [Botucatu]                            ', 'Créditos', 9822, 'C');
INSERT INTO curso VALUES (951, 'Agronomia (Horticultura) [Botucatu]            ', 'Créditos', 1299, 'A');
INSERT INTO curso VALUES (952, 'Fisiopatologia em Clínica Médica [Botucatu]    ', 'Créditos', 9968, 'FCM');
INSERT INTO curso VALUES (953, 'Ciências Biológicas (Farmacologia) [Botucatu]  ', 'Créditos', 4878, 'CB');
INSERT INTO curso VALUES (954, 'Pediatria [Botucatu]                           ', 'Créditos', 7551, 'P');
INSERT INTO curso VALUES (955, 'Anestesiologia [Botucatu]                      ', 'Créditos', 2058, 'A');
INSERT INTO curso VALUES (956, 'Ginecologia e Obstetrícia [Botucatu]           ', 'Créditos', 2400, 'GO');
INSERT INTO curso VALUES (957, 'História [Franca]                              ', 'Créditos', 6037, 'H');
INSERT INTO curso VALUES (958, 'Geografia [P. Prudente]                        ', 'Créditos', 2695, 'GP');
INSERT INTO curso VALUES (959, 'Ciências Cartográficas [P. Prudente]           ', 'Créditos', 4727, 'CCP');
INSERT INTO curso VALUES (960, 'Geociências (Geologia Regional) [Rio Claro]    ', 'Créditos', 6901, 'GRC');
INSERT INTO curso VALUES (961, 'Odontologia (Radiologia Odontológica) [S.J.Camp', 'Créditos', 1032, 'OO');
INSERT INTO curso VALUES (962, 'Odontologia (Prótese Parcial Fixa) [S.J.Campos]', 'Créditos', 6437, 'OPF');
INSERT INTO curso VALUES (963, 'Ortodontia [Piracicaba]                        ', 'Créditos', 9408, 'O');
INSERT INTO curso VALUES (964, 'Educação                                       ', 'Créditos', 3471, 'E');
INSERT INTO curso VALUES (965, 'Ciências Geodésicas                            ', 'Créditos', 9215, 'CG');
INSERT INTO curso VALUES (966, 'Ciências (Bioquímica)                          ', 'Créditos', 5964, 'C');
INSERT INTO curso VALUES (967, 'Botânica                                       ', 'Créditos', 5437, 'B');
INSERT INTO curso VALUES (968, 'Ciências Biológicas (Entomologia)              ', 'Créditos', 1458, 'CB');
INSERT INTO curso VALUES (969, 'Genética                                       ', 'Créditos', 1183, 'G');
INSERT INTO curso VALUES (970, 'Biologia Celular e Molecular                   ', 'Créditos', 8216, 'BCM');
INSERT INTO curso VALUES (971, 'Zoologia                                       ', 'Créditos', 705, 'Z');
INSERT INTO curso VALUES (972, 'História                                       ', 'Créditos', 1245, 'H');
INSERT INTO curso VALUES (973, 'Medicina (Cardiologia)                         ', 'Créditos', 6349, 'M');
INSERT INTO curso VALUES (974, 'Medicina Interna                               ', 'Créditos', 781, 'MI');
INSERT INTO curso VALUES (975, 'Medicina (Pediatria)                           ', 'Créditos', 8471, 'M');
INSERT INTO curso VALUES (976, 'Ciências do Solo                               ', 'Créditos', 3277, 'CS');
INSERT INTO curso VALUES (977, 'Engenharia Florestal                           ', 'Créditos', 969, 'EF');
INSERT INTO curso VALUES (978, 'Letras                                         ', 'Créditos', 5842, 'L');
INSERT INTO curso VALUES (979, 'Direito                                        ', 'Créditos', 3653, 'D');
INSERT INTO curso VALUES (980, 'Medicina (Clínica Cirúrgica)                   ', 'Créditos', 8556, 'MC');
INSERT INTO curso VALUES (981, 'Tecnologia de Alimentos                        ', 'Créditos', 6645, 'TA');
INSERT INTO curso VALUES (982, 'Física                                         ', 'Créditos', 1292, 'F');
INSERT INTO curso VALUES (983, 'Engenharia de Recursos Hídricos e Ambiental    ', 'Créditos', 2054, 'ERHA');
INSERT INTO curso VALUES (984, 'Ciências Veterinárias                          ', 'Créditos', 1300, 'CV');
INSERT INTO curso VALUES (985, 'Desenvolvimento Econômico                      ', 'Créditos', 9290, 'DE');
INSERT INTO curso VALUES (986, 'Administração                                  ', 'Créditos', 2651, 'A');
INSERT INTO curso VALUES (987, 'Química                                        ', 'Créditos', 7652, 'Q');
INSERT INTO curso VALUES (988, 'Antropologia Social                            ', 'Créditos', 3966, 'AS');
INSERT INTO curso VALUES (989, 'Geologia                                       ', 'Créditos', 3070, 'G');
INSERT INTO curso VALUES (990, 'Meio Ambiente e Desenvolvimento                ', 'Créditos', 359, 'MAD');
INSERT INTO curso VALUES (991, 'Agronomia (Produção Vegetal)                   ', 'Créditos', 8812, 'AV');
INSERT INTO curso VALUES (992, 'Sociologia                                     ', 'Créditos', 5094, 'S');
INSERT INTO curso VALUES (993, 'Direito Negocial                               ', 'Créditos', 3743, 'DN');
INSERT INTO curso VALUES (994, 'Ciência de Alimentos                           ', 'Créditos', 252, 'CA');
INSERT INTO curso VALUES (995, 'Genética e Melhoramento                        ', 'Créditos', 2549, 'GM');
INSERT INTO curso VALUES (996, 'Microbiologia                                  ', 'Créditos', 8696, 'M');
INSERT INTO curso VALUES (997, 'Medicina (Ciência da Saúde)                    ', 'Créditos', 579, 'MS');
INSERT INTO curso VALUES (998, 'Saúde Coletiva                                 ', 'Créditos', 2998, 'SC');
INSERT INTO curso VALUES (999, 'Ciência Animal                                 ', 'Créditos', 9851, 'CA');
INSERT INTO curso VALUES (1000, 'Letras                                         ', 'Créditos', 2113, 'L');
INSERT INTO curso VALUES (1001, 'Agronomia                                      ', 'Créditos', 9692, 'A');
INSERT INTO curso VALUES (1002, 'Física                                         ', 'Créditos', 3411, 'F');
INSERT INTO curso VALUES (1003, 'Ciências Biológicas (Biologia Celular)         ', 'Créditos', 4093, 'CBC');
INSERT INTO curso VALUES (1004, 'Química                                        ', 'Créditos', 2599, 'Q');
INSERT INTO curso VALUES (1005, 'Engenharia Química                             ', 'Créditos', 6273, 'EQ');
INSERT INTO curso VALUES (1006, 'Educação                                       ', 'Créditos', 4689, 'E');
INSERT INTO curso VALUES (1007, 'Ecologia de Ambientes Aquáticos Continentais   ', 'Créditos', 9096, 'EAAC');
INSERT INTO curso VALUES (1008, 'Zootecnia                                      ', 'Créditos', 4742, 'Z');
INSERT INTO curso VALUES (1009, 'Agronomia                                      ', 'Créditos', 6553, 'A');
INSERT INTO curso VALUES (1010, 'Física                                         ', 'Créditos', 2613, 'F');
INSERT INTO curso VALUES (1011, 'Engenharia Elétrica e Informática Industrial   ', 'Créditos', 811, 'EEII');
INSERT INTO curso VALUES (1012, 'Tecnologia                                     ', 'Créditos', 3519, 'T');
INSERT INTO curso VALUES (1013, 'Engenharia Agrícola                            ', 'Créditos', 5354, 'EA');
INSERT INTO curso VALUES (1014, 'Matemática e Computação Científica             ', 'Créditos', 8648, 'MCC');
INSERT INTO curso VALUES (1015, 'História                                       ', 'Créditos', 7583, 'H');
INSERT INTO curso VALUES (1016, 'Engenharia Elétrica                            ', 'Créditos', 9492, 'EE');
INSERT INTO curso VALUES (1017, 'Engenharia Mecânica                            ', 'Créditos', 4070, 'EM');
INSERT INTO curso VALUES (1018, 'Engenharia de Produção                         ', 'Créditos', 9299, 'EP');
INSERT INTO curso VALUES (1019, 'Odontologia                                    ', 'Créditos', 5025, 'O');
INSERT INTO curso VALUES (1020, 'Enfermagem                                     ', 'Créditos', 5937, 'E');
INSERT INTO curso VALUES (1021, 'Administração                                  ', 'Créditos', 8725, 'A');
INSERT INTO curso VALUES (1022, 'Direito                                        ', 'Créditos', 7822, 'D');
INSERT INTO curso VALUES (1023, 'Letras (Inglês e Literatura Correspondente)    ', 'Créditos', 6751, 'LLC');
INSERT INTO curso VALUES (1024, 'Literatura                                     ', 'Créditos', 5728, 'L');
INSERT INTO curso VALUES (1025, 'Lingüística                                    ', 'Créditos', 912, 'L');
INSERT INTO curso VALUES (1026, 'Educação                                       ', 'Créditos', 3868, 'E');
INSERT INTO curso VALUES (1027, 'Geografia                                      ', 'Créditos', 9229, 'G');
INSERT INTO curso VALUES (1028, 'Antropologia Social                            ', 'Créditos', 3021, 'AS');
INSERT INTO curso VALUES (1029, 'Sociologia Política                            ', 'Créditos', 5447, 'SP');
INSERT INTO curso VALUES (1030, 'Aquicultura                                    ', 'Créditos', 6347, 'A');
INSERT INTO curso VALUES (1031, 'Física                                         ', 'Créditos', 2051, 'F');
INSERT INTO curso VALUES (1032, 'Ciência dos Alimentos                          ', 'Créditos', 8079, 'CA');
INSERT INTO curso VALUES (1033, 'Química                                        ', 'Créditos', 55, 'Q');
INSERT INTO curso VALUES (1034, 'Engenharia Civil                               ', 'Créditos', 653, 'EC');
INSERT INTO curso VALUES (1035, 'Farmacologia                                   ', 'Créditos', 5046, 'F');
INSERT INTO curso VALUES (1036, 'Ciência da Computação                          ', 'Créditos', 7048, 'CC');
INSERT INTO curso VALUES (1037, 'Ciências Médicas                               ', 'Créditos', 8116, 'CM');
INSERT INTO curso VALUES (1038, 'Neurociências                                  ', 'Créditos', 7989, 'N');
INSERT INTO curso VALUES (1039, 'Engenharia Química                             ', 'Créditos', 7767, 'EQ');
INSERT INTO curso VALUES (1040, 'Ciência e Engenharia de Materiais              ', 'Créditos', 8812, 'CEM');
INSERT INTO curso VALUES (1041, 'Economia                                       ', 'Créditos', 5664, 'E');
INSERT INTO curso VALUES (1042, 'Engenharia Ambiental                           ', 'Créditos', 751, 'EA');
INSERT INTO curso VALUES (1043, 'Biotecnologia                                  ', 'Créditos', 2450, 'B');
INSERT INTO curso VALUES (1044, 'Psicologia                                     ', 'Créditos', 4654, 'P');
INSERT INTO curso VALUES (1045, 'Ciências Humanas                               ', 'Créditos', 5719, 'CH');
INSERT INTO curso VALUES (1046, 'Ciência e Engenharia de Materiais              ', 'Créditos', 3005, 'CEM');
INSERT INTO curso VALUES (1047, 'Ciências do Solo                               ', 'Créditos', 150, 'CS');
INSERT INTO curso VALUES (1048, 'Educação                                       ', 'Créditos', 2934, 'E');
INSERT INTO curso VALUES (1049, 'Física                                         ', 'Créditos', 1504, 'F');
INSERT INTO curso VALUES (1050, 'Matemática                                     ', 'Créditos', 4242, 'M');
INSERT INTO curso VALUES (1051, 'Ciência da Computação                          ', 'Créditos', 3834, 'CC');
INSERT INTO curso VALUES (1052, 'Geociências                                    ', 'Créditos', 7780, 'G');
INSERT INTO curso VALUES (1053, 'Ciências Biológicas (Bioquimica)               ', 'Créditos', 6139, 'CB');
INSERT INTO curso VALUES (1054, 'Botânica                                       ', 'Créditos', 124, 'B');
INSERT INTO curso VALUES (1055, 'Ecologia                                       ', 'Créditos', 3866, 'E');
INSERT INTO curso VALUES (1056, 'Ciências Biológicas (Fisiologia)               ', 'Créditos', 7804, 'CB');
INSERT INTO curso VALUES (1057, 'Genética e Biologia Molecular                  ', 'Créditos', 9284, 'GBM');
INSERT INTO curso VALUES (1058, 'Ciências Biológicas (Neurociências)            ', 'Créditos', 6356, 'CB');
INSERT INTO curso VALUES (1059, 'Sociologia                                     ', 'Créditos', 4352, 'S');
INSERT INTO curso VALUES (1060, 'Economia                                       ', 'Créditos', 4143, 'E');
INSERT INTO curso VALUES (1061, 'Engenharia Civil (Estruturas)                  ', 'Créditos', 1622, 'EC');
INSERT INTO curso VALUES (1062, 'Recursos Hídricos e Saneamento Ambiente        ', 'Créditos', 9706, 'RHSA');
INSERT INTO curso VALUES (1063, 'Engenharia de Minas, Metalúrgica e de Materiais', 'Créditos', 4610, 'EMMM');
INSERT INTO curso VALUES (1064, 'Medicina (Cardiologia)                         ', 'Créditos', 8185, 'M');
INSERT INTO curso VALUES (1065, 'Medicina (Gastroenterologia)                   ', 'Créditos', 5757, 'M');
INSERT INTO curso VALUES (1066, 'Medicina (Nefrologia)                          ', 'Créditos', 8899, 'M');
INSERT INTO curso VALUES (1067, 'Medicina (Pneumologia)                         ', 'Créditos', 3100, 'M');
INSERT INTO curso VALUES (1068, 'Ciências Farmacêuticas                         ', 'Créditos', 2311, 'CF');
INSERT INTO curso VALUES (1069, 'Administração                                  ', 'Créditos', 220, 'A');
INSERT INTO curso VALUES (1070, 'Planejamento Urbano e Regional                 ', 'Créditos', 3033, 'PUR');
INSERT INTO curso VALUES (1071, 'Economia Rural                                 ', 'Créditos', 6761, 'ER');
INSERT INTO curso VALUES (1072, 'Ciências Veterinárias                          ', 'Créditos', 4316, 'CV');
INSERT INTO curso VALUES (1073, 'Letras                                         ', 'Créditos', 1455, 'L');
INSERT INTO curso VALUES (1074, 'Filosofia                                      ', 'Créditos', 430, 'F');
INSERT INTO curso VALUES (1075, 'Ciência Política                               ', 'Créditos', 2632, 'CP');
INSERT INTO curso VALUES (1076, 'Antropologia Social                            ', 'Créditos', 9310, 'AS');
INSERT INTO curso VALUES (1077, 'Agronomia (Fitotecnia)                         ', 'Créditos', 1158, 'A');
INSERT INTO curso VALUES (1078, 'Zootecnia                                      ', 'Créditos', 4147, 'Z');
INSERT INTO curso VALUES (1079, 'Ciência do Solo                                ', 'Créditos', 3999, 'CS');
INSERT INTO curso VALUES (1080, 'Medicina (Clínica Médica)                      ', 'Créditos', 3203, 'MM');
INSERT INTO curso VALUES (1081, 'Química                                        ', 'Créditos', 5640, 'Q');
INSERT INTO curso VALUES (1082, 'Direito                                        ', 'Créditos', 5937, 'D');
INSERT INTO curso VALUES (1083, 'História                                       ', 'Créditos', 9460, 'H');
INSERT INTO curso VALUES (1084, 'Música                                         ', 'Créditos', 6330, 'M');
INSERT INTO curso VALUES (1085, 'Engenharia Mecânica                            ', 'Créditos', 6400, 'EM');
INSERT INTO curso VALUES (1086, 'Psicologia do Desenvolvimento                  ', 'Créditos', 434, 'PD');
INSERT INTO curso VALUES (1087, 'Microbiologia Agrícola e do Ambiente           ', 'Créditos', 320, 'MAA');
INSERT INTO curso VALUES (1088, 'Arquitetura                                    ', 'Créditos', 4919, 'A');
INSERT INTO curso VALUES (1089, 'Medicina (Pediatria)                           ', 'Créditos', 7918, 'M');
INSERT INTO curso VALUES (1090, 'Ciências do Movimento Humano                   ', 'Créditos', 9974, 'CMH');
INSERT INTO curso VALUES (1091, 'Sensoriamento Remoto                           ', 'Créditos', 3224, 'SR');
INSERT INTO curso VALUES (1092, 'Odontologia (Patologia Bucal)                  ', 'Créditos', 6302, 'OB');
INSERT INTO curso VALUES (1093, 'Medicina Cirurgia                              ', 'Créditos', 7685, 'MC');
INSERT INTO curso VALUES (1094, 'Artes Visuais                                  ', 'Créditos', 1172, 'AV');
INSERT INTO curso VALUES (1095, 'Ciências dos Materiais                         ', 'Créditos', 5782, 'CM');
INSERT INTO curso VALUES (1096, 'Biologia Animal                                ', 'Créditos', 3903, 'BA');
INSERT INTO curso VALUES (1097, 'Engenharia Química                             ', 'Créditos', 6828, 'EQ');
INSERT INTO curso VALUES (1098, 'Engenharia de Produção                         ', 'Créditos', 6021, 'EP');
INSERT INTO curso VALUES (1099, 'Medicina (Endocrinologia)                      ', 'Créditos', 354, 'M');
INSERT INTO curso VALUES (1100, 'Matemática Aplicada                            ', 'Créditos', 9941, 'MA');
INSERT INTO curso VALUES (1101, 'Biologia Celular e Molecular                   ', 'Créditos', 664, 'BCM');
INSERT INTO curso VALUES (1102, 'Educação                                       ', 'Créditos', 9268, 'E');
INSERT INTO curso VALUES (1103, 'Filosofia                                      ', 'Créditos', 6011, 'F');
INSERT INTO curso VALUES (1104, 'Engenharia Elétrica                            ', 'Créditos', 8204, 'EE');
INSERT INTO curso VALUES (1105, 'Engenharia de Produção                         ', 'Créditos', 8355, 'EP');
INSERT INTO curso VALUES (1106, 'Ciência do Movimento Humano                    ', 'Créditos', 8906, 'CMH');
INSERT INTO curso VALUES (1107, 'Agronomia                                      ', 'Créditos', 291, 'A');
INSERT INTO curso VALUES (1108, 'Engenharia Agrícola                            ', 'Créditos', 9691, 'EA');
INSERT INTO curso VALUES (1109, 'Extensão Rural                                 ', 'Créditos', 4661, 'ER');
INSERT INTO curso VALUES (1110, 'Zootecnia                                      ', 'Créditos', 1088, 'Z');
INSERT INTO curso VALUES (1111, 'Medicina Veterinária                           ', 'Créditos', 1755, 'MV');
INSERT INTO curso VALUES (1112, 'Química                                        ', 'Créditos', 6625, 'Q');
INSERT INTO curso VALUES (1113, 'Ciência e Tecnologia dos Alimentos             ', 'Créditos', 8197, 'CTA');
INSERT INTO curso VALUES (1114, 'Letras                                         ', 'Créditos', 7447, 'L');
INSERT INTO curso VALUES (1115, 'Engenharia Florestal                           ', 'Créditos', 1207, 'EF');
INSERT INTO curso VALUES (1116, 'Distúrbios da Comunicação Humana               ', 'Créditos', 6775, 'DCH');
INSERT INTO curso VALUES (1117, 'Ciência e Tecnologia Farmacêuticas             ', 'Créditos', 9152, 'CTF');
INSERT INTO curso VALUES (1118, 'Física                                         ', 'Créditos', 5087, 'F');
INSERT INTO curso VALUES (1119, 'Engenharia Civil                               ', 'Créditos', 1728, 'EC');
INSERT INTO curso VALUES (1120, 'Endodontia                                     ', 'Créditos', 2354, 'E');
INSERT INTO curso VALUES (1121, 'Odontologia (Cirurgia e Traumatologia Buco-Maxi', 'Créditos', 9970, 'OTB');
INSERT INTO curso VALUES (1122, 'Zootecnia                                      ', 'Créditos', 9480, 'Z');
INSERT INTO curso VALUES (1123, 'Veterinária                                    ', 'Créditos', 5622, 'V');
INSERT INTO curso VALUES (1124, 'Ciência e Tecnologia Agroindustrial            ', 'Créditos', 772, 'CTA');
INSERT INTO curso VALUES (1125, 'Agronomia                                      ', 'Créditos', 4710, 'A');
INSERT INTO curso VALUES (1126, 'Epidemiologia                                  ', 'Créditos', 788, 'E');
INSERT INTO curso VALUES (1127, 'Biotecnologia                                  ', 'Créditos', 1539, 'B');
INSERT INTO curso VALUES (1128, 'Educação                                       ', 'Créditos', 3598, 'E');
INSERT INTO curso VALUES (1129, 'Ciência e Tecnologia de Sementes               ', 'Créditos', 9988, 'CTS');
INSERT INTO curso VALUES (1130, 'Fisiologia Vegetal                             ', 'Créditos', 4587, 'FV');
INSERT INTO curso VALUES (1131, 'Oceanografia Biológica                         ', 'Créditos', 5563, 'OB');
INSERT INTO curso VALUES (1132, 'Educação Ambiental                             ', 'Créditos', 7317, 'EA');
INSERT INTO curso VALUES (1133, 'Engenharia Oceânica                            ', 'Créditos', 8130, 'EO');
INSERT INTO curso VALUES (1134, 'Oceanografia Física, Química e Geológica       ', 'Créditos', 4960, 'OFQG');
INSERT INTO curso VALUES (1135, 'Educação                                       ', 'Créditos', 5746, 'E');
INSERT INTO curso VALUES (1136, 'Biociências (Zoologia)                         ', 'Créditos', 5002, 'B');
INSERT INTO curso VALUES (1137, 'Filosofia                                      ', 'Créditos', 4625, 'F');
INSERT INTO curso VALUES (1138, 'História                                       ', 'Créditos', 4392, 'H');
INSERT INTO curso VALUES (1139, 'Psicologia                                     ', 'Créditos', 121, 'P');
INSERT INTO curso VALUES (1140, 'Odontologia (Cirurgia e Traumatologia Buco-Maxi', 'Créditos', 581, 'OTB');
INSERT INTO curso VALUES (1141, 'Serviço Social                                 ', 'Créditos', 7016, 'SS');
INSERT INTO curso VALUES (1142, 'Lingüística e Letras                           ', 'Créditos', 7992, 'LL');
INSERT INTO curso VALUES (1143, 'Odontologia (Estomatologia Clínica)            ', 'Créditos', 4902, 'OC');
INSERT INTO curso VALUES (1144, 'Teologia                                       ', 'Créditos', 6896, 'T');
INSERT INTO curso VALUES (1145, 'Direito                                        ', 'Créditos', 9066, 'D');
INSERT INTO curso VALUES (1146, 'Medicina e Ciências da Saúde                   ', 'Créditos', 1574, 'MCS');
INSERT INTO curso VALUES (1147, 'Engenharia Elétrica                            ', 'Créditos', 3308, 'EE');
INSERT INTO curso VALUES (1148, 'CIÊNCIA DA COMPUTAÇÃO                          ', 'Créditos', 2151, 'CDC');
INSERT INTO curso VALUES (1149, 'Comunicação                                    ', 'Créditos', 7946, 'C');
INSERT INTO curso VALUES (1150, 'História                                       ', 'Créditos', 867, 'H');
INSERT INTO curso VALUES (1151, 'Geologia                                       ', 'Créditos', 8699, 'G');
INSERT INTO curso VALUES (1152, 'Educação                                       ', 'Créditos', 8727, 'E');
INSERT INTO curso VALUES (1153, 'Ciência da Comunicação                         ', 'Créditos', 2746, 'CC');
INSERT INTO curso VALUES (1154, 'Biotecnologia                                  ', 'Créditos', 8768, 'B');
INSERT INTO curso VALUES (1155, 'Farmacologia                                   ', 'Créditos', 2630, 'F');
INSERT INTO curso VALUES (1156, 'Patologia                                      ', 'Créditos', 9335, 'P');
INSERT INTO curso VALUES (1157, 'Medicina (Hepatologia)                         ', 'Créditos', 1807, 'M');
INSERT INTO curso VALUES (1158, 'Teologia                                       ', 'Créditos', 6345, 'T');
INSERT INTO curso VALUES (1159, 'Ciências da Saúde (Cardiologia)                ', 'Créditos', 2358, 'CS');
INSERT INTO curso VALUES (1160, 'Desenvolvimento Regional                       ', 'Créditos', 8615, 'DR');
INSERT INTO curso VALUES (1161, 'Modelagem Matemática                           ', 'Créditos', 4556, 'MM');
INSERT INTO curso VALUES (1162, 'Educação nas Ciências                          ', 'Créditos', 4757, 'EC');
INSERT INTO curso VALUES (1163, 'Educação                                       ', 'Créditos', 7502, 'E');
INSERT INTO curso VALUES (1164, 'Agricultura Tropical                           ', 'Créditos', 9462, 'AT');
INSERT INTO curso VALUES (1165, 'Ecologia e Conservação da Biodiversidade       ', 'Créditos', 8186, 'ECB');
INSERT INTO curso VALUES (1166, 'Saúde e Ambiente                               ', 'Créditos', 4031, 'SA');
INSERT INTO curso VALUES (1167, 'Educação                                       ', 'Créditos', 8064, 'E');
INSERT INTO curso VALUES (1168, 'Saúde Coletiva                                 ', 'Créditos', 5916, 'SC');
INSERT INTO curso VALUES (1169, 'Física                                         ', 'Créditos', 9321, 'F');
INSERT INTO curso VALUES (1170, 'Ecologia e Conservação                         ', 'Créditos', 3215, 'EC');
INSERT INTO curso VALUES (1171, 'Química                                        ', 'Créditos', 9074, 'Q');
INSERT INTO curso VALUES (1172, 'Matemática                                     ', 'Créditos', 2456, 'M');
INSERT INTO curso VALUES (1173, 'História                                       ', 'Créditos', 3253, 'H');
INSERT INTO curso VALUES (1174, 'Medicina Tropical                              ', 'Créditos', 5291, 'MT');
INSERT INTO curso VALUES (1175, 'Letras e Lingüística                           ', 'Créditos', 8995, 'LL');
INSERT INTO curso VALUES (1176, 'Biologia                                       ', 'Créditos', 7242, 'B');
INSERT INTO curso VALUES (1177, 'Agronomia                                      ', 'Créditos', 9020, 'A');
INSERT INTO curso VALUES (1178, 'Educação                                       ', 'Créditos', 7947, 'E');
INSERT INTO curso VALUES (1179, 'Direito Agrário                                ', 'Créditos', 5304, 'DA');
INSERT INTO curso VALUES (1180, 'Física                                         ', 'Créditos', 2531, 'F');
INSERT INTO curso VALUES (1181, 'Filosofia                                      ', 'Créditos', 8387, 'F');
INSERT INTO curso VALUES (1182, 'Geografia                                      ', 'Créditos', 6051, 'G');
INSERT INTO curso VALUES (1183, 'Medicina Veterinária (Sanidade e Produção Anima', 'Créditos', 6889, 'MVPA');
INSERT INTO curso VALUES (1184, 'Engenharia Civil                               ', 'Créditos', 7972, 'EC');
INSERT INTO curso VALUES (1185, 'Educação                                       ', 'Créditos', 8414, 'E');
INSERT INTO curso VALUES (1186, 'Física                                         ', 'Créditos', 4247, 'F');
INSERT INTO curso VALUES (1187, 'Matemática                                     ', 'Créditos', 1602, 'M');
INSERT INTO curso VALUES (1188, 'Estatística e Métodos Quantitativos            ', 'Créditos', 7646, 'EMQ');
INSERT INTO curso VALUES (1189, 'Química                                        ', 'Créditos', 4809, 'Q');
INSERT INTO curso VALUES (1190, 'Geologia                                       ', 'Créditos', 3195, 'G');
INSERT INTO curso VALUES (1191, 'Ciências Biológicas (Biologia Molecular)       ', 'Créditos', 6130, 'CBM');
INSERT INTO curso VALUES (1192, 'Ecologia                                       ', 'Créditos', 7326, 'E');
INSERT INTO curso VALUES (1193, 'Sociologia                                     ', 'Créditos', 2537, 'S');
INSERT INTO curso VALUES (1194, 'Antropologia                                   ', 'Créditos', 6854, 'A');
INSERT INTO curso VALUES (1195, 'História                                       ', 'Créditos', 7134, 'H');
INSERT INTO curso VALUES (1196, 'Economia                                       ', 'Créditos', 3338, 'E');
INSERT INTO curso VALUES (1197, 'Psicologia                                     ', 'Créditos', 6199, 'P');
INSERT INTO curso VALUES (1198, 'Engenharia Elétrica                            ', 'Créditos', 6017, 'EE');
INSERT INTO curso VALUES (1199, 'Medicina Tropical                              ', 'Créditos', 6879, 'MT');
INSERT INTO curso VALUES (1200, 'Administração                                  ', 'Créditos', 4309, 'A');
INSERT INTO curso VALUES (1201, 'Direito                                        ', 'Créditos', 7560, 'D');
INSERT INTO curso VALUES (1202, 'Ciência da Informação                          ', 'Créditos', 461, 'CI');
INSERT INTO curso VALUES (1203, 'Comunicação                                    ', 'Créditos', 7952, 'C');
INSERT INTO curso VALUES (1204, 'Fitopatologia                                  ', 'Créditos', 7386, 'F');
INSERT INTO curso VALUES (1205, 'Literatura                                     ', 'Créditos', 2456, 'L');
INSERT INTO curso VALUES (1206, 'Lingüística                                    ', 'Créditos', 8208, 'L');
INSERT INTO curso VALUES (1207, 'Medicina (Clínica Médica)                      ', 'Créditos', 8332, 'MM');
INSERT INTO curso VALUES (1208, 'Relações Internacionais                        ', 'Créditos', 2935, 'RI');
INSERT INTO curso VALUES (1209, 'Ciência Política                               ', 'Créditos', 1969, 'CP');
INSERT INTO curso VALUES (1210, 'Engenharia Mecânica                            ', 'Créditos', 7654, 'EM');
INSERT INTO curso VALUES (1211, 'Estudos Comparados sobre as Américas           ', 'Créditos', 3868, 'ECA');
INSERT INTO curso VALUES (1212, 'Transportes                                    ', 'Créditos', 4737, 'T');
INSERT INTO curso VALUES (1213, 'Patologia Molecular                            ', 'Créditos', 7504, 'PM');
INSERT INTO curso VALUES (1214, 'Geotecnia                                      ', 'Créditos', 7673, 'G');
INSERT INTO curso VALUES (1215, 'Ciência da Computação                          ', 'Créditos', 6560, 'CC');
INSERT INTO curso VALUES (1216, 'Nutrição Humana                                ', 'Créditos', 9380, 'NH');
INSERT INTO curso VALUES (1217, 'Política Social                                ', 'Créditos', 2455, 'PS');
INSERT INTO curso VALUES (1218, 'Estruturas e Construcao Civil                  ', 'Créditos', 5929, 'ECC');
INSERT INTO curso VALUES (1219, 'Botânica                                       ', 'Créditos', 5203, 'B');
INSERT INTO curso VALUES (1220, 'CIÊNCIAS AGRÁRIAS                              ', 'Créditos', 2186, 'CA');
INSERT INTO curso VALUES (1221, 'Tecnologia Ambiental e Recursos Hídricos       ', 'Créditos', 4996, 'TARH');
INSERT INTO curso VALUES (1222, 'Arquitetura e Urbanismo                        ', 'Créditos', 3876, 'AU');
INSERT INTO curso VALUES (1223, 'Geografia                                      ', 'Créditos', 4151, 'G');
INSERT INTO curso VALUES (1224, 'Desenvolvimento Sustentável                    ', 'Créditos', 2096, 'DS');
INSERT INTO curso VALUES (1225, 'Biologia Animal                                ', 'Créditos', 1023, 'BA');
INSERT INTO curso VALUES (1226, 'Educação                                       ', 'Créditos', 2435, 'E');
INSERT INTO curso VALUES (1227, 'Ciências da Reabilitação                       ', 'Créditos', 9045, 'CR');
INSERT INTO curso VALUES (1228, 'Estudos Populacionais e Pesquisas Sociais      ', 'Créditos', 8870, 'EPPS');
INSERT INTO curso VALUES (1229, 'Teologia                                       ', 'Créditos', 7729, 'T');
INSERT INTO curso VALUES (1230, 'Oncologia                                      ', 'Créditos', 5306, 'O');
INSERT INTO curso VALUES (1231, 'Medicina ( Ortopedia e Traumatologia )         ', 'Créditos', 9596, 'MOT');
INSERT INTO curso VALUES (1232, 'Patologia                                      ', 'Créditos', 6762, 'P');
INSERT INTO curso VALUES (1233, 'Princípios da Cirurgia                         ', 'Créditos', 1533, 'PC');
INSERT INTO curso VALUES (1234, 'Medicina Tropical e Infectologia               ', 'Créditos', 4135, 'MTI');
INSERT INTO curso VALUES (1235, 'Agronomia                                      ', 'Créditos', 9085, 'A');
INSERT INTO curso VALUES (1236, 'Medicina (Pediatria)                           ', 'Créditos', 6955, 'M');
INSERT INTO curso VALUES (1237, 'Engenharia e Ciência de Alimentos              ', 'Créditos', 8824, 'ECA');
INSERT INTO curso VALUES (1238, 'Habitação: Planejamento e Tecnologia           ', 'Créditos', 3192, 'HPT');
INSERT INTO curso VALUES (1239, 'Direito                                        ', 'Créditos', 6329, 'D');
INSERT INTO curso VALUES (1240, 'Engenharia Elétrica                            ', 'Créditos', 6216, 'EE');
INSERT INTO curso VALUES (1241, 'Engenharia Mecânica                            ', 'Créditos', 2010, 'EM');
INSERT INTO curso VALUES (1242, 'Informática Aplicada                           ', 'Créditos', 4715, 'IA');
INSERT INTO curso VALUES (1243, 'Medicina (Pediatria)                           ', 'Créditos', 4310, 'M');
INSERT INTO curso VALUES (1244, 'Psicologia Experimental: Análise do Comportamen', 'Créditos', 5970, 'PEAC');
INSERT INTO curso VALUES (1245, 'Clínica Médica                                 ', 'Créditos', 9522, 'CM');
INSERT INTO curso VALUES (1246, 'Economia Empresarial                           ', 'Créditos', 7106, 'EE');
INSERT INTO curso VALUES (1247, 'Geografia                                      ', 'Créditos', 8492, 'G');
INSERT INTO curso VALUES (1248, 'Saúde Coletiva                                 ', 'Créditos', 6323, 'SC');
INSERT INTO curso VALUES (1249, 'Direito                                        ', 'Créditos', 8246, 'D');
INSERT INTO curso VALUES (1250, 'Geografia                                      ', 'Créditos', 2477, 'G');
INSERT INTO curso VALUES (1251, 'ENGENHARIA                                     ', 'Créditos', 1091, 'E');
INSERT INTO curso VALUES (1252, 'Engenharia e Ciência dos Materiais             ', 'Créditos', 2195, 'ECM');
INSERT INTO curso VALUES (1253, 'Produção Vegetal                               ', 'Créditos', 5473, 'PV');
INSERT INTO curso VALUES (1254, 'Ciências Sociais                               ', 'Créditos', 6075, 'CS');
INSERT INTO curso VALUES (1255, 'Física                                         ', 'Créditos', 3994, 'F');
INSERT INTO curso VALUES (1256, 'Desenvolvimento Regional e Meio Ambiente       ', 'Créditos', 2340, 'DRMA');
INSERT INTO curso VALUES (1257, 'Desenvolvimento e Meio Ambiente                ', 'Créditos', 5408, 'DMA');
INSERT INTO curso VALUES (1258, 'Artes Cênicas                                  ', 'Créditos', 9823, 'AC');
INSERT INTO curso VALUES (1259, 'Geografia                                      ', 'Créditos', 8947, 'G');
INSERT INTO curso VALUES (1260, 'Engenharia Elétrica e de Computação            ', 'Créditos', 6051, 'EEC');
INSERT INTO curso VALUES (1261, 'Engenharia Elétrica                            ', 'Créditos', 771, 'EE');
INSERT INTO curso VALUES (1262, 'Saúde e Ambiente                               ', 'Créditos', 4777, 'SA');
INSERT INTO curso VALUES (1263, 'Ciências Farmacêuticas                         ', 'Créditos', 7735, 'CF');
INSERT INTO curso VALUES (1264, 'Comunicação Social                             ', 'Créditos', 1978, 'CS');
INSERT INTO curso VALUES (1265, 'Engenharia de Produção                         ', 'Créditos', 5242, 'EP');
INSERT INTO curso VALUES (1266, 'Estatística                                    ', 'Créditos', 8254, 'E');
INSERT INTO curso VALUES (1267, 'Genética                                       ', 'Créditos', 8326, 'G');
INSERT INTO curso VALUES (1268, 'Medicina (Obstetrícia e Ginecologia)           ', 'Créditos', 6061, 'MG');
INSERT INTO curso VALUES (1269, 'Ciências Biológicas                            ', 'Créditos', 8127, 'CB');
INSERT INTO curso VALUES (1270, 'Engenharia de Materiais                        ', 'Créditos', 1942, 'EM');
INSERT INTO curso VALUES (1271, 'Ciências Jurídicas                             ', 'Créditos', 1027, 'CJ');
INSERT INTO curso VALUES (1272, 'Engenharia de Produção                         ', 'Créditos', 3642, 'EP');
INSERT INTO curso VALUES (1273, 'Engenharia Mecânica                            ', 'Créditos', 3253, 'EM');
INSERT INTO curso VALUES (1274, 'Estatística                                    ', 'Créditos', 2543, 'E');
INSERT INTO curso VALUES (1275, 'Saúde Coletiva                                 ', 'Créditos', 1605, 'SC');
INSERT INTO curso VALUES (1276, 'Comunicação e Informação                       ', 'Créditos', 1825, 'CI');
INSERT INTO curso VALUES (1277, 'Métodos Numéricos em Engenharia                ', 'Créditos', 2570, 'MNE');
INSERT INTO curso VALUES (1278, 'Informática                                    ', 'Créditos', 7068, 'I');
INSERT INTO curso VALUES (1279, 'Enfermagem                                     ', 'Créditos', 5643, 'E');
INSERT INTO curso VALUES (1280, 'Engenharia Elétrica                            ', 'Créditos', 1352, 'EE');
INSERT INTO curso VALUES (1281, 'Geografia                                      ', 'Créditos', 6058, 'G');
INSERT INTO curso VALUES (1282, 'Psicologia Social e Institucional              ', 'Créditos', 3052, 'PSI');
INSERT INTO curso VALUES (1283, 'Ciências Biológicas (Fisiologia)               ', 'Créditos', 5527, 'CB');
INSERT INTO curso VALUES (1284, 'Informática                                    ', 'Créditos', 422, 'I');
INSERT INTO curso VALUES (1285, 'Odontologia                                    ', 'Créditos', 234, 'O');
INSERT INTO curso VALUES (1286, 'Saúde Coletiva                                 ', 'Créditos', 152, 'SC');
INSERT INTO curso VALUES (1287, 'Bioecologia Aquática                           ', 'Créditos', 7227, 'BA');
INSERT INTO curso VALUES (1288, 'Bioquímica                                     ', 'Créditos', 597, 'B');
INSERT INTO curso VALUES (1289, 'Fitopatologia                                  ', 'Créditos', 336, 'F');
INSERT INTO curso VALUES (1290, 'Zootecnia                                      ', 'Créditos', 8741, 'Z');
INSERT INTO curso VALUES (1291, 'Agroecossistemas                               ', 'Créditos', 5452, 'A');
INSERT INTO curso VALUES (1372, 'Agricultura Tropical e Subtropical             ', 'Créditos', 5734, 'ATS');
INSERT INTO curso VALUES (1292, 'Educação Física                                ', 'Créditos', 2998, 'EF');
INSERT INTO curso VALUES (1293, 'Filosofia                                      ', 'Créditos', 2940, 'F');
INSERT INTO curso VALUES (1294, 'Metrologia Científica e Industrial             ', 'Créditos', 5873, 'MCI');
INSERT INTO curso VALUES (1295, 'Recursos Genéticos Vegetais                    ', 'Créditos', 9312, 'RGV');
INSERT INTO curso VALUES (1296, 'Saúde Pública                                  ', 'Créditos', 1069, 'SP');
INSERT INTO curso VALUES (1297, 'Ciências Biológicas (Bioquímica Toxicológica)  ', 'Créditos', 9860, 'CBT');
INSERT INTO curso VALUES (1298, 'Integração Latino-Americana                    ', 'Créditos', 6211, 'IL');
INSERT INTO curso VALUES (1299, 'Medicina de Urgência                           ', 'Créditos', 5914, 'MU');
INSERT INTO curso VALUES (1300, 'Clínica Médica                                 ', 'Créditos', 8999, 'CM');
INSERT INTO curso VALUES (1301, 'Medicina Interna e Terapêutica                 ', 'Créditos', 5014, 'MIT');
INSERT INTO curso VALUES (1302, 'Direito                                        ', 'Créditos', 7000, 'D');
INSERT INTO curso VALUES (1303, 'Química                                        ', 'Créditos', 8345, 'Q');
INSERT INTO curso VALUES (1304, 'Sexologia                                      ', 'Créditos', 129, 'S');
INSERT INTO curso VALUES (1305, 'Engenharia de Produção                         ', 'Créditos', 1837, 'EP');
INSERT INTO curso VALUES (1306, 'Arte                                           ', 'Créditos', 3984, 'A');
INSERT INTO curso VALUES (1307, 'Odontologia                                    ', 'Créditos', 7912, 'O');
INSERT INTO curso VALUES (1308, 'Ciências Florestais                            ', 'Créditos', 8887, 'CF');
INSERT INTO curso VALUES (1309, 'Direito                                        ', 'Créditos', 7423, 'D');
INSERT INTO curso VALUES (1310, 'Ciências Farmacêuticas [Araraquara]            ', 'Créditos', 7528, 'CF');
INSERT INTO curso VALUES (1311, 'Ciências Jurídicas                             ', 'Créditos', 3296, 'CJ');
INSERT INTO curso VALUES (1312, 'Engenharia Biomédica                           ', 'Créditos', 1006, 'EB');
INSERT INTO curso VALUES (1313, 'Agronomia                                      ', 'Créditos', 7597, 'A');
INSERT INTO curso VALUES (1314, 'Zootecnia [Ilha Solteira]                      ', 'Créditos', 492, 'ZS');
INSERT INTO curso VALUES (1315, 'Educação                                       ', 'Créditos', 4823, 'E');
INSERT INTO curso VALUES (1316, 'Microbiologia [Jaboticabal]                    ', 'Créditos', 3762, 'M');
INSERT INTO curso VALUES (1317, 'Gerontologia                                   ', 'Créditos', 8348, 'G');
INSERT INTO curso VALUES (1318, 'Qualidade                                      ', 'Créditos', 6079, 'Q');
INSERT INTO curso VALUES (1319, 'Engenharia Mecânica [Ilha Solteira]            ', 'Créditos', 253, 'EMS');
INSERT INTO curso VALUES (1320, 'Ciência da Computação [Sp-Capital]             ', 'Créditos', 3656, 'CC');
INSERT INTO curso VALUES (1321, 'Letras (Língua Literatura e Cultura Japonesa)  ', 'Créditos', 466, 'LLCJ');
INSERT INTO curso VALUES (1322, 'Odontologia (Odontologia Restauradora) [Rib.Pre', 'Créditos', 3855, 'OR');
INSERT INTO curso VALUES (1323, 'Psicologia [Rib.Preto]                         ', 'Créditos', 3715, 'P');
INSERT INTO curso VALUES (1324, 'Odontologia (Cirurgia e Traumatologia Buco-Maxi', 'Créditos', 4529, 'OTB');
INSERT INTO curso VALUES (1325, 'Tocoginecologia                                ', 'Créditos', 5839, 'T');
INSERT INTO curso VALUES (1326, 'Desenvolvimento e Meio Ambiente                ', 'Créditos', 77, 'DMA');
INSERT INTO curso VALUES (1327, 'Design                                         ', 'Créditos', 1716, 'D');
INSERT INTO curso VALUES (1328, 'Ciência da Arte                                ', 'Créditos', 2714, 'CA');
INSERT INTO curso VALUES (1329, 'Comunicação, Imagem e Informação               ', 'Créditos', 4049, 'CII');
INSERT INTO curso VALUES (1330, 'Neuroimunologia                                ', 'Créditos', 29, 'N');
INSERT INTO curso VALUES (1331, 'Saúde Pública [Nesc/Pe]                        ', 'Créditos', 7743, 'SP');
INSERT INTO curso VALUES (1332, 'Metrologia para a Qualidade Industrial         ', 'Créditos', 1296, 'MQI');
INSERT INTO curso VALUES (1333, 'Ciências Agrárias                              ', 'Créditos', 9229, 'CA');
INSERT INTO curso VALUES (1334, 'Matemática                                     ', 'Créditos', 1691, 'M');
INSERT INTO curso VALUES (1335, 'Engenharia                                     ', 'Créditos', 4198, 'E');
INSERT INTO curso VALUES (1336, 'Desenvolvimento e Meio Ambiente                ', 'Créditos', 2347, 'DMA');
INSERT INTO curso VALUES (1337, 'Desenvolvimento e Meio Ambiente                ', 'Créditos', 4974, 'DMA');
INSERT INTO curso VALUES (1338, 'Medicina (Cardiologia)                         ', 'Créditos', 6026, 'M');
INSERT INTO curso VALUES (1339, 'História                                       ', 'Créditos', 9990, 'H');
INSERT INTO curso VALUES (1340, 'Química                                        ', 'Créditos', 7402, 'Q');
INSERT INTO curso VALUES (1341, 'Física                                         ', 'Créditos', 2677, 'F');
INSERT INTO curso VALUES (1342, 'Fitossanidade                                  ', 'Créditos', 4182, 'F');
INSERT INTO curso VALUES (1343, 'Ecologia e Conservação de Recursos Naturais    ', 'Créditos', 2498, 'ECRN');
INSERT INTO curso VALUES (1344, 'Ciências Biológicas (Doenças Parasitárias)     ', 'Créditos', 5204, 'CBP');
INSERT INTO curso VALUES (1345, 'Genética e Biologia Molecular                  ', 'Créditos', 7640, 'GBM');
INSERT INTO curso VALUES (1346, 'Sustentabilidade Sócio-Econômica e Ambiental   ', 'Créditos', 6945, 'SSA');
INSERT INTO curso VALUES (1347, 'Recursos Naturais                              ', 'Créditos', 8128, 'RN');
INSERT INTO curso VALUES (1348, 'Agronegócios                                   ', 'Créditos', 4570, 'A');
INSERT INTO curso VALUES (1349, 'Administração Pública                          ', 'Créditos', 7595, 'AP');
INSERT INTO curso VALUES (1350, 'História Social                                ', 'Créditos', 9664, 'HS');
INSERT INTO curso VALUES (1351, 'Educação                                       ', 'Créditos', 3162, 'E');
INSERT INTO curso VALUES (1352, 'Sociologia                                     ', 'Créditos', 7909, 'S');
INSERT INTO curso VALUES (1353, 'Ciência de Alimentos                           ', 'Créditos', 2437, 'CA');
INSERT INTO curso VALUES (1354, 'Ciência Animal                                 ', 'Créditos', 5159, 'CA');
INSERT INTO curso VALUES (1355, 'Engenharia e Ciência de Alimentos [Sjrp]       ', 'Créditos', 3014, 'ECA');
INSERT INTO curso VALUES (1356, 'Matemática Aplicada [Sjrp]                     ', 'Créditos', 9262, 'MA');
INSERT INTO curso VALUES (1357, 'Enfermagem                                     ', 'Créditos', 8762, 'E');
INSERT INTO curso VALUES (1358, 'Clínica Médica                                 ', 'Créditos', 2322, 'CM');
INSERT INTO curso VALUES (1359, 'Medicina Interna                               ', 'Créditos', 4247, 'MI');
INSERT INTO curso VALUES (1360, 'Serviço Social                                 ', 'Créditos', 7913, 'SS');
INSERT INTO curso VALUES (1361, 'Desenvolvimento Econômico, Espaço e Meio Ambien', 'Créditos', 5681, 'DEEM');
INSERT INTO curso VALUES (1362, 'Arquitetura e Urbanismo                        ', 'Créditos', 2331, 'AU');
INSERT INTO curso VALUES (1363, 'Administração                                  ', 'Créditos', 9032, 'A');
INSERT INTO curso VALUES (1364, 'Economia Social e do Trabalho                  ', 'Créditos', 8891, 'EST');
INSERT INTO curso VALUES (1365, 'História Econômica                             ', 'Créditos', 5933, 'HE');
INSERT INTO curso VALUES (1366, 'Direito                                        ', 'Créditos', 6352, 'D');
INSERT INTO curso VALUES (1367, 'Artes Visuais                                  ', 'Créditos', 5215, 'AV');
INSERT INTO curso VALUES (1368, 'Engenharia Sanitária                           ', 'Créditos', 9592, 'ES');
INSERT INTO curso VALUES (1369, 'Engenharia Civil                               ', 'Créditos', 8966, 'EC');
INSERT INTO curso VALUES (1370, 'Engenharia de Energia                          ', 'Créditos', 7329, 'EE');
INSERT INTO curso VALUES (1371, 'Gestão Empresarial                             ', 'Créditos', 136, 'GE');
INSERT INTO curso VALUES (1373, 'Letras                                         ', 'Créditos', 6474, 'L');
INSERT INTO curso VALUES (1374, 'Distúrbios do Desenvolvimento                  ', 'Créditos', 5419, 'DD');
INSERT INTO curso VALUES (1375, 'Engenharia Mecânica                            ', 'Créditos', 4673, 'EM');
INSERT INTO curso VALUES (1376, 'Urbanismo                                      ', 'Créditos', 5867, 'U');
INSERT INTO curso VALUES (1377, 'Física                                         ', 'Créditos', 6467, 'F');
INSERT INTO curso VALUES (1378, 'Economia                                       ', 'Créditos', 888, 'E');
INSERT INTO curso VALUES (1379, 'Lingüística Aplicada                           ', 'Créditos', 7876, 'LA');
INSERT INTO curso VALUES (1380, 'Enfermagem                                     ', 'Créditos', 2912, 'E');
INSERT INTO curso VALUES (1381, 'Psicanálise                                    ', 'Créditos', 5612, 'P');
INSERT INTO curso VALUES (1382, 'Agronomia (Produção Vegetal)                   ', 'Créditos', 4280, 'AV');
INSERT INTO curso VALUES (1383, 'Meteorologia                                   ', 'Créditos', 1854, 'M');
INSERT INTO curso VALUES (1384, 'Psicologia                                     ', 'Créditos', 3385, 'P');
INSERT INTO curso VALUES (1385, 'Artes Visuais                                  ', 'Créditos', 297, 'AV');
INSERT INTO curso VALUES (1386, 'História                                       ', 'Créditos', 9718, 'H');
INSERT INTO curso VALUES (1387, 'Geografia                                      ', 'Créditos', 8507, 'G');
INSERT INTO curso VALUES (1388, 'Engenharia                                     ', 'Créditos', 3389, 'E');
INSERT INTO curso VALUES (1389, 'Tecnologia Educacional nas Ciências da Saúde   ', 'Créditos', 8191, 'TECS');
INSERT INTO curso VALUES (1390, 'Engenharia de Produção                         ', 'Créditos', 4662, 'EP');
INSERT INTO curso VALUES (1391, 'Sistemas e Computação                          ', 'Créditos', 6227, 'SC');
INSERT INTO curso VALUES (1392, 'Biologia Vegetal                               ', 'Créditos', 4902, 'BV');
INSERT INTO curso VALUES (1393, 'Farmácia                                       ', 'Créditos', 199, 'F');
INSERT INTO curso VALUES (1394, 'Agronomia (Ciências do Solo) [Jaboticabal]     ', 'Créditos', 8344, 'AS');
INSERT INTO curso VALUES (1395, 'Filosofia [Marília]                            ', 'Créditos', 4833, 'F');
INSERT INTO curso VALUES (1396, 'Estudos Lingüísticos [Sjrp]                    ', 'Créditos', 5462, 'EL');
INSERT INTO curso VALUES (1397, 'Administração de Empresas                      ', 'Créditos', 9350, 'AE');
INSERT INTO curso VALUES (1398, 'Engenharia de Produção                         ', 'Créditos', 5743, 'EP');
INSERT INTO curso VALUES (1399, 'Direito                                        ', 'Créditos', 549, 'D');
INSERT INTO curso VALUES (1400, 'Ciências (Fisiopatologia Experimental)         ', 'Créditos', 353, 'CE');
INSERT INTO curso VALUES (1401, 'Biologia Comparada                             ', 'Créditos', 1797, 'BC');
INSERT INTO curso VALUES (1402, 'Ciências do Mar                                ', 'Créditos', 4944, 'CM');
INSERT INTO curso VALUES (1403, 'Disturbios da Comunicação                      ', 'Créditos', 2004, 'DC');
INSERT INTO curso VALUES (1404, 'Análise Regional                               ', 'Créditos', 893, 'AR');
INSERT INTO curso VALUES (1405, 'Ciencias da Saude                              ', 'Créditos', 6204, 'CS');
INSERT INTO curso VALUES (1406, 'Historia                                       ', 'Créditos', 9786, 'H');
INSERT INTO curso VALUES (1407, 'Historia                                       ', 'Créditos', 6729, 'H');
INSERT INTO curso VALUES (1408, 'Odontologia (Endodontia)                       ', 'Créditos', 7486, 'O');
INSERT INTO curso VALUES (1409, 'Educacao                                       ', 'Créditos', 1601, 'E');
INSERT INTO curso VALUES (1410, 'Odontologia                                    ', 'Créditos', 242, 'O');
INSERT INTO curso VALUES (1411, 'Educação para a Ciência -UNESP-Bauru           ', 'Créditos', 4643, 'EC');
INSERT INTO curso VALUES (1412, 'Ciencias e Praticas Educativas                 ', 'Créditos', 2566, 'CPE');
INSERT INTO curso VALUES (1413, 'Historia da Ciencia                            ', 'Créditos', 9, 'HC');
INSERT INTO curso VALUES (1414, 'Agricultura Familiares e Desenvolvimento Susten', 'Créditos', 2513, 'AFDS');
INSERT INTO curso VALUES (1415, 'Linguistica Aplicada                           ', 'Créditos', 2334, 'LA');
INSERT INTO curso VALUES (1416, 'Ciências Veterinarias                          ', 'Créditos', 7816, 'CV');
INSERT INTO curso VALUES (1417, 'Agronomia (Sistema de Producao ) - UNESP - Ilha', 'Créditos', 3704, 'APUI');
INSERT INTO curso VALUES (1418, 'Engenharia Eletrica                            ', 'Créditos', 6919, 'EE');
INSERT INTO curso VALUES (1419, 'Estomatopatologia                              ', 'Créditos', 7187, 'E');
INSERT INTO curso VALUES (1420, 'Saude Coletiva-Unesp-Bot                       ', 'Créditos', 7228, 'SC');
INSERT INTO curso VALUES (1421, 'Ciencia da Motricidade Humana                  ', 'Créditos', 1285, 'CMH');
INSERT INTO curso VALUES (1422, 'Educacao                                       ', 'Créditos', 7741, 'E');
INSERT INTO curso VALUES (1423, 'Historia- UEM/UEL                              ', 'Créditos', 7662, 'HU');
INSERT INTO curso VALUES (1424, 'História                                       ', 'Créditos', 9703, 'H');
INSERT INTO curso VALUES (1425, 'Psicologia                                     ', 'Créditos', 882, 'P');
INSERT INTO curso VALUES (1426, 'Sociologia                                     ', 'Créditos', 516, 'S');
INSERT INTO curso VALUES (1427, 'Oceanografia Quimica e Geologica               ', 'Créditos', 3409, 'OQG');
INSERT INTO curso VALUES (1428, 'Letras                                         ', 'Créditos', 7380, 'L');
INSERT INTO curso VALUES (1429, 'Musica                                         ', 'Créditos', 5862, 'M');
INSERT INTO curso VALUES (1430, 'Desenvolvimento Rural                          ', 'Créditos', 495, 'DR');
INSERT INTO curso VALUES (1431, 'Ciencias Sociais                               ', 'Créditos', 5541, 'CS');
INSERT INTO curso VALUES (1432, 'Filosofia                                      ', 'Créditos', 2783, 'F');
INSERT INTO curso VALUES (1433, 'Ciências Contábeis                             ', 'Créditos', 2410, 'CC');
INSERT INTO curso VALUES (1434, 'Zootecnia-UFRPE-UFPB-UFC                       ', 'Créditos', 3132, 'Z');
INSERT INTO curso VALUES (1435, 'Estatistica                                    ', 'Créditos', 9569, 'E');
INSERT INTO curso VALUES (1436, 'Processos Biotecnologicos                      ', 'Créditos', 7821, 'PB');
INSERT INTO curso VALUES (1437, 'Odontologia(Periodontia)                       ', 'Créditos', 4136, 'O');
INSERT INTO curso VALUES (1438, 'Medicina Veterinaria [Jaboticabal]             ', 'Créditos', 8507, 'MV');
INSERT INTO curso VALUES (1439, 'Fisica - UEM-UEL                               ', 'Créditos', 855, 'FU');
INSERT INTO curso VALUES (1440, 'Quimica                                        ', 'Créditos', 2494, 'Q');
INSERT INTO curso VALUES (1441, 'Comunicação e Linguagens                       ', 'Créditos', 3232, 'CL');
INSERT INTO curso VALUES (1442, 'Comunicação e Mercado                          ', 'Créditos', 4465, 'CM');
INSERT INTO curso VALUES (1443, 'Ciência e Engenharia de Materiais              ', 'Créditos', 8306, 'CEM');
INSERT INTO curso VALUES (1444, 'Engenharia Mecânica                            ', 'Créditos', 7750, 'EM');
INSERT INTO curso VALUES (1445, 'Engenharia Elétrica                            ', 'Créditos', 5038, 'EE');
INSERT INTO curso VALUES (1446, 'Sociologia e Direito                           ', 'Créditos', 256, 'SD');
INSERT INTO curso VALUES (1447, 'Gerontologia                                   ', 'Créditos', 684, 'G');
INSERT INTO curso VALUES (1448, 'Eduacao,Arte e Historia da Cultura             ', 'Créditos', 3881, 'EHC');
INSERT INTO curso VALUES (1449, 'Zoologia de Vertebrados                        ', 'Créditos', 2417, 'ZV');
INSERT INTO curso VALUES (1450, 'Farmacologia                                   ', 'Créditos', 5031, 'F');
INSERT INTO curso VALUES (1451, 'Ciências Fisiológicas- Fisiologia Animal Compar', 'Créditos', 8591, 'CFFA');
INSERT INTO curso VALUES (1452, 'Ciências Sociais                               ', 'Créditos', 1666, 'CS');
INSERT INTO curso VALUES (1453, 'Ciências Sociais                               ', 'Créditos', 8517, 'CS');
INSERT INTO curso VALUES (1454, 'Turismo e Hotelaria                            ', 'Créditos', 3567, 'TH');
INSERT INTO curso VALUES (1455, 'Administracao: Gestão Moderna de Negócios      ', 'Créditos', 1640, 'AGMN');
INSERT INTO curso VALUES (1456, 'Econômia                                       ', 'Créditos', 4024, 'E');
INSERT INTO curso VALUES (1457, 'Direito                                        ', 'Créditos', 5946, 'D');
INSERT INTO curso VALUES (1458, 'Ciencias Criminais                             ', 'Créditos', 2904, 'CC');
INSERT INTO curso VALUES (1459, 'Direitos das Obrigacões                        ', 'Créditos', 1065, 'DO');
INSERT INTO curso VALUES (1460, 'Produção Animal                                ', 'Créditos', 4129, 'PA');
INSERT INTO curso VALUES (1461, 'Bioquimica Agricola                            ', 'Créditos', 7254, 'BA');
INSERT INTO curso VALUES (1462, 'Medicina Veterinaria Tropical                  ', 'Créditos', 1422, 'MVT');
INSERT INTO curso VALUES (1463, 'CIÊNCIAS DO MOVIMENTO HUMANO                   ', 'Créditos', 1928, 'CDMH');
INSERT INTO curso VALUES (1464, 'Odontologia (Cirurgia e Traumatologia Buco-Maxi', 'Créditos', 7319, 'OTB');
INSERT INTO curso VALUES (1465, 'Odontologia                                    ', 'Créditos', 7064, 'O');
INSERT INTO curso VALUES (1466, 'Engenharia de Reservatorio e de Exploracao     ', 'Créditos', 9507, 'ERE');
INSERT INTO curso VALUES (1467, 'Ciências Fisiológicas                          ', 'Créditos', 3188, 'CF');
INSERT INTO curso VALUES (1468, 'História                                       ', 'Créditos', 6073, 'H');
INSERT INTO curso VALUES (1469, 'Economia Aplicada                              ', 'Créditos', 5416, 'EA');
INSERT INTO curso VALUES (1470, 'Modelagem Computacional                        ', 'Créditos', 7392, 'MC');
INSERT INTO curso VALUES (1471, 'Engenharia e Ciência de Materiais              ', 'Créditos', 9783, 'ECM');
INSERT INTO curso VALUES (1472, 'MICROBIOLOGIA                                  ', 'Créditos', 6370, 'M');
INSERT INTO curso VALUES (1473, 'ENGENHARIA DE ALIMENTOS                        ', 'Créditos', 5730, 'EDA');
INSERT INTO curso VALUES (1474, 'Botânica                                       ', 'Créditos', 3513, 'B');
INSERT INTO curso VALUES (1475, 'Gerontologia Biomédica                         ', 'Créditos', 8015, 'GB');
INSERT INTO curso VALUES (1476, 'Computação Aplicada                            ', 'Créditos', 6597, 'CA');
INSERT INTO curso VALUES (1477, 'Epidemiologia                                  ', 'Créditos', 579, 'E');
INSERT INTO curso VALUES (1478, 'ADMINISTRAÇÃO- UEM/UEL                         ', 'Créditos', 4607, 'AU');
INSERT INTO curso VALUES (1479, 'Agronomia                                      ', 'Créditos', 5248, 'A');
INSERT INTO curso VALUES (1480, 'QUÍMICA DOS RECURSOS NATURAIS                  ', 'Créditos', 9623, 'QDRN');
INSERT INTO curso VALUES (1481, 'ECONOMIA -Unesp Araraquara                     ', 'Créditos', 1593, 'EA');
INSERT INTO curso VALUES (1482, 'CIÊNCIAS SOCIAIS                               ', 'Créditos', 2296, 'CS');
INSERT INTO curso VALUES (1483, 'Engenharia Biomédica                           ', 'Créditos', 558, 'EB');
INSERT INTO curso VALUES (1484, 'Biotecnologia                                  ', 'Créditos', 2009, 'B');
INSERT INTO curso VALUES (1485, 'REABILITAÇÃO ORAL- Araraquara                  ', 'Créditos', 5868, 'ROA');
INSERT INTO curso VALUES (1486, 'FISIOPATOLOGIA CLÍNICA E EXPERIMENTAL          ', 'Créditos', 327, 'FCEE');
INSERT INTO curso VALUES (1487, 'RECURSOS FLORESTAIS-ESALQ                      ', 'Créditos', 979, 'RF');
INSERT INTO curso VALUES (1488, 'ENGENHARIA MECÂNICA E DE MATERIAIS             ', 'Créditos', 9659, 'EMED');
INSERT INTO curso VALUES (1489, 'PSICOLOGIA                                     ', 'Créditos', 7264, 'P');
INSERT INTO curso VALUES (1490, 'Geociencias                                    ', 'Créditos', 2286, 'G');
INSERT INTO curso VALUES (1491, 'CIÊNCIAS DO AMBIENTE E SUSTENTABILIDADE NA AMAZ', 'Créditos', 763, 'CDAE');
INSERT INTO curso VALUES (1492, 'CIÊNCIAS AGRÁRIAS                              ', 'Créditos', 3842, 'CA');
INSERT INTO curso VALUES (1493, 'FISICA QUIMICA E NEUROCIÊNCIAS                 ', 'Créditos', 8846, 'FQEN');
INSERT INTO curso VALUES (1494, 'LETRAS                                         ', 'Créditos', 2121, 'L');
INSERT INTO curso VALUES (1495, 'CIÊNCIA DA NUTRIÇÃO                            ', 'Créditos', 7501, 'CDN');
INSERT INTO curso VALUES (1496, 'FISICA APLICADA                                ', 'Créditos', 5896, 'FA');
INSERT INTO curso VALUES (1497, 'SERVIÇO SOCIAL E POLÍTICA SOCIAL               ', 'Créditos', 783, 'SSEP');
INSERT INTO curso VALUES (1498, 'PSICOLOGIA-Assis                               ', 'Créditos', 7018, 'P');
INSERT INTO curso VALUES (1499, 'AGRONOMIA                                      ', 'Créditos', 1899, 'A');
INSERT INTO curso VALUES (1500, 'Ciências Biológicas                            ', 'Créditos', 8672, 'CB');
INSERT INTO curso VALUES (1501, 'Geografia, Meio Ambiente e Desenvolvimento     ', 'Créditos', 2674, 'GMAD');
INSERT INTO curso VALUES (1502, 'Ciências e Engenharia de Petróleo              ', 'Créditos', 4150, 'CEP');
INSERT INTO curso VALUES (1503, 'BIOLOGIA EXPERIMENTAL                          ', 'Créditos', 5521, 'BE');
INSERT INTO curso VALUES (1504, 'EDUCAÇÃO-Formação de Professores               ', 'Créditos', 2061, 'EP');
INSERT INTO curso VALUES (1505, 'PSICOLOGIA                                     ', 'Créditos', 8152, 'P');
INSERT INTO curso VALUES (1506, 'Ciências da Religião                           ', 'Créditos', 9392, 'CR');
INSERT INTO curso VALUES (1507, 'ENGENHARIA AMBIENTAL URBANA                    ', 'Créditos', 9010, 'EAU');
INSERT INTO curso VALUES (1508, 'CIÊNCIA DE MATERIAIS                           ', 'Créditos', 5121, 'CDM');
INSERT INTO curso VALUES (1509, 'Química                                        ', 'Créditos', 1437, 'Q');
INSERT INTO curso VALUES (1510, 'MATERIAIS PARA ENGENHARIA                      ', 'Créditos', 1265, 'MPE');
INSERT INTO curso VALUES (1511, 'Estudos da Linguagem                           ', 'Créditos', 9093, 'EL');
INSERT INTO curso VALUES (1512, 'Engenharia e Ciência dos Materiais             ', 'Créditos', 4401, 'ECM');
INSERT INTO curso VALUES (1513, 'Física                                         ', 'Créditos', 451, 'F');
INSERT INTO curso VALUES (1514, 'CIÊNCIA DOS MATERIAIS                          ', 'Créditos', 9892, 'CDM');
INSERT INTO curso VALUES (1515, 'ENSINO, FILOSOFIA E HISTÓRIA DAS CIÊNCIAS      ', 'Créditos', 4000, 'EFEH');
INSERT INTO curso VALUES (1516, 'Informática na Educação                        ', 'Créditos', 5388, 'IE');
INSERT INTO curso VALUES (1517, 'Meteorologia                                   ', 'Créditos', 9134, 'M');
INSERT INTO curso VALUES (1518, 'ENGENHARIA ELETRICA                            ', 'Créditos', 9990, 'EE');
INSERT INTO curso VALUES (1519, 'Ciências Farmaceuticas                         ', 'Créditos', 6296, 'CF');
INSERT INTO curso VALUES (1520, 'ENGENHARIA CIVIL                               ', 'Créditos', 8535, 'EC');
INSERT INTO curso VALUES (1521, 'GENÉTICA E BIOLOGIA MOLECULAR                  ', 'Créditos', 9491, 'GEBM');
INSERT INTO curso VALUES (1522, 'ENGENHARIA QUÍMICA                             ', 'Créditos', 637, 'EQ');
INSERT INTO curso VALUES (1523, 'BIOMETRIA                                      ', 'Créditos', 2039, 'B');
INSERT INTO curso VALUES (1524, 'ARQUITETURA E URBANISMO                        ', 'Créditos', 4652, 'AEU');
INSERT INTO curso VALUES (1525, 'ECOLOGIA E BIOMONITORAMENTO                    ', 'Créditos', 7472, 'EEB');
INSERT INTO curso VALUES (1526, 'Analises Clinicas                              ', 'Créditos', 7601, 'AC');
INSERT INTO curso VALUES (1527, 'CIÊNCIAS DA SAÚDE                              ', 'Créditos', 7940, 'CDS');
INSERT INTO curso VALUES (1528, 'Biologia                                       ', 'Créditos', 6841, 'B');
INSERT INTO curso VALUES (1529, 'BIOLOGIA AMBIENTAL                             ', 'Créditos', 1624, 'BA');
INSERT INTO curso VALUES (1530, 'CONSTRUÇÃO CIVIL                               ', 'Créditos', 8218, 'CC');
INSERT INTO curso VALUES (1531, 'RADIOPROTEÇÃO E DOSIMETRIA                     ', 'Créditos', 7772, 'RED');
INSERT INTO curso VALUES (1532, 'Microbiologia Agrícola                         ', 'Créditos', 7908, 'MA');
INSERT INTO curso VALUES (1533, 'Biotecnologia                                  ', 'Créditos', 84, 'B');
INSERT INTO curso VALUES (1534, 'ENGENHARIA QUIMICA                             ', 'Créditos', 2790, 'EQ');
INSERT INTO curso VALUES (1535, 'Física                                         ', 'Créditos', 9666, 'F');
INSERT INTO curso VALUES (1536, 'CIÊNCIAS FARMACÊUTICAS: INSUMOS E MEDICAMENTOS ', 'Créditos', 2093, 'CFIE');
INSERT INTO curso VALUES (1537, 'Odontologia                                    ', 'Créditos', 6171, 'O');
INSERT INTO curso VALUES (1538, 'Tecnologias Ambientais                         ', 'Créditos', 1678, 'TA');
INSERT INTO curso VALUES (1539, 'Ciência da Computação                          ', 'Créditos', 8142, 'CC');
INSERT INTO curso VALUES (1540, 'SERVIÇO SOCIAL                                 ', 'Créditos', 9763, 'SS');
INSERT INTO curso VALUES (1541, 'FÍSICA-RC                                      ', 'Créditos', 9326, 'F');
INSERT INTO curso VALUES (1542, 'HISTÓRIA DAS CIÊNCIAS                          ', 'Créditos', 215, 'HDC');
INSERT INTO curso VALUES (1543, 'Saúde na Comunidade (Ribeirão Preto)           ', 'Créditos', 7424, 'SCP');
INSERT INTO curso VALUES (1544, 'EDUCAÇÃO                                       ', 'Créditos', 2454, 'E');
INSERT INTO curso VALUES (1545, 'ODONTOLOGIA-UFPB/UFBA                          ', 'Créditos', 2115, 'O');
INSERT INTO curso VALUES (1546, 'ADMINISTRAÇÃO DE EMPRESAS                      ', 'Créditos', 4964, 'ADE');
INSERT INTO curso VALUES (1547, 'Ciencias Agrarias                              ', 'Créditos', 1643, 'CA');
INSERT INTO curso VALUES (1548, 'COMUNICAÇÃO                                    ', 'Créditos', 1466, 'C');
INSERT INTO curso VALUES (1549, 'Engenharia Mecânica                            ', 'Créditos', 6439, 'EM');
INSERT INTO curso VALUES (1550, 'PSICOLOGIA CLÍNICA                             ', 'Créditos', 1635, 'PC');
INSERT INTO curso VALUES (1551, 'ENGENHARIA QUÍMICA                             ', 'Créditos', 3912, 'EQ');
INSERT INTO curso VALUES (1552, 'Psicologia                                     ', 'Créditos', 6483, 'P');
INSERT INTO curso VALUES (1553, 'Aquicultura                                    ', 'Créditos', 7818, 'A');
INSERT INTO curso VALUES (1554, 'Psiquiatria                                    ', 'Créditos', 5870, 'P');
INSERT INTO curso VALUES (1555, 'Engenharia de Materiais                        ', 'Créditos', 2488, 'EM');
INSERT INTO curso VALUES (1556, 'Educação                                       ', 'Créditos', 485, 'E');
INSERT INTO curso VALUES (1557, 'Psicologia                                     ', 'Créditos', 3101, 'P');
INSERT INTO curso VALUES (1558, 'ODONTOLOGIA (BIOPATOLOGIA BUCAL)               ', 'Créditos', 4645, 'OB');
INSERT INTO curso VALUES (1559, 'Música                                         ', 'Créditos', 9247, 'M');
INSERT INTO curso VALUES (1560, 'Biologia Animal-SJRP                           ', 'Créditos', 5297, 'BA');
INSERT INTO curso VALUES (1561, 'ENGENHARIA CIVIL                               ', 'Créditos', 4229, 'EC');
INSERT INTO curso VALUES (1562, 'Engenharia de Transportes                      ', 'Créditos', 4258, 'ET');
INSERT INTO curso VALUES (1563, 'Planejamento e Gestão Ambiental                ', 'Créditos', 5442, 'PGA');
INSERT INTO curso VALUES (1564, 'Letras (História da Literatura)                ', 'Créditos', 3839, 'LL');
INSERT INTO curso VALUES (1565, 'Enfermagem                                     ', 'Créditos', 3037, 'E');
INSERT INTO curso VALUES (1566, 'Matemática Aplicada                            ', 'Créditos', 5396, 'MA');
INSERT INTO curso VALUES (1567, 'Engenharia Civil                               ', 'Créditos', 4830, 'EC');
INSERT INTO curso VALUES (1568, 'CIÊNCIAS GEODÉSICAS E TECNOLOGIAS DA GEOINFORMA', 'Créditos', 7450, 'CGET');
INSERT INTO curso VALUES (1569, 'Ciências Contábeis                             ', 'Créditos', 3173, 'CC');
INSERT INTO curso VALUES (1570, 'CIÊNCIAS BIOLÓGICAS                            ', 'Créditos', 8251, 'CB');
INSERT INTO curso VALUES (1571, 'DIREITO TRIBUTÁRIO E EMPRESARIAL               ', 'Créditos', 8683, 'DTEE');
INSERT INTO curso VALUES (1572, 'EDUCAÇÃO                                       ', 'Créditos', 3406, 'E');
INSERT INTO curso VALUES (1573, 'Educação                                       ', 'Créditos', 9933, 'E');
INSERT INTO curso VALUES (1574, 'Saúde e Comportamento                          ', 'Créditos', 2589, 'SC');
INSERT INTO curso VALUES (1575, 'Economia de Empresas                           ', 'Créditos', 7152, 'EE');
INSERT INTO curso VALUES (1576, 'POLÍTICAS SOCIAIS                              ', 'Créditos', 2681, 'PS');
INSERT INTO curso VALUES (1577, 'ECOLOGIA DE AGROECOSSISTEMAS                   ', 'Créditos', 2574, 'EDA');
INSERT INTO curso VALUES (1578, 'Fisiopatologia Médica                          ', 'Créditos', 8060, 'FM');
INSERT INTO curso VALUES (1579, 'Engenharia de Alimentos                        ', 'Créditos', 8077, 'EA');
INSERT INTO curso VALUES (1580, 'CIÊNCIAS BIOLÓGICAS: FARMACOLOGIA BIOQUÍMICA MO', 'Créditos', 5156, 'CBFB');
INSERT INTO curso VALUES (1581, 'BIOLOGIA VEGETAL                               ', 'Créditos', 9287, 'BV');
INSERT INTO curso VALUES (1582, 'Botânica                                       ', 'Créditos', 8803, 'B');
INSERT INTO curso VALUES (1583, 'Engenharia Ambiental                           ', 'Créditos', 199, 'EA');
INSERT INTO curso VALUES (1584, 'Lingüística                                    ', 'Créditos', 6365, 'L');
INSERT INTO curso VALUES (1585, 'Agriculturas Amazônicas                        ', 'Créditos', 3929, 'AA');
INSERT INTO curso VALUES (1586, 'Ciência Animal                                 ', 'Créditos', 1075, 'CA');
INSERT INTO curso VALUES (1587, 'Agroecologia                                   ', 'Créditos', 9910, 'A');
INSERT INTO curso VALUES (1588, 'Ensino das Ciências                            ', 'Créditos', 7259, 'EC');
INSERT INTO curso VALUES (1589, 'Literatura e Diversidade Cultural              ', 'Créditos', 6142, 'LDC');
INSERT INTO curso VALUES (1590, 'Redes de Computadores                          ', 'Créditos', 9539, 'RC');
INSERT INTO curso VALUES (1591, 'Medicina (Clínica Obstétrica)                  ', 'Créditos', 5001, 'MO');
INSERT INTO curso VALUES (1592, 'Tisiologia e Pneumologia                       ', 'Créditos', 7555, 'TP');
INSERT INTO curso VALUES (1593, 'Medicina (Ginecologia)                         ', 'Créditos', 2591, 'M');
INSERT INTO curso VALUES (1594, 'Engenharia de Reservatório e de Exploração     ', 'Créditos', 3926, 'ERE');
INSERT INTO curso VALUES (1595, 'Música                                         ', 'Créditos', 5587, 'M');
INSERT INTO curso VALUES (1596, 'Engenharia de Barragens                        ', 'Créditos', 4248, 'EB');
INSERT INTO curso VALUES (1597, 'Odontologia                                    ', 'Créditos', 881, 'O');
INSERT INTO curso VALUES (1598, 'Modelagem Matemática em Finanças               ', 'Créditos', 3897, 'MMF');
INSERT INTO curso VALUES (1599, 'Pesquisa e Desenvolvimento (Biotecnologia Médic', 'Créditos', 7855, 'PDM');
INSERT INTO curso VALUES (1600, 'Economia da Saúde                              ', 'Créditos', 1072, 'ES');
INSERT INTO curso VALUES (1601, 'Fisiologia do Exercício                        ', 'Créditos', 7539, 'FE');
INSERT INTO curso VALUES (1602, 'Tecnologia Ambiental                           ', 'Créditos', 1979, 'TA');
INSERT INTO curso VALUES (1603, 'Clínica Odontológica                           ', 'Créditos', 9811, 'CO');
INSERT INTO curso VALUES (1604, 'Engenharia de Produção                         ', 'Créditos', 9346, 'EP');
INSERT INTO curso VALUES (1605, 'Patologia Tropical                             ', 'Créditos', 4290, 'PT');
INSERT INTO curso VALUES (1606, 'Ciências Farmacêuticas                         ', 'Créditos', 5173, 'CF');
INSERT INTO curso VALUES (1607, 'Enfermagem                                     ', 'Créditos', 4719, 'E');
INSERT INTO curso VALUES (1608, 'Filosofia                                      ', 'Créditos', 822, 'F');
INSERT INTO curso VALUES (1609, 'Ciências da Saúde                              ', 'Créditos', 4828, 'CS');
INSERT INTO curso VALUES (1610, 'Gestão Pública para o Desenvolvimento do Nordes', 'Créditos', 9576, 'GPDN');
INSERT INTO curso VALUES (1611, 'Educação e Contemporaneidade                   ', 'Créditos', 4567, 'EC');
INSERT INTO curso VALUES (1612, 'Sistemas de Gestão                             ', 'Créditos', 2097, 'SG');
INSERT INTO curso VALUES (1613, 'Engenharia de Computação                       ', 'Créditos', 2786, 'EC');
INSERT INTO curso VALUES (1614, 'Direito                                        ', 'Créditos', 9149, 'D');
INSERT INTO curso VALUES (1615, 'Direito                                        ', 'Créditos', 2785, 'D');
INSERT INTO curso VALUES (1616, 'Promoção de Saúde                              ', 'Créditos', 4505, 'PS');
INSERT INTO curso VALUES (1617, 'Lasers em Odontologia                          ', 'Créditos', 2053, 'LO');
INSERT INTO curso VALUES (1618, 'Projeto e Operação de Sistemas Nucleares       ', 'Créditos', 7723, 'POSN');
INSERT INTO curso VALUES (1619, 'Ciências                                       ', 'Créditos', 8218, 'C');
INSERT INTO curso VALUES (1620, 'Serviço Social                                 ', 'Créditos', 9421, 'SS');
INSERT INTO curso VALUES (1621, 'Odontologia (Radiologia Buco-Maxilo-Facial)    ', 'Créditos', 8174, 'OB');
INSERT INTO curso VALUES (1622, 'Nutrição Humana                                ', 'Créditos', 1560, 'NH');
INSERT INTO curso VALUES (1623, 'Planejamento Urbano e Regional                 ', 'Créditos', 7561, 'PUR');
INSERT INTO curso VALUES (1624, 'Bioengenharia                                  ', 'Créditos', 7342, 'B');
INSERT INTO curso VALUES (1625, 'Ortodontia                                     ', 'Créditos', 9018, 'O');
INSERT INTO curso VALUES (1626, 'Odontologia                                    ', 'Créditos', 8432, 'O');
INSERT INTO curso VALUES (1627, 'Odontologia (Implantologia)                    ', 'Créditos', 9666, 'O');
INSERT INTO curso VALUES (1628, 'Odontologia                                    ', 'Créditos', 331, 'O');
INSERT INTO curso VALUES (1629, 'Tecnologia Ambiental                           ', 'Créditos', 9742, 'TA');
INSERT INTO curso VALUES (1630, 'Engenharia de Computação                       ', 'Créditos', 4906, 'EC');
INSERT INTO curso VALUES (1631, 'Serviço Social e Política Social               ', 'Créditos', 4133, 'SSPS');
INSERT INTO curso VALUES (1632, 'Letras e Cultura Regional                      ', 'Créditos', 8925, 'LCR');
INSERT INTO curso VALUES (1633, 'Turismo                                        ', 'Créditos', 3570, 'T');
INSERT INTO curso VALUES (1634, 'Direito                                        ', 'Créditos', 6635, 'D');
INSERT INTO curso VALUES (1635, 'Saúde Coletiva                                 ', 'Créditos', 8693, 'SC');
INSERT INTO curso VALUES (1636, 'Engenharia: Energia, Ambiente e Materiais      ', 'Créditos', 2108, 'EEAM');
INSERT INTO curso VALUES (1637, 'Letras                                         ', 'Créditos', 3778, 'L');
INSERT INTO curso VALUES (1638, 'Gestão do Patrimônio Cultural                  ', 'Créditos', 5422, 'GPC');
INSERT INTO curso VALUES (1639, 'Engenharia de Processos                        ', 'Créditos', 6721, 'EP');
INSERT INTO curso VALUES (1640, 'Recursos Pesqueiros e Aquicultura              ', 'Créditos', 4629, 'RPA');
INSERT INTO curso VALUES (1641, 'Química                                        ', 'Créditos', 710, 'Q');
INSERT INTO curso VALUES (1642, 'Ciências Ambientais                            ', 'Créditos', 3039, 'CA');
INSERT INTO curso VALUES (1643, 'Ciencias Biologicas (Zoologia)                 ', 'Créditos', 9349, 'CB');
INSERT INTO curso VALUES (1644, 'Filosofia                                      ', 'Créditos', 9399, 'F');
INSERT INTO curso VALUES (1645, 'Psicologia                                     ', 'Créditos', 5854, 'P');
INSERT INTO curso VALUES (1646, 'Ciências Ambientais                            ', 'Créditos', 5693, 'CA');
INSERT INTO curso VALUES (1647, 'Ciências Veterinárias                          ', 'Créditos', 6536, 'CV');
INSERT INTO curso VALUES (1648, 'Ciências Econômicas                            ', 'Créditos', 6330, 'CE');
INSERT INTO curso VALUES (1649, 'Agronomia ( Fitotecnia)                        ', 'Créditos', 5533, 'AF');
INSERT INTO curso VALUES (1650, 'ENGENHARIA ELETRICA                            ', 'Créditos', 606, 'EE');
INSERT INTO curso VALUES (1651, 'CIÊNCIAS FARMACÊUTICAS                         ', 'Créditos', 3856, 'CF');
INSERT INTO curso VALUES (1652, 'DIREITO POLÍTICO E ECONÔMICO                   ', 'Créditos', 2447, 'DPEE');
INSERT INTO curso VALUES (1653, 'ENGENHARIA ELETRICA                            ', 'Créditos', 9342, 'EE');
INSERT INTO curso VALUES (1654, 'Filosofia                                      ', 'Créditos', 8860, 'F');
INSERT INTO curso VALUES (1655, 'Nutrição                                       ', 'Créditos', 6098, 'N');
INSERT INTO curso VALUES (1656, 'Arquitertura e Urbanismo                       ', 'Créditos', 7478, 'AU');
INSERT INTO curso VALUES (1657, 'Engenharia Urbana ( J.Pessoa)                  ', 'Créditos', 8062, 'EUJ');
INSERT INTO curso VALUES (1658, 'QUÍMICA ANALÍTICA                              ', 'Créditos', 8784, 'QA');
INSERT INTO curso VALUES (1659, 'Educação                                       ', 'Créditos', 888, 'E');
INSERT INTO curso VALUES (1660, 'CIÊNCIAS DA RELIGIÃO                           ', 'Créditos', 4469, 'CDR');
INSERT INTO curso VALUES (1661, 'Ecologia e Manejo de Recursos Naturais         ', 'Créditos', 5735, 'EMRN');
INSERT INTO curso VALUES (1662, 'Matemática Computacional                       ', 'Créditos', 6936, 'MC');
INSERT INTO curso VALUES (1663, 'Odontopediatria [Rib. Preto]                   ', 'Créditos', 775, 'OP');
INSERT INTO curso VALUES (1664, 'Ciências da Saúde                              ', 'Créditos', 9259, 'CS');
INSERT INTO curso VALUES (1665, 'Administração                                  ', 'Créditos', 5947, 'A');
INSERT INTO curso VALUES (1666, 'Política Social                                ', 'Créditos', 988, 'PS');
INSERT INTO curso VALUES (1667, 'CIÊNCIAS FLORESTAIS                            ', 'Créditos', 952, 'CF');
INSERT INTO curso VALUES (1668, 'Ciências da Saúde                              ', 'Créditos', 5902, 'CS');
INSERT INTO curso VALUES (1669, 'Administração                                  ', 'Créditos', 2809, 'A');
INSERT INTO curso VALUES (1670, 'Ciências Contábeis                             ', 'Créditos', 7101, 'CC');
INSERT INTO curso VALUES (1671, 'Direito                                        ', 'Créditos', 708, 'D');
INSERT INTO curso VALUES (1672, 'Ciências da Reabilitação                       ', 'Créditos', 2909, 'CR');
INSERT INTO curso VALUES (1673, 'GESTÃO DE POLÍTICAS PÚBLICAS                   ', 'Créditos', 9482, 'GDPP');
INSERT INTO curso VALUES (1674, 'Ciência da Informação                          ', 'Créditos', 7641, 'CI');
INSERT INTO curso VALUES (1675, 'Engenharia de Edificações e Saneamento         ', 'Créditos', 1569, 'EES');
INSERT INTO curso VALUES (1676, 'Biotecnologia                                  ', 'Créditos', 7762, 'B');
INSERT INTO curso VALUES (1677, 'Zoologia                                       ', 'Créditos', 1214, 'Z');
INSERT INTO curso VALUES (1678, 'Ensino de Ciência e Educação Matemática        ', 'Créditos', 6746, 'ECEM');
INSERT INTO curso VALUES (1679, 'Patologia Experimental                         ', 'Créditos', 1027, 'PE');
INSERT INTO curso VALUES (1680, 'Educação Científica e Tecnológica              ', 'Créditos', 7922, 'ECT');
INSERT INTO curso VALUES (1681, 'Engenharia Ambiental                           ', 'Créditos', 7698, 'EA');
INSERT INTO curso VALUES (1682, 'Economia                                       ', 'Créditos', 1802, 'E');
INSERT INTO curso VALUES (1683, 'Educação de Ciências e Matemática              ', 'Créditos', 6977, 'ECM');
INSERT INTO curso VALUES (1684, 'Vigilãncia Sanitária                           ', 'Créditos', 7221, 'VS');
INSERT INTO curso VALUES (1685, 'Teatro                                         ', 'Créditos', 5390, 'T');
INSERT INTO curso VALUES (1686, 'Ciência da Computação                          ', 'Créditos', 531, 'CC');
INSERT INTO curso VALUES (1687, 'Filosofia                                      ', 'Créditos', 6716, 'F');
INSERT INTO curso VALUES (1688, 'CIÊNCIA DA COMPUTAÇÃO                          ', 'Créditos', 6349, 'CDC');
INSERT INTO curso VALUES (1689, 'Odontologia                                    ', 'Créditos', 7915, 'O');
INSERT INTO curso VALUES (1690, 'Educação                                       ', 'Créditos', 8024, 'E');
INSERT INTO curso VALUES (1691, 'Comunicação                                    ', 'Créditos', 5914, 'C');
INSERT INTO curso VALUES (1692, 'BIODIVERSIDADE VEGETAL E MEIO AMBIENTE         ', 'Créditos', 760, 'BVEM');
INSERT INTO curso VALUES (1693, 'Educação                                       ', 'Créditos', 8342, 'E');
INSERT INTO curso VALUES (1694, 'Engenharia Civil                               ', 'Créditos', 9135, 'EC');
INSERT INTO curso VALUES (1695, 'Geografia                                      ', 'Créditos', 9785, 'G');
INSERT INTO curso VALUES (1696, 'Filosofia                                      ', 'Créditos', 7395, 'F');
INSERT INTO curso VALUES (1697, 'GENÉTICA E BIOLOGIA MOLECULAR                  ', 'Créditos', 7619, 'GEBM');
INSERT INTO curso VALUES (1698, 'Literatura e Crítica Literária                 ', 'Créditos', 531, 'LCL');
INSERT INTO curso VALUES (1699, 'ENTOMOLOGIA E CONSERVAÇÃO DA BIODIVERSIDADE    ', 'Créditos', 5970, 'EECD');
INSERT INTO curso VALUES (1700, 'Pós-Graduação em Quimica                       ', 'Créditos', 3498, 'PQ');
INSERT INTO curso VALUES (1701, 'Direito                                        ', 'Créditos', 7529, 'D');
INSERT INTO curso VALUES (1702, 'Direito Processual e Cidadania                 ', 'Créditos', 2491, 'DPC');
INSERT INTO curso VALUES (1703, 'Genética e Melhoramento                        ', 'Créditos', 8191, 'GM');
INSERT INTO curso VALUES (1704, 'Ciência e Tecnologia das Radiações e dos Materi', 'Créditos', 2043, 'CTRM');
INSERT INTO curso VALUES (1705, 'ENFERMAGEM NA SAÚDE DO ADULTO                  ', 'Créditos', 8353, 'ENSD');
INSERT INTO curso VALUES (1706, 'Mestrado em Educação                           ', 'Créditos', 2259, 'ME');
INSERT INTO curso VALUES (1707, 'Enfermagem                                     ', 'Créditos', 5138, 'E');
INSERT INTO curso VALUES (1708, 'Psicologia                                     ', 'Créditos', 6286, 'P');
INSERT INTO curso VALUES (1709, 'Lingüística                                    ', 'Créditos', 9313, 'L');
INSERT INTO curso VALUES (1710, 'Engenharia de Produção                         ', 'Créditos', 2287, 'EP');
INSERT INTO curso VALUES (1711, 'Patologia Tropical                             ', 'Créditos', 5989, 'PT');
INSERT INTO curso VALUES (1712, 'Agriculturas Amazônicas                        ', 'Créditos', 3121, 'AA');
INSERT INTO curso VALUES (1713, 'Ciência Animal                                 ', 'Créditos', 7587, 'CA');
INSERT INTO curso VALUES (1714, 'Educação Em Ciências e Matemáticas             ', 'Créditos', 9508, 'EECM');
INSERT INTO curso VALUES (1715, 'Ciências Sociais                               ', 'Créditos', 8604, 'CS');
INSERT INTO curso VALUES (1716, 'Programa de Pós-Graduação Em Economia          ', 'Créditos', 1741, 'PPEE');
INSERT INTO curso VALUES (1717, 'Sustentabilidade de Ecossistemas               ', 'Créditos', 6665, 'SE');
INSERT INTO curso VALUES (1718, 'Agroecologia                                   ', 'Créditos', 3729, 'A');
INSERT INTO curso VALUES (1719, 'Desenvolvimento e Meio Ambiente                ', 'Créditos', 1534, 'DMA');
INSERT INTO curso VALUES (1720, 'Políticas Públicas                             ', 'Créditos', 3696, 'PP');
INSERT INTO curso VALUES (1721, 'Ciências Farmacêuticas                         ', 'Créditos', 7251, 'CF');
INSERT INTO curso VALUES (1722, 'Toco-Ginecologia                               ', 'Créditos', 1625, 'T');
INSERT INTO curso VALUES (1723, 'Ciências Marinhas Tropicais                    ', 'Créditos', 8926, 'CMT');
INSERT INTO curso VALUES (1724, 'Ligüística Aplicada                            ', 'Créditos', 9609, 'LA');
INSERT INTO curso VALUES (1725, 'Políticas Públicas e Sociedade                 ', 'Créditos', 7576, 'PPS');
INSERT INTO curso VALUES (1726, 'Enfermagem                                     ', 'Créditos', 2086, 'E');
INSERT INTO curso VALUES (1727, 'Filosofia                                      ', 'Créditos', 977, 'F');
INSERT INTO curso VALUES (1728, 'Ciências da Saúde                              ', 'Créditos', 9350, 'CS');
INSERT INTO curso VALUES (1729, 'Ensino de Ciências Naturais e Matemática       ', 'Créditos', 5775, 'ECNM');
INSERT INTO curso VALUES (1730, 'Gestão Pública Para O Desenvolvimento do Nordes', 'Créditos', 2343, 'GPPO');
INSERT INTO curso VALUES (1731, 'Ensino das Ciências                            ', 'Créditos', 9195, 'EC');
INSERT INTO curso VALUES (1732, 'Odontologia                                    ', 'Créditos', 7570, 'O');
INSERT INTO curso VALUES (1733, ' Ciências da Saude                             ', 'Créditos', 6971, 'CS');
INSERT INTO curso VALUES (1734, 'Ciência da Informação                          ', 'Créditos', 7635, 'CI');
INSERT INTO curso VALUES (1735, 'Gerenciamento e Tecnologia Ambiental No Process', 'Créditos', 9415, 'GTAN');
INSERT INTO curso VALUES (1736, 'Literatura e Diversidade Cultural              ', 'Créditos', 6664, 'LDC');
INSERT INTO curso VALUES (1737, 'Educação e Contemporaneidade                   ', 'Créditos', 1016, 'EC');
INSERT INTO curso VALUES (1738, 'Cultura & Turismo - Parceria Uesc/Ufba         ', 'Créditos', 745, 'CTPU');
INSERT INTO curso VALUES (1739, 'Ciências Contábeis                             ', 'Créditos', 9411, 'CC');
INSERT INTO curso VALUES (1740, 'Redes de Computadores                          ', 'Créditos', 7723, 'RC');
INSERT INTO curso VALUES (1741, 'Regulação da Indústria de Energia              ', 'Créditos', 7639, 'RIE');
INSERT INTO curso VALUES (1742, 'Mestrado Em Administração Estratégica          ', 'Créditos', 2852, 'MEAE');
INSERT INTO curso VALUES (1743, 'Administração                                  ', 'Créditos', 9046, 'A');
INSERT INTO curso VALUES (1744, 'Direito                                        ', 'Créditos', 7777, 'D');
INSERT INTO curso VALUES (1745, 'Ciência Política                               ', 'Créditos', 2380, 'CP');
INSERT INTO curso VALUES (1746, 'Engenharia Ambiental                           ', 'Créditos', 8651, 'EA');
INSERT INTO curso VALUES (1747, 'Sistemas de Gestão                             ', 'Créditos', 13, 'SG');
INSERT INTO curso VALUES (1748, ' Medicina                                      ', 'Créditos', 8069, 'M');
INSERT INTO curso VALUES (1749, 'Engenharia de Computação                       ', 'Créditos', 1095, 'EC');
INSERT INTO curso VALUES (1750, 'Direito                                        ', 'Créditos', 3277, 'D');
INSERT INTO curso VALUES (1751, 'Administração e Desenvolvimento Empresarial    ', 'Créditos', 3845, 'ADE');
INSERT INTO curso VALUES (1752, 'Odontologia                                    ', 'Créditos', 4494, 'O');
INSERT INTO curso VALUES (1753, 'Engenharia de Reservatório e de Exploração     ', 'Créditos', 990, 'ERE');
INSERT INTO curso VALUES (1754, 'Cognição e Linguagem                           ', 'Créditos', 4662, 'CL');
INSERT INTO curso VALUES (1755, 'Administração                                  ', 'Créditos', 5534, 'A');
INSERT INTO curso VALUES (1756, 'Economia                                       ', 'Créditos', 2430, 'E');
INSERT INTO curso VALUES (1757, 'Odontologia                                    ', 'Créditos', 3420, 'O');
INSERT INTO curso VALUES (1758, 'Direito                                        ', 'Créditos', 2708, 'D');
INSERT INTO curso VALUES (1759, 'Direito                                        ', 'Créditos', 58, 'D');
INSERT INTO curso VALUES (1760, 'Música                                         ', 'Créditos', 1449, 'M');
INSERT INTO curso VALUES (1761, 'Ciências da Reabilitação                       ', 'Créditos', 4073, 'CR');
INSERT INTO curso VALUES (1762, ' Clínica Médica                                ', 'Créditos', 3569, 'CM');
INSERT INTO curso VALUES (1763, 'Engenharia de Barragens                        ', 'Créditos', 6193, 'EB');
INSERT INTO curso VALUES (1764, 'Odontologia                                    ', 'Créditos', 8448, 'O');
INSERT INTO curso VALUES (1765, 'Administração                                  ', 'Créditos', 7850, 'A');
INSERT INTO curso VALUES (1766, 'FISIOTERAPIA                                   ', 'Créditos', 4994, 'F');
INSERT INTO curso VALUES (1767, 'Direito                                        ', 'Créditos', 6709, 'D');
INSERT INTO curso VALUES (1768, 'Pós-Graduação Em Engenharia Elétrica           ', 'Créditos', 1484, 'PEEE');
INSERT INTO curso VALUES (1769, 'Administração                                  ', 'Créditos', 9219, 'A');
INSERT INTO curso VALUES (1770, 'Modelagem Matemática Em Finanças               ', 'Créditos', 6729, 'MMEF');
INSERT INTO curso VALUES (1771, 'Língua, Literatura e Cultura Arabe             ', 'Créditos', 3417, 'LLCA');
INSERT INTO curso VALUES (1772, 'Literatura e Cultura Russa                     ', 'Créditos', 1925, 'LCR');
INSERT INTO curso VALUES (1773, 'Estética e História da Arte                    ', 'Créditos', 8160, 'EHA');
INSERT INTO curso VALUES (1774, 'Odontologia                                    ', 'Créditos', 5272, 'O');
INSERT INTO curso VALUES (1775, 'Psicologia da Saúde                            ', 'Créditos', 1343, 'PS');
INSERT INTO curso VALUES (1776, ' Odontologia Em Saúde Coletiva                 ', 'Créditos', 7383, 'OESC');
INSERT INTO curso VALUES (1777, 'Música                                         ', 'Créditos', 966, 'M');
INSERT INTO curso VALUES (1778, 'Comunicação                                    ', 'Créditos', 9788, 'C');
INSERT INTO curso VALUES (1779, 'Pesquisa e Desenvolvimento (Biotecnologia Médic', 'Créditos', 1378, 'PDM');
INSERT INTO curso VALUES (1780, 'Fisiologia do Exercicio                        ', 'Créditos', 9300, 'FE');
INSERT INTO curso VALUES (1781, 'Economia da Saúde                              ', 'Créditos', 2, 'ES');
INSERT INTO curso VALUES (1782, 'Mestrado Em Direito                            ', 'Créditos', 4704, 'MED');
INSERT INTO curso VALUES (1783, 'Engenharia Mecânica                            ', 'Créditos', 8598, 'EM');
INSERT INTO curso VALUES (1784, 'Tecnologia Ambiental                           ', 'Créditos', 4358, 'TA');
INSERT INTO curso VALUES (1785, 'Clínica Odontológica                           ', 'Créditos', 1332, 'CO');
INSERT INTO curso VALUES (1786, 'Planejamento Urbano e Regional                 ', 'Créditos', 6790, 'PUR');
INSERT INTO curso VALUES (1787, 'Bioengenharia                                  ', 'Créditos', 8179, 'B');
INSERT INTO curso VALUES (1788, 'Ortodontia                                     ', 'Créditos', 7209, 'O');
INSERT INTO curso VALUES (1789, 'Educação                                       ', 'Créditos', 4250, 'E');
INSERT INTO curso VALUES (1790, 'Comunicação                                    ', 'Créditos', 5501, 'C');
INSERT INTO curso VALUES (1791, 'Odontologia (Implantologia)                    ', 'Créditos', 5880, 'O');
INSERT INTO curso VALUES (1792, 'Odontologia                                    ', 'Créditos', 4497, 'O');
INSERT INTO curso VALUES (1793, 'Análises Clínicas                              ', 'Créditos', 5489, 'AC');
INSERT INTO curso VALUES (1794, 'Saúde Materno Infantil                         ', 'Créditos', 1611, 'SMI');
INSERT INTO curso VALUES (1795, 'Tecnologia Ambiental                           ', 'Créditos', 9002, 'TA');
INSERT INTO curso VALUES (1796, 'Engenharia de Computação                       ', 'Créditos', 1720, 'EC');
INSERT INTO curso VALUES (1797, 'Processos Industriais                          ', 'Créditos', 5600, 'PI');
INSERT INTO curso VALUES (1798, 'Administração                                  ', 'Créditos', 2333, 'A');
INSERT INTO curso VALUES (1799, 'Educação                                       ', 'Créditos', 5849, 'E');
INSERT INTO curso VALUES (1800, 'Promoção de Saúde                              ', 'Créditos', 2854, 'PS');
INSERT INTO curso VALUES (1801, 'Controladoria e Contabilidade Estratégica      ', 'Créditos', 5507, 'CCE');
INSERT INTO curso VALUES (1802, 'Administração de Empresas                      ', 'Créditos', 9399, 'AE');
INSERT INTO curso VALUES (1803, 'Administração                                  ', 'Créditos', 6610, 'A');
INSERT INTO curso VALUES (1804, 'Lasers Em Odontologia                          ', 'Créditos', 9785, 'LEO');
INSERT INTO curso VALUES (1805, 'Sistema Constitucional de Garantia de Direitos ', 'Créditos', 869, 'SCGD');
INSERT INTO curso VALUES (1806, 'Hospitalidade                                  ', 'Créditos', 7982, 'H');
INSERT INTO curso VALUES (1807, 'Ciências da Reabilitação Neuro-Motora          ', 'Créditos', 8186, 'CRN');
INSERT INTO curso VALUES (1808, 'Ciências                                       ', 'Créditos', 9777, 'C');
INSERT INTO curso VALUES (1809, 'Odontologia                                    ', 'Créditos', 8545, 'O');
INSERT INTO curso VALUES (1810, 'Engenharia de Produção e Sistemas              ', 'Créditos', 9709, 'EPS');
INSERT INTO curso VALUES (1811, 'Ciências Sociais Aplicadas                     ', 'Créditos', 5785, 'CSA');
INSERT INTO curso VALUES (1812, 'Odontologia                                    ', 'Créditos', 9419, 'O');
INSERT INTO curso VALUES (1813, 'Letras -Linguagem e Sociedade                  ', 'Créditos', 2827, 'LS');
INSERT INTO curso VALUES (1814, 'Serviço Social                                 ', 'Créditos', 8699, 'SS');
INSERT INTO curso VALUES (1815, 'Educação                                       ', 'Créditos', 5449, 'E');
INSERT INTO curso VALUES (1816, 'Ensino de Física                               ', 'Créditos', 6003, 'EF');
INSERT INTO curso VALUES (1817, 'Relações Internacionais                        ', 'Créditos', 2638, 'RI');
INSERT INTO curso VALUES (1818, 'Biotecnologia Agricola                         ', 'Créditos', 927, 'BA');
INSERT INTO curso VALUES (1819, 'Ciências Sociais Aplicadas                     ', 'Créditos', 9159, 'CSA');
INSERT INTO curso VALUES (1820, 'Turismo                                        ', 'Créditos', 8222, 'T');
INSERT INTO curso VALUES (1821, 'Direito                                        ', 'Créditos', 3760, 'D');
INSERT INTO curso VALUES (1822, 'Letras e Cultura Regional                      ', 'Créditos', 2313, 'LCR');
INSERT INTO curso VALUES (1823, 'Ciências Médicas                               ', 'Créditos', 1059, 'CM');
INSERT INTO curso VALUES (1824, 'Ciências da Saúde (Cardiologia)                ', 'Créditos', 1190, 'CS');
INSERT INTO curso VALUES (1825, 'Saúde Coletiva                                 ', 'Créditos', 7677, 'SC');
INSERT INTO curso VALUES (1826, 'Ensino de Ciências e Matemática                ', 'Créditos', 9000, 'ECM');
INSERT INTO curso VALUES (1827, 'Engenharia: Energia, Ambiente e Materiais      ', 'Créditos', 9747, 'EEAM');
INSERT INTO curso VALUES (1828, 'Desenvolvimento, Gestão e Cidadania            ', 'Créditos', 5857, 'DGC');
INSERT INTO curso VALUES (1829, 'Geografia                                      ', 'Créditos', 9340, 'G');
INSERT INTO curso VALUES (1830, 'Física e Meio Ambiente                         ', 'Créditos', 3008, 'FMA');
INSERT INTO curso VALUES (1831, 'Letras                                         ', 'Créditos', 7975, 'L');
INSERT INTO curso VALUES (1832, 'Ciência da Computação                          ', 'Créditos', 5276, 'CC');
INSERT INTO curso VALUES (1833, 'Ciência Animal                                 ', 'Créditos', 3739, 'CA');
INSERT INTO curso VALUES (1834, 'Geografia                                      ', 'Créditos', 653, 'G');
INSERT INTO curso VALUES (1835, 'Agronegócios                                   ', 'Créditos', 9657, 'A');
INSERT INTO curso VALUES (1836, 'Desenvolvimento Local                          ', 'Créditos', 2525, 'DL');
INSERT INTO curso VALUES (1837, 'Psicologia                                     ', 'Créditos', 2323, 'P');
INSERT INTO curso VALUES (1838, 'Meio Ambiente e Desenvolvimento Regional       ', 'Créditos', 9039, 'MADR');
INSERT INTO curso VALUES (1839, 'Produção Agroindustrial                        ', 'Créditos', 8409, 'PA');
INSERT INTO curso VALUES (1840, 'Odontologia (Radiologia Buco Maxilo Facial)    ', 'Créditos', 6043, 'OBMF');
INSERT INTO curso VALUES (1841, 'Gestão do Patrimônio Cultural                  ', 'Créditos', 79, 'GPC');
INSERT INTO curso VALUES (1842, 'Nutrição Humana                                ', 'Créditos', 1117, 'NH');
INSERT INTO curso VALUES (1843, 'Ciências Genômicas e Biotecnologia             ', 'Créditos', 1018, 'CGB');
INSERT INTO curso VALUES (1844, 'Gestão do Conhecimento e Tecnologia da Informaç', 'Créditos', 5485, 'GCTI');
INSERT INTO curso VALUES (1845, 'Diplomacia                                     ', 'Créditos', 4871, 'D');
INSERT INTO curso VALUES (1846, 'Ciência Política                               ', 'Créditos', 2556, 'CP');
INSERT INTO curso VALUES (1847, 'DESENVOLVIMENTO E MEIO AMBIENTE                ', 'Créditos', 3868, 'DEMA');
INSERT INTO curso VALUES (1848, 'ECONOMIA                                       ', 'Créditos', 8440, 'E');
INSERT INTO curso VALUES (1849, 'MECATRÔNICA                                    ', 'Créditos', 7056, 'M');
INSERT INTO curso VALUES (1850, 'Biologia Celular e Molecular                   ', 'Créditos', 9719, 'BCM');
INSERT INTO curso VALUES (1851, 'Ciências da Saúde                              ', 'Créditos', 7757, 'CS');
INSERT INTO curso VALUES (1852, 'Ciências da Saúde                              ', 'Créditos', 5102, 'CS');
INSERT INTO curso VALUES (1853, 'Análises Clínicas                              ', 'Créditos', 7287, 'AC');
INSERT INTO curso VALUES (1854, 'Educação Física                                ', 'Créditos', 5497, 'EF');
INSERT INTO curso VALUES (1855, 'Desenvolvimento Regional e Agronegócios        ', 'Créditos', 867, 'DRA');
INSERT INTO curso VALUES (1856, 'Biologia Vegetal                               ', 'Créditos', 167, 'BV');
INSERT INTO curso VALUES (1857, 'Linguística Aplicada                           ', 'Créditos', 5242, 'LA');
INSERT INTO curso VALUES (1858, 'MESTRADO EM CIRURGIA                           ', 'Créditos', 8421, 'MEC');
INSERT INTO curso VALUES (1859, 'Matemática                                     ', 'Créditos', 505, 'M');
INSERT INTO curso VALUES (1860, 'MEDICINA VETERINÁRIA EM PEQUENOS RUMINANTES    ', 'Créditos', 5488, 'MVEP');
INSERT INTO curso VALUES (1861, 'Desenho Industrial (Bauru)                     ', 'Créditos', 3256, 'DI');
INSERT INTO curso VALUES (1862, 'Biotecnologia                                  ', 'Créditos', 500, 'B');
INSERT INTO curso VALUES (1863, 'ODONTOLOGIA                                    ', 'Créditos', 5154, 'O');
INSERT INTO curso VALUES (1864, 'Ciência Animal                                 ', 'Créditos', 5177, 'CA');
INSERT INTO curso VALUES (1865, 'Informática                                    ', 'Créditos', 4432, 'I');
INSERT INTO curso VALUES (1866, 'Sociedade e Cultura na Amazônia                ', 'Créditos', 5297, 'SCA');
INSERT INTO curso VALUES (1867, 'Ciência do Solo                                ', 'Créditos', 564, 'CS');
INSERT INTO curso VALUES (1868, 'Arqueologia                                    ', 'Créditos', 5483, 'A');
INSERT INTO curso VALUES (1869, 'Educação                                       ', 'Créditos', 49, 'E');
INSERT INTO curso VALUES (1870, 'Agronomia ( Melhoramento Genético de Plantas)  ', 'Créditos', 9906, 'AMGP');
INSERT INTO curso VALUES (1871, 'Sistemas Mecatrônicos                          ', 'Créditos', 8964, 'SM');
INSERT INTO curso VALUES (1872, 'Genética, Conservação e Biologia Evolutiva     ', 'Créditos', 6348, 'GCBE');
INSERT INTO curso VALUES (1873, 'Geografia                                      ', 'Créditos', 455, 'G');
INSERT INTO curso VALUES (1874, 'Química                                        ', 'Créditos', 1341, 'Q');
INSERT INTO curso VALUES (1875, 'Sistemas Agrosilvopastoris no Semi-Arido       ', 'Créditos', 6051, 'SAS');
INSERT INTO curso VALUES (1876, 'Física                                         ', 'Créditos', 4200, 'F');
INSERT INTO curso VALUES (1877, 'Ciências Médicas                               ', 'Créditos', 305, 'CM');
INSERT INTO curso VALUES (1878, 'Cirurgia e Experimentação                      ', 'Créditos', 7134, 'CE');
INSERT INTO curso VALUES (1879, 'Zoologia                                       ', 'Créditos', 5682, 'Z');
INSERT INTO curso VALUES (1880, 'Direito                                        ', 'Créditos', 7808, 'D');
INSERT INTO curso VALUES (1881, 'Matematica                                     ', 'Créditos', 6902, 'M');
INSERT INTO curso VALUES (1882, 'Doenças Tropicais e Infecciosas                ', 'Créditos', 2714, 'DTI');
INSERT INTO curso VALUES (1883, 'Odontologia                                    ', 'Créditos', 9141, 'O');
INSERT INTO curso VALUES (1884, 'Direito Constitucional                         ', 'Créditos', 1951, 'DC');
INSERT INTO curso VALUES (1885, 'Educação em Saúde                              ', 'Créditos', 2118, 'ES');
INSERT INTO curso VALUES (1886, 'Informatica Aplicada                           ', 'Créditos', 5931, 'IA');
INSERT INTO curso VALUES (1887, 'Psicologia                                     ', 'Créditos', 6957, 'P');
INSERT INTO curso VALUES (1888, 'Saude e Meio Ambiente                          ', 'Créditos', 2562, 'SMA');
INSERT INTO curso VALUES (1889, 'Sociologia                                     ', 'Créditos', 2504, 'S');
INSERT INTO curso VALUES (1890, 'Educação                                       ', 'Créditos', 9844, 'E');
INSERT INTO curso VALUES (1891, 'Educação                                       ', 'Créditos', 2748, 'E');
INSERT INTO curso VALUES (1892, 'Engenharia e Ciência dos materiais             ', 'Créditos', 531, 'EC');
INSERT INTO curso VALUES (1893, 'Bioinformatica                                 ', 'Créditos', 8977, 'B');
INSERT INTO curso VALUES (1894, 'Engenharia Automotiva ( Profissionalizante)    ', 'Créditos', 6606, 'EAP');
INSERT INTO curso VALUES (1895, 'Quimica                                        ', 'Créditos', 2449, 'Q');
INSERT INTO curso VALUES (1896, 'Cirurgia Plástica                              ', 'Créditos', 2253, 'CP');
INSERT INTO curso VALUES (1897, 'Odontopediatria e Ortodontia (Profissionalizant', 'Créditos', 6870, 'OO');
INSERT INTO curso VALUES (1898, 'Administração da Prática Oftalmológica (Profiss', 'Créditos', 4982, 'APO');
INSERT INTO curso VALUES (1899, 'Administração ( Profissionalizante)            ', 'Créditos', 3645, 'AP');
INSERT INTO curso VALUES (1900, 'Administração ( Profissionalizante)            ', 'Créditos', 2632, 'AP');
INSERT INTO curso VALUES (1901, 'Administração e Negócios ( Profissionalizante) ', 'Créditos', 2290, 'ANP');
INSERT INTO curso VALUES (1902, 'Mestrado Profissionalizante em Engenharia de Re', 'Créditos', 1150, 'MPER');
INSERT INTO curso VALUES (1903, 'Engenharia Mecânica                            ', 'Créditos', 9420, 'EM');
INSERT INTO curso VALUES (1904, 'Agronomia                                      ', 'Créditos', 2705, 'A');
INSERT INTO curso VALUES (1905, 'CIÊNCIA DA INFORMAÇÃO                          ', 'Créditos', 3678, 'CDI');
INSERT INTO curso VALUES (1906, 'Saúde Coletiva                                 ', 'Créditos', 915, 'SC');
INSERT INTO curso VALUES (1907, 'PRODUÇÃO VEGETAL                               ', 'Créditos', 2742, 'PV');
INSERT INTO curso VALUES (1908, 'TEOLOGIA                                       ', 'Créditos', 7203, 'T');
INSERT INTO curso VALUES (1909, 'PLANEJAMENTO REGIONAL E GESTÃO DA CIDADE (PROFI', 'Créditos', 984, 'PREG');
INSERT INTO curso VALUES (1910, 'MESTRADO EM LETRAS                             ', 'Créditos', 5706, 'MEL');
INSERT INTO curso VALUES (1911, 'Clínica Médica                                 ', 'Créditos', 1822, 'CM');
INSERT INTO curso VALUES (1912, 'Diversidade Vegetal: Conhecer e Conservar      ', 'Créditos', 356, 'DVCC');
INSERT INTO curso VALUES (1913, 'Administração                                  ', 'Créditos', 5618, 'A');
INSERT INTO curso VALUES (1914, 'Engenharia Elétrica                            ', 'Créditos', 6668, 'EE');
INSERT INTO curso VALUES (1915, 'Astronomia                                     ', 'Créditos', 4460, 'A');
INSERT INTO curso VALUES (1916, 'Ciências Médicas                               ', 'Créditos', 4017, 'CM');
INSERT INTO curso VALUES (1917, 'Ciência e Tecnologia de Alimentos              ', 'Créditos', 9257, 'CTA');
INSERT INTO curso VALUES (1918, 'Ciências                                       ', 'Créditos', 794, 'C');
INSERT INTO curso VALUES (1919, 'Estudos de Linguagem                           ', 'Créditos', 4904, 'EL');
INSERT INTO curso VALUES (1920, 'Engenharia Civil                               ', 'Créditos', 4400, 'EC');
INSERT INTO curso VALUES (1921, 'Psicologia                                     ', 'Créditos', 9786, 'P');
INSERT INTO curso VALUES (1922, 'Parasitologia                                  ', 'Créditos', 3133, 'P');
INSERT INTO curso VALUES (1923, 'Ciências Sociais                               ', 'Créditos', 1514, 'CS');
INSERT INTO curso VALUES (1924, 'Engenharia                                     ', 'Créditos', 2906, 'E');
INSERT INTO curso VALUES (1925, 'Produção Vegetal                               ', 'Créditos', 6284, 'PV');
INSERT INTO curso VALUES (1926, 'CIÊNCIA E TECNOLOGIA AMBIENTAL                 ', 'Créditos', 7077, 'CETA');
INSERT INTO curso VALUES (1927, 'CIÊNCIAS DA SAUDE                              ', 'Créditos', 1511, 'CDS');
INSERT INTO curso VALUES (1928, 'Odontologia Preventiva e Social                ', 'Créditos', 8327, 'OPS');
INSERT INTO curso VALUES (1929, 'Educação Física                                ', 'Créditos', 8913, 'EF');
INSERT INTO curso VALUES (1930, 'CIÊNCIAS DA REABILITAÇÃO                       ', 'Créditos', 7931, 'CDR');
INSERT INTO curso VALUES (1931, 'Administração e Desenvolvimento Rural          ', 'Créditos', 9281, 'ADR');
INSERT INTO curso VALUES (1932, 'CIÊNCIAS VETERINÁRIAS                          ', 'Créditos', 7642, 'CV');
INSERT INTO curso VALUES (1933, 'Filosofia                                      ', 'Créditos', 6191, 'F');
INSERT INTO curso VALUES (1934, 'CIÊNCIA E TECNOLOGIA DE MATERIAIS              ', 'Créditos', 2478, 'CETD');
INSERT INTO curso VALUES (1935, 'Microbiologia, Parasitologia e Patologia       ', 'Créditos', 5247, 'MPP');
INSERT INTO curso VALUES (1936, 'Comunicação                                    ', 'Créditos', 3998, 'C');
INSERT INTO curso VALUES (1937, 'Estética e História da Arte                    ', 'Créditos', 3211, 'EHA');
INSERT INTO curso VALUES (1938, 'História                                       ', 'Créditos', 3494, 'H');
INSERT INTO curso VALUES (1939, 'Microbiologia Médica                           ', 'Créditos', 9845, 'MM');
INSERT INTO curso VALUES (1940, 'Tecnologia em Saúde                            ', 'Créditos', 8775, 'TS');
INSERT INTO curso VALUES (1941, 'CIÊNCIAS DA SAÚDE                              ', 'Créditos', 214, 'CDS');
INSERT INTO curso VALUES (1942, 'ZOOTECNIA                                      ', 'Créditos', 4280, 'Z');
INSERT INTO curso VALUES (1943, 'EDUCAÇÃO/RC                                    ', 'Créditos', 5068, 'E');
INSERT INTO curso VALUES (1944, 'Telecomunicações                               ', 'Créditos', 3930, 'T');
INSERT INTO curso VALUES (1945, 'Desenvolvimento Regional e Meio Ambiente       ', 'Créditos', 6233, 'DRMA');
INSERT INTO curso VALUES (1946, 'Ensino em Biociências e Saúde                  ', 'Créditos', 2556, 'EBS');
INSERT INTO curso VALUES (1947, 'Educação                                       ', 'Créditos', 9055, 'E');
INSERT INTO curso VALUES (1948, 'Pesquisa Clínica em Doenças Infecciosas        ', 'Créditos', 8878, 'PCDI');
INSERT INTO curso VALUES (1949, 'BIOLOGIA ORAL                                  ', 'Créditos', 9268, 'BO');
INSERT INTO curso VALUES (1950, 'CIÊNCIA E TECNOLOGIA DE ALIMENTOS              ', 'Créditos', 9628, 'CETD');
INSERT INTO curso VALUES (1951, 'DIREITO DAS RELAÇÕES INTERNACIONAIS            ', 'Créditos', 8073, 'DDRI');
INSERT INTO curso VALUES (1952, 'Odontologia                                    ', 'Créditos', 9430, 'O');
INSERT INTO curso VALUES (1953, 'Ciências Farmacêuticas                         ', 'Créditos', 1762, 'CF');
INSERT INTO curso VALUES (1954, 'PRODUÇÃO VEGETAL                               ', 'Créditos', 477, 'PV');
INSERT INTO curso VALUES (1955, 'FISIOTERAPIA                                   ', 'Créditos', 6033, 'F');
INSERT INTO curso VALUES (1956, 'Química                                        ', 'Créditos', 2602, 'Q');
INSERT INTO curso VALUES (1957, 'CIÊNCIAS FLORESTAIS E AMBIENTAIS               ', 'Créditos', 3554, 'CFEA');
INSERT INTO curso VALUES (1958, 'ADMINISTRAÇÃO                                  ', 'Créditos', 6867, 'A');
INSERT INTO curso VALUES (1959, 'AGRICULTURA NO TRÓPICO ÚMIDO                   ', 'Créditos', 8185, 'ANT');
INSERT INTO curso VALUES (1960, 'Ciências da Saude                              ', 'Créditos', 3368, 'CS');
INSERT INTO curso VALUES (1961, 'MESTRADO EM DIREITO AMBIENTAL                  ', 'Créditos', 2398, 'MEDA');
INSERT INTO curso VALUES (1962, 'ODONTOLOGIA                                    ', 'Créditos', 6129, 'O');
INSERT INTO curso VALUES (1963, 'SERVIÇO SOCIAL                                 ', 'Créditos', 5881, 'SS');
INSERT INTO curso VALUES (1964, 'FISICA                                         ', 'Créditos', 5874, 'F');
INSERT INTO curso VALUES (1965, 'ODONTOLOGIA                                    ', 'Créditos', 2019, 'O');
INSERT INTO curso VALUES (1966, 'BIOLOGIA DE AGENTES INFECCIOSOS E PARASITÁRIOS ', 'Créditos', 1744, 'BDAI');
INSERT INTO curso VALUES (1967, 'MESTRADO EM MATEMÁTICA E ESTATÍSTICA           ', 'Créditos', 8806, 'MEME');
INSERT INTO curso VALUES (1968, 'CIÊNCIAS DO AMBIENTE                           ', 'Créditos', 1256, 'CDA');
INSERT INTO curso VALUES (1969, 'ENFERMAGEM                                     ', 'Créditos', 8584, 'E');
INSERT INTO curso VALUES (1970, 'MESTRADO EM EDUCAÇÃO FÍSICA                    ', 'Créditos', 418, 'MEEF');
INSERT INTO curso VALUES (1971, 'GESTÃO URBANA                                  ', 'Créditos', 7411, 'GU');
INSERT INTO curso VALUES (1972, 'FILOSOFIA                                      ', 'Créditos', 687, 'F');
INSERT INTO curso VALUES (1973, 'EDUCAÇÃO PARA A CIÊNCIA E A MATEMATICA         ', 'Créditos', 9855, 'EPAC');
INSERT INTO curso VALUES (1974, 'MESTRADO EM ENFERMAGEM                         ', 'Créditos', 1535, 'MEE');
INSERT INTO curso VALUES (1975, 'AGRONOMIA                                      ', 'Créditos', 2570, 'A');
INSERT INTO curso VALUES (1976, 'ENGENHARIA DE PRODUÇÃO                         ', 'Créditos', 4660, 'EDP');
INSERT INTO curso VALUES (1977, 'MESTRADO EM ODONTOLOGIA                        ', 'Créditos', 3298, 'MEO');
INSERT INTO curso VALUES (1978, 'CIÊNCIA JURÍDICA                               ', 'Créditos', 9398, 'CJ');
INSERT INTO curso VALUES (1979, 'DESENVOLVIMENTO DE TECNOLOGIA                  ', 'Créditos', 5160, 'DDT');
INSERT INTO curso VALUES (1980, 'PSICOLOGIA                                     ', 'Créditos', 8990, 'P');
INSERT INTO curso VALUES (1981, 'EDUCAÇÃO                                       ', 'Créditos', 9657, 'E');
INSERT INTO curso VALUES (1982, 'DIREITO                                        ', 'Créditos', 225, 'D');
INSERT INTO curso VALUES (1983, 'ESTUDOS DA TRADUÇÃO                            ', 'Créditos', 5725, 'EDT');
INSERT INTO curso VALUES (1984, 'ODONTOLOGIA                                    ', 'Créditos', 1662, 'O');
INSERT INTO curso VALUES (1985, 'CIÊNCIAS DA NUTRIÇÃO - J.P.                    ', 'Créditos', 2151, 'CDNJ');
INSERT INTO curso VALUES (1986, 'GEOGRAFIA                                      ', 'Créditos', 7304, 'G');
INSERT INTO curso VALUES (1987, 'CONTABILIDADE                                  ', 'Créditos', 976, 'C');
INSERT INTO curso VALUES (1988, 'ADMINISTRAÇÃO                                  ', 'Créditos', 9324, 'A');
INSERT INTO curso VALUES (1989, 'CIÊNCIA E ENGENHARIA DE MATERIAIS              ', 'Créditos', 449, 'CEED');
INSERT INTO curso VALUES (1990, 'GEOGRAFIA                                      ', 'Créditos', 3795, 'G');
INSERT INTO curso VALUES (1991, 'GEOMÁTICA                                      ', 'Créditos', 4820, 'G');
INSERT INTO curso VALUES (1992, 'DESIGN                                         ', 'Créditos', 313, 'D');
INSERT INTO curso VALUES (1993, 'ADMINISTRAÇÃO                                  ', 'Créditos', 5711, 'A');
INSERT INTO curso VALUES (1994, 'ENGENHARIA CIVIL                               ', 'Créditos', 6314, 'EC');
INSERT INTO curso VALUES (1995, 'CIÊNCIAS DA LINGUAGEM                          ', 'Créditos', 5521, 'CDL');
INSERT INTO curso VALUES (1996, 'MATERIAIS                                      ', 'Créditos', 605, 'M');
INSERT INTO curso VALUES (1997, 'Diagnóstico Genético Muscular                  ', 'Créditos', 9459, 'DGM');
INSERT INTO curso VALUES (1998, 'DIREITO                                        ', 'Créditos', 7043, 'D');
INSERT INTO curso VALUES (1999, 'ECOLOGIA E EVOLUÇÃO                            ', 'Créditos', 6850, 'EEE');
INSERT INTO curso VALUES (2000, 'CIÊNCIAS MEDICAS                               ', 'Créditos', 866, 'CM');
INSERT INTO curso VALUES (2001, 'CIÊNCIAS MECÂNICAS                             ', 'Créditos', 1896, 'CM');
INSERT INTO curso VALUES (2002, 'CIÊNCIAS DA COMPUTAÇÃO                         ', 'Créditos', 4447, 'CDC');
INSERT INTO curso VALUES (2003, 'ENSINO DE CIÊNCIAS                             ', 'Créditos', 8529, 'EDC');
INSERT INTO curso VALUES (2004, 'ADMINISTRAÇÃO E DESENVOLVIMENTO RURAL          ', 'Créditos', 6523, 'AEDR');
INSERT INTO curso VALUES (2005, 'SOCIOLOGIA                                     ', 'Créditos', 7147, 'S');
INSERT INTO curso VALUES (2006, 'DINÂMICA DO ESPAÇO HABITADO                    ', 'Créditos', 7798, 'DDEH');
INSERT INTO curso VALUES (2007, 'MATEMÁTICA                                     ', 'Créditos', 5508, 'M');
INSERT INTO curso VALUES (2008, 'ATENÇÃO À SAÚDE COLETIVA                       ', 'Créditos', 6250, 'ASC');
INSERT INTO curso VALUES (2009, 'LETRAS                                         ', 'Créditos', 1032, 'L');
INSERT INTO curso VALUES (2010, 'AGROECOSSISTEMAS                               ', 'Créditos', 9895, 'A');
INSERT INTO curso VALUES (2011, 'RELACÕES INTERNACIONAIS                        ', 'Créditos', 8172, 'RI');
INSERT INTO curso VALUES (2012, 'ARQUITETURA E URBANISMO                        ', 'Créditos', 7121, 'AEU');
INSERT INTO curso VALUES (2013, 'ODONTOLOGIA                                    ', 'Créditos', 501, 'O');
INSERT INTO curso VALUES (2014, 'NEUROLOGIA                                     ', 'Créditos', 3292, 'N');
INSERT INTO curso VALUES (2015, 'ODONTOLOGIA                                    ', 'Créditos', 6358, 'O');
INSERT INTO curso VALUES (2016, 'ENGENHARIA CIVIL                               ', 'Créditos', 8747, 'EC');
INSERT INTO curso VALUES (2017, 'CIÊNCIAS NATURAIS                              ', 'Créditos', 509, 'CN');
INSERT INTO curso VALUES (2018, 'BIOINFORMÁTICA                                 ', 'Créditos', 2164, 'B');
INSERT INTO curso VALUES (2019, 'CIRURGIA                                       ', 'Créditos', 8508, 'C');
INSERT INTO curso VALUES (2020, 'OFTALMOLOGIA                                   ', 'Créditos', 8447, 'O');
INSERT INTO curso VALUES (2021, 'ENGENHARIA AMBIENTAL                           ', 'Créditos', 7467, 'EA');
INSERT INTO curso VALUES (2022, 'CLÍNICA ODONTOLÓGICA                           ', 'Créditos', 8630, 'CO');
INSERT INTO curso VALUES (2023, 'LETRAS                                         ', 'Créditos', 2540, 'L');
INSERT INTO curso VALUES (2024, 'TURISMO E MEIO AMBIENTE                        ', 'Créditos', 9607, 'TEMA');
INSERT INTO curso VALUES (2025, 'CIÊNCIAS DA SAÚDE                              ', 'Créditos', 2359, 'CDS');
INSERT INTO curso VALUES (2026, 'ENGENHARIA DE SISTEMAS LOGÍSTICOS              ', 'Créditos', 1209, 'EDSL');
INSERT INTO curso VALUES (2027, 'ADMINISTRAÇÃO DE ORGANIZAÇÕES                  ', 'Créditos', 6248, 'ADO');
INSERT INTO curso VALUES (2028, 'ENSINO E HISTÓRIA DE CIÊNCIAS DA TERRA         ', 'Créditos', 7153, 'EEHD');
INSERT INTO curso VALUES (2029, '''RELAÇÕES INTERNACIONAIS (UNESP/UNICAMP/PUC-SP)', 'Créditos', 4299, 'I');
INSERT INTO curso VALUES (2030, 'INFORMÁTICA EM SAÚDE                           ', 'Créditos', 2345, 'IES');
INSERT INTO curso VALUES (2031, 'MEDICINA (DERMATOLOGIA CLÍNICA E CIRÚRGICA)    ', 'Créditos', 96, 'MCEC');
INSERT INTO curso VALUES (2032, 'ENSINO EM CIÊNCIAS DA SAÚDE                    ', 'Créditos', 8723, 'EECD');
INSERT INTO curso VALUES (2033, 'REABILITAÇÃO                                   ', 'Créditos', 7545, 'R');
INSERT INTO curso VALUES (2034, 'GESTÃO DE NEGÓCIOS                             ', 'Créditos', 4795, 'GDN');
INSERT INTO curso VALUES (2035, 'COMUNICAÇÃO                                    ', 'Créditos', 5435, 'C');
INSERT INTO curso VALUES (2036, 'PRODUÇÃO INTEGRADA EM AGROECOSSISTEMAS         ', 'Créditos', 8119, 'PIEA');
INSERT INTO curso VALUES (2037, 'CIÊNCIAS DA SAÚDE                              ', 'Créditos', 1800, 'CDS');
INSERT INTO curso VALUES (2038, 'EDUCAÇÃO, ADMINISTRAÇÃO E COMUNICAÇÃO          ', 'Créditos', 7903, 'EAEC');
INSERT INTO curso VALUES (2039, 'FÍSICA E ASTRONOMIA                            ', 'Créditos', 3349, 'FEA');
INSERT INTO curso VALUES (2040, 'EDUCAÇÃO                                       ', 'Créditos', 8034, 'E');
INSERT INTO curso VALUES (2041, 'MEDICINA VETERINÁRIA                           ', 'Créditos', 2289, 'MV');
INSERT INTO curso VALUES (2042, 'FILOSOFIA                                      ', 'Créditos', 1701, 'F');
INSERT INTO curso VALUES (2043, 'EDUCAÇÃO FÍSICA                                ', 'Créditos', 9403, 'EF');
INSERT INTO curso VALUES (2044, 'ODONTOLOGIA                                    ', 'Créditos', 6967, 'O');
INSERT INTO curso VALUES (2045, 'CIÊNCIAS                                       ', 'Créditos', 8640, 'C');


--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 178
-- Name: curso_curso_id_seq_1; Type: SEQUENCE SET; Schema: flash; Owner: postgres
--

SELECT pg_catalog.setval('curso_curso_id_seq_1', 2045, true);


--
-- TOC entry 2174 (class 0 OID 27759)
-- Dependencies: 179
-- Data for Name: dia_semana; Type: TABLE DATA; Schema: flash; Owner: postgres
--

INSERT INTO dia_semana VALUES (1, 'Domingo');
INSERT INTO dia_semana VALUES (2, 'Segunda-feira');
INSERT INTO dia_semana VALUES (3, 'Terça-feira');
INSERT INTO dia_semana VALUES (4, 'Quarta-feira');
INSERT INTO dia_semana VALUES (5, 'Quinta-feira');
INSERT INTO dia_semana VALUES (6, 'Sexta-feira');
INSERT INTO dia_semana VALUES (7, 'Sábado');


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 180
-- Name: dia_semana_dia_semana_id_seq_1; Type: SEQUENCE SET; Schema: flash; Owner: postgres
--

SELECT pg_catalog.setval('dia_semana_dia_semana_id_seq_1', 7, true);


--
-- TOC entry 2176 (class 0 OID 27767)
-- Dependencies: 181
-- Data for Name: disciplina; Type: TABLE DATA; Schema: flash; Owner: postgres
--

INSERT INTO disciplina VALUES (1, 'Lógica', 60, 1, 1, 2);
INSERT INTO disciplina VALUES (2, 'Cálculo 1', 90, 1, 1, 2);
INSERT INTO disciplina VALUES (3, 'Programação 1', 90, 1, 1, 1313);
INSERT INTO disciplina VALUES (4, 'Comunicação Empresarial', 30, 1, 1, 1071);
INSERT INTO disciplina VALUES (5, 'Fundamentos de Sistemas de Informação', 60, 1, 1, 1312);
INSERT INTO disciplina VALUES (6, 'Metodologia da Pesquisa', 30, 1, 1, 1071);
INSERT INTO disciplina VALUES (7, 'Matemática Discreta', 60, 2, 1, 2);
INSERT INTO disciplina VALUES (8, 'Cálculo 2', 90, 2, 1, 2);
INSERT INTO disciplina VALUES (9, 'Programação 2', 90, 2, 1, 1313);
INSERT INTO disciplina VALUES (10, 'Arquitetura e Organização de Computadores', 60, 2, 1, 1312);
INSERT INTO disciplina VALUES (11, 'Teoria Geral da Administração', 60, 2, 1, 1315);
INSERT INTO disciplina VALUES (12, 'Probabilidade e Estatística', 60, 3, 1, 2);
INSERT INTO disciplina VALUES (13, 'Estrutura de Dados', 60, 3, 1, 1313);
INSERT INTO disciplina VALUES (14, 'Teoria Geral de Sistemas', 60, 3, 1, 1312);
INSERT INTO disciplina VALUES (15, 'Sistemas Operacionais', 60, 3, 1, 1314);
INSERT INTO disciplina VALUES (16, 'Administração Financeira', 60, 3, 1, 1315);
INSERT INTO disciplina VALUES (17, 'Banco de Dados 1', 60, 4, 1, 58);
INSERT INTO disciplina VALUES (18, 'Programação Orientada a Objetos 1', 60, 4, 1, 1313);
INSERT INTO disciplina VALUES (19, 'Análise de Sistemas', 60, 4, 1, 57);
INSERT INTO disciplina VALUES (20, 'Sistemas de Apoio a Decisão', 30, 4, 1, 57);
INSERT INTO disciplina VALUES (21, 'Redes de Computadores', 60, 4, 1, 1314);
INSERT INTO disciplina VALUES (22, 'Sociologia', 30, 4, 1, 1071);
INSERT INTO disciplina VALUES (23, 'Linguagens Formais e Autômatos', 60, 5, 1, 1312);
INSERT INTO disciplina VALUES (24, 'Banco de Dados 2', 60, 5, 1, 58);
INSERT INTO disciplina VALUES (25, 'Programação Orientada a Objetos 2', 60, 5, 1, 1313);
INSERT INTO disciplina VALUES (26, 'Engenharia de Software', 60, 5, 1, 57);
INSERT INTO disciplina VALUES (27, 'Projeto de Sistemas', 60, 5, 1, 57);
INSERT INTO disciplina VALUES (28, 'Anteprojeto', 30, 6, 1, 1316);
INSERT INTO disciplina VALUES (29, 'Empreendedorismo', 60, 6, 1, 1316);
INSERT INTO disciplina VALUES (30, 'Técnicas de Programação Avançada', 60, 6, 1, 1313);
INSERT INTO disciplina VALUES (31, 'Gerência de Projetos de Software', 60, 6, 1, 57);
INSERT INTO disciplina VALUES (32, 'Sistemas Distribuidos', 60, 6, 1, 1314);
INSERT INTO disciplina VALUES (33, 'Administração da Produção e Logística', 30, 6, 1, 1315);
INSERT INTO disciplina VALUES (34, 'Projeto de Diplomação 1', 60, 7, 1, 1316);
INSERT INTO disciplina VALUES (35, 'Laboratório de Engenharia de Software', 60, 7, 1, 57);
INSERT INTO disciplina VALUES (36, 'Comércio Eletrônico', 60, 7, 1, 1314);
INSERT INTO disciplina VALUES (37, 'Desenvolvimento Web', 60, 7, 1, 1314);
INSERT INTO disciplina VALUES (38, 'Gestão de Sistemas de Informação', 60, 7, 1, 57);
INSERT INTO disciplina VALUES (39, 'Projeto de Diplomação 2', 90, 8, 1, 1316);
INSERT INTO disciplina VALUES (40, 'Ética e Legislação', 30, 8, 1, 1071);
INSERT INTO disciplina VALUES (41, 'Informática e Sociedade', 30, 8, 1, 1071);


--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 182
-- Name: disciplina_disciplina_id_seq; Type: SEQUENCE SET; Schema: flash; Owner: postgres
--

SELECT pg_catalog.setval('disciplina_disciplina_id_seq', 41, true);


--
-- TOC entry 2178 (class 0 OID 27775)
-- Dependencies: 183
-- Data for Name: endereco; Type: TABLE DATA; Schema: flash; Owner: postgres
--

INSERT INTO endereco VALUES (1, 'Georgia', 'Washington', '580 Fahey Inlet', 768, '94755');
INSERT INTO endereco VALUES (2, 'Pennsylvania', 'San Francisco', '78021 Effie Meadows', 102, '41683');
INSERT INTO endereco VALUES (3, 'Arkansas', 'Washington', '052 Bins Pine', 63, '19578');
INSERT INTO endereco VALUES (4, 'Idaho', 'Miami', '881 Clint Square', 788, '08097');
INSERT INTO endereco VALUES (5, 'Mississippi', 'Miami', '1088 Balistreri Ranch', 990, '36579');
INSERT INTO endereco VALUES (6, 'Connecticut', 'San Francisco', '628 Hegmann Prairie', 783, '49950');
INSERT INTO endereco VALUES (7, 'Kentucky', 'Miami', '893 Kreiger Ville', 863, '45250');
INSERT INTO endereco VALUES (8, 'Colorado', 'Miami', '5832 Gerson Street', 8, '87912');
INSERT INTO endereco VALUES (9, 'Hawaii', 'Washington', '162 Purdy Curve', 906, '66088');
INSERT INTO endereco VALUES (10, 'Pennsylvania', 'Washington', '32653 Konopelski Views', 374, '16810');
INSERT INTO endereco VALUES (11, 'Indiana', 'Washington', '7680 Harry Common', 83, '18764');
INSERT INTO endereco VALUES (12, 'North Dakota', 'Washington', '098 Conor Centers', 950, '11102');
INSERT INTO endereco VALUES (13, 'Oregon', 'Miami', '88095 Hauck Spring', 581, '64625');
INSERT INTO endereco VALUES (14, 'Louisiana', 'Washington', '90190 Runte Landing', 323, '62594');
INSERT INTO endereco VALUES (15, 'Washington', 'Miami', '716 Waters Fields', 116, '53422');
INSERT INTO endereco VALUES (16, 'Wyoming', 'San Francisco', '3955 Frami Lake', 106, '37394');
INSERT INTO endereco VALUES (17, 'New York', 'San Francisco', '961 Edgar Rest', 769, '02774');
INSERT INTO endereco VALUES (18, 'Illinois', 'New York', '33633 Wellington Circle', 969, '16731');
INSERT INTO endereco VALUES (19, 'New Mexico', 'Miami', '7676 Ruecker Keys', 448, '86443');
INSERT INTO endereco VALUES (20, 'Alaska', 'New York', '916 Hoyt Roads', 347, '48846');
INSERT INTO endereco VALUES (21, 'Vermont', 'Miami', '382 Schumm Neck', 171, '57299');
INSERT INTO endereco VALUES (22, 'Delaware', 'New York', '50754 Bartell Burgs', 680, '81319');
INSERT INTO endereco VALUES (23, 'Wyoming', 'Miami', '725 Adele Shoals', 965, '91880');
INSERT INTO endereco VALUES (24, 'Pennsylvania', 'New York', '909 Bayer Way', 960, '87847');
INSERT INTO endereco VALUES (25, 'Wisconsin', 'Washington', '187 Bryana Turnpike', 608, '46940');
INSERT INTO endereco VALUES (26, 'Alabama', 'San Francisco', '9999 Stroman Club', 612, '79714');
INSERT INTO endereco VALUES (27, 'Vermont', 'Miami', '61344 Cleo Spring', 495, '21580');
INSERT INTO endereco VALUES (28, 'Missouri', 'Miami', '250 Wintheiser Vista', 916, '55871');
INSERT INTO endereco VALUES (29, 'Oklahoma', 'New York', '64362 Hertha Circle', 575, '35425');
INSERT INTO endereco VALUES (30, 'Georgia', 'San Francisco', '300 Allen Extensions', 462, '93305');
INSERT INTO endereco VALUES (31, 'Texas', 'New York', '57017 Brock Pines', 463, '35430');
INSERT INTO endereco VALUES (32, 'Wyoming', 'Miami', '60940 Katlyn Stream', 443, '14121');
INSERT INTO endereco VALUES (33, 'Hawaii', 'Miami', '3304 Schmidt Squares', 271, '75283');
INSERT INTO endereco VALUES (34, 'Montana', 'New York', '81976 Aliya Valley', 985, '31578');
INSERT INTO endereco VALUES (35, 'Missouri', 'San Francisco', '6202 River Divide', 83, '02667');
INSERT INTO endereco VALUES (36, 'North Dakota', 'San Francisco', '055 Mandy Fields', 412, '21792');
INSERT INTO endereco VALUES (37, 'Hawaii', 'Miami', '98022 Garrick Island', 128, '58277');
INSERT INTO endereco VALUES (38, 'Missouri', 'Miami', '217 Sandra Ways', 64, '70299');
INSERT INTO endereco VALUES (39, 'Tennessee', 'San Francisco', '25859 Titus Parkway', 683, '18278');
INSERT INTO endereco VALUES (40, 'Missouri', 'Washington', '6341 Danny Estates', 469, '27278');
INSERT INTO endereco VALUES (41, 'Arizona', 'San Francisco', '201 Hamill Land', 783, '75081');
INSERT INTO endereco VALUES (42, 'Wyoming', 'Miami', '0719 Scottie Plain', 73, '79248');
INSERT INTO endereco VALUES (43, 'Missouri', 'San Francisco', '19106 Kozey Squares', 611, '07206');
INSERT INTO endereco VALUES (44, 'Indiana', 'San Francisco', '05305 Purdy Locks', 520, '34608');
INSERT INTO endereco VALUES (45, 'Colorado', 'Miami', '787 Linda Squares', 238, '72210');
INSERT INTO endereco VALUES (46, 'Mississippi', 'Miami', '187 Shaylee Flats', 476, '56718');
INSERT INTO endereco VALUES (47, 'Oregon', 'Miami', '9349 Hammes Light', 315, '40188');
INSERT INTO endereco VALUES (48, 'Colorado', 'Miami', '7498 Marley Stream', 562, '94819');
INSERT INTO endereco VALUES (49, 'New Mexico', 'New York', '9791 Renner Roads', 892, '30565');
INSERT INTO endereco VALUES (50, 'New Mexico', 'Miami', '0805 Ryan Highway', 60, '44624');
INSERT INTO endereco VALUES (51, 'Montana', 'Miami', '0621 Garett Mountains', 550, '75895');
INSERT INTO endereco VALUES (52, 'New Mexico', 'Miami', '33536 Dagmar Brook', 809, '49448');
INSERT INTO endereco VALUES (53, 'South Carolina', 'Washington', '1835 Sim Shore', 416, '01896');
INSERT INTO endereco VALUES (54, 'Ohio', 'San Francisco', '5714 McClure Gardens', 374, '36500');
INSERT INTO endereco VALUES (55, 'Nebraska', 'Miami', '23398 Jaleel Burg', 626, '95309');
INSERT INTO endereco VALUES (56, 'Wyoming', 'Miami', '8762 Streich Islands', 9, '02353');
INSERT INTO endereco VALUES (57, 'Texas', 'Washington', '442 Cletus Wells', 908, '89875');
INSERT INTO endereco VALUES (58, 'North Carolina', 'New York', '877 Jacklyn Route', 984, '04844');
INSERT INTO endereco VALUES (59, 'Arkansas', 'Washington', '731 Shields Path', 288, '19217');
INSERT INTO endereco VALUES (60, 'Colorado', 'Washington', '0458 Becker Lake', 125, '84608');
INSERT INTO endereco VALUES (61, 'Oregon', 'Miami', '49048 Ashlee Lake', 171, '39810');
INSERT INTO endereco VALUES (62, 'Oklahoma', 'San Francisco', '549 Blick Radial', 357, '64321');
INSERT INTO endereco VALUES (63, 'Maine', 'New York', '476 Keira Landing', 403, '06799');
INSERT INTO endereco VALUES (64, 'Vermont', 'San Francisco', '1488 Wilfredo Viaduct', 309, '38396');
INSERT INTO endereco VALUES (65, 'Nevada', 'Washington', '1895 Schmitt Lake', 188, '24019');
INSERT INTO endereco VALUES (66, 'Florida', 'Miami', '8058 Lue Harbors', 699, '41064');
INSERT INTO endereco VALUES (67, 'Arkansas', 'San Francisco', '23337 Jayson Parkways', 568, '42998');
INSERT INTO endereco VALUES (68, 'Pennsylvania', 'New York', '07062 Medhurst Corners', 133, '68459');
INSERT INTO endereco VALUES (69, 'Wyoming', 'San Francisco', '06152 Olson Trace', 861, '30043');
INSERT INTO endereco VALUES (70, 'Vermont', 'New York', '3687 Norbert Spring', 423, '00492');
INSERT INTO endereco VALUES (71, 'Maryland', 'New York', '92062 Cameron Tunnel', 346, '15934');
INSERT INTO endereco VALUES (72, 'Rhode Island', 'San Francisco', '7141 Ziemann Lakes', 407, '02042');
INSERT INTO endereco VALUES (73, 'North Dakota', 'Washington', '9888 Ryan Manor', 782, '06351');
INSERT INTO endereco VALUES (74, 'South Dakota', 'Miami', '58164 Ratke Orchard', 984, '31499');
INSERT INTO endereco VALUES (75, 'Arkansas', 'Miami', '8199 Gutmann Summit', 870, '27565');
INSERT INTO endereco VALUES (76, 'Oklahoma', 'Washington', '9027 Jaleel Tunnel', 16, '52546');
INSERT INTO endereco VALUES (77, 'California', 'San Francisco', '6532 Roselyn Walks', 897, '67058');
INSERT INTO endereco VALUES (78, 'Alabama', 'Miami', '449 Rutherford Fort', 748, '47635');
INSERT INTO endereco VALUES (79, 'Alabama', 'Washington', '09656 Barton Squares', 875, '27031');
INSERT INTO endereco VALUES (80, 'Kansas', 'Miami', '402 Crona Roads', 939, '42562');
INSERT INTO endereco VALUES (81, 'Alaska', 'New York', '5176 Whitney Key', 82, '59190');
INSERT INTO endereco VALUES (82, 'Montana', 'Miami', '9943 Marta Ranch', 605, '87748');
INSERT INTO endereco VALUES (83, 'Georgia', 'San Francisco', '585 Berge Divide', 345, '35439');
INSERT INTO endereco VALUES (84, 'Washington', 'San Francisco', '80224 Ziemann Lodge', 543, '18599');
INSERT INTO endereco VALUES (85, 'Massachusetts', 'Miami', '762 Andre Wall', 38, '30463');
INSERT INTO endereco VALUES (86, 'Nebraska', 'Miami', '009 Halvorson Islands', 183, '51018');
INSERT INTO endereco VALUES (87, 'Pennsylvania', 'San Francisco', '20338 Waelchi Prairie', 562, '42023');
INSERT INTO endereco VALUES (88, 'Indiana', 'New York', '691 Abshire Common', 323, '14955');
INSERT INTO endereco VALUES (89, 'Connecticut', 'Washington', '1505 Oma Fall', 874, '33436');
INSERT INTO endereco VALUES (90, 'Hawaii', 'New York', '35564 Juston Turnpike', 609, '85522');
INSERT INTO endereco VALUES (91, 'California', 'New York', '25412 Anderson Lodge', 425, '45824');
INSERT INTO endereco VALUES (92, 'Massachusetts', 'San Francisco', '919 Walter Villages', 58, '00445');
INSERT INTO endereco VALUES (93, 'Arkansas', 'New York', '215 Dibbert Fields', 120, '16542');
INSERT INTO endereco VALUES (94, 'Alabama', 'San Francisco', '058 Coty Spurs', 265, '29524');
INSERT INTO endereco VALUES (95, 'Massachusetts', 'Washington', '7458 Mayert Springs', 914, '30177');
INSERT INTO endereco VALUES (96, 'Wyoming', 'San Francisco', '3442 Santiago Ferry', 202, '68267');
INSERT INTO endereco VALUES (97, 'California', 'Miami', '058 Aileen Well', 866, '81395');
INSERT INTO endereco VALUES (98, 'Rhode Island', 'San Francisco', '15897 Harris Center', 700, '97114');
INSERT INTO endereco VALUES (99, 'Hawaii', 'San Francisco', '0564 Manley Orchard', 945, '71470');
INSERT INTO endereco VALUES (100, 'Georgia', 'Miami', '65333 Bechtelar Via', 797, '07986');


--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 184
-- Name: endereco_endereco_id_seq_1; Type: SEQUENCE SET; Schema: flash; Owner: postgres
--

SELECT pg_catalog.setval('endereco_endereco_id_seq_1', 3000, true);


--
-- TOC entry 2180 (class 0 OID 27783)
-- Dependencies: 185
-- Data for Name: espaco; Type: TABLE DATA; Schema: flash; Owner: postgres
--

INSERT INTO espaco VALUES (1, '1', 101, 1);
INSERT INTO espaco VALUES (2, '1', 102, 2);
INSERT INTO espaco VALUES (3, '1', 103, 1);
INSERT INTO espaco VALUES (4, '1', 104, 1);
INSERT INTO espaco VALUES (5, '1', 105, 1);
INSERT INTO espaco VALUES (6, '1', 106, 1);
INSERT INTO espaco VALUES (7, '1', 107, 1);
INSERT INTO espaco VALUES (8, '1', 108, 2);
INSERT INTO espaco VALUES (9, '1', 109, 1);
INSERT INTO espaco VALUES (10, '2', 201, 1);
INSERT INTO espaco VALUES (11, '2', 202, 1);
INSERT INTO espaco VALUES (12, '2', 203, 1);
INSERT INTO espaco VALUES (13, '2', 204, 1);
INSERT INTO espaco VALUES (14, '2', 205, 1);
INSERT INTO espaco VALUES (15, '2', 206, 1);
INSERT INTO espaco VALUES (16, '2', 207, 1);
INSERT INTO espaco VALUES (17, '2', 208, 1);
INSERT INTO espaco VALUES (18, '2', 209, 1);
INSERT INTO espaco VALUES (19, '3', 301, 1);
INSERT INTO espaco VALUES (20, '3', 302, 1);
INSERT INTO espaco VALUES (21, '3', 303, 1);
INSERT INTO espaco VALUES (22, '3', 304, 1);
INSERT INTO espaco VALUES (23, '3', 305, 1);
INSERT INTO espaco VALUES (24, '3', 306, 2);
INSERT INTO espaco VALUES (25, '3', 307, 1);
INSERT INTO espaco VALUES (26, '3', 308, 1);
INSERT INTO espaco VALUES (27, '3', 309, 2);
INSERT INTO espaco VALUES (28, '4', 401, 1);
INSERT INTO espaco VALUES (29, '4', 402, 2);
INSERT INTO espaco VALUES (30, '4', 403, 1);
INSERT INTO espaco VALUES (31, '4', 404, 2);
INSERT INTO espaco VALUES (32, '4', 405, 1);
INSERT INTO espaco VALUES (33, '4', 406, 1);
INSERT INTO espaco VALUES (34, '4', 407, 1);
INSERT INTO espaco VALUES (35, '4', 408, 2);
INSERT INTO espaco VALUES (36, '4', 409, 1);
INSERT INTO espaco VALUES (37, '7', 701, 1);
INSERT INTO espaco VALUES (38, '7', 702, 2);
INSERT INTO espaco VALUES (39, '7', 703, 2);
INSERT INTO espaco VALUES (40, '7', 704, 2);
INSERT INTO espaco VALUES (41, '7', 705, 1);
INSERT INTO espaco VALUES (42, '7', 706, 1);
INSERT INTO espaco VALUES (43, '7', 707, 1);
INSERT INTO espaco VALUES (44, '7', 708, 1);
INSERT INTO espaco VALUES (45, '7', 709, 1);


--
-- TOC entry 2189 (class 0 OID 28149)
-- Dependencies: 196
-- Data for Name: horario; Type: TABLE DATA; Schema: flash; Owner: postgres
--



--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 195
-- Name: horario_horario_id_seq; Type: SEQUENCE SET; Schema: flash; Owner: postgres
--

SELECT pg_catalog.setval('horario_horario_id_seq', 1, false);


--
-- TOC entry 2181 (class 0 OID 27794)
-- Dependencies: 186
-- Data for Name: professor; Type: TABLE DATA; Schema: flash; Owner: postgres
--

INSERT INTO professor VALUES (1, 'Sofia Barker', 'luke.ratliff@yahoo.com', '2002-01-25', '141-33-9280', '82310832782', '549718', 1);
INSERT INTO professor VALUES (2, 'Jackson Summers', 'wolf@gmail.com', '1942-08-12', '507-72-6251', '42677376652', '990716', 2);
INSERT INTO professor VALUES (3, 'Lucas Santos', 'solomon@yahoo.com', '1942-02-02', '747-22-8418', '80601235568', '686938', 3);
INSERT INTO professor VALUES (4, 'Brooklyn Church', 'luke.trujillo@mail.com', '1953-06-07', '118-73-3864', '62548709590', '069547', 4);
INSERT INTO professor VALUES (5, 'Reagan Griffith', 'blake@gmail.com', '2005-01-04', '178-77-3235', '80608598623', '769545', 5);
INSERT INTO professor VALUES (6, 'Josiah Gibbs', 'talley@mail.com', '1995-09-26', '347-99-6908', '68113651535', '810264', 6);
INSERT INTO professor VALUES (7, 'Alex Cotton', 'wilder@yahoo.com', '1955-09-25', '602-13-4429', '03490504305', '210224', 7);
INSERT INTO professor VALUES (8, 'Gabriella Douglas', 'justice@yahoo.com', '1974-05-29', '179-64-2889', '13530876461', '923256', 8);
INSERT INTO professor VALUES (9, 'Violet Pitts', 'lucas@yahoo.com', '1999-05-07', '073-52-6234', '08028313035', '054648', 9);
INSERT INTO professor VALUES (10, 'Owen Dale', 'samuelbullock@yahoo.com', '1972-05-29', '115-40-4230', '88024724243', '032601', 10);
INSERT INTO professor VALUES (11, 'Austin Moss', 'olson@mail.com', '1937-05-15', '562-11-7791', '49838500666', '014885', 11);
INSERT INTO professor VALUES (12, 'Charles Tucker', 'hanson@yahoo.com', '1970-12-24', '867-51-0153', '71586514954', '893125', 12);
INSERT INTO professor VALUES (13, 'Kylie Dickerson', 'porter@gmail.com', '1963-07-13', '710-22-0347', '70611707276', '689915', 13);
INSERT INTO professor VALUES (14, 'Ariana Santiago', 'wood@gmail.com', '1978-05-08', '152-69-0650', '21177944910', '933127', 14);
INSERT INTO professor VALUES (15, 'Thomas Avila', 'alexa.kirby@gmail.com', '1986-12-20', '371-77-6925', '62658853084', '325107', 15);
INSERT INTO professor VALUES (16, 'Henry Herring', 'abbott@mail.com', '1964-09-11', '841-67-5290', '73687104710', '032953', 16);
INSERT INTO professor VALUES (17, 'Levi Horn', 'isaac.chapman@mail.com', '2011-05-03', '123-97-4674', '07449737833', '193457', 17);
INSERT INTO professor VALUES (18, 'Samuel Rivera', 'mia.walter@gmail.com', '1993-04-08', '174-17-9199', '21562964801', '583179', 18);
INSERT INTO professor VALUES (19, 'Gavin Hyde', 'briannalawrence@yahoo.com', '1944-02-09', '631-28-8498', '38347003394', '970718', 19);
INSERT INTO professor VALUES (20, 'Savannah Vargas', 'james.mack@yahoo.com', '1932-12-09', '389-61-0809', '32176523717', '578596', 20);
INSERT INTO professor VALUES (21, 'Alexa Lane', 'elijahsolis@yahoo.com', '1928-09-05', '447-35-9815', '49186459767', '748187', 21);
INSERT INTO professor VALUES (22, 'Aiden Lyons', 'oliver.kramer@mail.com', '1983-02-03', '001-92-1188', '43643929951', '937475', 22);
INSERT INTO professor VALUES (23, 'Mia Mcfadden', 'coffey@gmail.com', '1970-08-22', '673-04-4444', '55063932452', '715642', 23);
INSERT INTO professor VALUES (24, 'Colton Rodriquez', 'webster@gmail.com', '1944-06-20', '736-83-9570', '97117803720', '800117', 24);
INSERT INTO professor VALUES (25, 'Wyatt Pitts', 'dotson@mail.com', '1927-10-11', '751-39-7100', '52706310405', '812061', 25);
INSERT INTO professor VALUES (26, 'Bailey Clarke', 'roy@gmail.com', '1916-01-13', '866-05-6564', '67447667242', '601943', 26);
INSERT INTO professor VALUES (27, 'Molly Clay', 'cantu@gmail.com', '1944-06-18', '863-64-5383', '31847374204', '730258', 27);
INSERT INTO professor VALUES (28, 'Allison Anderson', 'kirby@gmail.com', '1936-04-13', '838-90-6529', '55040444214', '428520', 28);
INSERT INTO professor VALUES (29, 'Emma Perez', 'castillo@yahoo.com', '1971-03-16', '585-81-7553', '22823024867', '968352', 29);
INSERT INTO professor VALUES (30, 'Aubree Flynn', 'clarke@yahoo.com', '2002-11-08', '710-73-5109', '89814307483', '299040', 30);
INSERT INTO professor VALUES (31, 'Angel Mueller', 'merritt@gmail.com', '1963-11-12', '158-48-1161', '33193076066', '332249', 31);
INSERT INTO professor VALUES (32, 'Zoe Marquez', 'schmidt@gmail.com', '1963-05-22', '104-58-7059', '09317871577', '898055', 32);
INSERT INTO professor VALUES (33, 'Madelyn Bartlett', 'valencia@gmail.com', '2005-04-09', '488-31-5277', '18388542907', '271853', 33);
INSERT INTO professor VALUES (34, 'Madeline Carroll', 'salas@gmail.com', '1986-02-22', '448-01-2933', '41562663895', '835291', 34);
INSERT INTO professor VALUES (35, 'Julian Williamson', 'dorsey@yahoo.com', '1997-11-09', '574-91-0733', '64829049120', '592873', 35);
INSERT INTO professor VALUES (36, 'Alexa Peterson', 'brooklyncole@mail.com', '2009-05-30', '840-28-2484', '67452979907', '348158', 36);
INSERT INTO professor VALUES (37, 'Violet Langley', 'ella.stephenson@gmail.com', '1947-06-15', '687-49-5588', '34990508467', '929153', 37);
INSERT INTO professor VALUES (38, 'Arianna Deleon', 'petty@gmail.com', '1982-03-26', '207-33-0337', '10876341644', '962999', 38);
INSERT INTO professor VALUES (39, 'Morgan Ewing', 'abigail.delgado@yahoo.com', '2005-08-15', '231-28-7335', '93337190839', '376080', 39);
INSERT INTO professor VALUES (40, 'Cameron Boone', 'chen@gmail.com', '1948-05-29', '620-27-5615', '60280680473', '246610', 40);
INSERT INTO professor VALUES (41, 'Austin Richmond', 'ariafrank@gmail.com', '2005-08-04', '790-01-3278', '77434414235', '312625', 41);
INSERT INTO professor VALUES (42, 'Kevin Wyatt', 'owengay@yahoo.com', '1985-05-22', '108-73-5550', '24705705491', '909501', 42);
INSERT INTO professor VALUES (43, 'Nathaniel Mccarthy', 'miamcguire@gmail.com', '1929-04-11', '459-38-9952', '74672949214', '663831', 43);
INSERT INTO professor VALUES (44, 'Jason Price', 'nolan@yahoo.com', '1968-09-04', '082-96-2829', '48721876444', '263472', 44);
INSERT INTO professor VALUES (45, 'Hunter Gonzalez', 'oliverchristensen@mail.com', '1925-06-24', '512-77-9018', '99996690342', '128587', 45);
INSERT INTO professor VALUES (46, 'Melanie Britt', 'henry.trujillo@yahoo.com', '1941-12-13', '176-01-2495', '45544889007', '792698', 46);
INSERT INTO professor VALUES (47, 'Justin Berger', 'chloesimmons@mail.com', '1937-03-27', '788-42-3990', '06271529615', '955575', 47);
INSERT INTO professor VALUES (48, 'Gavin Bowman', 'frederick@gmail.com', '2009-03-12', '820-95-4651', '66223343906', '866916', 48);
INSERT INTO professor VALUES (49, 'Wyatt Aguirre', 'calderon@gmail.com', '2012-03-24', '068-20-5315', '35016847975', '480572', 49);
INSERT INTO professor VALUES (50, 'Madison Aguilar', 'brodybentley@mail.com', '1947-07-15', '183-81-6199', '70552044539', '374410', 50);
INSERT INTO professor VALUES (51, 'Nicholas Glenn', 'oliver@gmail.com', '1996-08-20', '677-18-2754', '00124757421', '884829', 51);
INSERT INTO professor VALUES (52, 'Jackson Austin', 'sophia.blankenship@yahoo.com', '1964-03-29', '641-56-7403', '68329047709', '208984', 52);
INSERT INTO professor VALUES (53, 'Gabriel Williams', 'addison.gates@gmail.com', '1995-09-24', '604-17-9881', '81957799560', '085254', 53);
INSERT INTO professor VALUES (54, 'Xavier Mccoy', 'montgomery@mail.com', '1943-08-08', '803-76-9159', '50099297914', '779201', 54);
INSERT INTO professor VALUES (55, 'Robert Houston', 'austin.lott@mail.com', '1979-08-17', '861-65-1672', '25354405556', '797200', 55);
INSERT INTO professor VALUES (56, 'Ella Roy', 'robbins@gmail.com', '1939-05-05', '691-59-7751', '97980958390', '118753', 56);
INSERT INTO professor VALUES (57, 'Landon Hood', 'jasonreynolds@mail.com', '1961-01-10', '072-30-2183', '12878705467', '840726', 57);
INSERT INTO professor VALUES (58, 'Nathaniel Hughes', 'oliver.mccray@gmail.com', '1954-09-01', '729-34-3583', '94730389689', '937693', 58);
INSERT INTO professor VALUES (59, 'Lillian Weeks', 'smith@mail.com', '2010-12-19', '379-23-8515', '72754759441', '936713', 59);
INSERT INTO professor VALUES (60, 'Trinity Bush', 'samanthawood@gmail.com', '2013-02-13', '625-60-4420', '08684057368', '173216', 60);
INSERT INTO professor VALUES (61, 'Cameron Blankenship', 'barron@gmail.com', '1941-11-22', '844-27-0472', '19606012700', '718340', 61);
INSERT INTO professor VALUES (62, 'Gianna Dale', 'jasmine.mayer@mail.com', '1976-05-07', '747-29-8206', '30076236188', '141363', 62);
INSERT INTO professor VALUES (63, 'Robert Delacruz', 'genesis.keller@yahoo.com', '1997-03-17', '885-55-1897', '90062414585', '163612', 63);
INSERT INTO professor VALUES (64, 'Colton Conley', 'stephenson@gmail.com', '1930-04-13', '450-74-0034', '62970337304', '052638', 64);
INSERT INTO professor VALUES (65, 'Luke Mcmahon', 'mills@gmail.com', '1924-12-02', '861-63-1933', '66714637357', '884625', 65);
INSERT INTO professor VALUES (66, 'Khloe Barnes', 'booth@gmail.com', '1944-02-06', '405-38-1827', '46664230100', '037710', 66);
INSERT INTO professor VALUES (67, 'Morgan Hopkins', 'eva.mendoza@mail.com', '1934-05-29', '016-93-2923', '98168175271', '818623', 67);
INSERT INTO professor VALUES (68, 'Allison Pruitt', 'waters@gmail.com', '2003-07-13', '343-33-4599', '84203464625', '952932', 68);
INSERT INTO professor VALUES (69, 'Ayden Gross', 'strickland@yahoo.com', '1989-06-17', '400-82-6037', '29411015271', '098000', 69);
INSERT INTO professor VALUES (70, 'Bailey Bean', 'berg@gmail.com', '2012-10-07', '221-25-6002', '90791816761', '568291', 70);
INSERT INTO professor VALUES (71, 'Hudson Todd', 'ramos@mail.com', '1924-05-20', '003-40-3650', '52096233437', '378213', 71);
INSERT INTO professor VALUES (72, 'Kylie Bailey', 'hooper@yahoo.com', '1969-02-13', '645-48-1556', '69584668536', '502518', 72);
INSERT INTO professor VALUES (73, 'Aiden Vega', 'long@mail.com', '1981-01-25', '293-11-2638', '60159854962', '688429', 73);
INSERT INTO professor VALUES (74, 'Lydia Fisher', 'annabonner@gmail.com', '1999-10-30', '893-40-3696', '19338724972', '108487', 74);
INSERT INTO professor VALUES (75, 'Nicholas Mccall', 'elijahvalentine@gmail.com', '1986-11-21', '859-79-0319', '15814744901', '099566', 75);
INSERT INTO professor VALUES (76, 'Isaiah Briggs', 'spears@mail.com', '1967-12-07', '450-36-1661', '31987101111', '761234', 76);
INSERT INTO professor VALUES (77, 'Liam Strong', 'stellawhitley@yahoo.com', '2003-08-17', '290-30-2892', '91620633400', '553247', 77);
INSERT INTO professor VALUES (78, 'Autumn Aguilar', 'juliadorsey@yahoo.com', '1992-12-31', '087-82-4998', '17475412067', '311821', 78);
INSERT INTO professor VALUES (79, 'Angel Joyner', 'skylarhoffman@mail.com', '1965-01-30', '735-93-9189', '19343540230', '993858', 79);
INSERT INTO professor VALUES (80, 'Serenity Sampson', 'julian.burt@mail.com', '1939-07-26', '410-18-2325', '71572185937', '368582', 80);
INSERT INTO professor VALUES (81, 'Skylar Spencer', 'aaliyah.bray@gmail.com', '1977-06-27', '561-04-5439', '44726888080', '055110', 81);
INSERT INTO professor VALUES (82, 'Sophie Atkins', 'baldwin@yahoo.com', '1923-05-11', '737-68-0873', '75470908500', '729930', 82);
INSERT INTO professor VALUES (83, 'Jacob Miller', 'mcdaniel@gmail.com', '1977-01-21', '654-57-6379', '29682675154', '882055', 83);
INSERT INTO professor VALUES (84, 'Noah Bolton', 'butler@gmail.com', '1946-07-08', '246-83-5323', '48068046224', '127957', 84);
INSERT INTO professor VALUES (85, 'Cameron Gillespie', 'kimberly.pace@yahoo.com', '1925-11-13', '288-12-2216', '92570753971', '875935', 85);
INSERT INTO professor VALUES (86, 'Justin Torres', 'ashley@yahoo.com', '1977-07-13', '814-37-1180', '10406415803', '237100', 86);
INSERT INTO professor VALUES (87, 'Reagan Wells', 'heath@yahoo.com', '1940-09-27', '307-22-8230', '82260445373', '544240', 87);
INSERT INTO professor VALUES (88, 'Kayden Cabrera', 'perez@yahoo.com', '1942-11-29', '431-99-1080', '42758737264', '481830', 88);
INSERT INTO professor VALUES (89, 'Trinity Hobbs', 'mills@gmail.com', '1950-01-10', '603-64-4932', '08178470659', '073111', 89);
INSERT INTO professor VALUES (90, 'Sydney Mays', 'nataliestanley@gmail.com', '1998-10-18', '042-79-7019', '34414800234', '174316', 90);
INSERT INTO professor VALUES (91, 'Leah Conner', 'davidson@mail.com', '1963-09-14', '484-25-0518', '29640501123', '838497', 91);
INSERT INTO professor VALUES (92, 'Sophie Dotson', 'mullen@mail.com', '1934-10-13', '424-73-0605', '55499739790', '443789', 92);
INSERT INTO professor VALUES (93, 'Dylan Rivera', 'frost@gmail.com', '1972-03-10', '627-79-3564', '30078162033', '391397', 93);
INSERT INTO professor VALUES (94, 'Lydia Clay', 'mayer@gmail.com', '1990-03-08', '174-70-2677', '33319882945', '718516', 94);
INSERT INTO professor VALUES (95, 'Ashley Stuart', 'wilder@yahoo.com', '1923-01-18', '489-15-9744', '57478906389', '101584', 95);
INSERT INTO professor VALUES (96, 'Henry Reilly', 'lucy.sheppard@mail.com', '1925-12-21', '472-91-2264', '36068381820', '882758', 96);
INSERT INTO professor VALUES (97, 'Genesis Mays', 'berger@mail.com', '1982-08-30', '093-76-1558', '97900318151', '485033', 97);
INSERT INTO professor VALUES (98, 'Charlotte Bradshaw', 'burt@mail.com', '2013-10-06', '851-39-2363', '28555654130', '631995', 98);
INSERT INTO professor VALUES (99, 'Colton Bright', 'fuentes@gmail.com', '1986-05-09', '470-75-7890', '11717345069', '127623', 99);
INSERT INTO professor VALUES (100, 'Jonathan Lopez', 'makayla.blevins@yahoo.com', '1999-11-04', '612-88-7623', '83306519596', '705753', 100);


--
-- TOC entry 2191 (class 0 OID 28160)
-- Dependencies: 198
-- Data for Name: professor_disciplina; Type: TABLE DATA; Schema: flash; Owner: postgres
--



--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 197
-- Name: professor_disciplina_professor_disciplina_id_seq_1; Type: SEQUENCE SET; Schema: flash; Owner: postgres
--

SELECT pg_catalog.setval('professor_disciplina_professor_disciplina_id_seq_1', 1, false);


--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 187
-- Name: professor_professor_id_seq; Type: SEQUENCE SET; Schema: flash; Owner: postgres
--

SELECT pg_catalog.setval('professor_professor_id_seq', 3000, true);


--
-- TOC entry 2183 (class 0 OID 27802)
-- Dependencies: 188
-- Data for Name: requisito_curso; Type: TABLE DATA; Schema: flash; Owner: postgres
--

INSERT INTO requisito_curso VALUES (23, 1);
INSERT INTO requisito_curso VALUES (24, 1);
INSERT INTO requisito_curso VALUES (25, 1);
INSERT INTO requisito_curso VALUES (26, 1);
INSERT INTO requisito_curso VALUES (27, 1);
INSERT INTO requisito_curso VALUES (28, 1);
INSERT INTO requisito_curso VALUES (28, 2);
INSERT INTO requisito_curso VALUES (28, 3);
INSERT INTO requisito_curso VALUES (28, 4);
INSERT INTO requisito_curso VALUES (29, 1);


--
-- TOC entry 2184 (class 0 OID 27805)
-- Dependencies: 189
-- Data for Name: requisito_disciplina; Type: TABLE DATA; Schema: flash; Owner: postgres
--

INSERT INTO requisito_disciplina VALUES (7, 1);
INSERT INTO requisito_disciplina VALUES (8, 2);
INSERT INTO requisito_disciplina VALUES (9, 3);
INSERT INTO requisito_disciplina VALUES (12, 2);
INSERT INTO requisito_disciplina VALUES (13, 8);
INSERT INTO requisito_disciplina VALUES (14, 5);
INSERT INTO requisito_disciplina VALUES (15, 10);
INSERT INTO requisito_disciplina VALUES (16, 11);
INSERT INTO requisito_disciplina VALUES (18, 13);
INSERT INTO requisito_disciplina VALUES (20, 14);
INSERT INTO requisito_disciplina VALUES (21, 15);
INSERT INTO requisito_disciplina VALUES (23, 7);
INSERT INTO requisito_disciplina VALUES (24, 17);
INSERT INTO requisito_disciplina VALUES (25, 18);
INSERT INTO requisito_disciplina VALUES (26, 19);
INSERT INTO requisito_disciplina VALUES (27, 19);
INSERT INTO requisito_disciplina VALUES (30, 25);
INSERT INTO requisito_disciplina VALUES (31, 26);
INSERT INTO requisito_disciplina VALUES (32, 18);
INSERT INTO requisito_disciplina VALUES (32, 21);
INSERT INTO requisito_disciplina VALUES (33, 11);
INSERT INTO requisito_disciplina VALUES (34, 28);
INSERT INTO requisito_disciplina VALUES (35, 25);
INSERT INTO requisito_disciplina VALUES (35, 31);
INSERT INTO requisito_disciplina VALUES (36, 11);
INSERT INTO requisito_disciplina VALUES (36, 26);
INSERT INTO requisito_disciplina VALUES (37, 32);
INSERT INTO requisito_disciplina VALUES (38, 5);
INSERT INTO requisito_disciplina VALUES (38, 11);
INSERT INTO requisito_disciplina VALUES (39, 34);
INSERT INTO requisito_disciplina VALUES (41, 22);


--
-- TOC entry 2185 (class 0 OID 27808)
-- Dependencies: 190
-- Data for Name: sub_area; Type: TABLE DATA; Schema: flash; Owner: postgres
--



--
-- TOC entry 2186 (class 0 OID 27811)
-- Dependencies: 191
-- Data for Name: tipo_espaco; Type: TABLE DATA; Schema: flash; Owner: postgres
--

INSERT INTO tipo_espaco VALUES (1, 'Sala');
INSERT INTO tipo_espaco VALUES (2, 'Laboratório');


--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 192
-- Name: tipo_espaco_tipo_id_seq; Type: SEQUENCE SET; Schema: flash; Owner: postgres
--

SELECT pg_catalog.setval('tipo_espaco_tipo_id_seq', 2, true);


--
-- TOC entry 2044 (class 2606 OID 28183)
-- Name: alocacao_pk; Type: CONSTRAINT; Schema: flash; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alocacao
    ADD CONSTRAINT alocacao_pk PRIMARY KEY (alocacao_id);


--
-- TOC entry 2018 (class 2606 OID 27835)
-- Name: area_conhecimento_pk; Type: CONSTRAINT; Schema: flash; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY area_conhecimento
    ADD CONSTRAINT area_conhecimento_pk PRIMARY KEY (area_conhecimento_id);


--
-- TOC entry 2020 (class 2606 OID 27837)
-- Name: curso_pk; Type: CONSTRAINT; Schema: flash; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY curso
    ADD CONSTRAINT curso_pk PRIMARY KEY (curso_id);


--
-- TOC entry 2022 (class 2606 OID 27839)
-- Name: dia_semana_id; Type: CONSTRAINT; Schema: flash; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dia_semana
    ADD CONSTRAINT dia_semana_id PRIMARY KEY (dia_semana_id);


--
-- TOC entry 2024 (class 2606 OID 27841)
-- Name: disciplina_pk; Type: CONSTRAINT; Schema: flash; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY disciplina
    ADD CONSTRAINT disciplina_pk PRIMARY KEY (disciplina_id);


--
-- TOC entry 2026 (class 2606 OID 27843)
-- Name: endereco_pk; Type: CONSTRAINT; Schema: flash; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_pk PRIMARY KEY (endereco_id);


--
-- TOC entry 2028 (class 2606 OID 27845)
-- Name: espaco_pk; Type: CONSTRAINT; Schema: flash; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY espaco
    ADD CONSTRAINT espaco_pk PRIMARY KEY (espaco_id);


--
-- TOC entry 2040 (class 2606 OID 28154)
-- Name: horario_pk; Type: CONSTRAINT; Schema: flash; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY horario
    ADD CONSTRAINT horario_pk PRIMARY KEY (horario_id);


--
-- TOC entry 2042 (class 2606 OID 28165)
-- Name: professor_disciplina_pk; Type: CONSTRAINT; Schema: flash; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY professor_disciplina
    ADD CONSTRAINT professor_disciplina_pk PRIMARY KEY (professor_disciplina_id);


--
-- TOC entry 2030 (class 2606 OID 27849)
-- Name: professor_pk; Type: CONSTRAINT; Schema: flash; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY professor
    ADD CONSTRAINT professor_pk PRIMARY KEY (professor_id);


--
-- TOC entry 2032 (class 2606 OID 27851)
-- Name: requisito_curso_pk; Type: CONSTRAINT; Schema: flash; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requisito_curso
    ADD CONSTRAINT requisito_curso_pk PRIMARY KEY (disciplina_id, periodo);


--
-- TOC entry 2034 (class 2606 OID 27853)
-- Name: requisito_disciplina_pk; Type: CONSTRAINT; Schema: flash; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requisito_disciplina
    ADD CONSTRAINT requisito_disciplina_pk PRIMARY KEY (disciplina_id, disciplina_pre_requisito_id);


--
-- TOC entry 2036 (class 2606 OID 27855)
-- Name: sub_area_pk; Type: CONSTRAINT; Schema: flash; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sub_area
    ADD CONSTRAINT sub_area_pk PRIMARY KEY (area_conhecimento_id, sub_area_conhecimento_id);


--
-- TOC entry 2038 (class 2606 OID 27857)
-- Name: tipo_espaco_pk; Type: CONSTRAINT; Schema: flash; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_espaco
    ADD CONSTRAINT tipo_espaco_pk PRIMARY KEY (tipo_id);


--
-- TOC entry 2045 (class 2606 OID 27859)
-- Name: area_conhecimento_disciplina_fk; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY disciplina
    ADD CONSTRAINT area_conhecimento_disciplina_fk FOREIGN KEY (area_conhecimento_id) REFERENCES area_conhecimento(area_conhecimento_id) ON UPDATE CASCADE;


--
-- TOC entry 2052 (class 2606 OID 27864)
-- Name: area_conhecimento_sub_area_fk; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY sub_area
    ADD CONSTRAINT area_conhecimento_sub_area_fk FOREIGN KEY (area_conhecimento_id) REFERENCES area_conhecimento(area_conhecimento_id);


--
-- TOC entry 2053 (class 2606 OID 27869)
-- Name: area_conhecimento_sub_area_fk1; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY sub_area
    ADD CONSTRAINT area_conhecimento_sub_area_fk1 FOREIGN KEY (sub_area_conhecimento_id) REFERENCES area_conhecimento(area_conhecimento_id);


--
-- TOC entry 2046 (class 2606 OID 27874)
-- Name: curso_disciplina_fk; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY disciplina
    ADD CONSTRAINT curso_disciplina_fk FOREIGN KEY (curso_id) REFERENCES curso(curso_id);


--
-- TOC entry 2056 (class 2606 OID 28184)
-- Name: dia_semana_alocacao_fk; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY alocacao
    ADD CONSTRAINT dia_semana_alocacao_fk FOREIGN KEY (dia_semana_id) REFERENCES dia_semana(dia_semana_id);


--
-- TOC entry 2054 (class 2606 OID 28166)
-- Name: disciplina_professor_disciplina_fk; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY professor_disciplina
    ADD CONSTRAINT disciplina_professor_disciplina_fk FOREIGN KEY (disciplina_id) REFERENCES disciplina(disciplina_id);


--
-- TOC entry 2049 (class 2606 OID 27889)
-- Name: disciplina_requisito_curso_fk; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY requisito_curso
    ADD CONSTRAINT disciplina_requisito_curso_fk FOREIGN KEY (disciplina_id) REFERENCES disciplina(disciplina_id);


--
-- TOC entry 2050 (class 2606 OID 27894)
-- Name: disciplina_requisito_fk; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY requisito_disciplina
    ADD CONSTRAINT disciplina_requisito_fk FOREIGN KEY (disciplina_id) REFERENCES disciplina(disciplina_id);


--
-- TOC entry 2051 (class 2606 OID 27899)
-- Name: disciplina_requisito_fk1; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY requisito_disciplina
    ADD CONSTRAINT disciplina_requisito_fk1 FOREIGN KEY (disciplina_pre_requisito_id) REFERENCES disciplina(disciplina_id);


--
-- TOC entry 2048 (class 2606 OID 27904)
-- Name: endereco_professor_fk; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY professor
    ADD CONSTRAINT endereco_professor_fk FOREIGN KEY (endereco_id) REFERENCES endereco(endereco_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2057 (class 2606 OID 28189)
-- Name: espaco_alocacao_fk; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY alocacao
    ADD CONSTRAINT espaco_alocacao_fk FOREIGN KEY (espaco_id) REFERENCES espaco(espaco_id);


--
-- TOC entry 2058 (class 2606 OID 28194)
-- Name: horario_alocacao_fk; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY alocacao
    ADD CONSTRAINT horario_alocacao_fk FOREIGN KEY (horario_id) REFERENCES horario(horario_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2059 (class 2606 OID 28199)
-- Name: professor_disciplina_alocacao_fk; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY alocacao
    ADD CONSTRAINT professor_disciplina_alocacao_fk FOREIGN KEY (professor_disciplina_id) REFERENCES professor_disciplina(professor_disciplina_id);


--
-- TOC entry 2055 (class 2606 OID 28171)
-- Name: professor_professor_disciplina_fk; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY professor_disciplina
    ADD CONSTRAINT professor_professor_disciplina_fk FOREIGN KEY (professor_id) REFERENCES professor(professor_id);


--
-- TOC entry 2047 (class 2606 OID 27929)
-- Name: tipo_espaco_fk; Type: FK CONSTRAINT; Schema: flash; Owner: postgres
--

ALTER TABLE ONLY espaco
    ADD CONSTRAINT tipo_espaco_fk FOREIGN KEY (tipo_id) REFERENCES tipo_espaco(tipo_id);


-- Completed on 2016-10-21 17:45:39 BRST

--
-- PostgreSQL database dump complete
--

