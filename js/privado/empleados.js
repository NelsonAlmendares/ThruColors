// Constante para establecer la ruta y parámetros de comunicación con la API.
const API_USUARIOS = SERVER + 'privado/empleados.php?action=';
const ENDPOINT_TIPO_E = SERVER + 'privado/tipo_empleado.php?action=readAll';

// Método manejador de eventos que se ejecuta cuando el documento ha cargado.
document.addEventListener('DOMContentLoaded', function () {
    // Se llama a la función que obtiene los registros para llenar la tabla. Se encuentra en el archivo components.js
    readRows(API_USUARIOS);
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
                            <td class="contenido"><img src="${SERVER}imagenes/empleados/${row.foto_empleado}" class="materialboxed" height="100"></td>
                            <td class="contenido">${row.nombre_empleado}</td>
                            <td class="contenido">${row.apellido_empleado}</td>
                            <td class="contenido">${row.DUI}</td>
                            <td class="contenido">${row.direccion_empleado}</td>
                            <td class="contenido">${row.codigo_empleado}</td>
                            <td class="contenido">${row.tipo_empleado}</td>
                            <td class="contenido">
                                <button class="btn-editar" id="openModal" onclick="openUpdate(${row.id_empleado})"><i class="fa-solid fa-pen-to-square"></i></button>
                                <button class="btn-eliminar" onclick="openDelete(${row.id_empleado})"><i class="fa-solid fa-trash"></i></button>
                                </a>
                            </td>
                        </tr>          
        `;
    });
    // Se agregan las filas al cuerpo de la tabla mediante su id para mostrar los registros.
    document.getElementById('table-e').innerHTML = content;
    // Se inicializa el componente Tooltip para que funcionen las sugerencias textuales.
    //M.Tooltip.init(document.querySelectorAll('.tooltipped'));
}

// Método manejador de eventos que se ejecuta cuando se envía el formulario de buscar.
document.getElementById('search-form').addEventListener('submit', function (event) {
    // Se evita recargar la página web después de enviar el formulario.
    event.preventDefault();
    // Se llama a la función que realiza la búsqueda. Se encuentra en el archivo components.js
    searchRows(API_USUARIOS, 'search-form');
});

// Función para preparar el formulario al momento de insertar un registro.
function openCreate() {
    // Se abre la caja de diálogo (modal) que contiene el formulario.
    let register = '';
    // Se recorre el conjunto de registros (dataset) fila por fila a través del objeto row.
        // Se crean y concatenan las filas de la tabla con los datos de cada registro.
        register += `            
                <h2 id="modal-titulo"></h2>
                    <div class="openModal">
                        <div class="lateral1">
                            <!-- No se coloca el id solo al momento de modificar al momento de modificar -->
                            <div class="input-field">
                                <label class="label" for="nombre_empleado">Nombre de empleado:</label>
                                <input type="text" class="form-control input-label" id="nombre_empleado" name="nombre_empleado"
                                    placeholder="Nombre" required />
                            </div>
                            <div class="input-field">
                                <label class="label" for="apellido_empleado">Apellido de empleado:</label>
                                <input type="text" class="form-control input-label" id="apellido_empleado" name="apellido_empleado"
                                    placeholder="Apellido" required />
                            </div>
                            <div class="input-field">
                                <label class="label" for="DUI_empleado">DUI de empleado:</label>
                                <input type="text" class="form-control input-label" id="DUI_empleado" name="DUI_empleado"
                                    placeholder="12345678-9" maxlength="10" required />
                            </div>
                            <div class="input-field">
                                <label class="label" for="foto_empleado">Foto de empleado:</label>
                                <div class="file-select" id="src-file1">
                                    <input type="file" class="form-control" id="foto_empleado" name="foto_empleado" accept=".jpg, .png"
                                        required />
                                </div>
                            </div>
                        </div>

                            <div class="lateral2">
                                <div class="input-field">
                                    <label class="label" for="direccion_empleado">Direccion de empleado:</label>
                                    <input type="text" class="form-control input-label" id="direccion_empleado" name="direccion_empleado"
                                        placeholder="Residencial, pasaje, casa N°..." required />
                                </div>
                                <div class="input-field">
                                    <label class="label" for="codigo_empleado">Código de empleado:</label>
                                    <input type="number" class="form-control input-label" id="codigo_empleado" name="codigo_empleado"
                                        step="000" placeholder="001" min="1" required />
                                </div>
                                <div class="input-field">
                                    <label class="label" for="tipo_empleado">Tipo empleado</label>
                                    <select id="tipo_empleado" class="form-control select_id" name="tipo_empleado">
                                    </select>
                                </div>
                                <div class="input-field">
                                    <label class="label" for="clave">Contraseña:</label>
                                    <input type="password" id="clave" name="clave" maxlength="8" class="form-control input-label"
                                        placeholder="Contraseña" required />
                                </div>
                                <div class="input-field">
                                    <label class="label" for="password">Confirmar Contraseña:</label>
                                    <input id="confirmar" type="password" name="confirmar" maxlength="8" class="form-control input-label"
                                        placeholder="Confirmar contraseña" required>
                                </div>
                            </div>
                        
                    </div>
                    <!--Botones-->

                    <div class="input-field">
                        <a class="active" id="cerrar" href="empleados.html" id="cerrar_form">Cerrar</a>
                        <button id="agregar" type="submit">Agregar</button>
                    </div>                          
        `;
    // Se agregan las filas al cuerpo de la tabla mediante su id para mostrar los registros.
    document.getElementById('save-form').innerHTML = register;
    // Se asigna el título para la caja de diálogo (modal).
    document.getElementById('modal-titulo').textContent = 'Crear usuario de empleado';
    // Se habilitan los campos de alias y contraseña.
    //document.getElementById('id_empleado').hidden = true;
    //document.getElementById('id_e').hidden = true;
    //document.getElementById('id_empleado').disabled = true;
    //document.getElementById('id_e').disabled = true;
    fillSelect(ENDPOINT_TIPO_E, 'tipo_empleado', null);
}

// Función para preparar el formulario al momento de modificar un registro.
function openUpdate(id) {
    // Se abre la caja de diálogo (modal) que contiene el formulario.
    //M.Modal.getInstance(document.getElementById('save-modal')).open();
    // Se asigna el título para la caja de diálogo (modal).
    document.getElementById('modal-titulo').textContent = 'Actualizar usuario de empleado';
    // Se deshabilitan los campos de alias y contraseña.
    document.getElementById('id_empleado').hidden = false;
    document.getElementById('id_e').hidden = false;
    document.getElementById('id_empleado').disabled = true;
    document.getElementById('id_e').disabled = true;
    document.getElementById('clave').disabled = true;
    document.getElementById('confirmar').disabled = true;
    // Se define un objeto con los datos del registro seleccionado.
    const data = new FormData();
    data.append('id_empleado', id);
    // Petición para obtener los datos del registro solicitado.
    fetch(API_USUARIOS + 'readOne', {
        method: 'post',
        body: data
    }).then(function (request) {
        // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
        if (request.ok) {
            request.json().then(function (response) {
                // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
                if (response.status) {
                    // Se inicializan los campos del formulario con los datos del registro seleccionado.
                    document.getElementById('id').value = response.dataset.id_usuario;
                    document.getElementById('nombres').value = response.dataset.nombres_usuario;
                    document.getElementById('apellidos').value = response.dataset.apellidos_usuario;
                    document.getElementById('correo').value = response.dataset.correo_usuario;
                    document.getElementById('alias').value = response.dataset.alias_usuario;
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
    action = 'create';
    // Se comprueba si el campo oculto del formulario esta seteado para actualizar, de lo contrario será para crear.    
    //(document.getElementById('id_empleado').value) ? action = 'update' :
    // Se llama a la función para guardar el registro. Se encuentra en el archivo components.js
    saveRow(API_USUARIOS, action, 'save-form');
});

// Función para establecer el registro a eliminar y abrir una caja de diálogo de confirmación.
function openDelete(id) {
    // Se define un objeto con los datos del registro seleccionado.
    const data = new FormData();
    data.append('id', id);
    // Se llama a la función que elimina un registro. Se encuentra en el archivo components.js
    confirmDelete(API_USUARIOS, data);
}