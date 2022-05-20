/*se establece ruta y parametros para la comunicacion con API */
const API_CLIENTES = SERVER + 'privado/clientes.php?action=';
// Método manejador de eventos que se ejecuta cuando el documento ha cargado.
document.addEventListener('DOMContentLoaded', function () {
    // Se llama a la función que obtiene los registros para llenar la tabla. Se encuentra en el archivo components.js
    readRows(API_CLIENTES);
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
                            <td class="contenido">${row.id_cliente}</td>
                            <td class="contenido"><img src="${SERVER}imagenes/empleados/${row.foto_cliente}" class="materialboxed" height="100"></td>
                            <td class="contenido">${row.nombre_cliente}</td>
                            <td class="contenido">${row.apellido_cliente}</td>
                            <td class="contenido">${row.celular_cliente}</td>
                            <td class="contenido">${row.direccion_cliente}</td>
                            <td class="contenido">${row.email_cliente}</td>
                            <td class="contenido">${row.estado_cliente}</td>
                            <td class="contenido">
                                <button class="btn-editar" id="openModal" onclick="openUpdate(${row.id_cliente})"><i class="fa-solid fa-pen-to-square"></i></button>
                                <button class="btn-eliminar" onclick="openDelete(${row.id_cliente})"><i class="fa-solid fa-trash"></i></button>
                                </a>
                            </td>
                        </tr>          
        `;
    });
    // Se agregan las filas al cuerpo de la tabla mediante su id para mostrar los registros.
    document.getElementById('table-c').innerHTML = content;
    // Se inicializa el componente Tooltip para que funcionen las sugerencias textuales.
    //M.Tooltip.init(document.querySelectorAll('.tooltipped'));
}

// Método manejador de eventos que se ejecuta cuando se envía el formulario de buscar.
document.getElementById('search-form').addEventListener('submit', function (event) {
    // Se evita recargar la página web después de enviar el formulario.
    event.preventDefault();
    // Se llama a la función que realiza la búsqueda. Se encuentra en el archivo components.js
    searchRows(API_CLIENTES, 'search-form');

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
                                <label class="label" for="id_cliente" id="id_c">ID de cliente:</label>
                                <input type="number" class="form-control input-label" id="id_cliente" name="id_cliente" step="000" placeholder="1" min="1"
                                    required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="nombre_cliente">Nombre de cliente:</label>
                                <input type="text" class="form-control input-label" id="nombre_cliente" name="nombre_cliente" placeholder="Nombre"
                                    required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="apellido_cliente">Apellido de cliente:</label>
                                <input type="text" class="form-control input-label" id="apellido_cliente" name="apellido_cliente" placeholder="Apellido"
                                    required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="celular_cliente">Celular de cliente:</label>
                                <input type="text" class="form-control input-label" id="celular_cliente" name="celular_cliente" placeholder="1234-5678"
                                    maxlength="10" required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="foto_cliente">Foto de cliente:</label>
                                <div class="file-select">
                                    <input type="file" class="form-control" id="foto_cliente" name="foto_cliente" accept=".jpg, .png" required />
                                </div>
                            </div>
                        </div>
                        
                        <div class="lateral2">
                            <div class="input-field ">
                                <label class="label" for="direccion_cliente">Direccion de cliente:</label>
                                <input type="text" class="form-control input-label" id="direccion_cliente" name="direccion_cliente"
                                    placeholder="Residencial, pasaje, casa N°..." required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="email_cliente">Email de empleado:</label>
                                <input type="text" class="form-control input-label" id="email_cliente" name="email_cliente"
                                    placeholder="example@gmail.com" required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="estado_cliente">Estado cliente</label>
                                <select id="estado_cliente" class="select_id" name="estado_cliente">
                                    <option selected>Seleccione una opción</option>
                                    <option value="Habilitado">Habilitado</option>
                                    <option value="Inhabilitado">Inhabilitado</option>
                                </select>
                            </div>
                            <div class="input-field  ">
                                <label class="label" for="clave">Contraseña:</label>
                                <input type="password" id="clave" name="clave" maxlength="8" class="form-control input-label" placeholder="Contraseña"
                                    required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="password">Confirmar Contraseña:</label>
                                <input id="confirmar" type="password" name="confirmar" maxlength="8" class="form-control input-label"
                                    placeholder="Confirmar contraseña" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="input-field col s12 m6">
                        <a class="active" href="clientes.html" id="cerrar_form">Cerrar</a>
                        <button id="agregar" type="submit">Agregar</button>
                    </div>                          
        `;
    // Se agregan agregan todos los campos al formulario mediante su id para crear un registro.
    document.getElementById('save-form').innerHTML = register;
    // Se asigna el título para el formulario.
    document.getElementById('modal-titulo').textContent = 'Crear usuario de cliente';
    //se ocultan y deshabilitan los campos del id
    document.getElementById('id_cliente').hidden = true;
    document.getElementById('id_c').hidden = true;
    document.getElementById('id_c').disabled = true;
    document.getElementById('id_cliente').disabled = true;    
}

// Función para preparar el formulario al momento de modificar un registro.
function openUpdate(id_cliente) {
    // Se crea la variable que guardara todas las etiquetas html.
    let update = '';
    // Se crea todo el formulario.
        update += `            
                <h2 id="modal-titulo"></h2>
                <!-- No se coloca el id solo al momento de modificar al momento de modificar -->
                <div class="openModal">
                    <div class="lateral1">
                        <div class="input-field ">
                            <label class="label" for="id_cliente" id="id_c">ID de cliente:</label>
                            <input type="number" class="form-control input-label" id="id_cliente" name="id_cliente" step="000" placeholder="1" min="1"
                                required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="nombre_cliente">Nombre de cliente:</label>
                            <input type="text" class="form-control input-label" id="nombre_cliente" name="nombre_cliente" placeholder="Nombre"
                                required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="apellido_cliente">Apellido de cliente:</label>
                            <input type="text" class="form-control input-label" id="apellido_cliente" name="apellido_cliente" placeholder="Apellido"
                                required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="celular_cliente">Celular de cliente:</label>
                            <input type="text" class="form-control input-label" id="celular_cliente" name="celular_cliente" placeholder="1234-5678"
                                maxlength="10" required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="foto_cliente">Foto de cliente:</label>
                            <div class="file-select">
                                <input type="file" class="form-control" id="foto_cliente" name="foto_cliente" accept=".jpg, .png" required />
                            </div>
                        </div>
                    </div>
                    
                    <div class="lateral2">
                        <div class="input-field ">
                            <label class="label" for="direccion_cliente">Direccion de cliente:</label>
                            <input type="text" class="form-control input-label" id="direccion_cliente" name="direccion_cliente"
                                placeholder="Residencial, pasaje, casa N°..." required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="email_cliente">Email de empleado:</label>
                            <input type="text" class="form-control input-label" id="email_cliente" name="email_cliente"
                                placeholder="example@gmail.com" required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="estado_cliente">Estado cliente</label>
                            <select id="estado_cliente" class="select_id" name="estado_cliente">
                                <option selected>Seleccione una opción</option>
                                <option value="Habilitado">Habilitado</option>
                                <option value="Inhabilitado">Inhabilitado</option>
                            </select>
                        </div>
                        <div class="input-field  ">
                            <label class="label" for="clave">Contraseña:</label>
                            <input type="password" id="clave" name="clave" maxlength="8" class="form-control input-label" placeholder="Contraseña"
                                required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="password" id="confirm">Confirmar Contraseña:</label>
                            <input id="confirmar" type="password" name="confirmar" maxlength="8" class="form-control input-label"
                                placeholder="Confirmar contraseña" required>
                        </div>
                    </div>
                </div>
                
                <div class="input-field col s12 m6">
                    <a class="active" href="clientes.html" id="cerrar_form">Cerrar</a>
                    <button id="agregar" type="submit">Actualizar</button>
                </div>                            
        `;
    // Se agregan agregan todos los campos al formulario mediante su id para crear un registro.
    document.getElementById('save-form').innerHTML = update;
    // Se asigna el título para el formulario.
    document.getElementById('modal-titulo').textContent = 'Actualizar usuario de empleado';
    // Se deshabilitan los campos de alias y contraseña.
    document.getElementById('id_cliente').hidden = false;
    document.getElementById('id_c').hidden = false;
    document.getElementById('id_cliente').disabled = false;
    document.getElementById('id_c').disabled = false;   
    document.getElementById('confirmar').hidden = true;
    document.getElementById('confirm').hidden = true;
    document.getElementById('clave').disabled = true;
    document.getElementById('confirmar').disabled = true;
    // Se define un objeto con los datos del registro seleccionado.
    const data = new FormData();
    data.append('id_cliente', id_cliente);
    // Petición para obtener los datos del registro solicitado.
    fetch(API_CLIENTES + 'readOne', {
        method: 'post',
        body: data
    }).then(function (request) {
        // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
        if (request.ok) {
            request.json().then(function (response) {
                // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
                if (response.status) {
                    // Se inicializan los campos del formulario con los datos del registro seleccionado.
                    document.getElementById('id_cliente').value = response.dataset.id_cliente;
                    document.getElementById('nombre_cliente').value = response.dataset.nombre_cliente;
                    document.getElementById('apellido_cliente').value = response.dataset.apellido_cliente;
                    document.getElementById('celular_cliente').value = response.dataset.celular_cliente;                    
                    document.getElementById('direccion_cliente').value = response.dataset.direccion_cliente;
                    document.getElementById('email_cliente').value = response.dataset.email_cliente;
                    document.getElementById('estado_cliente').value = response.dataset.estado_cliente;                    
                    document.getElementById('clave').value = response.dataset.clave;
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
    if (document.getElementById('id_cliente').disabled==true){
        action = 'create';
    } else if (document.getElementById('id_cliente').disabled==false){
        action = 'update';
    }    
    // Se llama a la función para guardar el registro. Se encuentra en el archivo components.js
    saveRow(API_CLIENTES, action, 'save-form');
});

// Función para establecer el registro a eliminar y abrir una caja de diálogo de confirmación.
function openDelete(id_cliente) {
    // Se define un objeto con los datos del registro seleccionado.
    const data = new FormData();
    data.append('id_cliente', id_cliente);
    // Se llama a la función que elimina un registro. Se encuentra en el archivo components.js
    confirmDelete(API_CLIENTES, data);
}