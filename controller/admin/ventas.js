// Constante para establecer la ruta y parámetros de comunicación con la API.
const API_VENTAS = SERVER + 'privado/ventas.php?action=';

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
    //Se crea la variable estado, par asignarle un texto
    $estado = '';
    // Se recorre el conjunto de registros (dataset) fila por fila a través del objeto row.
    dataset.map(function (row) {
        //Se evalua el valor, si es 1 se coloca a la variable estado: "Activo", si no se coloca a la variable estado: "Inactivo"
        (row.estado==1) ? $estado = 'Activo' : $estado = 'Inactivo';
        // Se crean y concatenan las filas de la tabla con los datos de cada registro.
        content += `            
                        <tr>
                            <td class="contenido">${row.id_venta}</td>                          
                            <td class="contenido">${row.fecha}</td>                            
                            <td class="contenido">${row.cliente}</td>
                            <td class="contenido">${$estado}</td>
                            <td class="contenido">
                                <button class="btn-editar" id="openModal" onclick="openUpdate(${row.id_venta})"><i class="fa-solid fa-pen-to-square"></i></button>                                
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

// Función para preparar el formulario al momento de modificar un registro.
function openUpdate(id_venta) {
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
                            readonly required/>
                        </div>                        
                        <div class="input-field ">
                            <label class="label" for="estado_venta">Estado de la venta:</label>
                            <select id="estado_venta" class="select_id" name="estado_venta">
                            <option disabled selected>Seleccion una opción</option>
                            <option value="1">Activo</option>
                            <option value="0">Inactivo</option>                                
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
    document.getElementById('id_venta').hidden = false;
    document.getElementById('id_v').hidden = false;
    document.getElementById('id_v').disabled = false;
    document.getElementById('id_venta').disabled = false;  
    // Se define un objeto con los datos del registro seleccionado.
    const data = new FormData();
    data.append('id_venta', id_venta);
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
                    document.getElementById('id_venta').value = response.dataset.id_venta;                    
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
    let action = 'update'; 

    // Se llama a la función para guardar el registro. Se encuentra en el archivo components.js
    saveRow(API_VENTAS, action, 'save-form');
});