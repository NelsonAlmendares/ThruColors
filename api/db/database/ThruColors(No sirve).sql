PGDMP     (    4                z            ThruColors2.0    14.3    14.3 i    r           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            s           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            t           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            u           1262    58003    ThruColors2.0    DATABASE     s   CREATE DATABASE "ThruColors2.0" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "ThruColors2.0";
                postgres    false            ?            1259    58007    tb_categoria    TABLE     ?   CREATE TABLE public.tb_categoria (
    id_categoria integer NOT NULL,
    categoria_producto character varying(50) NOT NULL,
    foto_categoria character varying(150) NOT NULL,
    descripcion_categoria character varying(200)
);
     DROP TABLE public.tb_categoria;
       public         heap    postgres    false            ?            1259    58010    tb_categoria_id_categoria_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.tb_categoria_id_categoria_seq;
       public          postgres    false    209            v           0    0    tb_categoria_id_categoria_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.tb_categoria_id_categoria_seq OWNED BY public.tb_categoria.id_categoria;
          public          postgres    false    210            ?            1259    58011 
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
       public         heap    postgres    false            ?            1259    58016    tb_cliente_id_cliente_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tb_cliente_id_cliente_seq;
       public          postgres    false    211            w           0    0    tb_cliente_id_cliente_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.tb_cliente_id_cliente_seq OWNED BY public.tb_cliente.id_cliente;
          public          postgres    false    212            ?            1259    58017    tb_empleado    TABLE     ?  CREATE TABLE public.tb_empleado (
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
       public         heap    postgres    false            ?            1259    58020    tb_empleado_id_empleado_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_empleado_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tb_empleado_id_empleado_seq;
       public          postgres    false    213            x           0    0    tb_empleado_id_empleado_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tb_empleado_id_empleado_seq OWNED BY public.tb_empleado.id_empleado;
          public          postgres    false    214            ?            1259    58021 	   tb_estado    TABLE     v   CREATE TABLE public.tb_estado (
    id_estado integer NOT NULL,
    estado_producto character varying(30) NOT NULL
);
    DROP TABLE public.tb_estado;
       public         heap    postgres    false            ?            1259    58168    tb_estadoVenta    TABLE     z   CREATE TABLE public."tb_estadoVenta" (
    id_estado integer NOT NULL,
    estado_venta character varying(40) NOT NULL
);
 $   DROP TABLE public."tb_estadoVenta";
       public         heap    postgres    false            ?            1259    58167    tb_estadoVenta_id_estado_seq    SEQUENCE     ?   CREATE SEQUENCE public."tb_estadoVenta_id_estado_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public."tb_estadoVenta_id_estado_seq";
       public          postgres    false    230            y           0    0    tb_estadoVenta_id_estado_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."tb_estadoVenta_id_estado_seq" OWNED BY public."tb_estadoVenta".id_estado;
          public          postgres    false    229            ?            1259    58024    tb_estado_id_estado_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_estado_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tb_estado_id_estado_seq;
       public          postgres    false    215            z           0    0    tb_estado_id_estado_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tb_estado_id_estado_seq OWNED BY public.tb_estado.id_estado;
          public          postgres    false    216            ?            1259    58025 	   tb_genero    TABLE     v   CREATE TABLE public.tb_genero (
    id_genero integer NOT NULL,
    genero_producto character varying(30) NOT NULL
);
    DROP TABLE public.tb_genero;
       public         heap    postgres    false            ?            1259    58028    tb_gerero_id_genero_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_gerero_id_genero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tb_gerero_id_genero_seq;
       public          postgres    false    217            {           0    0    tb_gerero_id_genero_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tb_gerero_id_genero_seq OWNED BY public.tb_genero.id_genero;
          public          postgres    false    218            ?            1259    58029    tb_marca    TABLE     m   CREATE TABLE public.tb_marca (
    id_marca integer NOT NULL,
    nombre_marca character varying NOT NULL
);
    DROP TABLE public.tb_marca;
       public         heap    postgres    false            ?            1259    58034    tb_marca_id_marca_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_marca_id_marca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tb_marca_id_marca_seq;
       public          postgres    false    219            |           0    0    tb_marca_id_marca_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tb_marca_id_marca_seq OWNED BY public.tb_marca.id_marca;
          public          postgres    false    220            ?            1259    58035    tb_presentacion    TABLE     ?   CREATE TABLE public.tb_presentacion (
    id_presentacion integer NOT NULL,
    presentacion_producto character varying(50) NOT NULL
);
 #   DROP TABLE public.tb_presentacion;
       public         heap    postgres    false            ?            1259    58038 #   tb_presentacion_id_presentacion_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_presentacion_id_presentacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.tb_presentacion_id_presentacion_seq;
       public          postgres    false    221            }           0    0 #   tb_presentacion_id_presentacion_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.tb_presentacion_id_presentacion_seq OWNED BY public.tb_presentacion.id_presentacion;
          public          postgres    false    222            ?            1259    58039    tb_producto    TABLE     9  CREATE TABLE public.tb_producto (
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
       public         heap    postgres    false            ?            1259    58042    tb_producto_id_producto_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tb_producto_id_producto_seq;
       public          postgres    false    223            ~           0    0    tb_producto_id_producto_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tb_producto_id_producto_seq OWNED BY public.tb_producto.id_producto;
          public          postgres    false    224            ?            1259    58043    tb_valoracionProducto    TABLE     ?   CREATE TABLE public."tb_valoracionProducto" (
    id_valoracion integer NOT NULL,
    comentario_producto character varying(300) NOT NULL,
    fecha_comentario date NOT NULL,
    estado_comentario character varying(100) NOT NULL
);
 +   DROP TABLE public."tb_valoracionProducto";
       public         heap    postgres    false            ?            1259    58046 '   tb_valoracionProducto_id_valoracion_seq    SEQUENCE     ?   CREATE SEQUENCE public."tb_valoracionProducto_id_valoracion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public."tb_valoracionProducto_id_valoracion_seq";
       public          postgres    false    225                       0    0 '   tb_valoracionProducto_id_valoracion_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public."tb_valoracionProducto_id_valoracion_seq" OWNED BY public."tb_valoracionProducto".id_valoracion;
          public          postgres    false    226            ?            1259    58185 	   tb_ventas    TABLE       CREATE TABLE public.tb_ventas (
    id_venta integer NOT NULL,
    fecha_venta date NOT NULL,
    estado_venta integer NOT NULL,
    id_cliente integer NOT NULL,
    cantidad_venta numeric NOT NULL,
    id_producto integer NOT NULL,
    id_valoracion integer NOT NULL
);
    DROP TABLE public.tb_ventas;
       public         heap    postgres    false            ?            1259    58184    tb_ventas_id_venta_seq    SEQUENCE     ?   CREATE SEQUENCE public.tb_ventas_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tb_ventas_id_venta_seq;
       public          postgres    false    232            ?           0    0    tb_ventas_id_venta_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tb_ventas_id_venta_seq OWNED BY public.tb_ventas.id_venta;
          public          postgres    false    231            ?            1259    58051    tipo_empleado    TABLE     }   CREATE TABLE public.tipo_empleado (
    "id_tipoEmpleado" integer NOT NULL,
    "tipoEmpleado" character varying NOT NULL
);
 !   DROP TABLE public.tipo_empleado;
       public         heap    postgres    false            ?            1259    58056 !   tipo_empleado_id_tipoEmpleado_seq    SEQUENCE     ?   CREATE SEQUENCE public."tipo_empleado_id_tipoEmpleado_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."tipo_empleado_id_tipoEmpleado_seq";
       public          postgres    false    227            ?           0    0 !   tipo_empleado_id_tipoEmpleado_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."tipo_empleado_id_tipoEmpleado_seq" OWNED BY public.tipo_empleado."id_tipoEmpleado";
          public          postgres    false    228            ?           2604    58057    tb_categoria id_categoria    DEFAULT     ?   ALTER TABLE ONLY public.tb_categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.tb_categoria_id_categoria_seq'::regclass);
 H   ALTER TABLE public.tb_categoria ALTER COLUMN id_categoria DROP DEFAULT;
       public          postgres    false    210    209            ?           2604    58058    tb_cliente id_cliente    DEFAULT     ~   ALTER TABLE ONLY public.tb_cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.tb_cliente_id_cliente_seq'::regclass);
 D   ALTER TABLE public.tb_cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    212    211            ?           2604    58059    tb_empleado id_empleado    DEFAULT     ?   ALTER TABLE ONLY public.tb_empleado ALTER COLUMN id_empleado SET DEFAULT nextval('public.tb_empleado_id_empleado_seq'::regclass);
 F   ALTER TABLE public.tb_empleado ALTER COLUMN id_empleado DROP DEFAULT;
       public          postgres    false    214    213            ?           2604    58060    tb_estado id_estado    DEFAULT     z   ALTER TABLE ONLY public.tb_estado ALTER COLUMN id_estado SET DEFAULT nextval('public.tb_estado_id_estado_seq'::regclass);
 B   ALTER TABLE public.tb_estado ALTER COLUMN id_estado DROP DEFAULT;
       public          postgres    false    216    215            ?           2604    58171    tb_estadoVenta id_estado    DEFAULT     ?   ALTER TABLE ONLY public."tb_estadoVenta" ALTER COLUMN id_estado SET DEFAULT nextval('public."tb_estadoVenta_id_estado_seq"'::regclass);
 I   ALTER TABLE public."tb_estadoVenta" ALTER COLUMN id_estado DROP DEFAULT;
       public          postgres    false    229    230    230            ?           2604    58061    tb_genero id_genero    DEFAULT     z   ALTER TABLE ONLY public.tb_genero ALTER COLUMN id_genero SET DEFAULT nextval('public.tb_gerero_id_genero_seq'::regclass);
 B   ALTER TABLE public.tb_genero ALTER COLUMN id_genero DROP DEFAULT;
       public          postgres    false    218    217            ?           2604    58062    tb_marca id_marca    DEFAULT     v   ALTER TABLE ONLY public.tb_marca ALTER COLUMN id_marca SET DEFAULT nextval('public.tb_marca_id_marca_seq'::regclass);
 @   ALTER TABLE public.tb_marca ALTER COLUMN id_marca DROP DEFAULT;
       public          postgres    false    220    219            ?           2604    58063    tb_presentacion id_presentacion    DEFAULT     ?   ALTER TABLE ONLY public.tb_presentacion ALTER COLUMN id_presentacion SET DEFAULT nextval('public.tb_presentacion_id_presentacion_seq'::regclass);
 N   ALTER TABLE public.tb_presentacion ALTER COLUMN id_presentacion DROP DEFAULT;
       public          postgres    false    222    221            ?           2604    58064    tb_producto id_producto    DEFAULT     ?   ALTER TABLE ONLY public.tb_producto ALTER COLUMN id_producto SET DEFAULT nextval('public.tb_producto_id_producto_seq'::regclass);
 F   ALTER TABLE public.tb_producto ALTER COLUMN id_producto DROP DEFAULT;
       public          postgres    false    224    223            ?           2604    58065 #   tb_valoracionProducto id_valoracion    DEFAULT     ?   ALTER TABLE ONLY public."tb_valoracionProducto" ALTER COLUMN id_valoracion SET DEFAULT nextval('public."tb_valoracionProducto_id_valoracion_seq"'::regclass);
 T   ALTER TABLE public."tb_valoracionProducto" ALTER COLUMN id_valoracion DROP DEFAULT;
       public          postgres    false    226    225            ?           2604    58188    tb_ventas id_venta    DEFAULT     x   ALTER TABLE ONLY public.tb_ventas ALTER COLUMN id_venta SET DEFAULT nextval('public.tb_ventas_id_venta_seq'::regclass);
 A   ALTER TABLE public.tb_ventas ALTER COLUMN id_venta DROP DEFAULT;
       public          postgres    false    231    232    232            ?           2604    58067    tipo_empleado id_tipoEmpleado    DEFAULT     ?   ALTER TABLE ONLY public.tipo_empleado ALTER COLUMN "id_tipoEmpleado" SET DEFAULT nextval('public."tipo_empleado_id_tipoEmpleado_seq"'::regclass);
 N   ALTER TABLE public.tipo_empleado ALTER COLUMN "id_tipoEmpleado" DROP DEFAULT;
       public          postgres    false    228    227            X          0    58007    tb_categoria 
   TABLE DATA                 public          postgres    false    209   6       Z          0    58011 
   tb_cliente 
   TABLE DATA                 public          postgres    false    211   Z?       \          0    58017    tb_empleado 
   TABLE DATA                 public          postgres    false    213   w?       ^          0    58021 	   tb_estado 
   TABLE DATA                 public          postgres    false    215   ??       m          0    58168    tb_estadoVenta 
   TABLE DATA                 public          postgres    false    230   `?       `          0    58025 	   tb_genero 
   TABLE DATA                 public          postgres    false    217   z?       b          0    58029    tb_marca 
   TABLE DATA                 public          postgres    false    219   ??       d          0    58035    tb_presentacion 
   TABLE DATA                 public          postgres    false    221   ??       f          0    58039    tb_producto 
   TABLE DATA                 public          postgres    false    223   |?       h          0    58043    tb_valoracionProducto 
   TABLE DATA                 public          postgres    false    225   #?       o          0    58185 	   tb_ventas 
   TABLE DATA                 public          postgres    false    232   ??       j          0    58051    tipo_empleado 
   TABLE DATA                 public          postgres    false    227   ??       ?           0    0    tb_categoria_id_categoria_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.tb_categoria_id_categoria_seq', 11, true);
          public          postgres    false    210            ?           0    0    tb_cliente_id_cliente_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tb_cliente_id_cliente_seq', 3, true);
          public          postgres    false    212            ?           0    0    tb_empleado_id_empleado_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.tb_empleado_id_empleado_seq', 12, true);
          public          postgres    false    214            ?           0    0    tb_estadoVenta_id_estado_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public."tb_estadoVenta_id_estado_seq"', 1, false);
          public          postgres    false    229            ?           0    0    tb_estado_id_estado_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tb_estado_id_estado_seq', 3, true);
          public          postgres    false    216            ?           0    0    tb_gerero_id_genero_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tb_gerero_id_genero_seq', 3, true);
          public          postgres    false    218            ?           0    0    tb_marca_id_marca_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tb_marca_id_marca_seq', 15, true);
          public          postgres    false    220            ?           0    0 #   tb_presentacion_id_presentacion_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.tb_presentacion_id_presentacion_seq', 6, true);
          public          postgres    false    222            ?           0    0    tb_producto_id_producto_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.tb_producto_id_producto_seq', 14, true);
          public          postgres    false    224            ?           0    0 '   tb_valoracionProducto_id_valoracion_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public."tb_valoracionProducto_id_valoracion_seq"', 2, true);
          public          postgres    false    226            ?           0    0    tb_ventas_id_venta_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tb_ventas_id_venta_seq', 1, false);
          public          postgres    false    231            ?           0    0 !   tipo_empleado_id_tipoEmpleado_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."tipo_empleado_id_tipoEmpleado_seq"', 4, true);
          public          postgres    false    228            ?           2606    58071    tb_categoria tb_categoria_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tb_categoria
    ADD CONSTRAINT tb_categoria_pkey PRIMARY KEY (id_categoria);
 H   ALTER TABLE ONLY public.tb_categoria DROP CONSTRAINT tb_categoria_pkey;
       public            postgres    false    209            ?           2606    58073    tb_cliente tb_cliente_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tb_cliente
    ADD CONSTRAINT tb_cliente_pkey PRIMARY KEY (id_cliente);
 D   ALTER TABLE ONLY public.tb_cliente DROP CONSTRAINT tb_cliente_pkey;
       public            postgres    false    211            ?           2606    58075    tb_empleado tb_empleado_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT tb_empleado_pkey PRIMARY KEY (id_empleado);
 F   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT tb_empleado_pkey;
       public            postgres    false    213            ?           2606    58173 "   tb_estadoVenta tb_estadoVenta_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."tb_estadoVenta"
    ADD CONSTRAINT "tb_estadoVenta_pkey" PRIMARY KEY (id_estado);
 P   ALTER TABLE ONLY public."tb_estadoVenta" DROP CONSTRAINT "tb_estadoVenta_pkey";
       public            postgres    false    230            ?           2606    58077    tb_estado tb_estado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tb_estado
    ADD CONSTRAINT tb_estado_pkey PRIMARY KEY (id_estado);
 B   ALTER TABLE ONLY public.tb_estado DROP CONSTRAINT tb_estado_pkey;
       public            postgres    false    215            ?           2606    58079    tb_genero tb_gerero_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tb_genero
    ADD CONSTRAINT tb_gerero_pkey PRIMARY KEY (id_genero);
 B   ALTER TABLE ONLY public.tb_genero DROP CONSTRAINT tb_gerero_pkey;
       public            postgres    false    217            ?           2606    58081    tb_marca tb_marca_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_marca
    ADD CONSTRAINT tb_marca_pkey PRIMARY KEY (id_marca);
 @   ALTER TABLE ONLY public.tb_marca DROP CONSTRAINT tb_marca_pkey;
       public            postgres    false    219            ?           2606    58083 $   tb_presentacion tb_presentacion_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.tb_presentacion
    ADD CONSTRAINT tb_presentacion_pkey PRIMARY KEY (id_presentacion);
 N   ALTER TABLE ONLY public.tb_presentacion DROP CONSTRAINT tb_presentacion_pkey;
       public            postgres    false    221            ?           2606    58085    tb_producto tb_producto_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT tb_producto_pkey PRIMARY KEY (id_producto);
 F   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT tb_producto_pkey;
       public            postgres    false    223            ?           2606    58087 0   tb_valoracionProducto tb_valoracionProducto_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."tb_valoracionProducto"
    ADD CONSTRAINT "tb_valoracionProducto_pkey" PRIMARY KEY (id_valoracion);
 ^   ALTER TABLE ONLY public."tb_valoracionProducto" DROP CONSTRAINT "tb_valoracionProducto_pkey";
       public            postgres    false    225            ?           2606    58192    tb_ventas tb_ventas_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tb_ventas
    ADD CONSTRAINT tb_ventas_pkey PRIMARY KEY (id_venta);
 B   ALTER TABLE ONLY public.tb_ventas DROP CONSTRAINT tb_ventas_pkey;
       public            postgres    false    232            ?           2606    58091     tipo_empleado tipo_empleado_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.tipo_empleado
    ADD CONSTRAINT tipo_empleado_pkey PRIMARY KEY ("id_tipoEmpleado");
 J   ALTER TABLE ONLY public.tipo_empleado DROP CONSTRAINT tipo_empleado_pkey;
       public            postgres    false    227            ?           2606    58093 "   tb_categoria uq_categoria_producto 
   CONSTRAINT     k   ALTER TABLE ONLY public.tb_categoria
    ADD CONSTRAINT uq_categoria_producto UNIQUE (categoria_producto);
 L   ALTER TABLE ONLY public.tb_categoria DROP CONSTRAINT uq_categoria_producto;
       public            postgres    false    209            ?           2606    58095    tb_empleado uq_codigo_empleado 
   CONSTRAINT     d   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT uq_codigo_empleado UNIQUE (codigo_empleado);
 H   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT uq_codigo_empleado;
       public            postgres    false    213            ?           2606    58097    tb_empleado uq_dui_empleado 
   CONSTRAINT     W   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT uq_dui_empleado UNIQUE ("DUI");
 E   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT uq_dui_empleado;
       public            postgres    false    213            ?           2606    58099    tb_cliente uq_email_cliente 
   CONSTRAINT     _   ALTER TABLE ONLY public.tb_cliente
    ADD CONSTRAINT uq_email_cliente UNIQUE (email_cliente);
 E   ALTER TABLE ONLY public.tb_cliente DROP CONSTRAINT uq_email_cliente;
       public            postgres    false    211            ?           2606    58101    tipo_empleado uq_tipo_empleado 
   CONSTRAINT     c   ALTER TABLE ONLY public.tipo_empleado
    ADD CONSTRAINT uq_tipo_empleado UNIQUE ("tipoEmpleado");
 H   ALTER TABLE ONLY public.tipo_empleado DROP CONSTRAINT uq_tipo_empleado;
       public            postgres    false    227            ?           1259    58102    fki_FK_empleado    INDEX     P   CREATE INDEX "fki_FK_empleado" ON public.tb_producto USING btree (id_empleado);
 %   DROP INDEX public."fki_FK_empleado";
       public            postgres    false    223            ?           2606    58103    tb_producto FK_categoria    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_categoria" FOREIGN KEY ("id_categoriaProducto") REFERENCES public.tb_categoria(id_categoria) NOT VALID;
 D   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_categoria";
       public          postgres    false    209    3232    223            ?           2606    58113    tb_producto FK_empleado    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_empleado" FOREIGN KEY (id_empleado) REFERENCES public.tb_empleado(id_empleado) NOT VALID;
 C   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_empleado";
       public          postgres    false    213    223    3240            ?           2606    58118    tb_producto FK_estado    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_estado" FOREIGN KEY ("id_estadoProducto") REFERENCES public.tb_estado(id_estado) NOT VALID;
 A   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_estado";
       public          postgres    false    3246    223    215            ?           2606    58193    tb_ventas FK_estadoVenta    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_ventas
    ADD CONSTRAINT "FK_estadoVenta" FOREIGN KEY (estado_venta) REFERENCES public."tb_estadoVenta"(id_estado) NOT VALID;
 D   ALTER TABLE ONLY public.tb_ventas DROP CONSTRAINT "FK_estadoVenta";
       public          postgres    false    3263    230    232            ?           2606    58123    tb_producto FK_genero    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_genero" FOREIGN KEY ("id_generoProducto") REFERENCES public.tb_genero(id_genero) NOT VALID;
 A   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_genero";
       public          postgres    false    3248    223    217            ?           2606    58128    tb_producto FK_marca    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_marca" FOREIGN KEY ("id_marcaProducto") REFERENCES public.tb_marca(id_marca) NOT VALID;
 @   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_marca";
       public          postgres    false    219    3250    223            ?           2606    58133    tb_producto FK_presentacion    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_presentacion" FOREIGN KEY ("id_presentacionProducto") REFERENCES public.tb_presentacion(id_presentacion) NOT VALID;
 G   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_presentacion";
       public          postgres    false    221    223    3252            ?           2606    58143    tb_empleado FK_tipoEmpleado    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT "FK_tipoEmpleado" FOREIGN KEY (tipo_empleado) REFERENCES public.tipo_empleado("id_tipoEmpleado") NOT VALID;
 G   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT "FK_tipoEmpleado";
       public          postgres    false    227    3259    213            ?           2606    58208    tb_ventas KF_producto    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_ventas
    ADD CONSTRAINT "KF_producto" FOREIGN KEY (id_producto) REFERENCES public.tb_producto(id_producto) NOT VALID;
 A   ALTER TABLE ONLY public.tb_ventas DROP CONSTRAINT "KF_producto";
       public          postgres    false    232    223    3255            ?           2606    58203    tb_ventas KF_valoracion    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_ventas
    ADD CONSTRAINT "KF_valoracion" FOREIGN KEY (id_valoracion) REFERENCES public."tb_valoracionProducto"(id_valoracion) NOT VALID;
 C   ALTER TABLE ONLY public.tb_ventas DROP CONSTRAINT "KF_valoracion";
       public          postgres    false    232    3257    225            ?           2606    58198    tb_ventas KF_ventaCliente    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tb_ventas
    ADD CONSTRAINT "KF_ventaCliente" FOREIGN KEY (id_cliente) REFERENCES public.tb_cliente(id_cliente) NOT VALID;
 E   ALTER TABLE ONLY public.tb_ventas DROP CONSTRAINT "KF_ventaCliente";
       public          postgres    false    232    211    3236            X     x?őMNA????v	!?? qe?	?D?-??.??L???&??#x1{0'?U?{]Uy_z?\͞?0_???I?D?!??U/]?'Շ?v?x?????M???X??!Qw?{?z?x???;?C?@#Xq(r_^M??o'4)y<hܶ8 ???M ??V4?G u??1"???k??E.zw??ũF?6????X????=b=2T????W??,??J?^L?]??N>?:Pk?pdG??6ʹW;??^si??o伔ĢUxO1e?^s?U????8H<?t:???6      Z     x?M??N?@??y?MlRHp?@??7?VZC?@????1??f???w?)|1Y?w??dN?d?u??Q6??<R	W??I???Ww??5?aR
)???aB%1????@???`I??І?[???v???z?̞?5j]??R?N}?ډq/?x:X	\(D?܀??2b	?8????H}?wc0Ӆ????????v????t????I?[S???^?????fIL?????<??~J(HpO8???`؋BS??˽߹n?Z??ew?      \   Y  x?Ր?n?@??}??1Q?? ???QkITԔ?4?v?E~????}?bS+}?^͜3'3?ϴ??zL{〴?)	??	???s?#?W ㉟??!???՞n?? `??A@8k??ɾ?MQ??x?<Q????xq?}?/?3???Α_u?:AA??SF?eM?@ @983??Y?I?݁UG;b??e?7s?*??i???:?z?`O?ұ?\1?ϲ??-|=Z??P??I???pH???}??? G?;W:??5Q??P?(?|????P&??)ʀ|~?: oX5f/??T??ؔ??;?k?q>?dG??<^??2??ʽ??
N?&???!?D??????A?      ^   p   x???v
Q???W((M??L?+I?O-.IL?W??L?2u t|AQ~JirI??B??O?k???????k?BR~Jjz???5?'?F?tL??R?@c??~?
?y??y%EPc?? ?!R?      m   
   x???          `   j   x???v
Q???W((M??L?+I?OO?K-?W??L?2u t|AQ~JirI??B??O?k???????G~nRQ???5?'????-?J-??q?@?B?2?S+@?qq ѵN?      b   ?   x????j?@??{?bn*H1Zi?'ŵ??)4?W???Y?V??9?b??G????c????0%dy???j??;W;?l?n{?!D_1ݦl????a:????(???)?4?T?M?7lb ?6m???j?^???{b?jl.XN?3)??Gў??#V[?D???W??Slz?o?t?A?r[??_?ﬔ2????z?텸?L?Y
Vo?gb|+["?ѻ???'???-      d   ?   x???v
Q???W((M??L?+I?/(J-N?+IL???S??LA?Q@???SJ?K?5?}B]?4u?Mrs?5??<i`??CZ?`?????47?V6? m?O*???@???L??̀6?B??? !??O      f   ?  x???Kn?0??9? '?`Xo]5??H?"v???I),$Q Š?z?.??.[_?C?Vd7G?4Cs????w????w??6?$?v??V+nY??J????L?F?\?eˤjF?B-b?t??x?K?U?????]z?lu[	??VԨ?8[)?Չ?a'J????V#?]~#W??\?!?k?????bWs?i{0??\bE?VJCa??\?N??J??%s??g+?Q-?M9??&A?g?,
???Ӷ7?3?yy@12??f??U?M??],?4ԣd?6}P???F?.?жC??؆?Xr??s?\H????T%??iJ?9??gI*?<??I? s#?پ?'??L??N߸?Z?]~D?I??9?0le??u??µ?f?Y}?{w.?J?Ld?$?)K???'??B???a?~??U
6?񢮷?hN?P???<zC9?????9? h?Y?dO??hsČ?ƊG??}ֵ??R??<??=??A=~80
F?>
????
`g???V???M5?0N9k;Kl?CE?S?	?S??E??O?ϣ??O<?9wIF??T???P??8Ȧq<j???YS????(?0;]5%%b !G#??m??W?h`?0ʣ?\?&???խ??A?
D?????	?????Pj?CT 2>??9K??3>~??w??????v      h   ?   x?Ŏ=?0E????K[H???:?~???4yb 敚??vru??.?????@Y5?}g?\.\׎?? ?&{Hy?h?V????Z'Mm???P?E;M?鄢Y??u??5$+??#t-L??h?q?y?y??3???N??????8*{afΖ?h?V?/?(zl?~M      o   
   x???          j   v   x???v
Q???W((M??L?+?,ȏO?-?IML?W?P?L?	?BE?t?P??
a?>???
?:
??)??y??%E@?"uMk.Oj?`?!,5/%??NM.J-I,???? ?]?     