
CREATE TABLE public.tb_cliente
(
    id_cliente  SERIAL NOT NULL,
    nombre_cliente character varying(50) NOT NULL,
    apellido_cliente character varying(50) NOT NULL,
    celular_cliente character varying(9) NOT NULL,
    direccion_cliente text NOT NULL,
    email_cliente character varying(150) NOT NULL,
    password character varying(10) NOT NULL,
    estado_cliente character varying(30) NOT NULL,
    PRIMARY KEY (id_cliente)
);

ALTER TABLE IF EXISTS public.tb_cliente
    OWNER to postgres;

CREATE TABLE public.tb_venta
(
    id_venta SERIAL INTEGER NOT NULL,
    fecha_venta date NOT NULL, 
    estado_venta character varying(30) NOT NULL,
    id_cliente  NOT NULL,
    PRIMARY KEY (id_venta)
);

ALTER TABLE IF EXISTS public.tb_venta
    OWNER to postgres;

CREATE TABLE public."tb_DetalleVenta"
(
    "id_DetalleVenta" SERIAL INTEGER NOT NULL,
    cantidad integer NOT NULL,
    id_producto integer NOT NULL,
    id_venta integer NOT NULL,
    "id_Valoracion" integer NOT NULL,
    PRIMARY KEY ("id_DetalleVenta")
);

ALTER TABLE IF EXISTS public."tb_DetalleVenta"
    OWNER to postgres;

CREATE TABLE public."tb_valoracionProducto"
(
    id_valoracion SERIAL INTEGER NOT NULL,
    comentario_producto text NOT NULL,
    fecha_comentario date NOT NULL,
    estado_comentario character varying(100),
    PRIMARY KEY (id_valoracion)
);

ALTER TABLE IF EXISTS public."tb_valoracionProducto"
    OWNER to postgres;

CREATE TABLE public.tb_producto
(
    id_producto SERIAL INTEGER NOT NULL,
    nombre_producto character varying(50) not null,
    costo_producto double precision NOT NULL,
    descripcion_producto text NOT NULL,
    foto_producto text NOT NULL,
    cantidad_producto integer NOT NULL,
    "id_estadoProducto" integer NOT NULL,
    id_empleado integer NOT NULL,
    "id_marcaProducto" integer NOT NULL,
    "id_generoProoducto" integer NOT NULL,
    "id_categoriaProducto" integer NOT NULL,
    "id_presentacionProducto" integer NOT NULL,
    PRIMARY KEY (id_producto)
);

ALTER TABLE IF EXISTS public.tb_producto
    OWNER to postgres;

CREATE TABLE public.tb_estado
(
    id_estado SERIAL INTEGER NOT NULL,
    estado_producto character varying(30) NOT NULL,
    PRIMARY KEY (id_estado)
);

ALTER TABLE IF EXISTS public.tb_estado
    OWNER to postgres;

CREATE TABLE public.tb_gerero
(
    id_genero SERIAL INTEGER NOT NULL,
    genero_producto character varying(30) NOT NULL,
    PRIMARY KEY (id_genero)
);

ALTER TABLE IF EXISTS public.tb_gerero
    OWNER to postgres;

CREATE TABLE public.tb_empleado
(
    id_empleado SERIAL INTEGER NOT NULL,
    nombre_empleado character varying(50) NOT NULL,
    apellido_empleado character varying(50) NOT NULL,
    "DUI" character varying(11) NOT NULL,
    direccion_empleado text NOT NULL,
    codigo_empleado integer NOT NULL,
    password_empleado character varying(8) NOT NULL,
    tipo_empleado integer NOT NULL,
    PRIMARY KEY (id_empleado)
);

ALTER TABLE IF EXISTS public.tb_empleado
    OWNER to postgres;

CREATE TABLE public.tb_marca
(
    id_marca SERIAL INTEGER NOT NULL,
    nombre_marca character varying NOT NULL,
    PRIMARY KEY (id_marca)
);

ALTER TABLE IF EXISTS public.tb_marca
    OWNER to postgres;

CREATE TABLE public.tb_presentacion
(
    id_presentacion SERIAL INTEGER NOT NULL,
    presentacion_producto character varying(50) NOT NULL,
    PRIMARY KEY (id_presentacion)
);

ALTER TABLE IF EXISTS public.tb_presentacion
    OWNER to postgres;

CREATE TABLE public.tipo_empleado
(
    "id_tipoEmpleado" SERIAL INTEGER NOT NULL,
    "tipoEmpleado" character varying NOT NULL,
    PRIMARY KEY ("id_tipoEmpleado")
);

ALTER TABLE IF EXISTS public.tipo_empleado
    OWNER to postgres;

-- INSERTS --

--- Tabla de clientes -- 
INSERT INTO public.tb_cliente(
	id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, password, estado_cliente)
	VALUES (1, 'Nelson', 'Almedares', '7545-6587', 'Por mi casita', 'sdflkjsdfj@sdfsdfsafsd', '123456', 'activo');

-- Tabla de ventas --
INSERT INTO public.tb_venta(
	id_venta, fecha_vente, estado_venta, id_cliente)
	VALUES (1, '02-14-2022', 'Cancelado', 1); --Los datos para le fecha deben de ser (DD-MM-AAAA)

-- Vistas --
CREATE VIEW ventas_cliente
AS
SELECT nombre_cliente, apellido_cliente, celular_cliente, estado_cliente, fecha_venta, estado_venta
FROM tb_cliente tc, tb_venta tv
WHERE tc.id_cliente = tv.id_cliente

create view producto_especifico
as
select nombre_producto, costo_producto, descipcion_producto, foto_producto, cantidad_producto, estado_producto, nombre_marca, genero_producto, categoria_producto, presentacion_producto
from tb_producto tb_p, tb_estado tb_e, tb_genero tb_g, tb_marca tb_m , "tb_categoriaProducto" tb_c, tb_presentacion tb_pp
where tb_p."id_estadoProducto" = tb_e.id_estado AND tb_p."id_marcaProducto" = tb_m.id_marca AND tb_p."id_generoProducto" = tb_g.id_genero 
	AND tb_p."id_categoriaProducto" = tb_c.id_categoria AND tb_p."id_presentacionProducto" = tb_pp.id_presentacion;

-- Actualizaciones a la base
ALTER TABLE IF EXISTS public.tb_venta
    RENAME fecha_vente TO fecha_venta;

ALTER TABLE IF EXISTS public.tb_producto
    RENAME "id_generoProoducto" TO "id_generoProducto";

--Alters de las tablas

--Tabla de estado de los productos
ALTER TABLE IF EXISTS public.tb_producto
    ADD CONSTRAINT "FK_estado" FOREIGN KEY ("id_estadoProducto")
    REFERENCES public.tb_estado (id_estado) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

--Tabla de empleados
ALTER TABLE IF EXISTS public.tb_producto
    ADD CONSTRAINT "FK_empleado" FOREIGN KEY (id_empleado)
    REFERENCES public.tipo_empleado ("id_tipoEmpleado") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

--Tabla de genero de los productos
ALTER TABLE IF EXISTS public.tb_producto
    ADD CONSTRAINT "FK_genero" FOREIGN KEY ("id_generoProducto")
    REFERENCES public.tb_gerero (id_genero) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

--Tabla de marcas de los productos
ALTER TABLE IF EXISTS public.tb_producto
    ADD CONSTRAINT "FK_marca" FOREIGN KEY ("id_marcaProducto")
    REFERENCES public.tb_marca (id_marca) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

--Tabla de categoria de los productos
ALTER TABLE IF EXISTS public.tb_producto
    ADD CONSTRAINT "FK_categoria" FOREIGN KEY ("id_categoriaProducto")
    REFERENCES public.tb_categoria (id_categoria) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

--Tabla de presentacion de los productos
ALTER TABLE IF EXISTS public.tb_producto
    ADD CONSTRAINT "FK_presentacion" FOREIGN KEY ("id_presentacionProducto")
    REFERENCES public.tb_presentacion (id_presentacion) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

--tabla de detalle de venta con relacion a la tabla de productos
ALTER TABLE IF EXISTS public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_producto" FOREIGN KEY (id_producto)
    REFERENCES public.tb_producto (id_producto) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

--Tabla de detalle de venta para la tabla de ventas
ALTER TABLE IF EXISTS public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_venta" FOREIGN KEY (id_venta)
    REFERENCES public.tb_venta (id_venta) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

--tabla de detalle de ventas para la valoracion de los productos
ALTER TABLE IF EXISTS public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_valoracion" FOREIGN KEY ("id_Valoracion")
    REFERENCES public."tb_valoracionProducto" (id_valoracion) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

--Tabla de ventas con relacion para la tabla de cliente
ALTER TABLE IF EXISTS public.tb_venta
    ADD CONSTRAINT "FK_cliente" FOREIGN KEY (id_cliente)
    REFERENCES public.tb_cliente (id_cliente) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

--Relacion de las tablas de empleado con tipo Empleado
ALTER TABLE IF EXISTS public.tb_empleado
    ADD CONSTRAINT "FK_tipoEmpleado" FOREIGN KEY (tipo_empleado)
    REFERENCES public.tipo_empleado ("id_tipoEmpleado") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

--Inserts de la base

--Tabla de genero de productos
INSERT INTO PUBLIC."tb_gerero" (genero_producto)
VALUES('Hombre');
INSERT INTO PUBLIC."tb_gerero" (genero_producto)
VALUES('Mujer');
INSERT INTO PUBLIC."tb_gerero" (genero_producto)
VALUES('Unisex');

--tabla de estado de los productos
INSERT INTO PUBLIC.""(estado_producto)
VALUES('En bodega');
INSERT INTO PUBLIC.""(estado_producto)
VALUES('Agotado');
INSERT INTO PUBLIC.""(estado_producto)
VALUES('No encontrado');

--tabla de presentacion de los productos
INSERT INTO PUBLIC."tb_presentacion"(presentacion_Producto)
VALUES('500ml');
INSERT INTO PUBLIC."tb_presentacion"(presentacion_Producto)
VALUES('1000ml');
INSERT INTO PUBLIC."tb_presentacion"(presentacion_Producto)
VALUES('Espuma');
INSERT INTO PUBLIC."tb_presentacion"(presentacion_Producto)
VALUES('Sobres');
INSERT INTO PUBLIC."tb_presentacion"(presentacion_Producto)
VALUES('Única');

--Tabla de marcas de los productos
INSERT INTO PUBLIC."tb_marca"(nombre_marca)
VALUES('Aveeno');
INSERT INTO PUBLIC."tb_marca"(nombre_marca)
VALUES('Jo Malone');
INSERT INTO PUBLIC."tb_marca"(nombre_marca)
VALUES('Fresh');
INSERT INTO PUBLIC."tb_marca"(nombre_marca)
VALUES('Bioderma');
INSERT INTO PUBLIC."tb_marca"(nombre_marca)
VALUES('Neutrgena');
INSERT INTO PUBLIC."tb_marca"(nombre_marca)
VALUES('Lubriderm');
INSERT INTO PUBLIC."tb_marca"(nombre_marca)
VALUES('DARPHIN');
INSERT INTO PUBLIC."tb_marca"(nombre_marca)
VALUES('Garnier');

--Tabla de tipo de Empleados
INSERT INTO PUBLIC."tipo_empleado"("tipoEmpleado")
VALUES('Administrador');
INSERT INTO PUBLIC."tipo_empleado"("tipoEmpleado")
VALUES('Vendedor');

--Tabla de empleados
INSERT INTO PUBLIC."tb_empleado"("nombre_empleado", "apellido_empleado", "DUI", "direccion_empleado", "codigo_empleado", "password_empleado", tipo_empleado)
VALUES('Nelson', 'Almendares', 013568794, 'Urb Santisima trinidida, Ayutuxtepeque, casa 23', 202201, 'Nelson12', 1);

--Tabla de categorias de productos
insert into public."tb_categoria"(categoria_producto, foto_categoria)
values('Hidratacion', 'imagen.jpg');
insert into public."tb_categoria"(categoria_producto, foto_categoria)
values('Color', 'imagen.jpg');
insert into public."tb_categoria"(categoria_producto, foto_categoria)
values('Reparación', 'imagen.jpg');
insert into public."tb_categoria"(categoria_producto, foto_categoria)
values('Caballeros', 'imagen.jpg');
insert into public."tb_categoria"(categoria_producto, foto_categoria)
values('Cuero Cabelludo', 'imagen.jpg');
insert into public."tb_categoria"(categoria_producto, foto_categoria)
values('Estilizado', 'imagen.jpg');

--Tabla de productos
INSERT INTO public.tb_producto(
	nombre_producto, costo_producto, descripcion_producto, foto_producto, cantidad_producto, "id_estadoProducto", id_empleado, "id_marcaProducto", "id_generoProducto", "id_categoriaProducto", "id_presentacionProducto")
	VALUES ('Crema para manos', 12.50, 'Crema hidratante para piel reseca, a base de extracto de coco', 'imagen.jpg',12, 1, 1, 6, 3, 1, 1);INSERT INTO public.tb_producto(
	nombre_producto, costo_producto, descripcion_producto, foto_producto, cantidad_producto, "id_estadoProducto", id_empleado, "id_marcaProducto", "id_generoProducto", "id_categoriaProducto", "id_presentacionProducto")
	VALUES ('Quinnoa Hair Mask', 41.82, 'Tratamiento que ayuda a repara cabellos procesados', 'imagen.jpg', 12, 1, 1, 1, 3, 3, 5);
INSERT INTO public.tb_producto(
	nombre_producto, costo_producto, descripcion_producto, foto_producto, cantidad_producto, "id_estadoProducto", id_empleado, "id_marcaProducto", "id_generoProducto", "id_categoriaProducto", "id_presentacionProducto")
	VALUES ('Shampoo Lumina', 23.71, 'Matizador para cabello cano plateado. Su pigmento violeta neutraliza las tonalidades amarillas', 'imagen.png', 8, 1, 1, 9, 2, 5, 2);
INSERT INTO public.tb_producto(
	nombre_producto, costo_producto, descripcion_producto, foto_producto, cantidad_producto, "id_estadoProducto", id_empleado, "id_marcaProducto", "id_generoProducto", "id_categoriaProducto", "id_presentacionProducto")
	VALUES ('Love curl Shampoo', 22.19, 'Shampoo que birnda elasticidad manteniendo el cabello suave', 'imagen.jpg', 16, 1, 1, 8, 2, 7, 6);
INSERT INTO public.tb_producto(
	nombre_producto, costo_producto, descripcion_producto, foto_producto, cantidad_producto, "id_estadoProducto", id_empleado, "id_marcaProducto", "id_generoProducto", "id_categoriaProducto", "id_presentacionProducto")
	VALUES ('3D Men Champu', 21.50,'Ayuda a prevenir la caspa en el cabello masculino, brindando a su vez limpieza capilar', 'imagen.jpg', 20, 1, 1, 10, 1, 4, 6);


create table public."tb_ventas"(
    id_venta serial not null,
    fecha_venta date not null,
    estado_venta integer not null,
    id_cliente integer not null,
    cantidad_venta numeric not null,
    id_producto int not null,
    id_valoracion int not null
    primary key("id_venta")
);
ALTER TABLE IF EXISTS public.cliente
    OWNER to postgres;

create table public."tb_estadoVenta"(
    id_estado serial not null,
    estado_venta character varying(40) not null
    primary key("id_estado")
);

insert into tb_ventas (fecha_venta) values(current_timestamp)