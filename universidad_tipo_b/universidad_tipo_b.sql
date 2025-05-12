--
-- PostgreSQL database dump
--
-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4
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
-- Name: universidad; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA universidad;

ALTER SCHEMA universidad OWNER TO postgres;

--
-- Name: sexo_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.sexo_enum AS ENUM (
    'H',
    'M'
);

ALTER TYPE public.sexo_enum OWNER TO postgres;

--
-- Name: tipo_asignatura_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_asignatura_enum AS ENUM (
    'básica',
    'obligatoria',
    'optativa'
);

ALTER TYPE public.tipo_asignatura_enum OWNER TO postgres;

--
-- Name: sexo_enum; Type: TYPE; Schema: universidad; Owner: postgres
--

CREATE TYPE universidad.sexo_enum AS ENUM (
    'H',
    'M'
);

ALTER TYPE universidad.sexo_enum OWNER TO postgres;

--
-- Name: tipo_asignatura_enum; Type: TYPE; Schema: universidad; Owner: postgres
--

CREATE TYPE universidad.tipo_asignatura_enum AS ENUM (
    'básica',
    'obligatoria',
    'optativa'
);

ALTER TYPE universidad.tipo_asignatura_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alumno_se_matricula_asignatura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE universidad.departamento (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE universidad.alumno (
    id SERIAL PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('H', 'M')) NOT NULL
);

CREATE TABLE universidad.profesor (
    id SERIAL PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('H', 'M')) NOT NULL,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES universidad.departamento(id)
);

CREATE TABLE universidad.grado (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE universidad.asignatura (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT NOT NULL,
    tipo VARCHAR(20) CHECK (tipo IN ('básica', 'obligatoria', 'optativa')) NOT NULL,
    curso SMALLINT NOT NULL,
    cuatrimestre SMALLINT NOT NULL,
    id_profesor INT,
    id_grado INT NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES universidad.profesor(id),
    FOREIGN KEY(id_grado) REFERENCES universidad.grado(id)
);

CREATE TABLE universidad.curso_escolar (
    id SERIAL PRIMARY KEY,
    anyo_inicio INTEGER NOT NULL,
    anyo_fin INTEGER NULL
);

CREATE TABLE universidad.alumno_se_matricula_asignatura (
    id_alumno INT NOT NULL,
    id_asignatura INT NOT NULL,
    id_curso_escolar INT NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES universidad.alumno(id),
    FOREIGN KEY (id_asignatura) REFERENCES universidad.asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES universidad.curso_escolar(id)
);

INSERT INTO universidad.departamento (nombre) VALUES 
('Informática'),
('Matemáticas'),
('Economía y Empresa'),
('Educación'),
('Agronomía'),
('Química y Física'),
('Filología'),
('Derecho'),
('Biología y Geología');

INSERT INTO universidad.alumno (nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo) VALUES
('89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992-08-08', 'H'),
('26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991-03-28', 'H'),
('17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000-10-05', 'H'),
('04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998-01-28', 'H'),
('97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999-05-24', 'H'),
('82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996-11-21', 'H'),
('46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997-04-26', 'H'),
('11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998-09-01', 'M'),
('79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998-01-01', 'H'),
('41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999-02-11', 'H'),
('64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996-03-12', 'M'),
('85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995-04-13', 'M');

INSERT INTO universidad.profesor (nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, id_departamento) VALUES
('11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979-08-19', 'M', 1),
('38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978-01-19', 'H', 2),
('79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977-08-21', 'M', 3),
('61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977-05-19', 'M', 4),
('85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 4),
('73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980-02-01', 'H', 6),
('82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977-01-02', 'H', 1),
('80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980-03-14', 'H', 2),
('10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982-03-18', 'H', 3),
('85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973-05-05', 'H', 4),
('04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976-02-25', 'H', 5),
('79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980-10-31', 'H', 6),
('13175769N', 'Pepe', 'Sánchez', 'Ruiz', 'Almería', 'C/ Quinto pino', NULL, '1980-10-16', 'H', 1),
('98816696W', 'Juan', 'Guerrero', 'Martínez', 'Almería', 'C/ Quinto pino', NULL, '1980-11-21', 'H', 1),
('77194445M', 'María', 'Domínguez', 'Hernández', 'Almería', 'C/ Quinto pino', NULL, '1980-12-13', 'M', 2);

INSERT INTO universidad.grado (nombre) VALUES 
('Grado en Ingeniería Agrícola (Plan 2015)'),
('Grado en Ingeniería Eléctrica (Plan 2014)'),
('Grado en Ingeniería Electrónica Industrial (Plan 2010)'),
('Grado en Ingeniería Informática (Plan 2015)'),
('Grado en Ingeniería Mecánica (Plan 2010)'),
('Grado en Ingeniería Química Industrial (Plan 2010)'),
('Grado en Biotecnología (Plan 2015)'),
('Grado en Ciencias Ambientales (Plan 2009)'),
('Grado en Matemáticas (Plan 2010)'),
('Grado en Química (Plan 2009)');

INSERT INTO universidad.asignatura (nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES
('Álgebra lineal y matemática discreta', 6, 'básica', 1, 1, NULL, 4),
('Cálculo', 6, 'básica', 1, 1, NULL, 4),
('Física para informática', 6, 'básica', 1, 1, NULL, 4),
('Introducción a la programación', 6, 'básica', 1, 1, NULL, 4),
('Organización y gestión de empresas', 6, 'básica', 1, 1, NULL, 4),
('Estadística', 6, 'básica', 1, 2, NULL, 4),
('Estructura y tecnología de computadores', 6, 'básica', 1, 2, NULL, 4),
('Fundamentos de electrónica', 6, 'básica', 1, 2, NULL, 4),
('Lógica y algorítmica', 6, 'básica', 1, 2, NULL, 4),
('Metodología de la programación', 6, 'básica', 1, 2, NULL, 4),
('Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4),
('Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4),
('Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4),
('Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4),
('Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4),
('Bases de Datos', 6, 'básica', 2, 2, 14, 4),
('Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4),
('Fundamentos de Redes de Computadores', 6, 'obligatoria', 2, 2, 3, 4),
('Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4),
('Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4),
('Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4),
('Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4),
('Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
('Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4),
('Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4),
('Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4),
('Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
('Tecnologías web', 6, 'optativa', 3, 1, NULL, 4),
('Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4),
('Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4),
('Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4),
('Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4),
('Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4),
('Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4),
('Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4),
('Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4),
('Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4),
('Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4),
('Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4),
('Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4),
('Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4),
('Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4),
('Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4),
('Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4),
('Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4),
('Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4),
('Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4),
('Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4),
('Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4),
('Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4),
('Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4);

INSERT INTO universidad.asignatura (nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES
('Biología celular', 6, 'básica', 1, 1, NULL, 7),
('Física', 6, 'básica', 1, 1, NULL, 7),
('Matemáticas I', 6, 'básica', 1, 1, NULL, 7),
('Química general', 6, 'básica', 1, 1, NULL, 7),
('Química orgánica', 6, 'básica', 1, 1, NULL, 7),
('Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7),
('Bioquímica', 6, 'básica', 1, 2, NULL, 7),
('Genética', 6, 'básica', 1, 2, NULL, 7),
('Matemáticas II', 6, 'básica', 1, 2, NULL, 7),
('Microbiología', 6, 'básica', 1, 2, NULL, 7),
('Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7),
('Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7),
('Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7),
('Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7),
('Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7),
('Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7),
('Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7),
('Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7),
('Inmunología', 6, 'obligatoria', 2, 2, NULL, 7),
('Virología', 6, 'obligatoria', 2, 2, NULL, 7),
('Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7),
('Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7),
('Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7),
('Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7),
('Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7),
('Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7),
('Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7),
('Biotecnología de los productos hortofrutícolas', 4.5, 'obligatoria', 3, 2, NULL, 7),
('Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7),
('Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7),
('Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7),
('Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

INSERT INTO universidad.curso_escolar (anyo_inicio, anyo_fin) VALUES
(2014, 2015),
(2015, 2016),
(2016, 2017),
(2017, 2018);

INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES
(1, 1, 1), (1, 2, 1), (1, 3, 1), (1, 4, 1), (1, 5, 1),
(1, 6, 1), (1, 7, 1), (1, 8, 1), (1, 9, 1), (1, 10, 1),
(1, 1, 2), (1, 2, 2), (1, 3, 2),
(1, 1, 3), (1, 2, 3), (1, 3, 3),
(1, 1, 4), (1, 2, 4), (1, 3, 4),
(2, 1, 1), (2, 2, 1), (2, 3, 1),
(4, 1, 1), (4, 2, 1), (4, 3, 1),
(4, 1, 2), (4, 2, 2), (4, 3, 2), (4, 4, 2), (4, 5, 2),
(4, 6, 2), (4, 7, 2), (4, 8, 2), (4, 9, 2), (4, 10, 2);
