PGDMP     $            	        z         
   ThruColors    14.1    14.1 g    r           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            s           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            t           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            u           1262    58267 
   ThruColors    DATABASE     h   CREATE DATABASE "ThruColors" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "ThruColors";
                postgres    false            ?            1259    58268    tb_DetalleVenta    TABLE     ?   CREATE TABLE public."tb_DetalleVenta" (
    "id_DetalleVenta" integer NOT NULL,
    cantidad integer NOT NULL,
    id_producto integer NOT NULL,
    id_venta integer NOT NULL,
    "id_Valoracion" integer,
    precio_producto double precision NOT NULL
);
 %   DROP TABLE public."tb_DetalleVenta";
       public         heap    postgres    false            ?            1259    58441 #   tb_DetalleVenta_id_DetalleVenta_seq    SEQUENCE     ?   ALTER TABLE public."tb_DetalleVenta" ALTER COLUMN "id_DetalleVenta" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tb_DetalleVenta_id_DetalleVenta_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            ?            1259    58271    tb_categoria    TABLE     ?   CREATE TABLE public.tb_categoria (
    id_categoria integer NOT NULL,
    categoria_producto character varying(50) NOT NULL,
    foto_categoria character varying(150) NOT NULL,
    descripcion_categoria character varying(200)
);
     DROP TABLE public.tb_categoria;
       public         heap    postgres    false            ?            1259    58274    tb_categoria_id_categoria_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.tb_categoria_id_categoria_seq;
       public          postgres    false    210            v           0    0    tb_categoria_id_categoria_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.tb_categoria_id_categoria_seq OWNED BY public.tb_categoria.id_categoria;
          public          postgres    false    211            ?            1259    58275 
   tb_cliente    TABLE     ?  CREATE TABLE public.tb_cliente (
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
    DROP TABLE public.tb_cliente;
       public         heap    postgres    false            ?            1259    58280    tb_cliente_id_cliente_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tb_cliente_id_cliente_seq;
       public          postgres    false    212            w           0    0    tb_cliente_id_cliente_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.tb_cliente_id_cliente_seq OWNED BY public.tb_cliente.id_cliente;
          public          postgres    false    213            ?            1259    58281    tb_empleado    TABLE     ?  CREATE TABLE public.tb_empleado (
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
    DROP TABLE public.tb_empleado;
       public         heap    postgres    false            ?            1259    58284    tb_empleado_id_empleado_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_empleado_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tb_empleado_id_empleado_seq;
       public          postgres    false    214            x           0    0    tb_empleado_id_empleado_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tb_empleado_id_empleado_seq OWNED BY public.tb_empleado.id_empleado;
          public          postgres    false    215            ?            1259    58285 	   tb_estado    TABLE     v   CREATE TABLE public.tb_estado (
    id_estado integer NOT NULL,
    estado_producto character varying(30) NOT NULL
);
    DROP TABLE public.tb_estado;
       public         heap    postgres    false            ?            1259    58288    tb_estado_id_estado_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_estado_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tb_estado_id_estado_seq;
       public          postgres    false    216            y           0    0    tb_estado_id_estado_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tb_estado_id_estado_seq OWNED BY public.tb_estado.id_estado;
          public          postgres    false    217            ?            1259    58289 	   tb_genero    TABLE     v   CREATE TABLE public.tb_genero (
    id_genero integer NOT NULL,
    genero_producto character varying(30) NOT NULL
);
    DROP TABLE public.tb_genero;
       public         heap    postgres    false            ?            1259    58292    tb_gerero_id_genero_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_gerero_id_genero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tb_gerero_id_genero_seq;
       public          postgres    false    218            z           0    0    tb_gerero_id_genero_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tb_gerero_id_genero_seq OWNED BY public.tb_genero.id_genero;
          public          postgres    false    219            ?            1259    58293    tb_marca    TABLE     m   CREATE TABLE public.tb_marca (
    id_marca integer NOT NULL,
    nombre_marca character varying NOT NULL
);
    DROP TABLE public.tb_marca;
       public         heap    postgres    false            ?            1259    58298    tb_marca_id_marca_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_marca_id_marca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tb_marca_id_marca_seq;
       public          postgres    false    220            {           0    0    tb_marca_id_marca_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tb_marca_id_marca_seq OWNED BY public.tb_marca.id_marca;
          public          postgres    false    221            ?            1259    58299    tb_presentacion    TABLE     ?   CREATE TABLE public.tb_presentacion (
    id_presentacion integer NOT NULL,
    presentacion_producto character varying(50) NOT NULL
);
 #   DROP TABLE public.tb_presentacion;
       public         heap    postgres    false            ?            1259    58302 #   tb_presentacion_id_presentacion_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_presentacion_id_presentacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.tb_presentacion_id_presentacion_seq;
       public          postgres    false    222            |           0    0 #   tb_presentacion_id_presentacion_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.tb_presentacion_id_presentacion_seq OWNED BY public.tb_presentacion.id_presentacion;
          public          postgres    false    223            ?            1259    58303    tb_producto    TABLE     9  CREATE TABLE public.tb_producto (
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
    DROP TABLE public.tb_producto;
       public         heap    postgres    false            ?            1259    58306    tb_producto_id_producto_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tb_producto_id_producto_seq;
       public          postgres    false    224            }           0    0    tb_producto_id_producto_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tb_producto_id_producto_seq OWNED BY public.tb_producto.id_producto;
          public          postgres    false    225            ?            1259    58307    tb_valoracionProducto    TABLE     ?   CREATE TABLE public."tb_valoracionProducto" (
    id_valoracion integer NOT NULL,
    comentario_producto character varying(300) NOT NULL,
    fecha_comentario date NOT NULL,
    estado_comentario character varying(100) NOT NULL
);
 +   DROP TABLE public."tb_valoracionProducto";
       public         heap    postgres    false            ?            1259    58310 '   tb_valoracionProducto_id_valoracion_seq    SEQUENCE     ?   CREATE SEQUENCE public."tb_valoracionProducto_id_valoracion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public."tb_valoracionProducto_id_valoracion_seq";
       public          postgres    false    226            ~           0    0 '   tb_valoracionProducto_id_valoracion_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public."tb_valoracionProducto_id_valoracion_seq" OWNED BY public."tb_valoracionProducto".id_valoracion;
          public          postgres    false    227            ?            1259    58311    tb_venta    TABLE     ?   CREATE TABLE public.tb_venta (
    id_venta integer NOT NULL,
    fecha_venta date NOT NULL,
    id_cliente integer NOT NULL,
    estado_venta smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.tb_venta;
       public         heap    postgres    false            ?            1259    58314    tb_venta_id_venta_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_venta_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tb_venta_id_venta_seq;
       public          postgres    false    228                       0    0    tb_venta_id_venta_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tb_venta_id_venta_seq OWNED BY public.tb_venta.id_venta;
          public          postgres    false    229            ?            1259    58315    tipo_empleado    TABLE     }   CREATE TABLE public.tipo_empleado (
    "id_tipoEmpleado" integer NOT NULL,
    "tipoEmpleado" character varying NOT NULL
);
 !   DROP TABLE public.tipo_empleado;
       public         heap    postgres    false            ?            1259    58320 !   tipo_empleado_id_tipoEmpleado_seq    SEQUENCE     ?   CREATE SEQUENCE public."tipo_empleado_id_tipoEmpleado_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."tipo_empleado_id_tipoEmpleado_seq";
       public          postgres    false    230            ?           0    0 !   tipo_empleado_id_tipoEmpleado_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."tipo_empleado_id_tipoEmpleado_seq" OWNED BY public.tipo_empleado."id_tipoEmpleado";
          public          postgres    false    231            ?           2604    58321    tb_categoria id_categoria    DEFAULT     ?   ALTER TABLE ONLY public.tb_categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.tb_categoria_id_categoria_seq'::regclass);
 H   ALTER TABLE public.tb_categoria ALTER COLUMN id_categoria DROP DEFAULT;
       public          postgres    false    211    210            ?           2604    58322    tb_cliente id_cliente    DEFAULT     ~   ALTER TABLE ONLY public.tb_cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.tb_cliente_id_cliente_seq'::regclass);
 D   ALTER TABLE public.tb_cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    213    212            ?           2604    58323    tb_empleado id_empleado    DEFAULT     ?   ALTER TABLE ONLY public.tb_empleado ALTER COLUMN id_empleado SET DEFAULT nextval('public.tb_empleado_id_empleado_seq'::regclass);
 F   ALTER TABLE public.tb_empleado ALTER COLUMN id_empleado DROP DEFAULT;
       public          postgres    false    215    214            ?           2604    58324    tb_estado id_estado    DEFAULT     z   ALTER TABLE ONLY public.tb_estado ALTER COLUMN id_estado SET DEFAULT nextval('public.tb_estado_id_estado_seq'::regclass);
 B   ALTER TABLE public.tb_estado ALTER COLUMN id_estado DROP DEFAULT;
       public          postgres    false    217    216            ?           2604    58325    tb_genero id_genero    DEFAULT     z   ALTER TABLE ONLY public.tb_genero ALTER COLUMN id_genero SET DEFAULT nextval('public.tb_gerero_id_genero_seq'::regclass);
 B   ALTER TABLE public.tb_genero ALTER COLUMN id_genero DROP DEFAULT;
       public          postgres    false    219    218            ?           2604    58326    tb_marca id_marca    DEFAULT     v   ALTER TABLE ONLY public.tb_marca ALTER COLUMN id_marca SET DEFAULT nextval('public.tb_marca_id_marca_seq'::regclass);
 @   ALTER TABLE public.tb_marca ALTER COLUMN id_marca DROP DEFAULT;
       public          postgres    false    221    220            ?           2604    58327    tb_presentacion id_presentacion    DEFAULT     ?   ALTER TABLE ONLY public.tb_presentacion ALTER COLUMN id_presentacion SET DEFAULT nextval('public.tb_presentacion_id_presentacion_seq'::regclass);
 N   ALTER TABLE public.tb_presentacion ALTER COLUMN id_presentacion DROP DEFAULT;
       public          postgres    false    223    222            ?           2604    58328    tb_producto id_producto    DEFAULT     ?   ALTER TABLE ONLY public.tb_producto ALTER COLUMN id_producto SET DEFAULT nextval('public.tb_producto_id_producto_seq'::regclass);
 F   ALTER TABLE public.tb_producto ALTER COLUMN id_producto DROP DEFAULT;
       public          postgres    false    225    224            ?           2604    58329 #   tb_valoracionProducto id_valoracion    DEFAULT     ?   ALTER TABLE ONLY public."tb_valoracionProducto" ALTER COLUMN id_valoracion SET DEFAULT nextval('public."tb_valoracionProducto_id_valoracion_seq"'::regclass);
 T   ALTER TABLE public."tb_valoracionProducto" ALTER COLUMN id_valoracion DROP DEFAULT;
       public          postgres    false    227    226            ?           2604    58330    tb_venta id_venta    DEFAULT     v   ALTER TABLE ONLY public.tb_venta ALTER COLUMN id_venta SET DEFAULT nextval('public.tb_venta_id_venta_seq'::regclass);
 @   ALTER TABLE public.tb_venta ALTER COLUMN id_venta DROP DEFAULT;
       public          postgres    false    229    228            ?           2604    58331    tipo_empleado id_tipoEmpleado    DEFAULT     ?   ALTER TABLE ONLY public.tipo_empleado ALTER COLUMN "id_tipoEmpleado" SET DEFAULT nextval('public."tipo_empleado_id_tipoEmpleado_seq"'::regclass);
 N   ALTER TABLE public.tipo_empleado ALTER COLUMN "id_tipoEmpleado" DROP DEFAULT;
       public          postgres    false    231    230            X          0    58268    tb_DetalleVenta 
   TABLE DATA           ?   COPY public."tb_DetalleVenta" ("id_DetalleVenta", cantidad, id_producto, id_venta, "id_Valoracion", precio_producto) FROM stdin;
    public          postgres    false    209   ??       Y          0    58271    tb_categoria 
   TABLE DATA           o   COPY public.tb_categoria (id_categoria, categoria_producto, foto_categoria, descripcion_categoria) FROM stdin;
    public          postgres    false    210   ҂       [          0    58275 
   tb_cliente 
   TABLE DATA           ?   COPY public.tb_cliente (id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, password, estado_cliente, foto_cliente) FROM stdin;
    public          postgres    false    212   ??       ]          0    58281    tb_empleado 
   TABLE DATA           ?   COPY public.tb_empleado (id_empleado, nombre_empleado, apellido_empleado, "DUI", direccion_empleado, codigo_empleado, password_empleado, tipo_empleado, foto_empleado) FROM stdin;
    public          postgres    false    214   ^?       _          0    58285 	   tb_estado 
   TABLE DATA           ?   COPY public.tb_estado (id_estado, estado_producto) FROM stdin;
    public          postgres    false    216   Y?       a          0    58289 	   tb_genero 
   TABLE DATA           ?   COPY public.tb_genero (id_genero, genero_producto) FROM stdin;
    public          postgres    false    218   ??       c          0    58293    tb_marca 
   TABLE DATA           :   COPY public.tb_marca (id_marca, nombre_marca) FROM stdin;
    public          postgres    false    220   Ѕ       e          0    58299    tb_presentacion 
   TABLE DATA           Q   COPY public.tb_presentacion (id_presentacion, presentacion_producto) FROM stdin;
    public          postgres    false    222   p?       g          0    58303    tb_producto 
   TABLE DATA           	  COPY public.tb_producto (id_producto, costo_producto, descripcion_producto, foto_producto, cantidad_producto, "id_estadoProducto", id_empleado, "id_marcaProducto", "id_generoProducto", "id_categoriaProducto", "id_presentacionProducto", nombre_producto) FROM stdin;
    public          postgres    false    224   ??       i          0    58307    tb_valoracionProducto 
   TABLE DATA           z   COPY public."tb_valoracionProducto" (id_valoracion, comentario_producto, fecha_comentario, estado_comentario) FROM stdin;
    public          postgres    false    226   ??       k          0    58311    tb_venta 
   TABLE DATA           S   COPY public.tb_venta (id_venta, fecha_venta, id_cliente, estado_venta) FROM stdin;
    public          postgres    false    228   ?       m          0    58315    tipo_empleado 
   TABLE DATA           J   COPY public.tipo_empleado ("id_tipoEmpleado", "tipoEmpleado") FROM stdin;
    public          postgres    false    230   N?       ?           0    0 #   tb_DetalleVenta_id_DetalleVenta_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public."tb_DetalleVenta_id_DetalleVenta_seq"', 7, true);
          public          postgres    false    232            ?           0    0    tb_categoria_id_categoria_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.tb_categoria_id_categoria_seq', 11, true);
          public          postgres    false    211            ?           0    0    tb_cliente_id_cliente_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tb_cliente_id_cliente_seq', 3, true);
          public          postgres    false    213            ?           0    0    tb_empleado_id_empleado_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.tb_empleado_id_empleado_seq', 12, true);
          public          postgres    false    215            ?           0    0    tb_estado_id_estado_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tb_estado_id_estado_seq', 3, true);
          public          postgres    false    217            ?           0    0    tb_gerero_id_genero_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tb_gerero_id_genero_seq', 3, true);
          public          postgres    false    219            ?           0    0    tb_marca_id_marca_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tb_marca_id_marca_seq', 15, true);
          public          postgres    false    221            ?           0    0 #   tb_presentacion_id_presentacion_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.tb_presentacion_id_presentacion_seq', 6, true);
          public          postgres    false    223            ?           0    0    tb_producto_id_producto_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.tb_producto_id_producto_seq', 14, true);
          public          postgres    false    225            ?           0    0 '   tb_valoracionProducto_id_valoracion_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public."tb_valoracionProducto_id_valoracion_seq"', 2, true);
          public          postgres    false    227            ?           0    0    tb_venta_id_venta_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tb_venta_id_venta_seq', 3, true);
          public          postgres    false    229            ?           0    0 !   tipo_empleado_id_tipoEmpleado_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."tipo_empleado_id_tipoEmpleado_seq"', 4, true);
          public          postgres    false    231            ?           2606    58333 $   tb_DetalleVenta tb_DetalleVenta_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "tb_DetalleVenta_pkey" PRIMARY KEY ("id_DetalleVenta");
 R   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "tb_DetalleVenta_pkey";
       public            postgres    false    209            ?           2606    58335    tb_categoria tb_categoria_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tb_categoria
    ADD CONSTRAINT tb_categoria_pkey PRIMARY KEY (id_categoria);
 H   ALTER TABLE ONLY public.tb_categoria DROP CONSTRAINT tb_categoria_pkey;
       public            postgres    false    210            ?           2606    58337    tb_cliente tb_cliente_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tb_cliente
    ADD CONSTRAINT tb_cliente_pkey PRIMARY KEY (id_cliente);
 D   ALTER TABLE ONLY public.tb_cliente DROP CONSTRAINT tb_cliente_pkey;
       public            postgres    false    212            ?           2606    58339    tb_empleado tb_empleado_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT tb_empleado_pkey PRIMARY KEY (id_empleado);
 F   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT tb_empleado_pkey;
       public            postgres    false    214            ?           2606    58341    tb_estado tb_estado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tb_estado
    ADD CONSTRAINT tb_estado_pkey PRIMARY KEY (id_estado);
 B   ALTER TABLE ONLY public.tb_estado DROP CONSTRAINT tb_estado_pkey;
       public            postgres    false    216            ?           2606    58343    tb_genero tb_gerero_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tb_genero
    ADD CONSTRAINT tb_gerero_pkey PRIMARY KEY (id_genero);
 B   ALTER TABLE ONLY public.tb_genero DROP CONSTRAINT tb_gerero_pkey;
       public            postgres    false    218            ?           2606    58345    tb_marca tb_marca_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_marca
    ADD CONSTRAINT tb_marca_pkey PRIMARY KEY (id_marca);
 @   ALTER TABLE ONLY public.tb_marca DROP CONSTRAINT tb_marca_pkey;
       public            postgres    false    220            ?           2606    58347 $   tb_presentacion tb_presentacion_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.tb_presentacion
    ADD CONSTRAINT tb_presentacion_pkey PRIMARY KEY (id_presentacion);
 N   ALTER TABLE ONLY public.tb_presentacion DROP CONSTRAINT tb_presentacion_pkey;
       public            postgres    false    222            ?           2606    58349    tb_producto tb_producto_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT tb_producto_pkey PRIMARY KEY (id_producto);
 F   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT tb_producto_pkey;
       public            postgres    false    224            ?           2606    58351 0   tb_valoracionProducto tb_valoracionProducto_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."tb_valoracionProducto"
    ADD CONSTRAINT "tb_valoracionProducto_pkey" PRIMARY KEY (id_valoracion);
 ^   ALTER TABLE ONLY public."tb_valoracionProducto" DROP CONSTRAINT "tb_valoracionProducto_pkey";
       public            postgres    false    226            ?           2606    58353    tb_venta tb_venta_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_venta
    ADD CONSTRAINT tb_venta_pkey PRIMARY KEY (id_venta);
 @   ALTER TABLE ONLY public.tb_venta DROP CONSTRAINT tb_venta_pkey;
       public            postgres    false    228            ?           2606    58355     tipo_empleado tipo_empleado_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.tipo_empleado
    ADD CONSTRAINT tipo_empleado_pkey PRIMARY KEY ("id_tipoEmpleado");
 J   ALTER TABLE ONLY public.tipo_empleado DROP CONSTRAINT tipo_empleado_pkey;
       public            postgres    false    230            ?           2606    58357 "   tb_categoria uq_categoria_producto 
   CONSTRAINT     k   ALTER TABLE ONLY public.tb_categoria
    ADD CONSTRAINT uq_categoria_producto UNIQUE (categoria_producto);
 L   ALTER TABLE ONLY public.tb_categoria DROP CONSTRAINT uq_categoria_producto;
       public            postgres    false    210            ?           2606    58359    tb_empleado uq_codigo_empleado 
   CONSTRAINT     d   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT uq_codigo_empleado UNIQUE (codigo_empleado);
 H   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT uq_codigo_empleado;
       public            postgres    false    214            ?           2606    58361    tb_empleado uq_dui_empleado 
   CONSTRAINT     W   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT uq_dui_empleado UNIQUE ("DUI");
 E   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT uq_dui_empleado;
       public            postgres    false    214            ?           2606    58363    tb_cliente uq_email_cliente 
   CONSTRAINT     _   ALTER TABLE ONLY public.tb_cliente
    ADD CONSTRAINT uq_email_cliente UNIQUE (email_cliente);
 E   ALTER TABLE ONLY public.tb_cliente DROP CONSTRAINT uq_email_cliente;
       public            postgres    false    212            ?           2606    58365    tipo_empleado uq_tipo_empleado 
   CONSTRAINT     c   ALTER TABLE ONLY public.tipo_empleado
    ADD CONSTRAINT uq_tipo_empleado UNIQUE ("tipoEmpleado");
 H   ALTER TABLE ONLY public.tipo_empleado DROP CONSTRAINT uq_tipo_empleado;
       public            postgres    false    230            ?           1259    58366    fki_FK_empleado    INDEX     P   CREATE INDEX "fki_FK_empleado" ON public.tb_producto USING btree (id_empleado);
 %   DROP INDEX public."fki_FK_empleado";
       public            postgres    false    224            ?           2606    58367    tb_producto FK_categoria    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_categoria" FOREIGN KEY ("id_categoriaProducto") REFERENCES public.tb_categoria(id_categoria) NOT VALID;
 D   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_categoria";
       public          postgres    false    3234    224    210            ?           2606    58372    tb_venta FK_cliente    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_venta
    ADD CONSTRAINT "FK_cliente" FOREIGN KEY (id_cliente) REFERENCES public.tb_cliente(id_cliente) NOT VALID;
 ?   ALTER TABLE ONLY public.tb_venta DROP CONSTRAINT "FK_cliente";
       public          postgres    false    3238    228    212            ?           2606    58377    tb_producto FK_empleado    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_empleado" FOREIGN KEY (id_empleado) REFERENCES public.tb_empleado(id_empleado) NOT VALID;
 C   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_empleado";
       public          postgres    false    224    3242    214            ?           2606    58382    tb_producto FK_estado    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_estado" FOREIGN KEY ("id_estadoProducto") REFERENCES public.tb_estado(id_estado) NOT VALID;
 A   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_estado";
       public          postgres    false    224    3248    216            ?           2606    58387    tb_producto FK_genero    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_genero" FOREIGN KEY ("id_generoProducto") REFERENCES public.tb_genero(id_genero) NOT VALID;
 A   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_genero";
       public          postgres    false    218    224    3250            ?           2606    58392    tb_producto FK_marca    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_marca" FOREIGN KEY ("id_marcaProducto") REFERENCES public.tb_marca(id_marca) NOT VALID;
 @   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_marca";
       public          postgres    false    224    3252    220            ?           2606    58397    tb_producto FK_presentacion    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_presentacion" FOREIGN KEY ("id_presentacionProducto") REFERENCES public.tb_presentacion(id_presentacion) NOT VALID;
 G   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_presentacion";
       public          postgres    false    224    3254    222            ?           2606    58402    tb_DetalleVenta FK_producto    FK CONSTRAINT     ?   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_producto" FOREIGN KEY (id_producto) REFERENCES public.tb_producto(id_producto) NOT VALID;
 I   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "FK_producto";
       public          postgres    false    209    3257    224            ?           2606    58407    tb_empleado FK_tipoEmpleado    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT "FK_tipoEmpleado" FOREIGN KEY (tipo_empleado) REFERENCES public.tipo_empleado("id_tipoEmpleado") NOT VALID;
 G   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT "FK_tipoEmpleado";
       public          postgres    false    214    3263    230            ?           2606    58412    tb_DetalleVenta FK_valoracion    FK CONSTRAINT     ?   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_valoracion" FOREIGN KEY ("id_Valoracion") REFERENCES public."tb_valoracionProducto"(id_valoracion) NOT VALID;
 K   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "FK_valoracion";
       public          postgres    false    209    3259    226            ?           2606    58417    tb_DetalleVenta FK_venta    FK CONSTRAINT     ?   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_venta" FOREIGN KEY (id_venta) REFERENCES public.tb_venta(id_venta) NOT VALID;
 F   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "FK_venta";
       public          postgres    false    209    3261    228            X   =   x?%??  ??]1$??4a?_?D??쀡????A?CǇ?
&j??R?H??8B??1E      Y   ?   x?=?Kn1D??S?	???a?.?l??4??"?\9?L?VU?^?~8?S(?}??-?'?,v?%??/br\@$?|??pa???>se??_??r?0?v8&???ɲݽ??| .4??r?Ϝ??_?ZjV????7??Z??Q??8?g???h~?u+??o?i??'?n?ںDN$}v????????s??W?      [   ?   x??9?@ ?z8??:?/?(?h?%Q??gؾƀ???Sx1_?4@?? ??q\?\??m?s9bQ????{??F?g)??Ӫ? [?EG??h???y?Q?h?B???̣?a??M-.?,?Cȴ蔪͘?[?W? ?_Pb??c??kq/?????;?$???3_      ]   ?   x?=?IR?@??us?^?4m??2E?
d???r??!t??0hȵ<?ӊ???},?nB>t
zdْq??3-???r|S?y?2?d2j?:??????p}l?r#?jE?+K)?U?Ӓ?????[?z8???=??u?b2?????\??=?;???L?P]?W?m:\??jS?????8:Z?d??z??M<o??.???????tx?>y?-YM????\??T\(/?0?/ïO      _   0   x?3?t?SH?OIMO?2?tL?/IL??2???WH?K??+)?c???? iv      a   '   x?3????M*J?2??-?J-?2???,N??????? ?|T      c   ?   x?̽?0???)2?	? 4P???Vb;:?#?s?韞??K$&??KŞ?5*?aF+????Q?A??Kd,h??(̔??{?~?4?`??;Ɯ֬?????x?~_??????s+???lF?E?????	??Y/!      e   <   x?3?450???2?44 3?9]?Js?L8????R??L9???LN?2?42)????? ?q?      g   ?  x?e??n?@???)?,t???:??H???H?f?g#`?^?8o?GI??]Z^,??N@3h???gV?m?nQ@??:???A??(3???D8??N?L=??V???E!?t?Jvb??a9k?1y?!I˪?(?;;???`Ai?\????D?H?<Mk??Ăm?`d??,\?C???SU?Rp??\?%_?????N??6??4M%?j?3?>$?f@wE??N?ʮ????0??z,x-??ΪJղ.vtN?r},??????l-?;?o?q??P?M??????ju/)jMk??l??H鯒|?)???<?1???kk?s??h6?Y??????č?z??B?rJ?e?????????c??8I???l????wT???"kx?:u??}????z?XB??6-ˣlH??}0?????L=??? ???)?_t??>o?秂?G????z??hh?@?i}]?????m?c??7?U??????T?sHɗ4I?? ??H      i   W   x?3?,MUH*M?S((?O)M.??QH?HN?I?+I?4202?50?52?LL.?,??2??M?AR??????P??????????EK? ?9?      k   !   x?3?4202?50?5??4?4?2F????? }??      m   2   x?3?tL????,.)JL?/?2?K?KI1?9?S??RK?2??b???? V?     