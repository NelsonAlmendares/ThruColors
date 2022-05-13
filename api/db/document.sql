
--Vistas

select * from public."ventas_cliente" where estado_venta like '%Cancelado%';

create view factura
as
select nombre_cliente, apellido_cliente, fecha_venta, estado_venta, predcio_producto, cantidad, nombre_producto, costo_producto, descripcion_producto, genero_producto, presentacion, marca, categoria_producto 
from tb_producto tp, tb_marca tm, tb_categoriaProducto tcp, tb_presentacion tps, tb_genero tg, tb_DetalleVenta tdc, tb_venta tv, tb_cliente tc
where tdc.id_producto = tp.id_Producto AND tp AND tdc.id_venta = tv.id_venta AND tv.id_cliente = tc.id_cliente

SELECT COUNT(*) FROM public."tb_categoriaProducto" WHERE categoria_producto LIKE '%cara%';

create or replace function fnc_filtrarProducto()
returns setof filtrar_producto
language plpgsql;
as 
$$
declare
registro record;
cursor cursor_tabla is 
select * from producto_especifico;

begin
	open cursor_tabla;
	fetch cursor_tabla into registro:
	while found loop
		begin
		exception when others then
			raise notice '% %',sqlerrm,sqlstate;
		end;
		fetch cursor_tablas into registro;	
	end loop;
	close cursor_tablas;
	returns;
end;
$$

--Busqueda con inner joins para productos
SELECT nombre_producto, descipcion_producto, costo_producto, estado_producto, nombre_marca, categoria_producto, presentacion_producto
            FROM tb_producto tp INNER JOIN tb_estado te ON tp."id_estadoProducto" = te.id_estado 
                INNER JOIN tb_marca tm ON tp."id_marcaProducto" = tm.id_marca
                INNER JOIN "tb_categoriaProducto" tc ON tp."id_categoriaProducto" = tc.id_categoria
                INNER JOIN tb_presentacion tb ON tp."id_presentacionProducto" = tb.id_presentacion
                WHERE nombre_producto LIKE = ? OR descipcion_producto LIKE = ?
                ORDER BY id_producto;

INSERT INTO "tb_producto" (id_producto, nombre_producto, costo_producto, descipcion_producto, foto_producto, cantidad_producto,"id_estadoProducto", id_empleado, "id_marcaProducto", "id_generoProducto","id_categoriaProducto","id_presentacionProducto")
VALUES (?,?,?,?,?,?,?,?,?,?,?,?)

SELECT id_producto as ID, nombre_producto as nombre, foto_producto as foto, descripcion_producto as descripcion, costo_producto as costo, estado_producto as estado, nombre_marca as marca, categoria_producto as categoria, presentacion_producto as presentacion
            FROM tb_producto tp INNER JOIN tb_estado te ON tp."id_estadoProducto" = te.id_estado 
                INNER JOIN tb_marca tm ON tp."id_marcaProducto" = tm.id_marca
                INNER JOIN "tb_categoria" tc ON tp."id_categoriaProducto" = tc.id_categoria
                INNER JOIN tb_presentacion tb ON tp."id_presentacionProducto" = tb.id_presentacion
                WHERE id_categoria = 4 
                ORDER BY id_producto;