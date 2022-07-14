
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