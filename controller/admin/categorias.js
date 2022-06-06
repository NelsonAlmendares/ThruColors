// Constante para establecer la ruta y parámetros de comunicación con la API.
const API_CATEGORIA = SERVER + 'privado/categorias.php?action=';

// Método manejador de eventos que se ejecuta cuando el documento ha cargado.
document.addEventListener('DOMContentLoaded', function () {
    // Se llama a la función que obtiene los registros para llenar la tabla. Se encuentra en el archivo components.js
    readRows(API_CATEGORIA);
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
                            <td class="contenido">${row.id_categoria}</td>
                            <td class="contenido"><img src="${SERVER}imagenes/categorias/${row.foto_categoria}" class="materialboxed" height="100"></td>                            
                            <td class="contenido">${row.categoria_producto}</td>
                            <td class="contenido">${row.descripcion_categoria}</td>
                            <td class="contenido">
                                <button class="btn-editar" id="openModal" onclick="openUpdate(${row.id_categoria})"><i class="fa-solid fa-pen-to-square"></i></button>
                                <button class="btn-eliminar" onclick="openDelete(${row.id_categoria})"><i class="fa-solid fa-trash"></i></button>
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
    searchRows(API_CATEGORIA, 'search-form');
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
                                <label class="label" for="id_categoria" id="id_c">ID de categoria:</label>
                                <input type="number" class="form-control input-label" id="id_categoria" name="id_categoria" step="000" placeholder="1" min="1"
                                    required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="categoria_producto">Categoria:</label>
                                <input type="text" class="form-control input-label" id="categoria_producto" name="categoria_producto" placeholder="Categoria"
                                    required />
                            </div>
                            <div class="input-field ">
                            <label class="label" for="foto_categoria">Foto de categoria:</label>
                                <div class="file-select">
                                    <input type="file" class="form-control" id="foto_categoria" name="foto_categoria" accept=".jpg, .png" required />
                                </div>
                            </div>                          
                        </div>
                        
                        <div class="lateral2">
                            <div class="input-field ">
                                <label class="label" for="descripcion_categoria">Direccion de empleado:</label>
                                <input type="text" class="form-control input-label" id="descripcion_categoria" name="descripcion_categoria"
                                    placeholder="Esta categoria es para..." required />
                            </div>                            
                        </div>
                    </div>
                    
                    <div class="input-field col s12 m6">
                        <a class="active" href="categoria.html" id="cerrar_form">Cerrar</a>
                        <button id="agregar" type="submit">Agregar</button>
                    </div>                          
        `;
    // Se agregan agregan todos los campos al formulario mediante su id para crear un registro.
    document.getElementById('save-form').innerHTML = register;
    // Se asigna el título para el formulario.
    document.getElementById('modal-titulo').textContent = 'Crear categoria';
    //se ocultan y deshabilitan los campos del id
    document.getElementById('id_categoria').hidden = true;
    document.getElementById('id_c').hidden = true;
    document.getElementById('id_c').disabled = true;
    document.getElementById('id_categoria').disabled = true;  
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
                                <label class="label" for="id_categoria" id="id_c">ID de categoria:</label>
                                <input type="number" class="form-control input-label" id="id_categoria" name="id_categoria" step="000" placeholder="1" min="1"
                                    required />
                            </div>
                            <div class="input-field ">
                                <label class="label" for="categoria_producto">Categoria:</label>
                                <input type="text" class="form-control input-label" id="categoria_producto" name="categoria_producto" placeholder="Categoria"
                                    required />
                            </div>
                            <div class="input-field ">
                            <label class="label" for="foto_categoria">Foto de categoria:</label>
                                <div class="file-select">
                                    <input type="file" class="form-control" id="foto_categoria" name="foto_categoria" accept=".jpg, .png" />
                                </div>
                            </div>                          
                        </div>
                        
                        <div class="lateral2">
                            <div class="input-field ">
                                <label class="label" for="descripcion_categoria">Direccion de empleado:</label>
                                <input type="text" class="form-control input-label" id="descripcion_categoria" name="descripcion_categoria"
                                    placeholder="Esta categoria es para..." required />
                            </div>                            
                        </div>
                    </div> 									
                    <div class="input-field col s12 m6">
                    <a class="active" href="categoria.html" id="cerrar_form">Cerrar</a>
                        <button id="agregar" type="submit">Actualizar</button>
                    </div>
        `;
    // Se agregan agregan todos los campos al formulario mediante su id para crear un registro.
    document.getElementById('save-form').innerHTML = update;
    // Se asigna el título para el formulario.
    document.getElementById('modal-titulo').textContent = 'Actualizar categoria';
    // Se deshabilitan los campos de alias y contraseña.
    document.getElementById('id_categoria').hidden = false;
    document.getElementById('id_c').hidden = false;
    document.getElementById('id_c').disabled = false;
    document.getElementById('id_categoria').disabled = false;  
    // Se define un objeto con los datos del registro seleccionado.
    const data = new FormData();
    data.append('id_categoria', id_categoria);
    // Petición para obtener los datos del registro solicitado.
    fetch(API_CATEGORIA + 'readOne', {
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
    saveRow(API_CATEGORIA, action, 'save-form');
});

// Función para establecer el registro a eliminar y abrir una caja de diálogo de confirmación.
function openDelete(id_categoria) {
    // Se define un objeto con los datos del registro seleccionado.
    const data = new FormData();
    data.append('id_categoria', id_categoria);
    // Se llama a la función que elimina un registro. Se encuentra en el archivo components.js
    confirmDelete(API_CATEGORIA, data);
}