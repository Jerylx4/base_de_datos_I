--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-12 19:58:22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4887 (class 1262 OID 16429)
-- Name: universidad_A; Type: DATABASE; Schema: -; Owner: postgres
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16527)
-- Name: universidad_A; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "universidad_A";


ALTER SCHEMA "universidad_A" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 16532)
-- Name: alumno_se_matricula_asignatura; Type: TABLE; Schema: universidad_A; Owner: postgres
--

CREATE TABLE "universidad_A".alumno_se_matricula_asignatura (
    id_alumno integer NOT NULL,
    id_asignatura integer NOT NULL,
    id_curso_escolar integer NOT NULL
);


ALTER TABLE "universidad_A".alumno_se_matricula_asignatura OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16535)
-- Name: asignatura; Type: TABLE; Schema: universidad_A; Owner: postgres
--

CREATE TABLE "universidad_A".asignatura (
    "ID" integer NOT NULL,
    nombre character varying(100) NOT NULL,
    creditos double precision NOT NULL,
    tipo character varying(100) NOT NULL,
    curso smallint NOT NULL,
    cuatrimestre smallint NOT NULL,
    id_profesor integer,
    id_grado integer NOT NULL
);


ALTER TABLE "universidad_A".asignatura OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16538)
-- Name: asignatura_ID_seq; Type: SEQUENCE; Schema: universidad_A; Owner: postgres
--

CREATE SEQUENCE "universidad_A"."asignatura_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "universidad_A"."asignatura_ID_seq" OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 231
-- Name: asignatura_ID_seq; Type: SEQUENCE OWNED BY; Schema: universidad_A; Owner: postgres
--

ALTER SEQUENCE "universidad_A"."asignatura_ID_seq" OWNED BY "universidad_A".asignatura."ID";


--
-- TOC entry 232 (class 1259 OID 16539)
-- Name: curso_escolar; Type: TABLE; Schema: universidad_A; Owner: postgres
--

CREATE TABLE "universidad_A".curso_escolar (
    "ID" integer NOT NULL,
    anyo_inicio integer NOT NULL,
    anyo_fin integer NOT NULL
);


ALTER TABLE "universidad_A".curso_escolar OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16542)
-- Name: curso_escolar_ID_seq; Type: SEQUENCE; Schema: universidad_A; Owner: postgres
--

CREATE SEQUENCE "universidad_A"."curso_escolar_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "universidad_A"."curso_escolar_ID_seq" OWNER TO postgres;

--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 233
-- Name: curso_escolar_ID_seq; Type: SEQUENCE OWNED BY; Schema: universidad_A; Owner: postgres
--

ALTER SEQUENCE "universidad_A"."curso_escolar_ID_seq" OWNED BY "universidad_A".curso_escolar."ID";


--
-- TOC entry 234 (class 1259 OID 16543)
-- Name: departamento; Type: TABLE; Schema: universidad_A; Owner: postgres
--

CREATE TABLE "universidad_A".departamento (
    "ID" integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE "universidad_A".departamento OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16546)
-- Name: departamento_ID_seq; Type: SEQUENCE; Schema: universidad_A; Owner: postgres
--

CREATE SEQUENCE "universidad_A"."departamento_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "universidad_A"."departamento_ID_seq" OWNER TO postgres;

--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 235
-- Name: departamento_ID_seq; Type: SEQUENCE OWNED BY; Schema: universidad_A; Owner: postgres
--

ALTER SEQUENCE "universidad_A"."departamento_ID_seq" OWNED BY "universidad_A".departamento."ID";


--
-- TOC entry 236 (class 1259 OID 16547)
-- Name: grado; Type: TABLE; Schema: universidad_A; Owner: postgres
--

CREATE TABLE "universidad_A".grado (
    "ID" integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE "universidad_A".grado OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16550)
-- Name: grado_ID_seq; Type: SEQUENCE; Schema: universidad_A; Owner: postgres
--

CREATE SEQUENCE "universidad_A"."grado_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "universidad_A"."grado_ID_seq" OWNER TO postgres;

--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 237
-- Name: grado_ID_seq; Type: SEQUENCE OWNED BY; Schema: universidad_A; Owner: postgres
--

ALTER SEQUENCE "universidad_A"."grado_ID_seq" OWNED BY "universidad_A".grado."ID";


--
-- TOC entry 238 (class 1259 OID 16551)
-- Name: persona; Type: TABLE; Schema: universidad_A; Owner: postgres
--

CREATE TABLE "universidad_A".persona (
    "ID" integer NOT NULL,
    nif character varying(9) NOT NULL,
    nombre character varying(25) NOT NULL,
    apellido1 character varying(50) NOT NULL,
    apellido2 character varying(50) NOT NULL,
    ciudad character varying(25) NOT NULL,
    direccion character varying(50) NOT NULL,
    telefono character varying(9),
    fecha_nacimiento date NOT NULL,
    sexo character(1) NOT NULL,
    tipo character varying(10) NOT NULL
);


ALTER TABLE "universidad_A".persona OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16554)
-- Name: persona_ID_seq; Type: SEQUENCE; Schema: universidad_A; Owner: postgres
--

CREATE SEQUENCE "universidad_A"."persona_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "universidad_A"."persona_ID_seq" OWNER TO postgres;

--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 239
-- Name: persona_ID_seq; Type: SEQUENCE OWNED BY; Schema: universidad_A; Owner: postgres
--

ALTER SEQUENCE "universidad_A"."persona_ID_seq" OWNED BY "universidad_A".persona."ID";


--
-- TOC entry 240 (class 1259 OID 16555)
-- Name: profesor; Type: TABLE; Schema: universidad_A; Owner: postgres
--

CREATE TABLE "universidad_A".profesor (
    id_profesor integer NOT NULL,
    id_departamento integer NOT NULL
);


ALTER TABLE "universidad_A".profesor OWNER TO postgres;

--
-- TOC entry 4699 (class 2604 OID 16558)
-- Name: asignatura ID; Type: DEFAULT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".asignatura ALTER COLUMN "ID" SET DEFAULT nextval('"universidad_A"."asignatura_ID_seq"'::regclass);


--
-- TOC entry 4700 (class 2604 OID 16559)
-- Name: curso_escolar ID; Type: DEFAULT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".curso_escolar ALTER COLUMN "ID" SET DEFAULT nextval('"universidad_A"."curso_escolar_ID_seq"'::regclass);


--
-- TOC entry 4701 (class 2604 OID 16560)
-- Name: departamento ID; Type: DEFAULT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".departamento ALTER COLUMN "ID" SET DEFAULT nextval('"universidad_A"."departamento_ID_seq"'::regclass);


--
-- TOC entry 4702 (class 2604 OID 16561)
-- Name: grado ID; Type: DEFAULT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".grado ALTER COLUMN "ID" SET DEFAULT nextval('"universidad_A"."grado_ID_seq"'::regclass);


--
-- TOC entry 4703 (class 2604 OID 16562)
-- Name: persona ID; Type: DEFAULT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".persona ALTER COLUMN "ID" SET DEFAULT nextval('"universidad_A"."persona_ID_seq"'::regclass);


--
-- TOC entry 4870 (class 0 OID 16532)
-- Dependencies: 229
-- Data for Name: alumno_se_matricula_asignatura; Type: TABLE DATA; Schema: universidad_A; Owner: postgres
--

INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (1, 1, 1);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (1, 2, 1);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (1, 3, 1);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (2, 1, 1);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (2, 2, 1);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (2, 3, 1);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (4, 1, 1);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (4, 2, 1);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (4, 3, 1);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 1, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 2, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 3, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 4, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 5, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 6, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 7, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 8, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 9, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 10, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 1, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 2, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 3, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 4, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 5, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 6, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 7, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 8, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 9, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 10, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 1, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 2, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 3, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 4, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 5, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 6, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 7, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 8, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 9, 5);
INSERT INTO "universidad_A".alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 10, 5);


--
-- TOC entry 4871 (class 0 OID 16535)
-- Dependencies: 230
-- Data for Name: asignatura; Type: TABLE DATA; Schema: universidad_A; Owner: postgres
--

INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, 3, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (2, 'Cálculo', 6, 'básica', 1, 1, 14, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (3, 'Física para informática', 6, 'básica', 1, 1, 3, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (4, 'Introducción a la programación', 6, 'básica', 1, 1, 14, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, 3, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (6, 'Estadística', 6, 'básica', 1, 2, 14, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, 3, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, 14, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (9, 'Lógica y algorítmica', 6, 'básica', 1, 2, 3, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (10, 'Metodología de la programación', 6, 'básica', 1, 2, 14, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (18, 'Fundamentos de Redes de Computadores', 6, 'obligatoria', 2, 2, 3, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (53, 'Física', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (55, 'Química general', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (59, 'Genética', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO "universidad_A".asignatura ("ID", nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);


--
-- TOC entry 4873 (class 0 OID 16539)
-- Dependencies: 232
-- Data for Name: curso_escolar; Type: TABLE DATA; Schema: universidad_A; Owner: postgres
--

INSERT INTO "universidad_A".curso_escolar ("ID", anyo_inicio, anyo_fin) VALUES (1, 2014, 2015);
INSERT INTO "universidad_A".curso_escolar ("ID", anyo_inicio, anyo_fin) VALUES (2, 2015, 2016);
INSERT INTO "universidad_A".curso_escolar ("ID", anyo_inicio, anyo_fin) VALUES (3, 2016, 2017);
INSERT INTO "universidad_A".curso_escolar ("ID", anyo_inicio, anyo_fin) VALUES (4, 2017, 2018);
INSERT INTO "universidad_A".curso_escolar ("ID", anyo_inicio, anyo_fin) VALUES (5, 2018, 2019);


--
-- TOC entry 4875 (class 0 OID 16543)
-- Dependencies: 234
-- Data for Name: departamento; Type: TABLE DATA; Schema: universidad_A; Owner: postgres
--

INSERT INTO "universidad_A".departamento ("ID", nombre) VALUES (1, 'Informática');
INSERT INTO "universidad_A".departamento ("ID", nombre) VALUES (2, 'Matemáticas');
INSERT INTO "universidad_A".departamento ("ID", nombre) VALUES (3, 'Economía y Empresa');
INSERT INTO "universidad_A".departamento ("ID", nombre) VALUES (4, 'Educación');
INSERT INTO "universidad_A".departamento ("ID", nombre) VALUES (5, 'Agronomía');
INSERT INTO "universidad_A".departamento ("ID", nombre) VALUES (6, 'Química y Física');
INSERT INTO "universidad_A".departamento ("ID", nombre) VALUES (7, 'Filología');
INSERT INTO "universidad_A".departamento ("ID", nombre) VALUES (8, 'Derecho');
INSERT INTO "universidad_A".departamento ("ID", nombre) VALUES (9, 'Biología y Geología');


--
-- TOC entry 4877 (class 0 OID 16547)
-- Dependencies: 236
-- Data for Name: grado; Type: TABLE DATA; Schema: universidad_A; Owner: postgres
--

INSERT INTO "universidad_A".grado ("ID", nombre) VALUES (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
INSERT INTO "universidad_A".grado ("ID", nombre) VALUES (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
INSERT INTO "universidad_A".grado ("ID", nombre) VALUES (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)');
INSERT INTO "universidad_A".grado ("ID", nombre) VALUES (4, 'Grado en Ingeniería Informática (Plan 2015)');
INSERT INTO "universidad_A".grado ("ID", nombre) VALUES (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
INSERT INTO "universidad_A".grado ("ID", nombre) VALUES (6, 'Grado en Ingeniería Química Industrial (Plan 2010)');
INSERT INTO "universidad_A".grado ("ID", nombre) VALUES (7, 'Grado en Biotecnología (Plan 2015)');
INSERT INTO "universidad_A".grado ("ID", nombre) VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO "universidad_A".grado ("ID", nombre) VALUES (9, 'Grado en Matemáticas (Plan 2010)');
INSERT INTO "universidad_A".grado ("ID", nombre) VALUES (10, 'Grado en Química (Plan 2009)');


--
-- TOC entry 4879 (class 0 OID 16551)
-- Dependencies: 238
-- Data for Name: persona; Type: TABLE DATA; Schema: universidad_A; Owner: postgres
--

INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (1, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991-03-28', 'H', 'alumno');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (2, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992-08-08', 'H', 'alumno');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979-08-19', 'M', 'profesor');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000-10-05', 'H', 'alumno');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978-01-19', 'H', 'profesor');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998-01-28', 'H', 'alumno');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999-05-24', 'H', 'alumno');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977-08-21', 'M', 'profesor');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996-11-21', 'H', 'alumno');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977-05-19', 'M', 'profesor');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997-04-26', 'H', 'alumno');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980-02-01', 'H', 'profesor');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977-01-02', 'H', 'profesor');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980-03-14', 'H', 'profesor');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982-03-18', 'H', 'profesor');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973-05-05', 'H', 'profesor');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976-02-25', 'H', 'profesor');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998-09-01', 'M', 'alumno');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980-10-31', 'H', 'profesor');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998-01-01', 'H', 'alumno');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999-02-11', 'H', 'alumno');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996-03-12', 'M', 'alumno');
INSERT INTO "universidad_A".persona ("ID", nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995-04-13', 'M', 'alumno');


--
-- TOC entry 4881 (class 0 OID 16555)
-- Dependencies: 240
-- Data for Name: profesor; Type: TABLE DATA; Schema: universidad_A; Owner: postgres
--

INSERT INTO "universidad_A".profesor (id_profesor, id_departamento) VALUES (3, 1);
INSERT INTO "universidad_A".profesor (id_profesor, id_departamento) VALUES (5, 2);
INSERT INTO "universidad_A".profesor (id_profesor, id_departamento) VALUES (8, 3);
INSERT INTO "universidad_A".profesor (id_profesor, id_departamento) VALUES (10, 4);
INSERT INTO "universidad_A".profesor (id_profesor, id_departamento) VALUES (12, 4);
INSERT INTO "universidad_A".profesor (id_profesor, id_departamento) VALUES (13, 6);
INSERT INTO "universidad_A".profesor (id_profesor, id_departamento) VALUES (14, 1);
INSERT INTO "universidad_A".profesor (id_profesor, id_departamento) VALUES (15, 2);
INSERT INTO "universidad_A".profesor (id_profesor, id_departamento) VALUES (16, 3);
INSERT INTO "universidad_A".profesor (id_profesor, id_departamento) VALUES (17, 4);
INSERT INTO "universidad_A".profesor (id_profesor, id_departamento) VALUES (18, 5);
INSERT INTO "universidad_A".profesor (id_profesor, id_departamento) VALUES (20, 6);


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 231
-- Name: asignatura_ID_seq; Type: SEQUENCE SET; Schema: universidad_A; Owner: postgres
--

SELECT pg_catalog.setval('"universidad_A"."asignatura_ID_seq"', 1, false);


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 233
-- Name: curso_escolar_ID_seq; Type: SEQUENCE SET; Schema: universidad_A; Owner: postgres
--

SELECT pg_catalog.setval('"universidad_A"."curso_escolar_ID_seq"', 5, true);


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 235
-- Name: departamento_ID_seq; Type: SEQUENCE SET; Schema: universidad_A; Owner: postgres
--

SELECT pg_catalog.setval('"universidad_A"."departamento_ID_seq"', 9, true);


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 237
-- Name: grado_ID_seq; Type: SEQUENCE SET; Schema: universidad_A; Owner: postgres
--

SELECT pg_catalog.setval('"universidad_A"."grado_ID_seq"', 10, true);


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 239
-- Name: persona_ID_seq; Type: SEQUENCE SET; Schema: universidad_A; Owner: postgres
--

SELECT pg_catalog.setval('"universidad_A"."persona_ID_seq"', 24, true);


--
-- TOC entry 4705 (class 2606 OID 16566)
-- Name: alumno_se_matricula_asignatura alumno_se_matricula_asignatura_pkey; Type: CONSTRAINT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_pkey PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar);


--
-- TOC entry 4707 (class 2606 OID 16568)
-- Name: asignatura asignatura_pkey; Type: CONSTRAINT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".asignatura
    ADD CONSTRAINT asignatura_pkey PRIMARY KEY ("ID");


--
-- TOC entry 4709 (class 2606 OID 16570)
-- Name: curso_escolar curso_escolar_pkey; Type: CONSTRAINT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".curso_escolar
    ADD CONSTRAINT curso_escolar_pkey PRIMARY KEY ("ID");


--
-- TOC entry 4711 (class 2606 OID 16572)
-- Name: departamento departamento_pkey; Type: CONSTRAINT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY ("ID");


--
-- TOC entry 4713 (class 2606 OID 16574)
-- Name: grado grado_pkey; Type: CONSTRAINT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".grado
    ADD CONSTRAINT grado_pkey PRIMARY KEY ("ID");


--
-- TOC entry 4715 (class 2606 OID 16576)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY ("ID");


--
-- TOC entry 4717 (class 2606 OID 16578)
-- Name: profesor profesor_pkey; Type: CONSTRAINT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".profesor
    ADD CONSTRAINT profesor_pkey PRIMARY KEY (id_profesor);


--
-- TOC entry 4721 (class 2606 OID 16579)
-- Name: asignatura FK_asigantura_profesor; Type: FK CONSTRAINT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".asignatura
    ADD CONSTRAINT "FK_asigantura_profesor" FOREIGN KEY (id_profesor) REFERENCES "universidad_A".profesor(id_profesor) NOT VALID;


--
-- TOC entry 4722 (class 2606 OID 16584)
-- Name: asignatura FK_asignatura_grado; Type: FK CONSTRAINT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".asignatura
    ADD CONSTRAINT "FK_asignatura_grado" FOREIGN KEY (id_grado) REFERENCES "universidad_A".grado("ID") NOT VALID;


--
-- TOC entry 4718 (class 2606 OID 16589)
-- Name: alumno_se_matricula_asignatura FK_asma_asignatura; Type: FK CONSTRAINT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".alumno_se_matricula_asignatura
    ADD CONSTRAINT "FK_asma_asignatura" FOREIGN KEY (id_asignatura) REFERENCES "universidad_A".asignatura("ID") NOT VALID;


--
-- TOC entry 4719 (class 2606 OID 16594)
-- Name: alumno_se_matricula_asignatura FK_asma_curso_escolar; Type: FK CONSTRAINT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".alumno_se_matricula_asignatura
    ADD CONSTRAINT "FK_asma_curso_escolar" FOREIGN KEY (id_curso_escolar) REFERENCES "universidad_A".curso_escolar("ID") NOT VALID;


--
-- TOC entry 4720 (class 2606 OID 16599)
-- Name: alumno_se_matricula_asignatura FK_asma_persona; Type: FK CONSTRAINT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".alumno_se_matricula_asignatura
    ADD CONSTRAINT "FK_asma_persona" FOREIGN KEY (id_alumno) REFERENCES "universidad_A".persona("ID") NOT VALID;


--
-- TOC entry 4723 (class 2606 OID 16604)
-- Name: profesor FK_profesor_departamento; Type: FK CONSTRAINT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".profesor
    ADD CONSTRAINT "FK_profesor_departamento" FOREIGN KEY (id_departamento) REFERENCES "universidad_A".departamento("ID") NOT VALID;


--
-- TOC entry 4724 (class 2606 OID 16609)
-- Name: profesor FK_profesor_persona; Type: FK CONSTRAINT; Schema: universidad_A; Owner: postgres
--

ALTER TABLE ONLY "universidad_A".profesor
    ADD CONSTRAINT "FK_profesor_persona" FOREIGN KEY (id_profesor) REFERENCES "universidad_A".persona("ID") NOT VALID;


-- Completed on 2025-05-12 19:58:22

--
-- PostgreSQL database dump complete
--

