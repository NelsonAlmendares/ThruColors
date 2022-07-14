--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-06-27 19:08:45

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 67685)
-- Name: tb_DetalleVenta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."tb_DetalleVenta" (
    "id_DetalleVenta" integer NOT NULL,
    cantidad integer NOT NULL,
    id_producto integer NOT NULL,
    id_venta integer NOT NULL,
    "id_Valoracion" integer,
    precio_producto double precision NOT NULL
);


ALTER TABLE public."tb_DetalleVenta" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 67684)
-- Name: tb_DetalleVenta_id_DetalleVenta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tb_DetalleVenta_id_DetalleVenta_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tb_DetalleVenta_id_DetalleVenta_seq" OWNER TO postgres;

--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 209
-- Name: tb_DetalleVenta_id_DetalleVenta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tb_DetalleVenta_id_DetalleVenta_seq" OWNED BY public."tb_DetalleVenta"."id_DetalleVenta";


--
-- TOC entry 212 (class 1259 OID 67692)
-- Name: tb_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_categoria (
    id_categoria integer NOT NULL,
    categoria_producto character varying(50) NOT NULL,
    foto_categoria character varying(150) NOT NULL,
    descripcion_categoria character varying(200)
);


ALTER TABLE public.tb_categoria OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 67691)
-- Name: tb_categoria_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_categoria_id_categoria_seq OWNER TO postgres;

--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 211
-- Name: tb_categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_categoria_id_categoria_seq OWNED BY public.tb_categoria.id_categoria;


--
-- TOC entry 214 (class 1259 OID 67699)
-- Name: tb_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_cliente (
    id_cliente integer NOT NULL,
    nombre_cliente character varying(50) NOT NULL,
    apellido_cliente character varying(50) NOT NULL,
    celular_cliente character varying(9) NOT NULL,
    direccion_cliente character varying(200) NOT NULL,
    email_cliente character varying(150) NOT NULL,
    password character varying(100) NOT NULL,
    foto_cliente character varying NOT NULL,
    estado_cliente boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_cliente OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 67698)
-- Name: tb_cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_cliente_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 213
-- Name: tb_cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_cliente_id_cliente_seq OWNED BY public.tb_cliente.id_cliente;


--
-- TOC entry 216 (class 1259 OID 67708)
-- Name: tb_empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_empleado (
    id_empleado integer NOT NULL,
    nombre_empleado character varying(50) NOT NULL,
    apellido_empleado character varying(50) NOT NULL,
    "DUI" character varying(10) NOT NULL,
    direccion_empleado character varying(60) NOT NULL,
    codigo_empleado integer NOT NULL,
    password_empleado character varying(100) NOT NULL,
    tipo_empleado integer NOT NULL,
    foto_empleado character varying(100) NOT NULL
);


ALTER TABLE public.tb_empleado OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 67707)
-- Name: tb_empleado_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_empleado_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_empleado_id_empleado_seq OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 215
-- Name: tb_empleado_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_empleado_id_empleado_seq OWNED BY public.tb_empleado.id_empleado;


--
-- TOC entry 218 (class 1259 OID 67715)
-- Name: tb_estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_estado (
    id_estado integer NOT NULL,
    estado_producto character varying(30) NOT NULL
);


ALTER TABLE public.tb_estado OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 67714)
-- Name: tb_estado_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_estado_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_estado_id_estado_seq OWNER TO postgres;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 217
-- Name: tb_estado_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_estado_id_estado_seq OWNED BY public.tb_estado.id_estado;


--
-- TOC entry 220 (class 1259 OID 67722)
-- Name: tb_genero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_genero (
    id_genero integer NOT NULL,
    genero_producto character varying(30) NOT NULL
);


ALTER TABLE public.tb_genero OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 67721)
-- Name: tb_genero_id_genero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_genero_id_genero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_genero_id_genero_seq OWNER TO postgres;

--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 219
-- Name: tb_genero_id_genero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_genero_id_genero_seq OWNED BY public.tb_genero.id_genero;


--
-- TOC entry 222 (class 1259 OID 67729)
-- Name: tb_marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_marca (
    id_marca integer NOT NULL,
    nombre_marca character varying NOT NULL
);


ALTER TABLE public.tb_marca OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 67728)
-- Name: tb_marca_id_marca_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_marca_id_marca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_marca_id_marca_seq OWNER TO postgres;

--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_marca_id_marca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_marca_id_marca_seq OWNED BY public.tb_marca.id_marca;


--
-- TOC entry 224 (class 1259 OID 67738)
-- Name: tb_presentacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_presentacion (
    id_presentacion integer NOT NULL,
    presentacion_producto character varying(50) NOT NULL
);


ALTER TABLE public.tb_presentacion OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 67737)
-- Name: tb_presentacion_id_presentacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_presentacion_id_presentacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_presentacion_id_presentacion_seq OWNER TO postgres;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 223
-- Name: tb_presentacion_id_presentacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_presentacion_id_presentacion_seq OWNED BY public.tb_presentacion.id_presentacion;


--
-- TOC entry 226 (class 1259 OID 67745)
-- Name: tb_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_producto (
    id_producto integer NOT NULL,
    costo_producto double precision NOT NULL,
    descripcion_producto character varying(200) NOT NULL,
    foto_producto character varying(150) NOT NULL,
    cantidad_producto integer NOT NULL,
    "id_estadoProducto" integer NOT NULL,
    id_empleado integer NOT NULL,
    "id_marcaProducto" integer NOT NULL,
    "id_generoProducto" integer NOT NULL,
    "id_categoriaProducto" integer NOT NULL,
    "id_presentacionProducto" integer NOT NULL,
    nombre_producto character varying(50) NOT NULL
);


ALTER TABLE public.tb_producto OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 67744)
-- Name: tb_producto_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_producto_id_producto_seq OWNER TO postgres;

--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 225
-- Name: tb_producto_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_producto_id_producto_seq OWNED BY public.tb_producto.id_producto;


--
-- TOC entry 228 (class 1259 OID 67752)
-- Name: tb_valoracionProducto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."tb_valoracionProducto" (
    id_valoracion integer NOT NULL,
    comentario_producto character varying(300) NOT NULL,
    fecha_comentario date NOT NULL,
    estado_comentario character varying(100) NOT NULL
);


ALTER TABLE public."tb_valoracionProducto" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 67751)
-- Name: tb_valoracionProducto_id_valoracion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tb_valoracionProducto_id_valoracion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tb_valoracionProducto_id_valoracion_seq" OWNER TO postgres;

--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 227
-- Name: tb_valoracionProducto_id_valoracion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tb_valoracionProducto_id_valoracion_seq" OWNED BY public."tb_valoracionProducto".id_valoracion;


--
-- TOC entry 230 (class 1259 OID 67759)
-- Name: tb_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_venta (
    id_venta integer NOT NULL,
    fecha_venta date NOT NULL,
    id_cliente integer NOT NULL,
    estado_venta smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.tb_venta OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 67758)
-- Name: tb_venta_id_venta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_venta_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_venta_id_venta_seq OWNER TO postgres;

--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 229
-- Name: tb_venta_id_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_venta_id_venta_seq OWNED BY public.tb_venta.id_venta;


--
-- TOC entry 232 (class 1259 OID 67767)
-- Name: tipo_empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_empleado (
    "id_tipoEmpleado" integer NOT NULL,
    "tipoEmpleado" character varying NOT NULL
);


ALTER TABLE public.tipo_empleado OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 67766)
-- Name: tipo_empleado_id_tipoEmpleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tipo_empleado_id_tipoEmpleado_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tipo_empleado_id_tipoEmpleado_seq" OWNER TO postgres;

--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 231
-- Name: tipo_empleado_id_tipoEmpleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tipo_empleado_id_tipoEmpleado_seq" OWNED BY public.tipo_empleado."id_tipoEmpleado";


--
-- TOC entry 3219 (class 2604 OID 67688)
-- Name: tb_DetalleVenta id_DetalleVenta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tb_DetalleVenta" ALTER COLUMN "id_DetalleVenta" SET DEFAULT nextval('public."tb_DetalleVenta_id_DetalleVenta_seq"'::regclass);


--
-- TOC entry 3220 (class 2604 OID 67775)
-- Name: tb_categoria id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.tb_categoria_id_categoria_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 67776)
-- Name: tb_cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.tb_cliente_id_cliente_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 67777)
-- Name: tb_empleado id_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_empleado ALTER COLUMN id_empleado SET DEFAULT nextval('public.tb_empleado_id_empleado_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 67778)
-- Name: tb_estado id_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_estado ALTER COLUMN id_estado SET DEFAULT nextval('public.tb_estado_id_estado_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 67779)
-- Name: tb_genero id_genero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_genero ALTER COLUMN id_genero SET DEFAULT nextval('public.tb_genero_id_genero_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 67780)
-- Name: tb_marca id_marca; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_marca ALTER COLUMN id_marca SET DEFAULT nextval('public.tb_marca_id_marca_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 67781)
-- Name: tb_presentacion id_presentacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_presentacion ALTER COLUMN id_presentacion SET DEFAULT nextval('public.tb_presentacion_id_presentacion_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 67782)
-- Name: tb_producto id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto ALTER COLUMN id_producto SET DEFAULT nextval('public.tb_producto_id_producto_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 67783)
-- Name: tb_valoracionProducto id_valoracion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tb_valoracionProducto" ALTER COLUMN id_valoracion SET DEFAULT nextval('public."tb_valoracionProducto_id_valoracion_seq"'::regclass);


--
-- TOC entry 3231 (class 2604 OID 67784)
-- Name: tb_venta id_venta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_venta ALTER COLUMN id_venta SET DEFAULT nextval('public.tb_venta_id_venta_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 67785)
-- Name: tipo_empleado id_tipoEmpleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_empleado ALTER COLUMN "id_tipoEmpleado" SET DEFAULT nextval('public."tipo_empleado_id_tipoEmpleado_seq"'::regclass);


--
-- TOC entry 3419 (class 0 OID 67685)
-- Dependencies: 210
-- Data for Name: tb_DetalleVenta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."tb_DetalleVenta" ("id_DetalleVenta", cantidad, id_producto, id_venta, "id_Valoracion", precio_producto) FROM stdin;
\.


--
-- TOC entry 3421 (class 0 OID 67692)
-- Dependencies: 212
-- Data for Name: tb_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_categoria (id_categoria, categoria_producto, foto_categoria, descripcion_categoria) FROM stdin;
\.


--
-- TOC entry 3423 (class 0 OID 67699)
-- Dependencies: 214
-- Data for Name: tb_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_cliente (id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, password, foto_cliente, estado_cliente) FROM stdin;
\.


--
-- TOC entry 3425 (class 0 OID 67708)
-- Dependencies: 216
-- Data for Name: tb_empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_empleado (id_empleado, nombre_empleado, apellido_empleado, "DUI", direccion_empleado, codigo_empleado, password_empleado, tipo_empleado, foto_empleado) FROM stdin;
\.


--
-- TOC entry 3427 (class 0 OID 67715)
-- Dependencies: 218
-- Data for Name: tb_estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_estado (id_estado, estado_producto) FROM stdin;
\.


--
-- TOC entry 3429 (class 0 OID 67722)
-- Dependencies: 220
-- Data for Name: tb_genero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_genero (id_genero, genero_producto) FROM stdin;
\.


--
-- TOC entry 3431 (class 0 OID 67729)
-- Dependencies: 222
-- Data for Name: tb_marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_marca (id_marca, nombre_marca) FROM stdin;
\.


--
-- TOC entry 3433 (class 0 OID 67738)
-- Dependencies: 224
-- Data for Name: tb_presentacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_presentacion (id_presentacion, presentacion_producto) FROM stdin;
\.


--
-- TOC entry 3435 (class 0 OID 67745)
-- Dependencies: 226
-- Data for Name: tb_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_producto (id_producto, costo_producto, descripcion_producto, foto_producto, cantidad_producto, "id_estadoProducto", id_empleado, "id_marcaProducto", "id_generoProducto", "id_categoriaProducto", "id_presentacionProducto", nombre_producto) FROM stdin;
\.


--
-- TOC entry 3437 (class 0 OID 67752)
-- Dependencies: 228
-- Data for Name: tb_valoracionProducto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."tb_valoracionProducto" (id_valoracion, comentario_producto, fecha_comentario, estado_comentario) FROM stdin;
\.


--
-- TOC entry 3439 (class 0 OID 67759)
-- Dependencies: 230
-- Data for Name: tb_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_venta (id_venta, fecha_venta, id_cliente, estado_venta) FROM stdin;
\.


--
-- TOC entry 3441 (class 0 OID 67767)
-- Dependencies: 232
-- Data for Name: tipo_empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_empleado ("id_tipoEmpleado", "tipoEmpleado") FROM stdin;
1	root
\.


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 209
-- Name: tb_DetalleVenta_id_DetalleVenta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tb_DetalleVenta_id_DetalleVenta_seq"', 1, false);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 211
-- Name: tb_categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_categoria_id_categoria_seq', 1, false);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 213
-- Name: tb_cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_cliente_id_cliente_seq', 1, false);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 215
-- Name: tb_empleado_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_empleado_id_empleado_seq', 1, false);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 217
-- Name: tb_estado_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_estado_id_estado_seq', 1, false);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 219
-- Name: tb_genero_id_genero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_genero_id_genero_seq', 1, false);


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_marca_id_marca_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_marca_id_marca_seq', 1, false);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 223
-- Name: tb_presentacion_id_presentacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_presentacion_id_presentacion_seq', 1, false);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 225
-- Name: tb_producto_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_producto_id_producto_seq', 1, false);


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 227
-- Name: tb_valoracionProducto_id_valoracion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tb_valoracionProducto_id_valoracion_seq"', 1, false);


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 229
-- Name: tb_venta_id_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_venta_id_venta_seq', 1, false);


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 231
-- Name: tipo_empleado_id_tipoEmpleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tipo_empleado_id_tipoEmpleado_seq"', 1, true);


--
-- TOC entry 3234 (class 2606 OID 67690)
-- Name: tb_DetalleVenta tb_DetalleVenta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "tb_DetalleVenta_pkey" PRIMARY KEY ("id_DetalleVenta");


--
-- TOC entry 3236 (class 2606 OID 67697)
-- Name: tb_categoria tb_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_categoria
    ADD CONSTRAINT tb_categoria_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 3240 (class 2606 OID 67706)
-- Name: tb_cliente tb_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_cliente
    ADD CONSTRAINT tb_cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 3244 (class 2606 OID 67713)
-- Name: tb_empleado tb_empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT tb_empleado_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 3250 (class 2606 OID 67720)
-- Name: tb_estado tb_estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_estado
    ADD CONSTRAINT tb_estado_pkey PRIMARY KEY (id_estado);


--
-- TOC entry 3252 (class 2606 OID 67727)
-- Name: tb_genero tb_genero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_genero
    ADD CONSTRAINT tb_genero_pkey PRIMARY KEY (id_genero);


--
-- TOC entry 3254 (class 2606 OID 67736)
-- Name: tb_marca tb_marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_marca
    ADD CONSTRAINT tb_marca_pkey PRIMARY KEY (id_marca);


--
-- TOC entry 3256 (class 2606 OID 67743)
-- Name: tb_presentacion tb_presentacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_presentacion
    ADD CONSTRAINT tb_presentacion_pkey PRIMARY KEY (id_presentacion);


--
-- TOC entry 3259 (class 2606 OID 67750)
-- Name: tb_producto tb_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT tb_producto_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 3261 (class 2606 OID 67757)
-- Name: tb_valoracionProducto tb_valoracionProducto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tb_valoracionProducto"
    ADD CONSTRAINT "tb_valoracionProducto_pkey" PRIMARY KEY (id_valoracion);


--
-- TOC entry 3263 (class 2606 OID 67765)
-- Name: tb_venta tb_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_venta
    ADD CONSTRAINT tb_venta_pkey PRIMARY KEY (id_venta);


--
-- TOC entry 3265 (class 2606 OID 67774)
-- Name: tipo_empleado tipo_empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_empleado
    ADD CONSTRAINT tipo_empleado_pkey PRIMARY KEY ("id_tipoEmpleado");


--
-- TOC entry 3238 (class 2606 OID 67787)
-- Name: tb_categoria uq_categoria_producto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_categoria
    ADD CONSTRAINT uq_categoria_producto UNIQUE (categoria_producto);


--
-- TOC entry 3246 (class 2606 OID 67789)
-- Name: tb_empleado uq_codigo_empleado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT uq_codigo_empleado UNIQUE (codigo_empleado);


--
-- TOC entry 3248 (class 2606 OID 67791)
-- Name: tb_empleado uq_dui_empleado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT uq_dui_empleado UNIQUE ("DUI");


--
-- TOC entry 3242 (class 2606 OID 67793)
-- Name: tb_cliente uq_email_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_cliente
    ADD CONSTRAINT uq_email_cliente UNIQUE (email_cliente);


--
-- TOC entry 3267 (class 2606 OID 67795)
-- Name: tipo_empleado uq_tipo_empleado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_empleado
    ADD CONSTRAINT uq_tipo_empleado UNIQUE ("tipoEmpleado");


--
-- TOC entry 3257 (class 1259 OID 67796)
-- Name: fki_FK_empleado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_empleado" ON public.tb_producto USING btree (id_empleado);


--
-- TOC entry 3272 (class 2606 OID 67797)
-- Name: tb_producto FK_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_categoria" FOREIGN KEY ("id_categoriaProducto") REFERENCES public.tb_categoria(id_categoria) NOT VALID;


--
-- TOC entry 3278 (class 2606 OID 67802)
-- Name: tb_venta FK_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_venta
    ADD CONSTRAINT "FK_cliente" FOREIGN KEY (id_cliente) REFERENCES public.tb_cliente(id_cliente) NOT VALID;


--
-- TOC entry 3273 (class 2606 OID 67807)
-- Name: tb_producto FK_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_empleado" FOREIGN KEY (id_empleado) REFERENCES public.tb_empleado(id_empleado) NOT VALID;


--
-- TOC entry 3274 (class 2606 OID 67812)
-- Name: tb_producto FK_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_estado" FOREIGN KEY ("id_estadoProducto") REFERENCES public.tb_estado(id_estado) NOT VALID;


--
-- TOC entry 3275 (class 2606 OID 67817)
-- Name: tb_producto FK_genero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_genero" FOREIGN KEY ("id_generoProducto") REFERENCES public.tb_genero(id_genero) NOT VALID;


--
-- TOC entry 3276 (class 2606 OID 67822)
-- Name: tb_producto FK_marca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_marca" FOREIGN KEY ("id_marcaProducto") REFERENCES public.tb_marca(id_marca) NOT VALID;


--
-- TOC entry 3277 (class 2606 OID 67827)
-- Name: tb_producto FK_presentacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_presentacion" FOREIGN KEY ("id_presentacionProducto") REFERENCES public.tb_presentacion(id_presentacion) NOT VALID;


--
-- TOC entry 3268 (class 2606 OID 67832)
-- Name: tb_DetalleVenta FK_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_producto" FOREIGN KEY (id_producto) REFERENCES public.tb_producto(id_producto) NOT VALID;


--
-- TOC entry 3271 (class 2606 OID 67837)
-- Name: tb_empleado FK_tipoEmpleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT "FK_tipoEmpleado" FOREIGN KEY (tipo_empleado) REFERENCES public.tipo_empleado("id_tipoEmpleado") NOT VALID;


--
-- TOC entry 3269 (class 2606 OID 67842)
-- Name: tb_DetalleVenta FK_valoracion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_valoracion" FOREIGN KEY ("id_Valoracion") REFERENCES public."tb_valoracionProducto"(id_valoracion) NOT VALID;


--
-- TOC entry 3270 (class 2606 OID 67847)
-- Name: tb_DetalleVenta FK_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_venta" FOREIGN KEY (id_venta) REFERENCES public.tb_venta(id_venta) NOT VALID;


-- Completed on 2022-06-27 19:08:46

--
-- PostgreSQL database dump complete
--

