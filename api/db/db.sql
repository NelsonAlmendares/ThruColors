
CREATE TABLE public.tb_cliente
(
    id_cliente  SERIAL INTEGER NOT NULL,
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
    id_cliente integer NOT NULL,
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

UPDATE public.tb_presentacion
	SET id_presentacion=2, presentacion_producto='1000ml'
	WHERE id_presentacion = 2;

ALTER TABLE IF EXISTS public.tb_producto
    ADD COLUMN nombre_producto character varying(50) NOT NULL;

ALTER TABLE IF EXISTS public.tb_producto
    ALTER COLUMN foto_producto DROP NOT NULL;

ALTER TABLE IF EXISTS public.tb_producto
    RENAME "id_generoProoducto" TO "id_generoProducto";

ALTER TABLE IF EXISTS public.tb_gerero
    RENAME TO tb_genero;

ALTER TABLE IF EXISTS public.tb_producto
    RENAME CONSTRAINT "FK_estadp" TO "FK_estado";

--Alters de las tablas
ALTER TABLE IF EXISTS public."tb_DetalleVenta" DROP CONSTRAINT IF EXISTS "FK_detalleVenta";

ALTER TABLE IF EXISTS public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_detalleVenta" FOREIGN KEY (id_venta)
    REFERENCES public.tb_venta (id_venta) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_valoracion" FOREIGN KEY ("id_Valoracion")
    REFERENCES public."tb_valoracionProducto" (id_valoracion) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.tb_producto
    ADD CONSTRAINT "FK_estadp" FOREIGN KEY ("id_estadoProducto")
    REFERENCES public.tb_estado (id_estado) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.tb_producto
    ADD CONSTRAINT "FK_genero" FOREIGN KEY ("id_generoProoducto")
    REFERENCES public.tb_gerero (id_genero) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.tb_producto
    ADD CONSTRAINT "FK_presentacion" FOREIGN KEY ("id_presentacionProducto")
    REFERENCES public.tb_presentacion (id_presentacion) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.tb_producto
    ADD CONSTRAINT "FK_marca" FOREIGN KEY ("id_marcaProducto")
    REFERENCES public.tb_marca (id_marca) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.tb_producto
    ADD CONSTRAINT "FK_categoria" FOREIGN KEY ("id_categoriaProducto")
    REFERENCES public."tb_categoriaProducto" (id_categoria) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.tb_producto
    ADD CONSTRAINT "FK_empleado" FOREIGN KEY (id_empleado)
    REFERENCES public.tb_empleado (id_empleado) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.tb_empleado
    ADD CONSTRAINT "FK_tipoEmpleado" FOREIGN KEY (tipo_empleado)
    REFERENCES public.tipo_empleado ("id_tipoEmpleado") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."tb_DetalleVenta"
    ADD CONSTRAINT "FK_producto" FOREIGN KEY (id_producto)
    REFERENCES public.tb_producto (id_producto) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

create type filtrar_producto as(
	  nombre_producto character varying (50),
	  costo_producto double precision,
	  descripcion_producto character varying (200),
	  foto_producto text,
	  cantidad_producto integer,
	  estado_producto character varying (50),
	  categoria_producto character varying (20),
	  presentacion_producto character varying (20)
  );