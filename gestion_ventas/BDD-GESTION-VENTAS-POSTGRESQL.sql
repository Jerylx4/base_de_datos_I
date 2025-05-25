--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-12 15:42:05

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16648)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido1 character varying(100) NOT NULL,
    apellido2 character varying(100),
    ciudad character varying(100),
    categoria integer
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16647)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 217
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- TOC entry 220 (class 1259 OID 16655)
-- Name: comercial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comercial (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido1 character varying(100) NOT NULL,
    apellido2 character varying(100),
    comision double precision
);


ALTER TABLE public.comercial OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16654)
-- Name: comercial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comercial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comercial_id_seq OWNER TO postgres;

--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 219
-- Name: comercial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comercial_id_seq OWNED BY public.comercial.id;


--
-- TOC entry 222 (class 1259 OID 16662)
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido (
    id integer NOT NULL,
    total double precision NOT NULL,
    fecha date,
    id_cliente integer NOT NULL,
    id_comercial integer NOT NULL
);


ALTER TABLE public.pedido OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16661)
-- Name: pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pedido_id_seq OWNER TO postgres;

--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 221
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedido_id_seq OWNED BY public.pedido.id;


--
-- TOC entry 4651 (class 2604 OID 16651)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 4652 (class 2604 OID 16658)
-- Name: comercial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comercial ALTER COLUMN id SET DEFAULT nextval('public.comercial_id_seq'::regclass);


--
-- TOC entry 4653 (class 2604 OID 16665)
-- Name: pedido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido ALTER COLUMN id SET DEFAULT nextval('public.pedido_id_seq'::regclass);


--
-- TOC entry 4808 (class 0 OID 16648)
-- Dependencies: 218
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO public.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO public.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO public.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO public.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO public.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO public.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO public.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO public.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO public.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);


--
-- TOC entry 4810 (class 0 OID 16655)
-- Dependencies: 220
-- Data for Name: comercial; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comercial (id, nombre, apellido1, apellido2, comision) VALUES (1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO public.comercial (id, nombre, apellido1, apellido2, comision) VALUES (2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO public.comercial (id, nombre, apellido1, apellido2, comision) VALUES (3, 'Diego', 'Flores', 'Salas', 0.11);
INSERT INTO public.comercial (id, nombre, apellido1, apellido2, comision) VALUES (4, 'Marta', 'Herrera', 'Gil', 0.14);
INSERT INTO public.comercial (id, nombre, apellido1, apellido2, comision) VALUES (5, 'Antonio', 'Carretero', 'Ortega', 0.12);
INSERT INTO public.comercial (id, nombre, apellido1, apellido2, comision) VALUES (6, 'Manuel', 'Domínguez', 'Hernández', 0.13);
INSERT INTO public.comercial (id, nombre, apellido1, apellido2, comision) VALUES (7, 'Antonio', 'Vega', 'Hernández', 0.11);
INSERT INTO public.comercial (id, nombre, apellido1, apellido2, comision) VALUES (8, 'Alfredo', 'Ruiz', 'Flores', 0.05);


--
-- TOC entry 4812 (class 0 OID 16662)
-- Dependencies: 222
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (1, 150.5, '2017-10-05', 5, 2);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (2, 270.65, '2016-09-10', 1, 5);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (3, 65.26, '2017-10-05', 2, 1);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (4, 110.5, '2016-08-17', 8, 3);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (5, 948.5, '2017-09-10', 5, 2);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (7, 5760, '2015-09-10', 2, 1);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (10, 250.45, '2015-06-27', 8, 2);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (11, 75.29, '2016-08-17', 3, 7);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (13, 545.75, '2019-01-25', 6, 1);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (14, 145.82, '2017-02-02', 6, 1);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (15, 370.85, '2019-03-11', 1, 5);
INSERT INTO public.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (16, 2389.23, '2019-03-11', 1, 5);


--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 217
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 10, true);


--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 219
-- Name: comercial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comercial_id_seq', 8, true);


--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 221
-- Name: pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedido_id_seq', 16, true);


--
-- TOC entry 4655 (class 2606 OID 16653)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 4657 (class 2606 OID 16660)
-- Name: comercial comercial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comercial
    ADD CONSTRAINT comercial_pkey PRIMARY KEY (id);


--
-- TOC entry 4659 (class 2606 OID 16667)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 4660 (class 2606 OID 16668)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


--
-- TOC entry 4661 (class 2606 OID 16673)
-- Name: pedido pedido_id_comercial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_comercial_fkey FOREIGN KEY (id_comercial) REFERENCES public.comercial(id);


-- Completed on 2025-05-12 15:42:06

--
-- PostgreSQL database dump complete
--

