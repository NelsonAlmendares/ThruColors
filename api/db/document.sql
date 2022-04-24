
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