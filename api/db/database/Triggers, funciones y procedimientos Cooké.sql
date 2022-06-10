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


--REPORTES CON PARAMETROS


/*--------------------------Reportes con parámetros--------------------------*/
/*Consulta dados dos rangos de fecha*/ 
SELECT "idPedido" , "idCliente", "fechaPedido"
FROM pedido where "fechaPedido"
between cast ('2022-02-01' as date) and '2022-03-10' --params
order by "fechaPedido"

/*Consulta de clientes según estado*/
SELECT "idCliente", "nombresCliente", "apellidosCliente", "duiCliente", ec."estadoCliente" FROM cliente as c inner join "estadoCliente" ec on c."estadoCliente" = ec."idEstadoCliente" 
WHERE ec."estadoCliente" = 'Activo' --param
order by "nombresCliente"


/*Búsqueda de productos por descripción de subcategoría*/
SELECT "idProducto", "nombreProducto", "precioProducto", ep."estadoProducto", "nombreSubCategoriaP", "descripcionSubCategoriaP" 
FROM producto as p inner join "subcategoriaProducto" as sc on p."idSubCategoriaP" = sc."idSubCategoriaP" 
inner join "estadoProducto" as ep on p."estadoProducto" = ep."idEstadoProducto"
WHERE "descripcionSubCategoriaP" like '%sartenes%' -- param


--Reseñas por rango de puntaje
SELECT "idResena", "nombresCliente", "nombreProducto", "tituloResena", "puntajeResena"
from resena as r inner join cliente as c on r."idCliente" = c."idCliente"
inner join "detallePedido" as dp on r."idDetalle" = dp."idDetallePedido"
inner join producto as p on dp."idProducto" = p."idProducto"
where "puntajeResena" >=4  and "puntajeResena" <= 5


/*Productos por proveedor según X cantidad de productos*/ 
select c."nombreProveedor", COUNT ("idProducto") as "cantidadProductos"
from producto as p join proveedor as c on p."idProveedor" = c."idProveedor"
GROUP BY c."idProveedor"
having count("idProducto") >= 2


/*--------------------------Reportes con rango de fecha--------------------------*/
/*Ventas del día*/
Select "montoTotal", "nombresCliente", "apellidosCliente"
from pedido as p join cliente as c on p."idCliente" = c."idCliente"
where "fechaPedido" between (select current_date - cast('1 days' as interval))  and (select current_date) order by "montoTotal" DESC


/*Ventas en lo que va del mes estadistica*/
Select count("idPedido") as Ventas, sum("montoTotal") as Ingresos, EXTRACT(DAY FROM "fechaPedido") as Día --, to_char("fechaPedido", 'MONTH') as Mes -----Por si se quiere mostrar el mes también
from pedido
where "fechaPedido" between (select cast(date_trunc('month', current_date) as date)) and (select current_date) group by "fechaPedido" 

/*Clientes con x edad según año*/
select "nombresCliente", "apellidosCliente", "nacimientoCliente", 
extract (year from age(CAST("nacimientoCliente" AS DATE))) AS edad
from public.cliente
where "nacimientoCliente" BETWEEN '2000-01-01' AND '2005-01-01'

/*Pedidos de los últimos 7 dias*/ 
select "idPedido", "fechaPedido", "montoTotal", "nombresCliente", "apellidosCliente"
from pedido as p join cliente as c on p."idCliente" = c."idCliente"
where "fechaPedido" between (select current_date - cast('7 days' as interval))  and (select current_date) order by "montoTotal" DESC