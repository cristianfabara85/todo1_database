--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2022-03-12 21:22:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE demo;
--
-- TOC entry 2867 (class 1262 OID 59947)
-- Name: demo; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE demo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Ecuador.1252' LC_CTYPE = 'Spanish_Ecuador.1252';


ALTER DATABASE demo OWNER TO postgres;

\connect demo

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_table_access_method = heap;

--
-- TOC entry 205 (class 1259 OID 60023)
-- Name: catalogos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalogos (
    catalogoid integer NOT NULL,
    tipo integer NOT NULL,
    nombre character varying(100),
    estado integer NOT NULL
);


ALTER TABLE public.catalogos OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 60021)
-- Name: catalogos_catalogoid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalogos_catalogoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogos_catalogoid_seq OWNER TO postgres;

--
-- TOC entry 2868 (class 0 OID 0)
-- Dependencies: 204
-- Name: catalogos_catalogoid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalogos_catalogoid_seq OWNED BY public.catalogos.catalogoid;


--
-- TOC entry 207 (class 1259 OID 68141)
-- Name: compras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compras (
    compraid integer NOT NULL,
    productoid character varying(10) NOT NULL,
    proveedor character varying(100) NOT NULL,
    cantidad numeric(50,0) NOT NULL,
    fecharegistro date,
    preciounitario numeric(50,2),
    preciototal numeric(50,2)
);


ALTER TABLE public.compras OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 68139)
-- Name: compras_compraid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compras_compraid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compras_compraid_seq OWNER TO postgres;

--
-- TOC entry 2869 (class 0 OID 0)
-- Dependencies: 206
-- Name: compras_compraid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compras_compraid_seq OWNED BY public.compras.compraid;


--
-- TOC entry 203 (class 1259 OID 59969)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    productoid integer NOT NULL,
    codigo character varying(10) NOT NULL,
    nombre character varying(100) NOT NULL,
    preciounidad numeric(10,2) NOT NULL
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 59967)
-- Name: productos_productoid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_productoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_productoid_seq OWNER TO postgres;

--
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 202
-- Name: productos_productoid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_productoid_seq OWNED BY public.productos.productoid;


--
-- TOC entry 211 (class 1259 OID 68165)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    stockid integer NOT NULL,
    productoid numeric(50,0) NOT NULL,
    entradas numeric(50,0),
    salidas numeric(50,0),
    disponible numeric(50,0)
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 68163)
-- Name: stock_stockid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_stockid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stock_stockid_seq OWNER TO postgres;

--
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 210
-- Name: stock_stockid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_stockid_seq OWNED BY public.stock.stockid;


--
-- TOC entry 209 (class 1259 OID 68149)
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas (
    ventaid integer NOT NULL,
    productoid character varying(10) NOT NULL,
    cliente character varying(100) NOT NULL,
    cantidad numeric(50,0) NOT NULL,
    fecharegistro date,
    preciounitario numeric(50,2),
    preciototal numeric(50,2)
);


ALTER TABLE public.ventas OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 68147)
-- Name: ventas_ventaid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ventas_ventaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ventas_ventaid_seq OWNER TO postgres;

--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 208
-- Name: ventas_ventaid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_ventaid_seq OWNED BY public.ventas.ventaid;


--
-- TOC entry 2712 (class 2604 OID 60026)
-- Name: catalogos catalogoid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogos ALTER COLUMN catalogoid SET DEFAULT nextval('public.catalogos_catalogoid_seq'::regclass);


--
-- TOC entry 2713 (class 2604 OID 68144)
-- Name: compras compraid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras ALTER COLUMN compraid SET DEFAULT nextval('public.compras_compraid_seq'::regclass);


--
-- TOC entry 2711 (class 2604 OID 59972)
-- Name: productos productoid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN productoid SET DEFAULT nextval('public.productos_productoid_seq'::regclass);


--
-- TOC entry 2715 (class 2604 OID 68168)
-- Name: stock stockid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock ALTER COLUMN stockid SET DEFAULT nextval('public.stock_stockid_seq'::regclass);


--
-- TOC entry 2714 (class 2604 OID 68152)
-- Name: ventas ventaid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas ALTER COLUMN ventaid SET DEFAULT nextval('public.ventas_ventaid_seq'::regclass);


--
-- TOC entry 2855 (class 0 OID 60023)
-- Dependencies: 205
-- Data for Name: catalogos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.catalogos (catalogoid, tipo, nombre, estado) VALUES (7, 1, 'Corporacion Favorita', 1);
INSERT INTO public.catalogos (catalogoid, tipo, nombre, estado) VALUES (8, 1, 'Corporacion Rosado', 1);
INSERT INTO public.catalogos (catalogoid, tipo, nombre, estado) VALUES (9, 1, 'Comics Store S.A', 1);
INSERT INTO public.catalogos (catalogoid, tipo, nombre, estado) VALUES (10, 2, 'Christian Fabara', 1);
INSERT INTO public.catalogos (catalogoid, tipo, nombre, estado) VALUES (11, 2, 'Viviana Santos', 1);
INSERT INTO public.catalogos (catalogoid, tipo, nombre, estado) VALUES (12, 2, 'Juan Crespo', 1);


--
-- TOC entry 2857 (class 0 OID 68141)
-- Dependencies: 207
-- Data for Name: compras; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2853 (class 0 OID 59969)
-- Dependencies: 203
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos (productoid, codigo, nombre, preciounidad) VALUES (6, 'vb05', 'Camiseta Batman', 27.99);
INSERT INTO public.productos (productoid, codigo, nombre, preciounidad) VALUES (2, 'vb02', 'Vaso Batman 200 ml.', 7.50);
INSERT INTO public.productos (productoid, codigo, nombre, preciounidad) VALUES (3, 'vb03', 'Vaso Batman 500 ml.', 11.00);
INSERT INTO public.productos (productoid, codigo, nombre, preciounidad) VALUES (5, 'vb04', 'Camiseta Hulk MD', 25.99);
INSERT INTO public.productos (productoid, codigo, nombre, preciounidad) VALUES (8, 'vb07', 'Lampara Spiderman led', 40.00);
INSERT INTO public.productos (productoid, codigo, nombre, preciounidad) VALUES (9, 'vb08', 'Camiseta Libre Soy', 9.00);
INSERT INTO public.productos (productoid, codigo, nombre, preciounidad) VALUES (10, 'vb09', 'Vaso Mario Bross 250 ml', 2.50);
INSERT INTO public.productos (productoid, codigo, nombre, preciounidad) VALUES (11, 'vb10', 'Lampara Mario Bross', 4.50);


--
-- TOC entry 2861 (class 0 OID 68165)
-- Dependencies: 211
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stock (stockid, productoid, entradas, salidas, disponible) VALUES (9, 6, 0, 0, 0);
INSERT INTO public.stock (stockid, productoid, entradas, salidas, disponible) VALUES (10, 2, 0, 0, 0);
INSERT INTO public.stock (stockid, productoid, entradas, salidas, disponible) VALUES (11, 3, 0, 0, 0);
INSERT INTO public.stock (stockid, productoid, entradas, salidas, disponible) VALUES (12, 5, 0, 0, 0);
INSERT INTO public.stock (stockid, productoid, entradas, salidas, disponible) VALUES (13, 8, 0, 0, 0);
INSERT INTO public.stock (stockid, productoid, entradas, salidas, disponible) VALUES (14, 9, 0, 0, 0);
INSERT INTO public.stock (stockid, productoid, entradas, salidas, disponible) VALUES (15, 10, 0, 0, 0);
INSERT INTO public.stock (stockid, productoid, entradas, salidas, disponible) VALUES (16, 11, 0, 0, 0);


--
-- TOC entry 2859 (class 0 OID 68149)
-- Dependencies: 209
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 204
-- Name: catalogos_catalogoid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalogos_catalogoid_seq', 12, true);


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 206
-- Name: compras_compraid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compras_compraid_seq', 3, true);


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 202
-- Name: productos_productoid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_productoid_seq', 11, true);


--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 210
-- Name: stock_stockid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_stockid_seq', 16, true);


--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 208
-- Name: ventas_ventaid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_ventaid_seq', 1, false);


--
-- TOC entry 2719 (class 2606 OID 60028)
-- Name: catalogos catalogoid_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogos
    ADD CONSTRAINT catalogoid_pk PRIMARY KEY (catalogoid);


--
-- TOC entry 2721 (class 2606 OID 68146)
-- Name: compras compraid_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compraid_pk PRIMARY KEY (compraid);


--
-- TOC entry 2717 (class 2606 OID 59974)
-- Name: productos producto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT producto_pk PRIMARY KEY (productoid);


--
-- TOC entry 2725 (class 2606 OID 68170)
-- Name: stock stockid_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stockid_pk PRIMARY KEY (stockid);


--
-- TOC entry 2723 (class 2606 OID 68154)
-- Name: ventas ventaid_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventaid_pk PRIMARY KEY (ventaid);


-- Completed on 2022-03-12 21:22:37

--
-- PostgreSQL database dump complete
--

