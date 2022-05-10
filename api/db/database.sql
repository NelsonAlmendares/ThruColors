PGDMP                 
        z         
   ThruColors    14.1    14.1 \    x           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            {           1262    24843 
   ThruColors    DATABASE     h   CREATE DATABASE "ThruColors" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "ThruColors";
                postgres    false                        2615    24844    Example    SCHEMA        CREATE SCHEMA "Example";
    DROP SCHEMA "Example";
                postgres    false            �            1255    24845 "   buscar_producto(character varying)    FUNCTION     �   CREATE FUNCTION public.buscar_producto(character varying) RETURNS character varying
    LANGUAGE sql
    AS $_$
select descipcion_producto from producto_especifico where nombre_producto = $1
$_$;
 9   DROP FUNCTION public.buscar_producto(character varying);
       public          postgres    false            �            1259    24846    tb_valoracionProducto    TABLE     �   CREATE TABLE public."tb_valoracionProducto" (
    id_valoracion integer NOT NULL,
    comentario_producto text NOT NULL,
    fecha_comentario date NOT NULL,
    estado_comentario character varying(100)
);
 +   DROP TABLE public."tb_valoracionProducto";
       public         heap    postgres    false            �            1255    24851    fecha_valoracion(date)    FUNCTION     �   CREATE FUNCTION public.fecha_valoracion(x date) RETURNS public."tb_valoracionProducto"
    LANGUAGE sql
    AS $$
select * from "tb_valoracionProducto"
where fecha_comentario = x
$$;
 /   DROP FUNCTION public.fecha_valoracion(x date);
       public          postgres    false    210            �            1259    24852    tb_venta    TABLE     �   CREATE TABLE public.tb_venta (
    id_venta integer NOT NULL,
    fecha_venta date NOT NULL,
    estado_venta character varying(30) NOT NULL,
    id_cliente integer NOT NULL
);
    DROP TABLE public.tb_venta;
       public         heap    postgres    false            �            1255    24855    fecha_venta3(date)    FUNCTION     �   CREATE FUNCTION public.fecha_venta3(x date) RETURNS public.tb_venta
    LANGUAGE sql
    AS $$
select * from tb_venta
where fecha_venta = x
$$;
 +   DROP FUNCTION public.fecha_venta3(x date);
       public          postgres    false    211            �            1255    24998    venta_trigger()    FUNCTION     �   CREATE FUNCTION public.venta_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin

insert into "tb_ventaT" values (old.id_venta, old.fecha_Venta, old.estado_venta, old.id_cliente);

End
$$;
 &   DROP FUNCTION public.venta_trigger();
       public          postgres    false            �            1255    25001    ventat_trigger()    FUNCTION     �   CREATE FUNCTION public.ventat_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin

insert into "tb_ventaT" values (old.id_venta, old.fecha_Venta, old.estado_venta, old.id_cliente);

return new;
End
$$;
 '   DROP FUNCTION public.ventat_trigger();
       public          postgres    false            �            1255    25016    ventat_triggerdelete()    FUNCTION     6  CREATE FUNCTION public.ventat_triggerdelete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin

INSERT INTO public."tb_bitacoraV"(
	 id_venta, "fecha_ventaT", "estado_ventaT", id_cliente, "trigger")
	VALUES (old.id_venta, old.fecha_venta, old.estado_venta, old.id_cliente, 'Elimino');

return new;
End
$$;
 -   DROP FUNCTION public.ventat_triggerdelete();
       public          postgres    false            �            1255    25013    ventat_triggerupdate()    FUNCTION     8  CREATE FUNCTION public.ventat_triggerupdate() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin

INSERT INTO public."tb_bitacoraV"(
	 id_venta, "fecha_ventaT", "estado_ventaT", id_cliente, "trigger")
	VALUES (old.id_venta, old.fecha_venta, old.estado_venta, old.id_cliente, 'Actualizo');

return new;
End
$$;
 -   DROP FUNCTION public.ventat_triggerupdate();
       public          postgres    false            �            1259    24856    tb_categoriaProducto    TABLE     �   CREATE TABLE public."tb_categoriaProducto" (
    id_categoria integer NOT NULL,
    categoria_producto character varying(50) NOT NULL,
    foto_categoria text
);
 *   DROP TABLE public."tb_categoriaProducto";
       public         heap    postgres    false            �            1259    24861 	   tb_estado    TABLE     v   CREATE TABLE public.tb_estado (
    id_estado integer NOT NULL,
    estado_producto character varying(30) NOT NULL
);
    DROP TABLE public.tb_estado;
       public         heap    postgres    false            �            1259    24864 	   tb_genero    TABLE     v   CREATE TABLE public.tb_genero (
    id_genero integer NOT NULL,
    genero_producto character varying(30) NOT NULL
);
    DROP TABLE public.tb_genero;
       public         heap    postgres    false            �            1259    24867    tb_marca    TABLE     m   CREATE TABLE public.tb_marca (
    id_marca integer NOT NULL,
    nombre_marca character varying NOT NULL
);
    DROP TABLE public.tb_marca;
       public         heap    postgres    false            �            1259    24872    tb_presentacion    TABLE     �   CREATE TABLE public.tb_presentacion (
    id_presentacion integer NOT NULL,
    presentacion_producto character varying(50) NOT NULL
);
 #   DROP TABLE public.tb_presentacion;
       public         heap    postgres    false            �            1259    24875    tb_producto    TABLE       CREATE TABLE public.tb_producto (
    id_producto integer NOT NULL,
    costo_producto double precision NOT NULL,
    descipcion_producto text NOT NULL,
    foto_producto text,
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
       public         heap    postgres    false            �            1259    24880    producto_especifico    VIEW     �  CREATE VIEW public.producto_especifico AS
 SELECT tb_p.nombre_producto,
    tb_p.costo_producto,
    tb_p.descipcion_producto,
    tb_p.foto_producto,
    tb_p.cantidad_producto,
    tb_e.estado_producto,
    tb_m.nombre_marca,
    tb_g.genero_producto,
    tb_c.categoria_producto,
    tb_pp.presentacion_producto
   FROM public.tb_producto tb_p,
    public.tb_estado tb_e,
    public.tb_genero tb_g,
    public.tb_marca tb_m,
    public."tb_categoriaProducto" tb_c,
    public.tb_presentacion tb_pp
  WHERE ((tb_p."id_estadoProducto" = tb_e.id_estado) AND (tb_p."id_marcaProducto" = tb_m.id_marca) AND (tb_p."id_generoProducto" = tb_g.id_genero) AND (tb_p."id_categoriaProducto" = tb_c.id_categoria) AND (tb_p."id_presentacionProducto" = tb_pp.id_presentacion));
 &   DROP VIEW public.producto_especifico;
       public          postgres    false    212    217    217    217    217    217    217    217    217    217    217    216    216    215    215    214    214    213    213    212            �            1259    24884    tb_DetalleVenta    TABLE     �   CREATE TABLE public."tb_DetalleVenta" (
    "id_DetalleVenta" integer NOT NULL,
    cantidad integer NOT NULL,
    id_producto integer NOT NULL,
    id_venta integer NOT NULL,
    "id_Valoracion" integer NOT NULL
);
 %   DROP TABLE public."tb_DetalleVenta";
       public         heap    postgres    false            �            1259    41543 #   tb_DetalleVenta_id_DetalleVenta_seq    SEQUENCE     �   ALTER TABLE public."tb_DetalleVenta" ALTER COLUMN "id_DetalleVenta" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tb_DetalleVenta_id_DetalleVenta_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    25020    tb_bitacoraV    TABLE     �   CREATE TABLE public."tb_bitacoraV" (
    "id_ventaT" integer NOT NULL,
    id_venta integer NOT NULL,
    "fecha_ventaT" date NOT NULL,
    "estado_ventaT" character varying(30) NOT NULL,
    id_cliente integer NOT NULL,
    trigger text NOT NULL
);
 "   DROP TABLE public."tb_bitacoraV";
       public         heap    postgres    false            �            1259    25019    tb_bitacoraV_id_ventaT_seq    SEQUENCE     �   ALTER TABLE public."tb_bitacoraV" ALTER COLUMN "id_ventaT" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tb_bitacoraV_id_ventaT_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            �            1259    41544 %   tb_categoriaProducto_id_categoria_seq    SEQUENCE     �   ALTER TABLE public."tb_categoriaProducto" ALTER COLUMN id_categoria ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tb_categoriaProducto_id_categoria_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212            �            1259    24887 
   tb_cliente    TABLE     �  CREATE TABLE public.tb_cliente (
    id_cliente integer NOT NULL,
    nombre_cliente character varying(50) NOT NULL,
    apellido_cliente character varying(50) NOT NULL,
    celular_cliente character varying(9) NOT NULL,
    direccion_cliente text NOT NULL,
    email_cliente character varying(150) NOT NULL,
    password character varying(10) NOT NULL,
    estado_cliente character varying(30) NOT NULL
);
    DROP TABLE public.tb_cliente;
       public         heap    postgres    false            �            1259    41545    tb_cliente_id_cliente_seq    SEQUENCE     �   ALTER TABLE public.tb_cliente ALTER COLUMN id_cliente ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tb_cliente_id_cliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    24892    tb_empleado    TABLE     �  CREATE TABLE public.tb_empleado (
    id_empleado integer NOT NULL,
    nombre_empleado character varying(50) NOT NULL,
    apellido_empleado character varying(50) NOT NULL,
    "DUI" character varying(10) NOT NULL,
    direccion_empleado character varying(60) NOT NULL,
    codigo_empleado integer NOT NULL,
    password_empleado character varying(100) NOT NULL,
    tipo_empleado integer NOT NULL
);
    DROP TABLE public.tb_empleado;
       public         heap    postgres    false            �            1259    41532    tb_empleado_id_empleado_seq    SEQUENCE     �   ALTER TABLE public.tb_empleado ALTER COLUMN id_empleado ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tb_empleado_id_empleado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    41546    tb_estado_id_estado_seq    SEQUENCE     �   ALTER TABLE public.tb_estado ALTER COLUMN id_estado ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tb_estado_id_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    213            �            1259    41547    tb_genero_id_genero_seq    SEQUENCE     �   ALTER TABLE public.tb_genero ALTER COLUMN id_genero ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tb_genero_id_genero_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    41548    tb_marca_id_marca_seq    SEQUENCE     �   ALTER TABLE public.tb_marca ALTER COLUMN id_marca ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tb_marca_id_marca_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    41549 #   tb_presentacion_id_presentacion_seq    SEQUENCE     �   ALTER TABLE public.tb_presentacion ALTER COLUMN id_presentacion ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tb_presentacion_id_presentacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    41550    tb_producto_id_producto_seq    SEQUENCE     �   ALTER TABLE public.tb_producto ALTER COLUMN id_producto ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tb_producto_id_producto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    41551 '   tb_valoracionProducto_id_valoracion_seq    SEQUENCE     �   ALTER TABLE public."tb_valoracionProducto" ALTER COLUMN id_valoracion ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tb_valoracionProducto_id_valoracion_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210            �            1259    41552    tb_venta_id_venta_seq    SEQUENCE     �   ALTER TABLE public.tb_venta ALTER COLUMN id_venta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tb_venta_id_venta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            �            1259    24897    tipo_empleado    TABLE     }   CREATE TABLE public.tipo_empleado (
    "id_tipoEmpleado" integer NOT NULL,
    "tipoEmpleado" character varying NOT NULL
);
 !   DROP TABLE public.tipo_empleado;
       public         heap    postgres    false            �            1259    41553 !   tipo_empleado_id_tipoEmpleado_seq    SEQUENCE     �   ALTER TABLE public.tipo_empleado ALTER COLUMN "id_tipoEmpleado" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tipo_empleado_id_tipoEmpleado_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    24902    ventas_cliente    VIEW       CREATE VIEW public.ventas_cliente AS
 SELECT tc.nombre_cliente,
    tc.apellido_cliente,
    tc.celular_cliente,
    tc.estado_cliente,
    tv.fecha_venta,
    tv.estado_venta
   FROM public.tb_cliente tc,
    public.tb_venta tv
  WHERE (tc.id_cliente = tv.id_cliente);
 !   DROP VIEW public.ventas_cliente;
       public          postgres    false    220    220    220    211    211    211    220    220            d          0    24884    tb_DetalleVenta 
   TABLE DATA           p   COPY public."tb_DetalleVenta" ("id_DetalleVenta", cantidad, id_producto, id_venta, "id_Valoracion") FROM stdin;
    public          postgres    false    219   7|       i          0    25020    tb_bitacoraV 
   TABLE DATA           u   COPY public."tb_bitacoraV" ("id_ventaT", id_venta, "fecha_ventaT", "estado_ventaT", id_cliente, trigger) FROM stdin;
    public          postgres    false    225   T|       ^          0    24856    tb_categoriaProducto 
   TABLE DATA           b   COPY public."tb_categoriaProducto" (id_categoria, categoria_producto, foto_categoria) FROM stdin;
    public          postgres    false    212   �|       e          0    24887 
   tb_cliente 
   TABLE DATA           �   COPY public.tb_cliente (id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, password, estado_cliente) FROM stdin;
    public          postgres    false    220   �|       f          0    24892    tb_empleado 
   TABLE DATA           �   COPY public.tb_empleado (id_empleado, nombre_empleado, apellido_empleado, "DUI", direccion_empleado, codigo_empleado, password_empleado, tipo_empleado) FROM stdin;
    public          postgres    false    221   �~       _          0    24861 	   tb_estado 
   TABLE DATA           ?   COPY public.tb_estado (id_estado, estado_producto) FROM stdin;
    public          postgres    false    213          `          0    24864 	   tb_genero 
   TABLE DATA           ?   COPY public.tb_genero (id_genero, genero_producto) FROM stdin;
    public          postgres    false    214   V       a          0    24867    tb_marca 
   TABLE DATA           :   COPY public.tb_marca (id_marca, nombre_marca) FROM stdin;
    public          postgres    false    215   �       b          0    24872    tb_presentacion 
   TABLE DATA           Q   COPY public.tb_presentacion (id_presentacion, presentacion_producto) FROM stdin;
    public          postgres    false    216   �       c          0    24875    tb_producto 
   TABLE DATA             COPY public.tb_producto (id_producto, costo_producto, descipcion_producto, foto_producto, cantidad_producto, "id_estadoProducto", id_empleado, "id_marcaProducto", "id_generoProducto", "id_categoriaProducto", "id_presentacionProducto", nombre_producto) FROM stdin;
    public          postgres    false    217   Z�       \          0    24846    tb_valoracionProducto 
   TABLE DATA           z   COPY public."tb_valoracionProducto" (id_valoracion, comentario_producto, fecha_comentario, estado_comentario) FROM stdin;
    public          postgres    false    210   w�       ]          0    24852    tb_venta 
   TABLE DATA           S   COPY public.tb_venta (id_venta, fecha_venta, estado_venta, id_cliente) FROM stdin;
    public          postgres    false    211   �       g          0    24897    tipo_empleado 
   TABLE DATA           J   COPY public.tipo_empleado ("id_tipoEmpleado", "tipoEmpleado") FROM stdin;
    public          postgres    false    222   _�       |           0    0 #   tb_DetalleVenta_id_DetalleVenta_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."tb_DetalleVenta_id_DetalleVenta_seq"', 1, false);
          public          postgres    false    227            }           0    0    tb_bitacoraV_id_ventaT_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."tb_bitacoraV_id_ventaT_seq"', 4, true);
          public          postgres    false    224            ~           0    0 %   tb_categoriaProducto_id_categoria_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."tb_categoriaProducto_id_categoria_seq"', 1, false);
          public          postgres    false    228                       0    0    tb_cliente_id_cliente_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.tb_cliente_id_cliente_seq', 1, false);
          public          postgres    false    229            �           0    0    tb_empleado_id_empleado_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.tb_empleado_id_empleado_seq', 1, false);
          public          postgres    false    226            �           0    0    tb_estado_id_estado_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tb_estado_id_estado_seq', 1, false);
          public          postgres    false    230            �           0    0    tb_genero_id_genero_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tb_genero_id_genero_seq', 1, false);
          public          postgres    false    231            �           0    0    tb_marca_id_marca_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tb_marca_id_marca_seq', 1, false);
          public          postgres    false    232            �           0    0 #   tb_presentacion_id_presentacion_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.tb_presentacion_id_presentacion_seq', 1, false);
          public          postgres    false    233            �           0    0    tb_producto_id_producto_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.tb_producto_id_producto_seq', 1, false);
          public          postgres    false    234            �           0    0 '   tb_valoracionProducto_id_valoracion_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public."tb_valoracionProducto_id_valoracion_seq"', 1, false);
          public          postgres    false    235            �           0    0    tb_venta_id_venta_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tb_venta_id_venta_seq', 1, false);
          public          postgres    false    236            �           0    0 !   tipo_empleado_id_tipoEmpleado_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."tipo_empleado_id_tipoEmpleado_seq"', 1, false);
          public          postgres    false    237            �           2606    24907 $   tb_DetalleVenta tb_DetalleVenta_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "tb_DetalleVenta_pkey" PRIMARY KEY ("id_DetalleVenta");
 R   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "tb_DetalleVenta_pkey";
       public            postgres    false    219            �           2606    25026    tb_bitacoraV tb_bitacoraV_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."tb_bitacoraV"
    ADD CONSTRAINT "tb_bitacoraV_pkey" PRIMARY KEY ("id_ventaT");
 L   ALTER TABLE ONLY public."tb_bitacoraV" DROP CONSTRAINT "tb_bitacoraV_pkey";
       public            postgres    false    225            �           2606    24909 .   tb_categoriaProducto tb_categoriaProducto_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."tb_categoriaProducto"
    ADD CONSTRAINT "tb_categoriaProducto_pkey" PRIMARY KEY (id_categoria);
 \   ALTER TABLE ONLY public."tb_categoriaProducto" DROP CONSTRAINT "tb_categoriaProducto_pkey";
       public            postgres    false    212            �           2606    24911    tb_cliente tb_cliente_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tb_cliente
    ADD CONSTRAINT tb_cliente_pkey PRIMARY KEY (id_cliente);
 D   ALTER TABLE ONLY public.tb_cliente DROP CONSTRAINT tb_cliente_pkey;
       public            postgres    false    220            �           2606    24913    tb_empleado tb_empleado_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT tb_empleado_pkey PRIMARY KEY (id_empleado);
 F   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT tb_empleado_pkey;
       public            postgres    false    221            �           2606    24915    tb_estado tb_estado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tb_estado
    ADD CONSTRAINT tb_estado_pkey PRIMARY KEY (id_estado);
 B   ALTER TABLE ONLY public.tb_estado DROP CONSTRAINT tb_estado_pkey;
       public            postgres    false    213            �           2606    24917    tb_genero tb_gerero_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tb_genero
    ADD CONSTRAINT tb_gerero_pkey PRIMARY KEY (id_genero);
 B   ALTER TABLE ONLY public.tb_genero DROP CONSTRAINT tb_gerero_pkey;
       public            postgres    false    214            �           2606    24919    tb_marca tb_marca_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_marca
    ADD CONSTRAINT tb_marca_pkey PRIMARY KEY (id_marca);
 @   ALTER TABLE ONLY public.tb_marca DROP CONSTRAINT tb_marca_pkey;
       public            postgres    false    215            �           2606    24921 $   tb_presentacion tb_presentacion_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.tb_presentacion
    ADD CONSTRAINT tb_presentacion_pkey PRIMARY KEY (id_presentacion);
 N   ALTER TABLE ONLY public.tb_presentacion DROP CONSTRAINT tb_presentacion_pkey;
       public            postgres    false    216            �           2606    24923    tb_producto tb_producto_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT tb_producto_pkey PRIMARY KEY (id_producto);
 F   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT tb_producto_pkey;
       public            postgres    false    217            �           2606    24925 0   tb_valoracionProducto tb_valoracionProducto_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."tb_valoracionProducto"
    ADD CONSTRAINT "tb_valoracionProducto_pkey" PRIMARY KEY (id_valoracion);
 ^   ALTER TABLE ONLY public."tb_valoracionProducto" DROP CONSTRAINT "tb_valoracionProducto_pkey";
       public            postgres    false    210            �           2606    24927    tb_venta tb_venta_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_venta
    ADD CONSTRAINT tb_venta_pkey PRIMARY KEY (id_venta);
 @   ALTER TABLE ONLY public.tb_venta DROP CONSTRAINT tb_venta_pkey;
       public            postgres    false    211            �           2606    24929     tipo_empleado tipo_empleado_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.tipo_empleado
    ADD CONSTRAINT tipo_empleado_pkey PRIMARY KEY ("id_tipoEmpleado");
 J   ALTER TABLE ONLY public.tipo_empleado DROP CONSTRAINT tipo_empleado_pkey;
       public            postgres    false    222            �           2620    25017    tb_venta tr_ventadelete    TRIGGER     |   CREATE TRIGGER tr_ventadelete BEFORE DELETE ON public.tb_venta FOR EACH ROW EXECUTE FUNCTION public.ventat_triggerdelete();
 0   DROP TRIGGER tr_ventadelete ON public.tb_venta;
       public          postgres    false    244    211            �           2620    25014    tb_venta tr_ventaupdate    TRIGGER     |   CREATE TRIGGER tr_ventaupdate BEFORE UPDATE ON public.tb_venta FOR EACH ROW EXECUTE FUNCTION public.ventat_triggerupdate();
 0   DROP TRIGGER tr_ventaupdate ON public.tb_venta;
       public          postgres    false    243    211            �           2606    24930    tb_producto FK_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_categoria" FOREIGN KEY ("id_categoriaProducto") REFERENCES public."tb_categoriaProducto"(id_categoria) NOT VALID;
 D   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_categoria";
       public          postgres    false    212    217    3245            �           2606    24935    tb_venta FK_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_venta
    ADD CONSTRAINT "FK_cliente" FOREIGN KEY (id_cliente) REFERENCES public.tb_cliente(id_cliente) NOT VALID;
 ?   ALTER TABLE ONLY public.tb_venta DROP CONSTRAINT "FK_cliente";
       public          postgres    false    211    220    3259            �           2606    24940    tb_DetalleVenta FK_detalleVenta    FK CONSTRAINT     �   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_detalleVenta" FOREIGN KEY (id_venta) REFERENCES public.tb_venta(id_venta) NOT VALID;
 M   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "FK_detalleVenta";
       public          postgres    false    211    219    3243            �           2606    24945    tb_producto FK_empleado    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_empleado" FOREIGN KEY (id_empleado) REFERENCES public.tb_empleado(id_empleado) NOT VALID;
 C   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_empleado";
       public          postgres    false    221    3261    217            �           2606    24950    tb_producto FK_estado    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_estado" FOREIGN KEY ("id_estadoProducto") REFERENCES public.tb_estado(id_estado) NOT VALID;
 A   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_estado";
       public          postgres    false    217    3247    213            �           2606    24955    tb_producto FK_genero    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_genero" FOREIGN KEY ("id_generoProducto") REFERENCES public.tb_genero(id_genero) NOT VALID;
 A   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_genero";
       public          postgres    false    3249    214    217            �           2606    24960    tb_producto FK_marca    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_marca" FOREIGN KEY ("id_marcaProducto") REFERENCES public.tb_marca(id_marca) NOT VALID;
 @   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_marca";
       public          postgres    false    3251    217    215            �           2606    24965    tb_producto FK_presentacion    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_presentacion" FOREIGN KEY ("id_presentacionProducto") REFERENCES public.tb_presentacion(id_presentacion) NOT VALID;
 G   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_presentacion";
       public          postgres    false    216    217    3253            �           2606    24970    tb_DetalleVenta FK_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_producto" FOREIGN KEY (id_producto) REFERENCES public.tb_producto(id_producto) NOT VALID;
 I   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "FK_producto";
       public          postgres    false    3255    219    217            �           2606    24975    tb_empleado FK_tipoEmpleado    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT "FK_tipoEmpleado" FOREIGN KEY (tipo_empleado) REFERENCES public.tipo_empleado("id_tipoEmpleado") NOT VALID;
 G   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT "FK_tipoEmpleado";
       public          postgres    false    221    3263    222            �           2606    24980    tb_DetalleVenta FK_valoracion    FK CONSTRAINT     �   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_valoracion" FOREIGN KEY ("id_Valoracion") REFERENCES public."tb_valoracionProducto"(id_valoracion) NOT VALID;
 K   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "FK_valoracion";
       public          postgres    false    210    219    3241            d      x������ � �      i   Q   x�3�4�4202�50�5��tN�KN�IL��4�t�������2"�Ę���H�Ȑ3 1$o��\R���Y��eBPE� ��$      ^   8   x�3�LN,J�L�/��2��Rsr�!\c��ļ�bǄ� 3�6��ς���qqq ���      e   �  x�m�ϊ�0�ϓ���f-[|ې���������U*KTrr�7�P�4/V)^�������y439|��[K�����iISF�O�%�Jj��C��7����}8�ᄜ%e�u��vA���;+�:�
�1���GU���]��:Kvh�'�/?� ��7� {:�����E��K�Z$��-l�W�e��S&x*V�T�2���C}�ƺQ�a���1�n�\���o)�-a	�S-�BX���t@`�)%����5�佶�*GS	:�{ቤ�QK����,�yAgon��57Ah����:��S?N����耕��w�T3u$Bj��О�ΰ�'6h8�NM�#�%E:4_��	�J� �}ݳ�(�1|�>�����>�sr�5j���3��MLb0U���^7��	�Fs����sö�>�bl~N���&�jP�w�u�McA�y\����l�=�כ�00W|�=���)�T_��b���Sj      f      x������ � �      _   1   x�3�t�SH��ML>�2�ˈ�1=�$1%��$^RtxaZfr>W� 7'�      `   !   x�3��M,N.�����2�tK�M�1c���� ~�      a      x�3���M,I�2�t�p�s��2�t-.9�2U�'�4%��˄3(�,'?�˔�%3��ˌ�'1/����T.s ��(Q�7�(9�Ԃ�9?''��$��˒�5'�*1)�$C��(%5��Ѐ����ّ+F��� �j$9      b   4   x�3�450���2�44 3�9}�-,�LI�2�LO��2�tJ,*J����� d�      c      x������ � �      \   ^   x�U�1�  ��}E?�Һ��g��!1@��f����naG�)q�^(�aY)蝢F'2�u��B���_���+Um�o�
칧k<gD|�)      ]   j   x�M�9�0��_�l���� �� � ��� N;��e'$�I<G7�k�Ϻݎ!�����xiFh��O�m��R��Zd�ws��H�(v�����xA6��� .�5U      g   ,   x�3���/�2�tL����,.)JL�/�2�K�KI1c���� ��     