/*TRIGGERS*/

/*Trigger insert producto*/
create function insertProductoFn() returns trigger 
language plpgsql
as $$
begin
	insert into bitacora ("fechaBitacora", "usuario", "accion") values (current_date, 'Administrador', 'Se agregó un producto');
	return new;
end; $$

CREATE TRIGGER insertarProductoTr
after insert
on producto
for each row
execute function insertProductoFn();
-----------------------------------------------------------
/*Trigger update producto*/
create function updateProductoFn() returns trigger 
language plpgsql
as $$
begin
	insert into bitacora ("fechaBitacora", "usuario", "accion") values (current_date, 'Administrador', 'Se actualizó un producto');
	return new;
end; $$

CREATE TRIGGER editarProductoTr
after update
on producto
for each row
execute function updateProductoFn();
-----------------------------------------------------------
/*Trigger delete producto*/
create function deleteProductoFn() returns trigger 
language plpgsql
as $$
begin
	insert into bitacora ("fechaBitacora", "usuario", "accion") values (current_date, 'Administrador', 'Se eliminó un producto');
	return new;
end; $$

CREATE TRIGGER eliminarProductoTr
after delete
on producto
for each row
execute function deleteProductoFn();

/*FUNCIONES*/

--Promedio de puntaje reseña de un producto
CREATE OR REPLACE FUNCTION promedioResena(producto integer) RETURNS numeric 
language plpgsql 
AS $$
BEGIN
        RETURN (select avg("puntajeResena") as promedio  
        from resena as re, "detallePedido" as dp, producto p where re."idDetalle" = dp."idDetallePedido" and dp."idProducto" = p."idProducto" 
        and p."idProducto"= producto);
END; $$

select * from round(cast(promedioResena(3) as numeric), 2);


--Mostrar el stock de un producto con relación a su color
CREATE OR REPLACE FUNCTION stockProducto(producto integer, color integer) RETURNS integer
language plpgsql 
AS $$
BEGIN
        RETURN (select stock
        from colorStock 
        where "idProducto" = producto and "idColor" = color);
END; $$
select * from stockProducto(1, 2);

/*PROCEDIMIENTOS*/

/*Actualizar montoTotal*/
create or replace procedure actualizarMonto(numeroPedido int)
language plpgsql    
as $$
begin
    UPDATE public.pedido
	SET "montoTotal"= (SELECT SUM(("cantidadProducto"*"precioUnitario")) AS sumaPrecios
                        FROM "detallePedido"
                        WHERE "detallePedido"."idPedido" = numeroPedido)
	WHERE pedido."idPedido" = numeroPedido;
    commit;
end;$$
CALL actualizarMonto(1);

/*Dar de baja un producto, un cliente o un empleado*/

create or replace procedure darDeBaja(opcion int, id int) --opcion 1 producto, opcion 2 cliente, opcion 3 empleado
language plpgsql    
as $$
begin
    if opcion = 1 then
        UPDATE public.producto
            SET "estadoProducto" = 3 
            WHERE "idProducto" = id;
   elsif opcion = 2 then
        UPDATE public.cliente
            SET "estadoCliente" = 3 
            WHERE "idCliente" = id;
   elsif opcion = 3 then
        UPDATE public.empleado
            SET "estadoEmpleado" = 3 
            WHERE "idEmpleado" = id;
   else
    raise notice 'Ingresa un número válido';
    end if; 
    commit;
end;$$

CALL darDeBaja(1, 1);


