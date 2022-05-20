// Constante para establecer la ruta y parámetros de comunicación con la API.
const API_VENTAS = SERVER + 'privado/ventas.php?action=';
const ENDPOINT_PRODUCTOS = SERVER + 'privado/productos.php?action=readAll';
const ENDPOINT_CLIENTES = SERVER + 'privado/clientes.php?action=readAll';

// Método manejador de eventos que se ejecuta cuando el documento ha cargado.
document.addEventListener('DOMContentLoaded', function () {
    // Se llama a la función que obtiene los registros para llenar la tabla. Se encuentra en el archivo components.js
    readRows(API_VENTAS);
    // Se define una variable para establecer las opciones del componente Modal.
    let options = {
        dismissible: false,
        onOpenStart: function () {
            // Se restauran los elementos del formulario.
            document.getElementById('save-form').reset();
        }
    }
    // Se inicializa el componente Modal para que funcionen las cajas de diálogo.
    //M.Modal.init(document.querySelectorAll('.modal'), options);
});

// Función para llenar la tabla con los datos de los registros. Se manda a llamar en la función readRows().
function fillTable(dataset) {
    let content = '';
    // Se recorre el conjunto de registros (dataset) fila por fila a través del objeto row.
    dataset.map(function (row) {
        // Se crean y concatenan las filas de la tabla con los datos de cada registro.
        content += `            
                        <tr>
                            <td class="contenido">${row.id_venta}</td>                          
                            <td class="contenido">${row.cantidad}</td>
                            <td class="contenido">${row.producto}</td>
                            <td class="contenido">${row.fecha}</td>
                            <td class="contenido">${row.estado}</td>
                            <td class="contenido">${row.cliente}</td>
                            <td class="contenido">${row.comentario}</td>
                            <td class="contenido">
                                <button class="btn-editar" id="openModal" onclick="openUpdate(${row.id_venta})"><i class="fa-solid fa-pen-to-square"></i></button>
                                <button class="btn-eliminar" onclick="openDelete(${row.id_venta})"><i class="fa-solid fa-trash"></i></button>
                                </a>
                            </td>
                        </tr>          
        `;
    });
    // Se agregan las filas al cuerpo de la tabla mediante su id para mostrar los registros.
    document.getElementById('table-v').innerHTML = content;
    // Se inicializa el componente Tooltip para que funcionen las sugerencias textuales.
    //M.Tooltip.init(document.querySelectorAll('.tooltipped'));
}

// Método manejador de eventos que se ejecuta cuando se envía el formulario de buscar.
document.getElementById('search-form').addEventListener('submit', function (event) {
    // Se evita recargar la página web después de enviar el formulario.
    event.preventDefault();
    // Se llama a la función que realiza la búsqueda. Se encuentra en el archivo components.js
    searchRows(API_VENTAS, 'search-form');
});

// Función para preparar el formulario al momento de insertar un registro.
function openCreate() {
    // Se crea la variable que guardara todas las etiquetas html.
    let register = '';
    // Se crea todo el formulario.
        register += `            
                <h2 id="modal-titulo"></h2>
                    <!-- No se coloca el id solo al momento de modificar al momento de modificar -->
                    <div class="openModal">
                        <div class="lateral1">
                            <div class="input-field ">
                                <label class="label" for="id_venta" id="id_v">ID de venta:</label>
                                <input type="number" class="form-control input-label" id="id_venta" name="id_venta" step="000" placeholder="1" min="1"
                                    required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="cantidad_venta">Cantidad producto:</label>
                                <input type="number" class="form-control input-label" id="cantidad_venta" name="cantidad_venta" step="000"
                                    placeholder="1" min="0" required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="producto_venta">Producto de la venta:</label>
                                <select id="producto_venta" class="select_id" name="producto_venta">
                                </select>
                            </div>                          
                        </div>
                        
                        <div class="lateral2">
                            <div class="input-field ">
                                <label class="label" for="fecha_venta">Fecha venta:</label>
                                <input type="date" class="form-control input-label" id="fecha_venta" name="fecha_venta" required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="estado_venta">Estado venta:</label>
                                <select id="estado_venta" class="select_id" name="estado_venta">                                
                            </select>
                            </div>
                            <div class="input-field ">
                                <label class="label" for="cliente_venta">Cliente:</label>
                                <select id="cliente_venta" class="select_id" name="cliente_venta">                                
                                </select>                            
                            </div>
                            <div class="input-field ">
                                <label class="label" for="comentario_venta">Comentario:</label>
                                <select id="comentario_venta" class="select_id" name="comentario_venta">                                
                            </select>
                            </div>                            
                        </div>
                    </div>
                    
                    <div class="input-field col s12 m6">
                        <a class="active" href="ventas.html" id="cerrar_form">Cerrar</a>
                        <button id="agregar" type="submit">Agregar</button>
                    </div>                          
        `;
    // Se agregan agregan todos los campos al formulario mediante su id para crear un registro.
    document.getElementById('save-form').innerHTML = register;
    // Se asigna el título para el formulario.
    document.getElementById('modal-titulo').textContent = 'Crear venta';
    //se ocultan y deshabilitan los campos del id
    document.getElementById('id_venta').hidden = true;
    document.getElementById('id_v').hidden = true;
    document.getElementById('id_v').disabled = true;
    document.getElementById('id_venta').disabled = true;  
    //se llena el select    
    fillSelect(ENDPOINT_PRODUCTOS, 'producto_venta', null);
    fillSelect(ENDPOINT_CLIENTES, 'cliente_venta', null);
}

// Función para preparar el formulario al momento de modificar un registro.
function openUpdate(id_categoria) {
    // Se crea la variable que guardara todas las etiquetas html.
    let update = '';
    // Se crea todo el formulario.
        update += `            
                    <h2 id="modal-titulo"></h2>
                    <!-- No se coloca el id solo al momento de modificar al momento de modificar -->
                    <div class="openModal">
                        <div class="lateral1">
                            <div class="input-field ">
                                <label class="label" for="id_venta" id="id_v">ID de venta:</label>
                                <input type="number" class="form-control input-label" id="id_venta" name="id_venta" step="000" placeholder="1" min="1"
                                    required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="cantidad_venta">Cantidad producto:</label>
                                <input type="number" class="form-control input-label" id="cantidad_venta" name="cantidad_venta" step="000"
                                    placeholder="1" min="0" required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="producto_venta">Producto de la venta:</label>
                                <select id="producto_venta" class="select_id" name="producto_venta">
                                </select>
                            </div>                          
                        </div>
                        
                        <div class="lateral2">
                            <div class="input-field ">
                                <label class="label" for="fecha_venta">Fecha venta:</label>
                                <input type="date" class="form-control input-label" id="fecha_venta" name="fecha_venta" required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="estado_venta">Estado venta:</label>
                                <select id="estado_venta" class="select_id" name="estado_venta">                                
                            </select>
                            </div>
                            <div class="input-field ">
                                <label class="label" for="cliente_venta">Cliente:</label>
                                <select id="cliente_venta" class="select_id" name="cliente_venta">                                
                                </select>                            
                            </div>
                            <div class="input-field ">
                                <label class="label" for="comentario_venta">Comentario:</label>
                                <select id="comentario_venta" class="select_id" name="comentario_venta">                                
                            </select>
                            </div>                            
                        </div>
                    </div> 									
                    <div class="input-field col s12 m6">
                    <a class="active" href="ventas.html" id="cerrar_form">Cerrar</a>
                        <button type="submit">Actualizar</button>
                    </div>                          
        `;
    // Se agregan agregan todos los campos al formulario mediante su id para crear un registro.
    document.getElementById('save-form').innerHTML = update;
    // Se asigna el título para el formulario.
    document.getElementById('modal-titulo').textContent = 'Actualizar venta';
    // Se deshabilitan los campos de alias y contraseña.
    document.getElementById('id_categoria').hidden = false;
    document.getElementById('id_c').hidden = false;
    document.getElementById('id_c').disabled = false;
    document.getElementById('id_categoria').disabled = false;  
    // Se define un objeto con los datos del registro seleccionado.
    const data = new FormData();
    data.append('id_categoria', id_categoria);
    // Petición para obtener los datos del registro solicitado.
    fetch(API_VENTAS + 'readOne', {
        method: 'post',
        body: data
    }).then(function (request) {
        // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
        if (request.ok) {
            request.json().then(function (response) {
                // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
                if (response.status) {
                    // Se inicializan los campos del formulario con los datos del registro seleccionado.
                    document.getElementById('id_categoria').value = response.dataset.id_categoria;
                    document.getElementById('categoria_producto').value = response.dataset.categoria_producto;
                    document.getElementById('descripcion_categoria').value = response.dataset.descripcion_categoria;
                    // Se actualizan los campos para que las etiquetas (labels) no queden sobre los datos.
                    M.updateTextFields();
                } else {
                    sweetAlert(2, response.exception, null);
                }
            });
        } else {
            console.log(request.status + ' ' + request.statusText);
        }
    });
}

// Método manejador de eventos que se ejecuta cuando se envía el formulario de guardar.
document.getElementById('save-form').addEventListener('submit', function (event) {
    // Se evita recargar la página web después de enviar el formulario.
    event.preventDefault();
    // Se define una variable para establecer la acción a realizar en la API.
    let action; 
    
    // Se comprueba si el campo oculto del formulario esta seteado para actualizar, de lo contrario será para crear.    
    if (document.getElementById('id_categoria').disabled==true){
        action = 'create';
    } else if (document.getElementById('id_categoria').disabled==false){
        action = 'update';
    }    
    // Se llama a la función para guardar el registro. Se encuentra en el archivo components.js
    saveRow(API_VENTAS, action, 'save-form');
});

// Función para establecer el registro a eliminar y abrir una caja de diálogo de confirmación.
function openDelete(id_categoria) {
    // Se define un objeto con los datos del registro seleccionado.
    const data = new FormData();
    data.append('id_categoria', id_categoria);
    // Se llama a la función que elimina un registro. Se encuentra en el archivo components.js
    confirmDelete(API_VENTAS, data);
}