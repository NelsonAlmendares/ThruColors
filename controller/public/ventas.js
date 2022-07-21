// Constante para establecer la ruta y parámetros de comunicación con la API.
const API_VENTAS = SERVER + 'publico/ventas.php?action=';
const API_RECIBO = SERVER + 'reports/publico/ventas.php';
// Método manejador de eventos que se ejecuta cuando el documento ha cargado.
document.addEventListener('DOMContentLoaded', function () {
    // Se llama a la función que obtiene los productos del carrito de compras para llenar la tabla en la vista.
    readOrderDetail();    
});

// Función para obtener el detalle del pedido (carrito de compras).
function readOrderDetail() {
    // Petición para solicitar los datos del pedido en proceso.
    fetch(API_VENTAS + 'readVentas', {
        method: 'get'
    }).then(function (request) {
        // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
        if (request.ok) {
            // Se obtiene la respuesta en formato JSON.
            request.json().then(function (response) {                
                let boton = '';
                boton += `                        
                        <a href="index.html" type="button" class="btn btn-outline-info" data-bs-toggle="tooltip"
                        data-bs-placement="bottom" title="Seguir comprando"><i
                            class="fa-solid fa-house"></i></a>                           
                        `;
                // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.        
                if (response.status) {
                    // Se declara e inicializa una variable para concatenar las filas de la tabla en la vista.
                    let content = '';                    
                    // Se declara e inicializa una variable para calcular el importe por cada producto.
                    let subtotal = 0;
                    // Se declara e inicializa una variable para ir sumando cada subtotal y obtener el monto final a pagar.
                    let total = 0;
                    //
                    $estado = '';
                    // Se recorre el conjunto de registros (dataset) fila por fila a través del objeto row.
                    response.dataset.map(function (row) {
                        (row.estado==1) ? $estado = 'Activo' : $estado = 'Inactivo';
                        subtotal = parseFloat(row.costo);
                        total += subtotal;
                        // Se crean y concatenan las filas de la tabla con los datos de cada registro.
                        content += `
                            <tr>                                
                                <td class="text-center">${row.fecha}</td>
                                <td class="text-center">${row.cantidad_productos}</td>
                                <td class="text-center">${$estado}</td>                                
                                <td class="text-center">$${subtotal.toFixed(2)}</td>
                                <td class="text-center">
                                    <a onclick="openReport(${row.id_venta})" class="btn documento" data-bs-toggle="tooltip" data-bs-placement="top" title="Generar recibo">
                                        <i class="fa-solid fa-file-lines generar_documento"></i>
                                    </a>                                    
                                </td>
                            </tr>                            
                        `;                        
                    });
                    // Se agregan las filas al cuerpo de la tabla mediante su id para mostrar los registros.
                    document.getElementById('tb-venta').innerHTML = content;
                    // Se muestra el total a pagar con dos decimales.
                    document.getElementById('pago').textContent = total.toFixed(2);
                    // Se inicializa el componente Tooltip para que funcionen las sugerencias textuales.
                    document.getElementById('botones').innerHTML = boton;
                } else {
                    Toast(4, response.exception, null);
                }
            });
        } else {
            console.log(request.status + ' ' + request.statusText);
        }
    });
}

// Función para abrir el reporte de productos.
function openReport(id_venta) {
    // Se establece la ruta del reporte en el servidor y se manda el id de la venta para generar el recibo de la misma.
    let url = SERVER + 'reports/publico/ventas.php?id='+ id_venta;
    // Se abre el reporte en una nueva pestaña del navegador web.
    window.open(url);
}