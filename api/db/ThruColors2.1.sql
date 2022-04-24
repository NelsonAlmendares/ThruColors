PGDMP     9                    z            Thru_colors    14.1    14.1 5    I           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            J           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            K           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            L           1262    24586    Thru_colors    DATABASE     i   CREATE DATABASE "Thru_colors" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "Thru_colors";
                postgres    false                        2615    24587    Example    SCHEMA        CREATE SCHEMA "Example";
    DROP SCHEMA "Example";
                postgres    false            �            1259    24588    tb_DetalleVenta    TABLE     �   CREATE TABLE public."tb_DetalleVenta" (
    "id_DetalleVenta" integer NOT NULL,
    cantidad integer NOT NULL,
    id_producto integer NOT NULL,
    id_venta integer NOT NULL,
    "id_Valoracion" integer NOT NULL
);
 %   DROP TABLE public."tb_DetalleVenta";
       public         heap    postgres    false            �            1259    24591    tb_categoriaProducto    TABLE     �   CREATE TABLE public."tb_categoriaProducto" (
    id_categoria integer NOT NULL,
    categoria_producto character varying(50) NOT NULL,
    foto_categoria text
);
 *   DROP TABLE public."tb_categoriaProducto";
       public         heap    postgres    false            �            1259    24596 
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
       public         heap    postgres    false            �            1259    24601    tb_empleado    TABLE       CREATE TABLE public.tb_empleado (
    id_empleado integer NOT NULL,
    nombre_empleado character varying(50) NOT NULL,
    apellido_empleado character varying(50) NOT NULL,
    "DUI" character varying(11) NOT NULL,
    direccion_empleado text NOT NULL,
    codigo_empleado integer NOT NULL,
    password_empleado character varying(8) NOT NULL,
    tipo_empleado integer NOT NULL
);
    DROP TABLE public.tb_empleado;
       public         heap    postgres    false            �            1259    24606 	   tb_estado    TABLE     v   CREATE TABLE public.tb_estado (
    id_estado integer NOT NULL,
    estado_producto character varying(30) NOT NULL
);
    DROP TABLE public.tb_estado;
       public         heap    postgres    false            �            1259    24609 	   tb_genero    TABLE     v   CREATE TABLE public.tb_genero (
    id_genero integer NOT NULL,
    genero_producto character varying(30) NOT NULL
);
    DROP TABLE public.tb_genero;
       public         heap    postgres    false            �            1259    24612    tb_marca    TABLE     m   CREATE TABLE public.tb_marca (
    id_marca integer NOT NULL,
    nombre_marca character varying NOT NULL
);
    DROP TABLE public.tb_marca;
       public         heap    postgres    false            �            1259    24617    tb_presentacion    TABLE     �   CREATE TABLE public.tb_presentacion (
    id_presentacion integer NOT NULL,
    presentacion_producto character varying(50) NOT NULL
);
 #   DROP TABLE public.tb_presentacion;
       public         heap    postgres    false            �            1259    24620    tb_producto    TABLE       CREATE TABLE public.tb_producto (
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
       public         heap    postgres    false            �            1259    24625    tb_valoracionProducto    TABLE     �   CREATE TABLE public."tb_valoracionProducto" (
    id_valoracion integer NOT NULL,
    comentario_producto text NOT NULL,
    fecha_comentario date NOT NULL,
    estado_comentario character varying(100)
);
 +   DROP TABLE public."tb_valoracionProducto";
       public         heap    postgres    false            �            1259    24630    tb_venta    TABLE     �   CREATE TABLE public.tb_venta (
    id_venta integer NOT NULL,
    fecha_venta date NOT NULL,
    estado_venta character varying(30) NOT NULL,
    id_cliente integer NOT NULL
);
    DROP TABLE public.tb_venta;
       public         heap    postgres    false            �            1259    24633    tipo_empleado    TABLE     }   CREATE TABLE public.tipo_empleado (
    "id_tipoEmpleado" integer NOT NULL,
    "tipoEmpleado" character varying NOT NULL
);
 !   DROP TABLE public.tipo_empleado;
       public         heap    postgres    false            �            1259    24638    ventas_cliente    VIEW       CREATE VIEW public.ventas_cliente AS
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
       public          postgres    false    212    220    220    220    212    212    212    212            ;          0    24588    tb_DetalleVenta 
   TABLE DATA           p   COPY public."tb_DetalleVenta" ("id_DetalleVenta", cantidad, id_producto, id_venta, "id_Valoracion") FROM stdin;
    public          postgres    false    210   �E       <          0    24591    tb_categoriaProducto 
   TABLE DATA           b   COPY public."tb_categoriaProducto" (id_categoria, categoria_producto, foto_categoria) FROM stdin;
    public          postgres    false    211   �F       =          0    24596 
   tb_cliente 
   TABLE DATA           �   COPY public.tb_cliente (id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, password, estado_cliente) FROM stdin;
    public          postgres    false    212   �F       >          0    24601    tb_empleado 
   TABLE DATA           �   COPY public.tb_empleado (id_empleado, nombre_empleado, apellido_empleado, "DUI", direccion_empleado, codigo_empleado, password_empleado, tipo_empleado) FROM stdin;
    public          postgres    false    213   �H       ?          0    24606 	   tb_estado 
   TABLE DATA           ?   COPY public.tb_estado (id_estado, estado_producto) FROM stdin;
    public          postgres    false    214   J       @          0    24609 	   tb_genero 
   TABLE DATA           ?   COPY public.tb_genero (id_genero, genero_producto) FROM stdin;
    public          postgres    false    215   MJ       A          0    24612    tb_marca 
   TABLE DATA           :   COPY public.tb_marca (id_marca, nombre_marca) FROM stdin;
    public          postgres    false    216   ~J       B          0    24617    tb_presentacion 
   TABLE DATA           Q   COPY public.tb_presentacion (id_presentacion, presentacion_producto) FROM stdin;
    public          postgres    false    217   K       C          0    24620    tb_producto 
   TABLE DATA             COPY public.tb_producto (id_producto, costo_producto, descipcion_producto, foto_producto, cantidad_producto, "id_estadoProducto", id_empleado, "id_marcaProducto", "id_generoProducto", "id_categoriaProducto", "id_presentacionProducto", nombre_producto) FROM stdin;
    public          postgres    false    218   @K       D          0    24625    tb_valoracionProducto 
   TABLE DATA           z   COPY public."tb_valoracionProducto" (id_valoracion, comentario_producto, fecha_comentario, estado_comentario) FROM stdin;
    public          postgres    false    219   �M       E          0    24630    tb_venta 
   TABLE DATA           S   COPY public.tb_venta (id_venta, fecha_venta, estado_venta, id_cliente) FROM stdin;
    public          postgres    false    220   kN       F          0    24633    tipo_empleado 
   TABLE DATA           J   COPY public.tipo_empleado ("id_tipoEmpleado", "tipoEmpleado") FROM stdin;
    public          postgres    false    221   �N       �           2606    24643 $   tb_DetalleVenta tb_DetalleVenta_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "tb_DetalleVenta_pkey" PRIMARY KEY ("id_DetalleVenta");
 R   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "tb_DetalleVenta_pkey";
       public            postgres    false    210            �           2606    24645 .   tb_categoriaProducto tb_categoriaProducto_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."tb_categoriaProducto"
    ADD CONSTRAINT "tb_categoriaProducto_pkey" PRIMARY KEY (id_categoria);
 \   ALTER TABLE ONLY public."tb_categoriaProducto" DROP CONSTRAINT "tb_categoriaProducto_pkey";
       public            postgres    false    211            �           2606    24647    tb_cliente tb_cliente_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tb_cliente
    ADD CONSTRAINT tb_cliente_pkey PRIMARY KEY (id_cliente);
 D   ALTER TABLE ONLY public.tb_cliente DROP CONSTRAINT tb_cliente_pkey;
       public            postgres    false    212            �           2606    24649    tb_empleado tb_empleado_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT tb_empleado_pkey PRIMARY KEY (id_empleado);
 F   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT tb_empleado_pkey;
       public            postgres    false    213            �           2606    24651    tb_estado tb_estado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tb_estado
    ADD CONSTRAINT tb_estado_pkey PRIMARY KEY (id_estado);
 B   ALTER TABLE ONLY public.tb_estado DROP CONSTRAINT tb_estado_pkey;
       public            postgres    false    214            �           2606    24653    tb_genero tb_gerero_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tb_genero
    ADD CONSTRAINT tb_gerero_pkey PRIMARY KEY (id_genero);
 B   ALTER TABLE ONLY public.tb_genero DROP CONSTRAINT tb_gerero_pkey;
       public            postgres    false    215            �           2606    24655    tb_marca tb_marca_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_marca
    ADD CONSTRAINT tb_marca_pkey PRIMARY KEY (id_marca);
 @   ALTER TABLE ONLY public.tb_marca DROP CONSTRAINT tb_marca_pkey;
       public            postgres    false    216            �           2606    24657 $   tb_presentacion tb_presentacion_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.tb_presentacion
    ADD CONSTRAINT tb_presentacion_pkey PRIMARY KEY (id_presentacion);
 N   ALTER TABLE ONLY public.tb_presentacion DROP CONSTRAINT tb_presentacion_pkey;
       public            postgres    false    217            �           2606    24659    tb_producto tb_producto_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT tb_producto_pkey PRIMARY KEY (id_producto);
 F   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT tb_producto_pkey;
       public            postgres    false    218            �           2606    24661 0   tb_valoracionProducto tb_valoracionProducto_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."tb_valoracionProducto"
    ADD CONSTRAINT "tb_valoracionProducto_pkey" PRIMARY KEY (id_valoracion);
 ^   ALTER TABLE ONLY public."tb_valoracionProducto" DROP CONSTRAINT "tb_valoracionProducto_pkey";
       public            postgres    false    219            �           2606    24663    tb_venta tb_venta_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_venta
    ADD CONSTRAINT tb_venta_pkey PRIMARY KEY (id_venta);
 @   ALTER TABLE ONLY public.tb_venta DROP CONSTRAINT tb_venta_pkey;
       public            postgres    false    220            �           2606    24665     tipo_empleado tipo_empleado_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.tipo_empleado
    ADD CONSTRAINT tipo_empleado_pkey PRIMARY KEY ("id_tipoEmpleado");
 J   ALTER TABLE ONLY public.tipo_empleado DROP CONSTRAINT tipo_empleado_pkey;
       public            postgres    false    221            �           2606    24666    tb_producto FK_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_categoria" FOREIGN KEY ("id_categoriaProducto") REFERENCES public."tb_categoriaProducto"(id_categoria) NOT VALID;
 D   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_categoria";
       public          postgres    false    218    211    3215            �           2606    24671    tb_venta FK_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_venta
    ADD CONSTRAINT "FK_cliente" FOREIGN KEY (id_cliente) REFERENCES public.tb_cliente(id_cliente) NOT VALID;
 ?   ALTER TABLE ONLY public.tb_venta DROP CONSTRAINT "FK_cliente";
       public          postgres    false    220    3217    212            �           2606    24676    tb_DetalleVenta FK_detalleVenta    FK CONSTRAINT     �   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_detalleVenta" FOREIGN KEY (id_venta) REFERENCES public.tb_venta(id_venta) NOT VALID;
 M   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "FK_detalleVenta";
       public          postgres    false    210    3233    220            �           2606    24681    tb_producto FK_empleado    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_empleado" FOREIGN KEY (id_empleado) REFERENCES public.tb_empleado(id_empleado) NOT VALID;
 C   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_empleado";
       public          postgres    false    218    3219    213            �           2606    24686    tb_producto FK_estado    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_estado" FOREIGN KEY ("id_estadoProducto") REFERENCES public.tb_estado(id_estado) NOT VALID;
 A   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_estado";
       public          postgres    false    3221    214    218            �           2606    24691    tb_producto FK_genero    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_genero" FOREIGN KEY ("id_generoProducto") REFERENCES public.tb_genero(id_genero) NOT VALID;
 A   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_genero";
       public          postgres    false    215    218    3223            �           2606    24696    tb_producto FK_marca    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_marca" FOREIGN KEY ("id_marcaProducto") REFERENCES public.tb_marca(id_marca) NOT VALID;
 @   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_marca";
       public          postgres    false    3225    218    216            �           2606    24701    tb_producto FK_presentacion    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_producto
    ADD CONSTRAINT "FK_presentacion" FOREIGN KEY ("id_presentacionProducto") REFERENCES public.tb_presentacion(id_presentacion) NOT VALID;
 G   ALTER TABLE ONLY public.tb_producto DROP CONSTRAINT "FK_presentacion";
       public          postgres    false    217    3227    218            �           2606    24706    tb_DetalleVenta FK_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_producto" FOREIGN KEY (id_producto) REFERENCES public.tb_producto(id_producto) NOT VALID;
 I   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "FK_producto";
       public          postgres    false    218    3229    210            �           2606    24711    tb_empleado FK_tipoEmpleado    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_empleado
    ADD CONSTRAINT "FK_tipoEmpleado" FOREIGN KEY (tipo_empleado) REFERENCES public.tipo_empleado("id_tipoEmpleado") NOT VALID;
 G   ALTER TABLE ONLY public.tb_empleado DROP CONSTRAINT "FK_tipoEmpleado";
       public          postgres    false    221    213    3235            �           2606    24716    tb_DetalleVenta FK_valoracion    FK CONSTRAINT     �   ALTER TABLE ONLY public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_valoracion" FOREIGN KEY ("id_Valoracion") REFERENCES public."tb_valoracionProducto"(id_valoracion) NOT VALID;
 K   ALTER TABLE ONLY public."tb_DetalleVenta" DROP CONSTRAINT "FK_valoracion";
       public          postgres    false    210    219    3231            ;   �   x�M�Q�!C��a� Qڻ��ϱ�{��?Ry$���(Ԡ��,��u����J�ؾ��KT�_zB���p�w��m�Q������q}����w47q���;Ҏ��]�m8���l��TR ����!��f��ּG�k���̲���i�>h�)?ﷁ��o��g|/��O<<ܪ���׺�]y�E��k�� `F�      <   8   x�3�LN,J�L�/��2��Rsr�!\c��ļ�bǄ� 3�6��ς���qqq ���      =   �  x�m�ϊ�0�ϓ���f-[|ې���������U*KTrr�7�P�4/V)^�������y439|��[K�����iISF�O�%�Jj��C��7����}8�ᄜ%e�u��vA���;+�:�
�1���GU���]��:Kvh�'�/?� ��7� {:�����E��K�Z$��-l�W�e��S&x*V�T�2���C}�ƺQ�a���1�n�\���o)�-a	�S-�BX���t@`�)%����5�佶�*GS	:�{ቤ�QK����,�yAgon��57Ah����:��S?N����耕��w�T3u$Bj��О�ΰ�'6h8�NM�#�%E:4_��	�J� �}ݳ�(�1|�>�����>�sr�5j���3��MLb0U���^7��	�Fs����sö�>�bl~N���&�jP�w�u�McA�y\����l�=�כ�00W|�=���)�T_��b���Sj      >     x�m�]J�0����)r �4�&m�� �Ga_��҉$�����܋����y���a�@,
	w�E�p�&�=A�.���t>�i[�� �m�b� 3<�-�F&�����w@�Q��^��zN�c�p!\�!�#���<����֖w����A��0�J	k��yh�i�{�K����b�!�F���n%n(�[
O�g�JT�/�bLC-������N�OJvU7(s�����F�g�n��O�N��*˲ȿn]      ?   1   x�3�t�SH��ML>�2�ˈ�1=�$1%��$^RtxaZfr>W� 7'�      @   !   x�3��M,N.�����2�tK�M�1c���� ~�      A      x�3���M,I�2�t�p�s��2�t-.9�2U�'�4%��˄3(�,'?�˔�%3��ˌ�'1/����T.s ��(Q�7�(9�Ԃ�9?''��$��˒�5'�*1)�$C��(%5��Ѐ����ّ+F��� �j$9      B   #   x�3�(J-N�+IL��ϋ7�2B0����� h)      C   �  x�uT�n�0=�_�ˀ�ĉ��Xd-vH�`Ŷ�.��$�d˕������Oȏ��N��.� ����F*��j�dzl���-��rq�멶�zug��C5R�0I�C�q��҅ㆫF"�x��/������8�	rθ��ۊ�F#���F��q�1-�V�?�lӦP)[�x V�ҹ>����ulpg�齥�^W]�k����`ڂ�!dc��mE�%��NbzhI��q�ï3K5#k8�K$�'�U�8v^�ó5��涬H��c�(QH���2C�=}x�j��Ђ��#�dՊ�_r����<��}@��M�-pqn$�a�ó+uΠ�^��P�xv�]�lG޸����l�мu��B�7}�躖��,���!��d��a�-�]��!��^�� �N��t��(^u*�i<�����6s�Ug�uTr�lm�5Dh�z��zYd�M4Q�4����J��U�9J����������Q��8=���w���8-t�i֡3�w�����nj>_%�B��kP$|�g�q	�>�N�8��g����;>�f#5=���F?����Z��%�͇���F�MPly�ޕ\��ԭ�	$(���K(��{�ƙZ��N[�ᲇ\�6�9��]ŗ��B#��_��J�&�B|x<pB�\�=6�b������O�R��2Y߽w��qE8ɍe      D   ^   x�U�1�  ��}E?�Һ��g��!1@��f����naG�)q�^(�aY)蝢F'2�u��B���_���+Um�o�
칧k<gD|�)      E   j   x�Mͻ�0E�:o� ����,� 4 �w	��Y��D<���z��Y��1��gqs=ޚZ��׀h��!��tQC�U�:��PR7{�~�	L�^� 5U      F   ,   x�3���/�2�tL����,.)JL�/�2�K�KI1c���� ��     