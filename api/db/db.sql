--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-06-17 11:46:45

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
-- TOC entry 209 (class 1259 OID 58447)
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
-- TOC entry 210 (class 1259 OID 58450)
-- Name: tb_DetalleVenta_id_DetalleVenta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."tb_DetalleVenta" ALTER COLUMN "id_DetalleVenta" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tb_DetalleVenta_id_DetalleVenta_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 58451)
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
-- TOC entry 212 (class 1259 OID 58454)
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
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 212
-- Name: tb_categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_categoria_id_categoria_seq OWNED BY public.tb_categoria.id_categoria;


--
-- TOC entry 213 (class 1259 OID 58455)
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
    estado_cliente character varying(30) NOT NULL,
    foto_cliente character varying NOT NULL
);


ALTER TABLE public.tb_cliente OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 58460)
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
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 214
-- Name: tb_cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_cliente_id_cliente_seq OWNED BY public.tb_cliente.id_cliente;


--
-- TOC entry 215 (class 1259 OID 58461)
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
-- TOC entry 216 (class 1259 OID 58464)
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
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 216
-- Name: tb_empleado_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_empleado_id_empleado_seq OWNED BY public.tb_empleado.id_empleado;


--
-- TOC entry 217 (class 1259 OID 58465)
-- Name: tb_estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_estado (
    id_estado integer NOT NULL,
    estado_producto character varying(30) NOT NULL
);


ALTER TABLE public.tb_estado OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 58468)
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
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 218
-- Name: tb_estado_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_estado_id_estado_seq OWNED BY public.tb_estado.id_estado;


--
-- TOC entry 219 (class 1259 OID 58469)
-- Name: tb_genero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_genero (
    id_genero integer NOT NULL,
    genero_producto character varying(30) NOT NULL
);


ALTER TABLE public.tb_genero OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 58472)
-- Name: tb_gerero_id_genero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_gerero_id_genero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_gerero_id_genero_seq OWNER TO postgres;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 220
-- Name: tb_gerero_id_genero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_gerero_id_genero_seq OWNED BY public.tb_genero.id_genero;


--
-- TOC entry 221 (class 1259 OID 58473)
-- Name: tb_marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_marca (
    id_marca integer NOT NULL,
    nombre_marca character varying NOT NULL
);


ALTER TABLE public.tb_marca OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 58478)
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
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 222
-- Name: tb_marca_id_marca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_marca_id_marca_seq OWNED BY public.tb_marca.id_marca;


--
-- TOC entry 223 (class 1259 OID 58479)
-- Name: tb_presentacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_presentacion (
    id_presentacion integer NOT NULL,
    presentacion_producto character varying(50) NOT NULL
);


ALTER TABLE public.tb_presentacion OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 58482)
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
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 224
-- Name: tb_presentacion_id_presentacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_presentacion_id_presentacion_seq OWNED BY public.tb_presentacion.id_presentacion;


--
-- TOC entry 225 (class 1259 OID 58483)
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
-- TOC entry 226 (class 1259 OID 58486)
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
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 226
-- Name: tb_producto_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_producto_id_producto_seq OWNED BY public.tb_producto.id_producto;


--
-- TOC entry 227 (class 1259 OID 58487)
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
-- TOC entry 228 (class 1259 OID 58490)
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
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 228
-- Name: tb_valoracionProducto_id_valoracion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tb_valoracionProducto_id_valoracion_seq" OWNED BY public."tb_valoracionProducto".id_valoracion;


--
-- TOC entry 229 (class 1259 OID 58491)
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
-- TOC entry 230 (class 1259 OID 58495)
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
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 230
-- Name: tb_venta_id_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_venta_id_venta_seq OWNED BY public.tb_venta.id_venta;


--
-- TOC entry 231 (class 1259 OID 58496)
-- Name: tipo_empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_empleado (
    "id_tipoEmpleado" integer NOT NULL,
    "tipoEmpleado" character varying NOT NULL
);


ALTER TABLE public.tipo_empleado OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 58501)
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
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 232
-- Name: tipo_empleado_id_tipoEmpleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tipo_empleado_id_tipoEmpleado_seq" OWNED BY public.tipo_empleado."id_tipoEmpleado";


--
-- TOC entry 3219 (class 2604 OID 58502)
-- Name: tb_categoria id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.tb_categoria_id_categoria_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 58503)
-- Name: tb_cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.tb_cliente_id_cliente_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 58504)
-- Name: tb_empleado id_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_empleado ALTER COLUMN id_empleado SET DEFAULT nextval('public.tb_empleado_id_empleado_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 58505)
-- Name: tb_estado id_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_estado ALTER COLUMN id_estado SET DEFAULT nextval('public.tb_estado_id_estado_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 58506)
-- Name: tb_genero id_genero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_genero ALTER COLUMN id_genero SET DEFAULT nextval('public.tb_gerero_id_genero_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 58507)
-- Name: tb_marca id_marca; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_marca ALTER COLUMN id_marca SET DEFAULT nextval('public.tb_marca_id_marca_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 58508)
-- Name: tb_presentacion id_presentacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_presentacion ALTER COLUMN id_presentacion SET DEFAULT nextval('public.tb_presentacion_id_presentacion_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 58509)
-- Name: tb_producto id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto ALTER COLUMN id_producto SET DEFAULT nextval('public.tb_producto_id_producto_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 58510)
-- Name: tb_valoracionProducto id_valoracion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tb_valoracionProducto" ALTER COLUMN id_valoracion SET DEFAULT nextval('public."tb_valoracionProducto_id_valoracion_seq"'::regclass);


--
-- TOC entry 3229 (class 2604 OID 58511)
-- Name: tb_venta id_venta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_venta ALTER COLUMN id_venta SET DEFAULT nextval('public.tb_venta_id_venta_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 58512)
-- Name: tipo_empleado id_tipoEmpleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_empleado ALTER COLUMN "id_tipoEmpleado" SET DEFAULT nextval('public."tipo_empleado_id_tipoEmpleado_seq"'::regclass);


--
-- TOC entry 3416 (class 0 OID 58447)
-- Dependencies: 209
-- Data for Name: tb_DetalleVenta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."tb_DetalleVenta" ("id_DetalleVenta", cantidad, id_producto, id_venta, "id_Valoracion", precio_producto) FROM stdin;
4	2	9	2	\N	6.35
3	3	14	2	\N	5.95
6	1	12	3	\N	25.99
7	6	8	3	\N	5.95
\.


--
-- TOC entry 3418 (class 0 OID 58451)
-- Dependencies: 211
-- Data for Name: tb_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_categoria (id_categoria, categoria_producto, foto_categoria, descripcion_categoria) FROM stdin;
9	Labiales	629d0e58c86e7.png	Labiales a base de cera de abeja con hidratación constante
10	Lociones	629d0e86a674d.png	De las mejores marcas y distribuciones a nivel de competencia
11	Shampoo	629d0ea3e6bbe.png	Con el cuidado que tu cuero cabelludo necesita
\.


--
-- TOC entry 3420 (class 0 OID 58455)
-- Dependencies: 213
-- Data for Name: tb_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_cliente (id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, password, estado_cliente, foto_cliente) FROM stdin;
1	Danilo	Díaz	7854-8965	Residencial Trini, casa #5	danilo.diaz@gmail.com	$2y$10$/X9r3fNZGz1EHPJTH7AH9.BrzCbhgoSIZPsfLEH1GOY0hsTYF.A3W	Habilitado	628734085c9bc.jpg
\.


--
-- TOC entry 3422 (class 0 OID 58461)
-- Dependencies: 215
-- Data for Name: tb_empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_empleado (id_empleado, nombre_empleado, apellido_empleado, "DUI", direccion_empleado, codigo_empleado, password_empleado, tipo_empleado, foto_empleado) FROM stdin;
4	Gaby	Carias	45612378-9	La casa de Elmer	1	$2y$10$0mYlPugIs3Mt/qpyhQ3ulO.RD4dY1.fuOMXS0h2Z3SfNnvekjqmly	1	628712a9416c6.jpg
5	Elmer	Carias	94270829-6	Mi casa, por la Constitución	2	$2y$10$7nNLiMa6dYGFnDidQSAoR.HGAh.aNfzrGhPxx3d2UwasYV0p.OynC	1	628712b891503.jpg
\.


--
-- TOC entry 3424 (class 0 OID 58465)
-- Dependencies: 217
-- Data for Name: tb_estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_estado (id_estado, estado_producto) FROM stdin;
1	En bodega
2	Agotado
3	No encontrado
\.


--
-- TOC entry 3426 (class 0 OID 58469)
-- Dependencies: 219
-- Data for Name: tb_genero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_genero (id_genero, genero_producto) FROM stdin;
1	Hombre
2	Mujer
3	Unisex
\.


--
-- TOC entry 3428 (class 0 OID 58473)
-- Dependencies: 221
-- Data for Name: tb_marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_marca (id_marca, nombre_marca) FROM stdin;
1	Aveeno
2	Jo Malone
3	Fresh
4	Bioderma
5	Neutrgena
8	Garnier
10	Schwarzkopf
11	Esika
7	Darphin
12	TresEmmé
13	Herbal Esscence
15	Empresa Familiar
\.


--
-- TOC entry 3430 (class 0 OID 58479)
-- Dependencies: 223
-- Data for Name: tb_presentacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_presentacion (id_presentacion, presentacion_producto) FROM stdin;
1	500ml
2	1000ml
3	Espuma
4	Sobres
5	Única
6	250ml
\.


--
-- TOC entry 3432 (class 0 OID 58483)
-- Dependencies: 225
-- Data for Name: tb_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_producto (id_producto, costo_producto, descripcion_producto, foto_producto, cantidad_producto, "id_estadoProducto", id_empleado, "id_marcaProducto", "id_generoProducto", "id_categoriaProducto", "id_presentacionProducto", nombre_producto) FROM stdin;
8	5.95	Labial color fucsia distribuido por la marca Outstanding	629d0f042b3c7.png	10	1	4	8	2	9	5	Labial Éclat
9	6.35	Con extracto de frutas, y una duración de hasta veinticuatro horas	629d1067e5b4e.png	10	1	4	7	2	9	5	Labial Bissú Mate
10	15.95	Restaura la fibra capilar, con efecto BOTOX para cabello seco	629d1166d7c73.png	12	1	5	12	3	11	1	Shampoo TresEmmé
11	9.84	Con extracto de granadas, cuida el cuero cabelludo con su nueva fórmula	629d11f97d244.png	8	1	4	13	3	11	2	Shampoo Herbal Essence
12	25.99	Loción de larga duración, con fragancia fresca y atomizador	629d131842dfd.png	8	1	5	10	1	10	6	Loción Igora
13	29.55	Loción importada de paises extrangeros a base de cítricos	629d142034b43.png	9	1	5	11	1	10	6	Surprise eau da parfum
14	5.95	Labial para mujer	629e9d8bb8c76.png	10	1	5	7	2	9	5	Labial
\.


--
-- TOC entry 3434 (class 0 OID 58487)
-- Dependencies: 227
-- Data for Name: tb_valoracionProducto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."tb_valoracionProducto" (id_valoracion, comentario_producto, fecha_comentario, estado_comentario) FROM stdin;
1	Que buen producto, excelente	2022-05-20	activo
2	Mal producto, no lo recomiendo	2022-05-20	activo
\.


--
-- TOC entry 3436 (class 0 OID 58491)
-- Dependencies: 229
-- Data for Name: tb_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_venta (id_venta, fecha_venta, id_cliente, estado_venta) FROM stdin;
2	2022-06-09	1	1
3	2022-06-09	1	1
\.


--
-- TOC entry 3438 (class 0 OID 58496)
-- Dependencies: 231
-- Data for Name: tipo_empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_empleado ("id_tipoEmpleado", "tipoEmpleado") FROM stdin;
1	Administrador
2	Vendedor
3	Secretario
\.


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 210
-- Name: tb_DetalleVenta_id_DetalleVenta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tb_DetalleVenta_id_DetalleVenta_seq"', 7, true);


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 212
-- Name: tb_categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_categoria_id_categoria_seq', 11, true);


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 214
-- Name: tb_cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_cliente_id_cliente_seq', 3, true);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 216
-- Name: tb_empleado_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_empleado_id_empleado_seq', 12, true);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 218
-- Name: tb_estado_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_estado_id_estado_seq', 3, true);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 220
-- Name: tb_gerero_id_genero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_gerero_id_genero_seq', 3, true);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 222
-- Name: tb_marca_id_marca_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_marca_id_marca_seq', 15, true);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 224
-- Name: tb_presentacion_id_presentacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_presentacion_id_presentacion_seq', 6, true);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 226
-- Name: tb_producto_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_producto_id_producto_seq', 14, true);


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 228
-- Name: tb_valoracionProducto_id_valoracion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tb_valoracionProducto_id_valoracion_seq"', 2, true);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 230
-- Name: tb_venta_id_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_venta_id_venta_seq', 3, true);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 232
-- Name: tipo_empleado_id_tipoEmpleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tipo_empleado_id_tipoEmpleado_seq"', 4, true);


--
-- TOC entry 3232 (class 2606 OID 58514)
-- Name: tb_DetalleVenta tb_DetalleVenta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "tb_DetalleVenta_pkey" PRIMARY KEY ("id_DetalleVenta");


--
-- TOC entry 3234 (class 2606 OID 58516)
-- Name: tb_categoria tb_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_categoria
    ADD CONSTRAINT tb_categoria_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 3238 (class 2606 OID 58518)
-- Name: tb_cliente tb_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_cliente
    ADD CONSTRAINT tb_cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 3242 (class 2606 OID 58520)
-- Name: tb_empleado tb_empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT tb_empleado_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 3248 (class 2606 OID 58522)
-- Name: tb_estado tb_estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_estado
    ADD CONSTRAINT tb_estado_pkey PRIMARY KEY (id_estado);


--
-- TOC entry 3250 (class 2606 OID 58524)
-- Name: tb_genero tb_gerero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_genero
    ADD CONSTRAINT tb_gerero_pkey PRIMARY KEY (id_genero);


--
-- TOC entry 3252 (class 2606 OID 58526)
-- Name: tb_marca tb_marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_marca
    ADD CONSTRAINT tb_marca_pkey PRIMARY KEY (id_marca);


--
-- TOC entry 3254 (class 2606 OID 58528)
-- Name: tb_presentacion tb_presentacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_presentacion
    ADD CONSTRAINT tb_presentacion_pkey PRIMARY KEY (id_presentacion);


--
-- TOC entry 3257 (class 2606 OID 58530)
-- Name: tb_producto tb_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT tb_producto_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 3259 (class 2606 OID 58532)
-- Name: tb_valoracionProducto tb_valoracionProducto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tb_valoracionProducto"
    ADD CONSTRAINT "tb_valoracionProducto_pkey" PRIMARY KEY (id_valoracion);


--
-- TOC entry 3261 (class 2606 OID 58534)
-- Name: tb_venta tb_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_venta
    ADD CONSTRAINT tb_venta_pkey PRIMARY KEY (id_venta);


--
-- TOC entry 3263 (class 2606 OID 58536)
-- Name: tipo_empleado tipo_empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_empleado
    ADD CONSTRAINT tipo_empleado_pkey PRIMARY KEY ("id_tipoEmpleado");


--
-- TOC entry 3236 (class 2606 OID 58538)
-- Name: tb_categoria uq_categoria_producto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_categoria
    ADD CONSTRAINT uq_categoria_producto UNIQUE (categoria_producto);


--
-- TOC entry 3244 (class 2606 OID 58540)
-- Name: tb_empleado uq_codigo_empleado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT uq_codigo_empleado UNIQUE (codigo_empleado);


--
-- TOC entry 3246 (class 2606 OID 58542)
-- Name: tb_empleado uq_dui_empleado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT uq_dui_empleado UNIQUE ("DUI");


--
-- TOC entry 3240 (class 2606 OID 58544)
-- Name: tb_cliente uq_email_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_cliente
    ADD CONSTRAINT uq_email_cliente UNIQUE (email_cliente);


--
-- TOC entry 3265 (class 2606 OID 58546)
-- Name: tipo_empleado uq_tipo_empleado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_empleado
    ADD CONSTRAINT uq_tipo_empleado UNIQUE ("tipoEmpleado");


--
-- TOC entry 3255 (class 1259 OID 58547)
-- Name: fki_FK_empleado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_empleado" ON public.tb_producto USING btree (id_empleado);


--
-- TOC entry 3270 (class 2606 OID 58548)
-- Name: tb_producto FK_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_categoria" FOREIGN KEY ("id_categoriaProducto") REFERENCES public.tb_categoria(id_categoria) NOT VALID;


--
-- TOC entry 3276 (class 2606 OID 58553)
-- Name: tb_venta FK_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_venta
    ADD CONSTRAINT "FK_cliente" FOREIGN KEY (id_cliente) REFERENCES public.tb_cliente(id_cliente) NOT VALID;


--
-- TOC entry 3271 (class 2606 OID 58558)
-- Name: tb_producto FK_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_empleado" FOREIGN KEY (id_empleado) REFERENCES public.tb_empleado(id_empleado) NOT VALID;


--
-- TOC entry 3272 (class 2606 OID 58563)
-- Name: tb_producto FK_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_estado" FOREIGN KEY ("id_estadoProducto") REFERENCES public.tb_estado(id_estado) NOT VALID;


--
-- TOC entry 3273 (class 2606 OID 58568)
-- Name: tb_producto FK_genero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_genero" FOREIGN KEY ("id_generoProducto") REFERENCES public.tb_genero(id_genero) NOT VALID;


--
-- TOC entry 3274 (class 2606 OID 58573)
-- Name: tb_producto FK_marca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_marca" FOREIGN KEY ("id_marcaProducto") REFERENCES public.tb_marca(id_marca) NOT VALID;


--
-- TOC entry 3275 (class 2606 OID 58578)
-- Name: tb_producto FK_presentacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_presentacion" FOREIGN KEY ("id_presentacionProducto") REFERENCES public.tb_presentacion(id_presentacion) NOT VALID;


--
-- TOC entry 3266 (class 2606 OID 58583)
-- Name: tb_DetalleVenta FK_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_producto" FOREIGN KEY (id_producto) REFERENCES public.tb_producto(id_producto) NOT VALID;


--
-- TOC entry 3269 (class 2606 OID 58588)
-- Name: tb_empleado FK_tipoEmpleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT "FK_tipoEmpleado" FOREIGN KEY (tipo_empleado) REFERENCES public.tipo_empleado("id_tipoEmpleado") NOT VALID;


--
-- TOC entry 3267 (class 2606 OID 58593)
-- Name: tb_DetalleVenta FK_valoracion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_valoracion" FOREIGN KEY ("id_Valoracion") REFERENCES public."tb_valoracionProducto"(id_valoracion) NOT VALID;


--
-- TOC entry 3268 (class 2606 OID 58598)
-- Name: tb_DetalleVenta FK_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_venta" FOREIGN KEY (id_venta) REFERENCES public.tb_venta(id_venta) NOT VALID;


-- Completed on 2022-06-17 11:46:48

--
-- PostgreSQL database dump complete
--

