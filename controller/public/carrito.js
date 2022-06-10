// Constante para establecer la ruta y parámetros de comunicación con la API.
const API_PEDIDOS = SERVER + 'publico/pedidos.php?action=';
var myModal = new bootstrap.Modal(document.getElementById('Modal-cantidad'), {
    keyboard: false
});
// Método manejador de eventos que se ejecuta cuando el documento ha cargado.
document.addEventListener('DOMContentLoaded', function () {
    // Se llama a la función que obtiene los productos del carrito de compras para llenar la tabla en la vista.
    readOrderDetail();
    // Se define una variable para establecer las opciones del componente Modal.
    let options = {
        dismissible: false
    }
    // Se inicializa el componente Modal para que funcionen las cajas de diálogo.
    //M.Modal.init(document.querySelectorAll('.modal'), options);
});

// Función para obtener el detalle del pedido (carrito de compras).
function readOrderDetail() {
    // Petición para solicitar los datos del pedido en proceso.
    fetch(API_PEDIDOS + 'readOrderDetail', {
        method: 'get'
    }).then(function (request) {
        // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
        if (request.ok) {
            // Se obtiene la respuesta en formato JSON.
            request.json().then(function (response) {                
                let boton = '';
                boton += `
                        <a type="button" onclick="finishOrder(${response.dataset.id_venta})" class="btn btn-outline-primary"
                        data-bs-toggle="tooltip" data-bs-placement="bottom" title="Finalizar pedido"><i
                            class="fa-solid fa-credit-card"></i></a>
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
                    // Se recorre el conjunto de registros (dataset) fila por fila a través del objeto row.
                    response.dataset.map(function (row) {
                        subtotal = row.costo * row.cantidad;
                        total += subtotal;
                        // Se crean y concatenan las filas de la tabla con los datos de cada registro.
                        content += `
                            <tr>
                                <td class="text-center">${row.nombre}</td>
                                <td class="text-center">$${row.costo}</td>
                                <td class="text-center">${row.cantidad}</td>
                                <td class="text-center">${row.marca}</td>
                                <td class="text-center">${row.presentacion}</td>
                                <td class="text-center">$${subtotal.toFixed(2)}</td>
                                <td class="text-center">
                                    <a onclick="openUpdateDialog(${row.id_detalle}, ${row.id_venta}, ${row.cantidad})" class="btn btn-outline-warning" data-bs-toggle="tooltip" data-bs-placement="top" title="Cambiar cantidad">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                    <a onclick="openDeleteDialog(${row.id_detalle})" class="btn btn-outline-danger" data-bs-toggle="tooltip" data-bs-placement="top" title="Eliminar producto">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </td>
                            </tr>                            
                        `;                        
                    });
                    // Se agregan las filas al cuerpo de la tabla mediante su id para mostrar los registros.
                    document.getElementById('carrito-compra').innerHTML = content;
                    // Se muestra el total a pagar con dos decimales.
                    document.getElementById('pago').textContent = total.toFixed(2);
                    // Se inicializa el componente Tooltip para que funcionen las sugerencias textuales.
                    document.getElementById('botones').innerHTML = boton;
                } else {
                    sweetAlert(4, response.exception, 'index.html');
                }
            });
        } else {
            console.log(request.status + ' ' + request.statusText);
        }
    });
}

// Función para abrir una caja de dialogo (modal) con el formulario de cambiar cantidad de producto.
function openUpdateDialog(id_detalle,id_venta, quantity) {
    // Se abre la caja de dialogo (modal) que contiene el formulario.
    myModal.show()
    // Se inicializan los campos del formulario con los datos del registro seleccionado.
    document.getElementById('id_detalle').value = id_detalle;
    document.getElementById('id_venta').value = id_venta;
    document.getElementById('cantidad').value = quantity;
    // Se actualizan los campos para que las etiquetas (labels) no queden sobre los datos.
    //M.updateTextFields();
}

// Método manejador de eventos que se ejecuta cuando se envía el formulario de cambiar cantidad de producto.
document.getElementById('cantidad-form').addEventListener('submit', function (event) {
    // Se evita recargar la página web después de enviar el formulario.
    event.preventDefault();
    // Petición para actualizar la cantidad de producto.
    fetch(API_PEDIDOS + 'updateDetail', {
        method: 'post',
        body: new FormData(document.getElementById('cantidad-form'))
    }).then(function (request) {
        // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
        if (request.ok) {
            // Se obtiene la respuesta en formato JSON.
            request.json().then(function (response) {
                // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
                if (response.status) {
                    // Se actualiza la tabla en la vista para mostrar el cambio de la cantidad de producto.
                    readOrderDetail();
                    // Se cierra la caja de dialogo (modal) del formulario y se muestra un mensaje de éxito.
                    myModal.hide()
                    sweetAlert(1, response.message, null);
                } else {
                    sweetAlert(2, response.exception, null);
                }
            });
        } else {
            console.log(request.status + ' ' + request.statusText);
        }
    });
});

// Función para mostrar un mensaje de confirmación al momento de finalizar el pedido.
function finishOrder(id) {
    Swal.fire({
        title: 'Aviso',
        text: '¿Está seguro de finalizar el pedido?',
        icon: 'info',
        showCancelButton: true,
        confirmButtonText: 'Si',
        cancelButtonText: 'No',
        reverseButtons: true,
        closeOnClickOutside: false,
        closeOnEsc: false
    }).then((result) => {
        // Se verifica si fue cliqueado el botón Sí para realizar la petición respectiva, de lo contrario se muestra un mensaje.
        if (result.isConfirmed) {
            const data = new FormData();
            data.append('id_venta', id);
            // Petición para finalizar el pedido en proceso.
            fetch(API_PEDIDOS + 'finishOrder', {
                method: 'get'
            }).then(function (request) {
                // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
                if (request.ok) {
                    request.json().then(function (response) {
                        // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
                        if (response.status) {
                            sweetAlert(1, response.message, 'index.html');
                        } else {
                            sweetAlert(2, response.exception, null);
                        }
                    });
                } else {
                    console.log(request.status + ' ' + request.statusText);
                }
            });
        } else {
            sweetAlert(4, 'Puede seguir comprando', null);
        }
    });
}

// Función para mostrar un mensaje de confirmación al momento de eliminar un producto del carrito.
function openDeleteDialog(id) {
    Swal.fire({
        title: 'Advertencia',
        text: '¿Está seguro de remover el producto?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Si',
        cancelButtonText: 'No',
        reverseButtons: true,
        closeOnClickOutside: false,
        closeOnEsc: false
    }).then((value) => {
        // Se verifica si fue cliqueado el botón Sí para realizar la petición respectiva, de lo contrario no se hace nada.
        if (value.isConfirmed) {
            // Se define un objeto con los datos del producto seleccionado.
            const data = new FormData();
            data.append('id_detalle', id);
            // Petición para remover un producto del pedido.
            fetch(API_PEDIDOS + 'deleteDetail', {
                method: 'post',
                body: data
            }).then(function (request) {
                // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
                if (request.ok) {
                    request.json().then(function (response) {
                        // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
                        if (response.status) {
                            // Se cargan nuevamente las filas en la tabla de la vista después de borrar un producto del carrito.
                            readOrderDetail();
                            sweetAlert(1, response.message, null);
                        } else {
                            sweetAlert(2, response.exception, null);
                        }
                    });
                } else {
                    console.log(request.status + ' ' + request.statusText);
                }
            });
        }
    });
}