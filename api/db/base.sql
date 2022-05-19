PGDMP                         z            DB_ThruColors    14.0    14.0 `    f           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            g           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            h           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            i           1262    34298    DB_ThruColors    DATABASE     k   CREATE DATABASE "DB_ThruColors" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "DB_ThruColors";
                postgres    false            �            1259    34299    tb_DetalleVenta    TABLE     �   CREATE TABLE public."tb_DetalleVenta" (
    "id_DetalleVenta" integer NOT NULL,
    cantidad integer NOT NULL,
    id_producto integer NOT NULL,
    id_venta integer NOT NULL,
    "id_Valoracion" integer NOT NULL
);
 %   DROP TABLE public."tb_DetalleVenta";
       public         heap    postgres    false            �            1259    34302    tb_categoria    TABLE     �   CREATE TABLE public.tb_categoria (
    id_categoria integer NOT NULL,
    categoria_producto character varying(50) NOT NULL,
    foto_categoria character varying(150)
);
     DROP TABLE public.tb_categoria;
       public         heap    postgres    false            �            1259    34305    tb_categoria_id_categoria_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.tb_categoria_id_categoria_seq;
       public          postgres    false    210            j           0    0    tb_categoria_id_categoria_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.tb_categoria_id_categoria_seq OWNED BY public.tb_categoria.id_categoria;
          public          postgres    false    211            �            1259    34306 
   tb_cliente    TABLE     �  CREATE TABLE public.tb_cliente (
    id_cliente integer NOT NULL,
    nombre_cliente character varying(50) NOT NULL,
    apellido_cliente character varying(50) NOT NULL,
    celular_cliente character varying(9) NOT NULL,
    direccion_cliente text NOT NULL,
    email_cliente character varying(150) NOT NULL,
    password character varying(10) NOT NULL,
    estado_cliente character varying(30) NOT NULL,
    foto_cliente character varying NOT NULL
);
    DROP TABLE public.tb_cliente;
       public         heap    postgres    false            �            1259    34311    tb_cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tb_cliente_id_cliente_seq;
       public          postgres    false    212            k           0    0    tb_cliente_id_cliente_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.tb_cliente_id_cliente_seq OWNED BY public.tb_cliente.id_cliente;
          public          postgres    false    213            �            1259    34312    tb_empleado    TABLE     �  CREATE TABLE public.tb_empleado (
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
       public         heap    postgres    false            �            1259    34315    tb_empleado_id_empleado_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_empleado_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tb_empleado_id_empleado_seq;
       public          postgres    false    214            l           0    0    tb_empleado_id_empleado_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tb_empleado_id_empleado_seq OWNED BY public.tb_empleado.id_empleado;
          public          postgres    false    215            �            1259    34316 	   tb_estado    TABLE     v   CREATE TABLE public.tb_estado (
    id_estado integer NOT NULL,
    estado_producto character varying(30) NOT NULL
);
    DROP TABLE public.tb_estado;
       public         heap    postgres    false            �            1259    34319    tb_estado_id_estado_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_estado_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tb_estado_id_estado_seq;
       public          postgres    false    216            m           0    0    tb_estado_id_estado_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tb_estado_id_estado_seq OWNED BY public.tb_estado.id_estado;
          public          postgres    false    217            �            1259    34320 	   tb_genero    TABLE     v   CREATE TABLE public.tb_genero (
    id_genero integer NOT NULL,
    genero_producto character varying(30) NOT NULL
);
    DROP TABLE public.tb_genero;
       public         heap    postgres    false            �            1259    34323    tb_gerero_id_genero_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_gerero_id_genero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tb_gerero_id_genero_seq;
       public          postgres    false    218            n           0    0    tb_gerero_id_genero_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tb_gerero_id_genero_seq OWNED BY public.tb_genero.id_genero;
          public          postgres    false    219            �            1259    34324    tb_marca    TABLE     m   CREATE TABLE public.tb_marca (
    id_marca integer NOT NULL,
    nombre_marca character varying NOT NULL
);
    DROP TABLE public.tb_marca;
       public         heap    postgres    false            �            1259    34329    tb_marca_id_marca_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_marca_id_marca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tb_marca_id_marca_seq;
       public          postgres    false    220            o           0    0    tb_marca_id_marca_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tb_marca_id_marca_seq OWNED BY public.tb_marca.id_marca;
          public          postgres    false    221            �            1259    34330    tb_presentacion    TABLE     �   CREATE TABLE public.tb_presentacion (
    id_presentacion integer NOT NULL,
    presentacion_producto character varying(50) NOT NULL
);
 #   DROP TABLE public.tb_presentacion;
       public         heap    postgres    false            �            1259    34333 #   tb_presentacion_id_presentacion_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_presentacion_id_presentacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.tb_presentacion_id_presentacion_seq;
       public          postgres    false    222            p           0    0 #   tb_presentacion_id_presentacion_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.tb_presentacion_id_presentacion_seq OWNED BY public.tb_presentacion.id_presentacion;
          public          postgres    false    223            �            1259    34334    tb_producto    TABLE     9  CREATE TABLE public.tb_producto (
    id_producto integer NOT NULL,
    costo_producto double precision NOT NULL,
    descripcion_producto character varying(200) NOT NULL,
    foto_producto character varying(100) NOT NULL,
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
       public         heap    postgres    false            �            1259    34339    tb_producto_id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tb_producto_id_producto_seq;
       public          postgres    false    224            q           0    0    tb_producto_id_producto_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tb_producto_id_producto_seq OWNED BY public.tb_producto.id_producto;
          public          postgres    false    225            �            1259    34340    tb_valoracionProducto    TABLE     �   CREATE TABLE public."tb_valoracionProducto" (
    id_valoracion integer NOT NULL,
    comentario_producto text NOT NULL,
    fecha_comentario date NOT NULL,
    estado_comentario character varying(100)
);
 +   DROP TABLE public."tb_valoracionProducto";
       public         heap    postgres    false            �            1259    34345 '   tb_valoracionProducto_id_valoracion_seq    SEQUENCE     �   CREATE SEQUENCE public."tb_valoracionProducto_id_valoracion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public."tb_valoracionProducto_id_valoracion_seq";
       public          postgres    false    226            r           0    0 '   tb_valoracionProducto_id_valoracion_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public."tb_valoracionProducto_id_valoracion_seq" OWNED BY public."tb_valoracionProducto".id_valoracion;
          public          postgres    false    227            �            1259    34346    tb_venta    TABLE     �   CREATE TABLE public.tb_venta (
    id_venta integer NOT NULL,
    fecha_venta date NOT NULL,
    estado_venta character varying(30) NOT NULL,
    id_cliente integer NOT NULL
);
    DROP TABLE public.tb_venta;
       public         heap    postgres    false            �            1259    34349    tb_venta_id_venta_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_venta_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tb_venta_id_venta_seq;
       public          postgres    false    228            s           0    0    tb_venta_id_venta_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tb_venta_id_venta_seq OWNED BY public.tb_venta.id_venta;
          public          postgres    false    229            �            1259    34350    tipo_empleado    TABLE     }   CREATE TABLE public.tipo_empleado (
    "id_tipoEmpleado" integer NOT NULL,
    "tipoEmpleado" character varying NOT NULL
);
 !   DROP TABLE public.tipo_empleado;
       public         heap    postgres    false            �            1259    34355 !   tipo_empleado_id_tipoEmpleado_seq    SEQUENCE     �   CREATE SEQUENCE public."tipo_empleado_id_tipoEmpleado_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."tipo_empleado_id_tipoEmpleado_seq";
       public          postgres    false    230            t           0    0 !   tipo_empleado_id_tipoEmpleado_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."tipo_empleado_id_tipoEmpleado_seq" OWNED BY public.tipo_empleado."id_tipoEmpleado";
          public          postgres    false    231            �           2604    34356    tb_categoria id_categoria    DEFAULT     �   ALTER TABLE ONLY public.tb_categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.tb_categoria_id_categoria_seq'::regclass);
 H   ALTER TABLE public.tb_categoria ALTER COLUMN id_categoria DROP DEFAULT;
       public          postgres    false    211    210            �           2604    34357    tb_cliente id_cliente    DEFAULT     ~   ALTER TABLE ONLY public.tb_cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.tb_cliente_id_cliente_seq'::regclass);
 D   ALTER TABLE public.tb_cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    213    212            �           2604    34358    tb_empleado id_empleado    DEFAULT     �   ALTER TABLE ONLY public.tb_empleado ALTER COLUMN id_empleado SET DEFAULT nextval('public.tb_empleado_id_empleado_seq'::regclass);
 F   ALTER TABLE public.tb_empleado ALTER COLUMN id_empleado DROP DEFAULT;
       public          postgres    false    215    214            �           2604    34359    tb_estado id_estado    DEFAULT     z   ALTER TABLE ONLY public.tb_estado ALTER COLUMN id_estado SET DEFAULT nextval('public.tb_estado_id_estado_seq'::regclass);
 B   ALTER TABLE public.tb_estado ALTER COLUMN id_estado DROP DEFAULT;
       public          postgres    false    217    216            �           2604    34360    tb_genero id_genero    DEFAULT     z   ALTER TABLE ONLY public.tb_genero ALTER COLUMN id_genero SET DEFAULT nextval('public.tb_gerero_id_genero_seq'::regclass);
 B   ALTER TABLE public.tb_genero ALTER COLUMN id_genero DROP DEFAULT;
       public          postgres    false    219    218            �           2604    34361    tb_marca id_marca    DEFAULT     v   ALTER TABLE ONLY public.tb_marca ALTER COLUMN id_marca SET DEFAULT nextval('public.tb_marca_id_marca_seq'::regclass);
 @   ALTER TABLE public.tb_marca ALTER COLUMN id_marca DROP DEFAULT;
       public          postgres    false    221    220            �           2604    34362    tb_presentacion id_presentacion    DEFAULT     �   ALTER TABLE ONLY public.tb_presentacion ALTER COLUMN id_presentacion SET DEFAULT nextval('public.tb_presentacion_id_presentacion_seq'::regclass);
 N   ALTER TABLE public.tb_presentacion ALTER COLUMN id_presentacion DROP DEFAULT;
       public          postgres    false    223    222            �           2604    34363    tb_producto id_producto    DEFAULT     �   ALTER TABLE ONLY public.tb_producto ALTER COLUMN id_producto SET DEFAULT nextval('public.tb_producto_id_producto_seq'::regclass);
 F   ALTER TABLE public.tb_producto ALTER COLUMN id_producto DROP DEFAULT;
       public          postgres    false    225    224            �           2604    34364 #   tb_valoracionProducto id_valoracion    DEFAULT     �   ALTER TABLE ONLY public."tb_valoracionProducto" ALTER COLUMN id_valoracion SET DEFAULT nextval('public."tb_valoracionProducto_id_valoracion_seq"'::regclass);
 T   ALTER TABLE public."tb_valoracionProducto" ALTER COLUMN id_valoracion DROP DEFAULT;
       public          postgres    false    227    226            �           2604    34365    tb_venta id_venta    DEFAULT     v   ALTER TABLE ONLY public.tb_venta ALTER COLUMN id_venta SET DEFAULT nextval('public.tb_venta_id_venta_seq'::regclass);
 @   ALTER TABLE public.tb_venta ALTER COLUMN id_venta DROP DEFAULT;
       public          postgres    false    229    228            �           2604    34366    tipo_empleado id_tipoEmpleado    DEFAULT     �   ALTER TABLE ONLY public.tipo_empleado ALTER COLUMN "id_tipoEmpleado" SET DEFAULT nextval('public."tipo_empleado_id_tipoEmpleado_seq"'::regclass);
 N   ALTER TABLE public.tipo_empleado ALTER COLUMN "id_tipoEmpleado" DROP DEFAULT;
       public          postgres    false    231    230            M          0    34299    tb_DetalleVenta 
   TABLE DATA           p   COPY public."tb_DetalleVenta" ("id_DetalleVenta", cantidad, id_producto, id_venta, "id_Valoracion") FROM stdin;
    public          postgres    false    209   y       N          0    34302    tb_categoria 
   TABLE DATA           X   COPY public.tb_categoria (id_categoria, categoria_producto, foto_categoria) FROM stdin;
    public          postgres    false    210   0y       P          0    34306 
   tb_cliente 
   TABLE DATA           �   COPY public.tb_cliente (id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, password, estado_cliente, foto_cliente) FROM stdin;
    public          postgres    false    212   �y       R          0    34312    tb_empleado 
   TABLE DATA           �   COPY public.tb_empleado (id_empleado, nombre_empleado, apellido_empleado, "DUI", direccion_empleado, codigo_empleado, password_empleado, tipo_empleado, foto_empleado) FROM stdin;
    public          postgres    false    214   �y       T          0    34316 	   tb_estado 
   TABLE DATA           ?   COPY public.tb_estado (id_estado, estado_producto) FROM stdin;
    public          postgres    false    216   �z       V          0    34320 	   tb_genero 
   TABLE DATA           ?   COPY public.tb_genero (id_genero, genero_producto) FROM stdin;
    public          postgres    false    218   {       X          0    34324    tb_marca 
   TABLE DATA           :   COPY public.tb_marca (id_marca, nombre_marca) FROM stdin;
    public          postgres    false    220   F{       Z          0    34330    tb_presentacion 
   TABLE DATA           Q   COPY public.tb_presentacion (id_presentacion, presentacion_producto) FROM stdin;
    public          postgres    false    222   �{       \          0    34334    tb_producto 
   TABLE DATA           	  COPY public.tb_producto (id_producto, costo_producto, descripcion_producto, foto_producto, cantidad_producto, "id_estadoProducto", id_empleado, "id_marcaProducto", "id_generoProducto", "id_categoriaProducto", "id_presentacionProducto", nombre_producto) FROM stdin;
    public          postgres    false    224   |       ^          0    34340    tb_valoracionProducto 
   TABLE DATA           z   COPY public."tb_valoracionProducto" (id_valoracion, comentario_producto, fecha_comentario, estado_comentario) FROM stdin;
    public          postgres    false    226   f}       `          0    34346    tb_venta 
   TABLE DATA           S   COPY public.tb_venta (id_venta, fecha_venta, estado_venta, id_cliente) FROM stdin;
    public          postgres    false    228   �}       b          0    34350    tipo_empleado 
   TABLE DATA           J   COPY public.tipo_empleado ("id_tipoEmpleado", "tipoEmpleado") FROM stdin;
    public          postgres    false    230   �}       u           0    0    tb_categoria_id_categoria_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.tb_categoria_id_categoria_seq', 7, true);
          public          postgres    false    211            v           0    0    tb_cliente_id_cliente_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.tb_cliente_id_cliente_seq', 1, false);
          public          postgres    false    213            w           0    0    tb_empleado_id_empleado_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.tb_empleado_id_empleado_seq', 14, true);
          public          postgres    false    215            x           0    0    tb_estado_id_estado_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tb_estado_id_estado_seq', 3, true);
          public          postgres    false    217            y           0    0    tb_gerero_id_genero_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tb_gerero_id_genero_seq', 3, true);
          public          postgres    false    219            z           0    0    tb_marca_id_marca_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tb_marca_id_marca_seq', 10, true);
          public          postgres    false    221            {           0    0 #   tb_presentacion_id_presentacion_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.tb_presentacion_id_presentacion_seq', 6, true);
          public          postgres    false    223            |           0    0    tb_producto_id_producto_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tb_producto_id_producto_seq', 4, true);
          public          postgres    false    225            }           0    0 '   tb_valoracionProducto_id_valoracion_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public."tb_valoracionProducto_id_valoracion_seq"', 1, false);
          public          postgres    false    227            ~           0    0    tb_venta_id_venta_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tb_venta_id_venta_seq', 1, false);
          public          postgres    false    229                       0    0 !   tipo_empleado_id_tipoEmpleado_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."tipo_empleado_id_tipoEmpleado_seq"', 2, true);
          public          postgres    false    231            �           2606    34368 $   tb_DetalleVenta tb_DetalleVenta_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "tb_DetalleVenta_pkey" PRIMARY KEY ("id_DetalleVenta");
 R   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "tb_DetalleVenta_pkey";
       public            postgres    false    209            �           2606    34370    tb_categoria tb_categoria_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tb_categoria
    ADD CONSTRAINT tb_categoria_pkey PRIMARY KEY (id_categoria);
 H   ALTER TABLE ONLY public.tb_categoria DROP CONSTRAINT tb_categoria_pkey;
       public            postgres    false    210            �           2606    34372    tb_cliente tb_cliente_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tb_cliente
    ADD CONSTRAINT tb_cliente_pkey PRIMARY KEY (id_cliente);
 D   ALTER TABLE ONLY public.tb_cliente DROP CONSTRAINT tb_cliente_pkey;
       public            postgres    false    212            �           2606    34374    tb_empleado tb_empleado_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT tb_empleado_pkey PRIMARY KEY (id_empleado);
 F   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT tb_empleado_pkey;
       public            postgres    false    214            �           2606    34376    tb_estado tb_estado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tb_estado
    ADD CONSTRAINT tb_estado_pkey PRIMARY KEY (id_estado);
 B   ALTER TABLE ONLY public.tb_estado DROP CONSTRAINT tb_estado_pkey;
       public            postgres    false    216            �           2606    34378    tb_genero tb_gerero_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tb_genero
    ADD CONSTRAINT tb_gerero_pkey PRIMARY KEY (id_genero);
 B   ALTER TABLE ONLY public.tb_genero DROP CONSTRAINT tb_gerero_pkey;
       public            postgres    false    218            �           2606    34380    tb_marca tb_marca_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_marca
    ADD CONSTRAINT tb_marca_pkey PRIMARY KEY (id_marca);
 @   ALTER TABLE ONLY public.tb_marca DROP CONSTRAINT tb_marca_pkey;
       public            postgres    false    220            �           2606    34382 $   tb_presentacion tb_presentacion_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.tb_presentacion
    ADD CONSTRAINT tb_presentacion_pkey PRIMARY KEY (id_presentacion);
 N   ALTER TABLE ONLY public.tb_presentacion DROP CONSTRAINT tb_presentacion_pkey;
       public            postgres    false    222            �           2606    34384    tb_producto tb_producto_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT tb_producto_pkey PRIMARY KEY (id_producto);
 F   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT tb_producto_pkey;
       public            postgres    false    224            �           2606    34386 0   tb_valoracionProducto tb_valoracionProducto_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."tb_valoracionProducto"
    ADD CONSTRAINT "tb_valoracionProducto_pkey" PRIMARY KEY (id_valoracion);
 ^   ALTER TABLE ONLY public."tb_valoracionProducto" DROP CONSTRAINT "tb_valoracionProducto_pkey";
       public            postgres    false    226            �           2606    34388    tb_venta tb_venta_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_venta
    ADD CONSTRAINT tb_venta_pkey PRIMARY KEY (id_venta);
 @   ALTER TABLE ONLY public.tb_venta DROP CONSTRAINT tb_venta_pkey;
       public            postgres    false    228            �           2606    34390     tipo_empleado tipo_empleado_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.tipo_empleado
    ADD CONSTRAINT tipo_empleado_pkey PRIMARY KEY ("id_tipoEmpleado");
 J   ALTER TABLE ONLY public.tipo_empleado DROP CONSTRAINT tipo_empleado_pkey;
       public            postgres    false    230            �           2606    34392    tb_empleado uq_codigo_empleado 
   CONSTRAINT     d   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT uq_codigo_empleado UNIQUE (codigo_empleado);
 H   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT uq_codigo_empleado;
       public            postgres    false    214            �           2606    34393    tb_producto FK_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_categoria" FOREIGN KEY ("id_categoriaProducto") REFERENCES public.tb_categoria(id_categoria) NOT VALID;
 D   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_categoria";
       public          postgres    false    210    224    3232            �           2606    34398    tb_venta FK_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_venta
    ADD CONSTRAINT "FK_cliente" FOREIGN KEY (id_cliente) REFERENCES public.tb_cliente(id_cliente) NOT VALID;
 ?   ALTER TABLE ONLY public.tb_venta DROP CONSTRAINT "FK_cliente";
       public          postgres    false    3234    228    212            �           2606    34403    tb_producto FK_empleado    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_empleado" FOREIGN KEY (id_empleado) REFERENCES public.tipo_empleado("id_tipoEmpleado") NOT VALID;
 C   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_empleado";
       public          postgres    false    3254    224    230            �           2606    34408    tb_producto FK_estado    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_estado" FOREIGN KEY ("id_estadoProducto") REFERENCES public.tb_estado(id_estado) NOT VALID;
 A   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_estado";
       public          postgres    false    3240    224    216            �           2606    34413    tb_producto FK_genero    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_genero" FOREIGN KEY ("id_generoProducto") REFERENCES public.tb_genero(id_genero) NOT VALID;
 A   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_genero";
       public          postgres    false    3242    224    218            �           2606    34418    tb_producto FK_marca    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_marca" FOREIGN KEY ("id_marcaProducto") REFERENCES public.tb_marca(id_marca) NOT VALID;
 @   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_marca";
       public          postgres    false    3244    224    220            �           2606    34423    tb_producto FK_presentacion    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_presentacion" FOREIGN KEY ("id_presentacionProducto") REFERENCES public.tb_presentacion(id_presentacion) NOT VALID;
 G   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_presentacion";
       public          postgres    false    3246    224    222            �           2606    34428    tb_DetalleVenta FK_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_producto" FOREIGN KEY (id_producto) REFERENCES public.tb_producto(id_producto) NOT VALID;
 I   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "FK_producto";
       public          postgres    false    3248    209    224            �           2606    34433    tb_empleado FK_tipoEmpleado    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT "FK_tipoEmpleado" FOREIGN KEY (tipo_empleado) REFERENCES public.tipo_empleado("id_tipoEmpleado") NOT VALID;
 G   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT "FK_tipoEmpleado";
       public          postgres    false    3254    214    230            �           2606    34438    tb_DetalleVenta FK_valoracion    FK CONSTRAINT     �   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_valoracion" FOREIGN KEY ("id_Valoracion") REFERENCES public."tb_valoracionProducto"(id_valoracion) NOT VALID;
 K   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "FK_valoracion";
       public          postgres    false    3250    209    226            �           2606    34443    tb_DetalleVenta FK_venta    FK CONSTRAINT     �   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_venta" FOREIGN KEY (id_venta) REFERENCES public.tb_venta(id_venta) NOT VALID;
 F   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "FK_venta";
       public          postgres    false    228    209    3252            M      x������ � �      N   y   x�3���L)J,IL������MLO���*H�2�t���/B2�J-H,*=�E�	�sbRbNNjQ~1��)�s)PL(���S���,i��Z\���Y��*nԔ�TH-*��K�A������ B=?      P      x������ � �      R   �   x�=�MR�0 �u8E,m$!��PEg
�et�q󵁒
����^̙:����]�=
�W0��3��Y0(Vx���q8l�0�qګ�o�����c{:Y��̣{�Tr�-�-y�����j}>��=}?;I�E�����;�89v��v�:�sA���� ��2���Yzŝ&����qp���ԙj�NuJ�K.sJ�)�_2�b�nV&��x?�����^P�Ⴟ˲~�OY      T   0   x�3�t�SH�OIMO�2�tL�/IL��2���WH�K��+)�c���� iv      V   '   x�3����M*J�2��-�J-�2���,N������� �|T      X   v   x����P���_�/U�a�A�F049�CoԽr���k�b�/U8�:D[i�W&X�>k1w�v�Ph��U�p�MW��'���n��b)�g8j�4�}��-���ǅ����"A      Z   <   x�3�450���2�44 3�9]�Js�L8��R��L9���LN�2�42)����� �q�      \   >  x�]��N�@Eד��T����,�U�l���͋yDЯ�)E�I�{��;��v��M�DL��B�L. ��L`�$J��C�b�#��-���:y6jy��u����vꄅ�hB�v�'k�T Z,$�Z8Way1�8X*���[��J�r1h(:Ll��(�Q�n {��Z��]�ձ�f�t'�?V�2aL4��$ʂ�#y��x�P-���>�7�M��\a�+Xv��un�l1=梟n�\Vs</p�ÌS��Һ���t�$⎹�0O(��g�]�rŉ�,as3�ɼ[�:�IU����m��bf��      ^      x������ � �      `      x������ � �      b   %   x�3�tL����,.)JL�/�2�K�KI1c���� �]	�     