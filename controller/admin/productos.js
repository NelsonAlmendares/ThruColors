const API_PRODUCTO = SERVER + 'privado/productos.php?action=';
const ENDPOINT_CATEGORIAS = SERVER + 'privado/categorias.php?action=readAll';
const ENDPOINT_EMPLEADO = SERVER + 'privado/empleados.php?action=readAll';
const ENDPOINT_MARCA = SERVER + 'privado/marca.php?action=readAll';
const ENDPOINT_GENERO = SERVER + 'privado/genero.php?action=readAll';
const ENDPOINT_ESTADO = SERVER + 'privado/estado.php?action=readAll';
const ENDPOINT_PRESENTACION = SERVER + 'privado/presentacion.php?action=readAll';

/* Metodo para manejar los eventos que se ejecutan cuando el sitio es cargado */
document.addEventListener('DOMContentLoaded', function() {

    // Llamamos a la función que obtiene los registros para llenar la base
    readRows(API_PRODUCTO);

    let options = {
        dismissible: false,
        onOpenStart: function () {
            // Se restauran los elementos del formulario.
            document.getElementById('save-form').reset();
            // Establecemos el valor minimo para un producto
            document.getElementById('costo').setAttribute('min', 0.01);
            //Estableceos el valor maximo de un producto
            document.getElementById('costo').setAttribute('max', 999.99);
        }
    }
    // Se inicializa el componente Modal para que funcionen los combo-box
    //M.Modal.init(document.querySelectorAll('.modal'), options);
});

function fillTable(dataset) {
    let content = '';
    // Se recorre el conjunto de registros (dataset) fila por fila a través del objeto row.
    dataset.map(function (row) {
        // Se crean y concatenan las filas de la tabla con los datos de cada registro.
        content += `            
                        <tr>
                            <td class="contenido">${row.id}</td>
                            <td class="contenido"><img src="${SERVER}imagenes/productos/${row.foto}" class="materialboxed" height="100"></td>                            
                            <td class="contenido">${row.nombre}</td>
                            <td class="contenido">${row.costo}</td>
                            <td class="contenido">${row.marca}</td>
                            <td class="contenido">${row.categoria}</td>
                            <td class="contenido">${row.estado}</td>
                            <td class="contenido">
                                <button class="btn-editar" id="openModal" onclick="openUpdate(${row.id})"><i class="fa-solid fa-pen-to-square"></i></button>
                                <button class="btn-eliminar" onclick="openDelete(${row.id})"><i class="fa-solid fa-trash"></i></button>
                                </a>
                            </td>
                        </tr>          
        `;
    });
    // Se agregan las filas al cuerpo de la tabla mediante su id para mostrar los registros.
    document.getElementById('table-pr').innerHTML = content;
    // Se inicializa el componente Tooltip para que funcionen las sugerencias textuales.
    //M.Tooltip.init(document.querySelectorAll('.tooltipped'));
}

document.getElementById('search-form').addEventListener('submit', function (event){
    event.preventDefault();
    searchRows(API_PRODUCTO, 'search-form');
});

// Funcion para preparar el formulario para insertar un registro
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
                            <label class="label" for="id_producto" id="id_p">ID de producto:</label>
                            <input type="number" class="form-control input-label" id="id_producto" name="id_producto" step="000" placeholder="1" min="1"
                                required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="nombre_producto">Nombre de producto:</label>
                            <input type="text" class="form-control input-label" id="nombre_producto" name="nombre_producto" placeholder="Nombre"
                                required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="costo">Costo producto (US$):</label>
                            <input id="costo" type="number" name="costo" step="0.01" min="0.00" class="validate" placeholder="0.00" required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="descripcion_producto">Descripcion del producto:</label>
                            <input type="text" class="form-control input-label" id="descripcion_producto" name="descripcion_producto"
                            placeholder="Un shampoo con olor a rosas..." required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="foto_producto">Foto de producto:</label>
                            <div class="file-select">
                                <input type="file" class="form-control" id="foto_producto" name="foto_producto" accept=".jpg, .png" />
                            </div>
                        </div>
                    </div>
                    
                    <div class="lateral2">
                        <div class="input-field ">
                            <label class="label" for="cantidad_producto">Cantidad producto:</label>
                            <input type="number" class="form-control input-label" id="cantidad_producto" name="cantidad_producto" step="000"
                                placeholder="1" min="0" required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="estado_producto">Estado:</label>
                            <select id="estado_producto" class="select_id" name="estado_producto">
                            </select>
                        </div>                        
                        <div class="input-field ">
                            <label class="label" for="marca_producto">Marca:</label>
                            <select id="marca_producto" class="select_id" name="marca_producto">
                            </select>
                        </div>
                        <div class="input-field ">
                            <label class="label" for="genero_producto">Género del producto:</label>
                            <select id="genero_producto" class="select_id" name="genero_producto">
                            </select>
                        </div>
                        <div class="input-field ">
                            <label class="label" for="categoria_producto">Categoria del producto:</label>
                            <select id="categoria_producto" class="select_id" name="categoria_producto">
                            </select>
                        </div>
                        <div class="input-field ">
                            <label class="label" for="presentacion_producto">Presentación del producto:</label>
                            <select id="presentacion_producto" class="select_id" name="presentacion_producto">
                            </select>
                        </div>
                    </div>
                </div>
                
                <div class="input-field col s12 m6">
                    <a class="active" href="productos.html" id="cerrar_form">Cerrar</a>
                    <button id="agregar" type="submit">Agregar</button>
                </div>                          
        `;
    // Se agregan agregan todos los campos al formulario mediante su id para crear un registro.
    document.getElementById('save-form').innerHTML = register;
    // Se asigna el título para el formulario.
    document.getElementById('modal-titulo').textContent = 'Registrar producto';
    //se ocultan y deshabilitan los campos del id
    document.getElementById('id_producto').hidden = true;
    document.getElementById('id_p').hidden = true;
    document.getElementById('id_p').disabled = true;
    document.getElementById('id_producto').disabled = true;
    //se llena el select    
    fillSelect(ENDPOINT_CATEGORIAS, 'categoria_producto', null);
    fillSelect(ENDPOINT_EMPLEADO, 'empleado_producto', null);
    fillSelect(ENDPOINT_MARCA, 'marca_producto', null);  
    fillSelect(ENDPOINT_GENERO, 'genero_producto', null);
    fillSelect(ENDPOINT_ESTADO, 'estado_producto', null);
    fillSelect(ENDPOINT_PRESENTACION, 'presentacion_producto', null);
}

// Funcion para preparar el formulario de Editar
function openUpdate(id) {
    // Se crea la variable que guardara todas las etiquetas html.
    let update = '';
    // Se crea todo el formulario.
        update += `            
                <h2 id="modal-titulo"></h2>
                <!-- No se coloca el id solo al momento de modificar al momento de modificar -->
                <div class="openModal">
                    <div class="lateral1">
                        <div class="input-field ">
                            <label class="label" for="id_producto" id="id_p">ID de producto:</label>
                            <input type="number" class="form-control input-label" id="id_producto" name="id_producto" step="000" placeholder="1" min="1"
                                required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="nombre_producto">Nombre de producto:</label>
                            <input type="text" class="form-control input-label" id="nombre_producto" name="nombre_producto" placeholder="Nombre"
                                required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="costo">Costo producto (US$):</label>
                            <input id="costo" type="number" name="costo" step="0.01" min="0.00" class="validate" placeholder="0.00" required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="descripcion_producto">Descripcion del producto:</label>
                            <input type="text" class="form-control input-label" id="descripcion_producto" name="descripcion_producto"
                            placeholder="Un shampoo con olor a rosas..." required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="foto_producto">Foto de producto:</label>
                            <div class="file-select">
                                <input type="file" class="form-control" id="foto_producto" name="foto_producto" accept=".jpg, .png" />
                            </div>
                        </div>
                    </div>
                    
                    <div class="lateral2">
                        <div class="input-field ">
                            <label class="label" for="cantidad_producto">Cantidad producto:</label>
                            <input type="number" class="form-control input-label" id="cantidad_producto" name="cantidad_producto" step="000"
                                placeholder="1" min="0" required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="empleado_producto">Empleado que agrego el producto:</label>
                            <input type="text" class="form-control input-label" id="empleado_producto" name="empleado_producto" placeholder="Nombre"
                                required />
                        </div>
                        <div class="input-field ">
                            <label class="label" for="estado_producto">Estado:</label>
                            <select id="estado_producto" class="select_id" name="estado_producto">
                            </select>
                        </div>                        
                        <div class="input-field ">
                            <label class="label" for="marca_producto">Marca:</label>
                            <select id="marca_producto" class="select_id" name="marca_producto">
                            </select>
                        </div>
                        <div class="input-field ">
                            <label class="label" for="genero_producto">Género del producto:</label>
                            <select id="genero_producto" class="select_id" name="genero_producto">
                            </select>
                        </div>
                        <div class="input-field ">
                            <label class="label" for="categoria_producto">Categoria del producto:</label>
                            <select id="categoria_producto" class="select_id" name="categoria_producto">
                            </select>
                        </div>
                        <div class="input-field ">
                            <label class="label" for="presentacion_producto">Presentación del producto:</label>
                            <select id="presentacion_producto" class="select_id" name="presentacion_producto">
                            </select>
                        </div>
                    </div>
                </div>
                
                <div class="input-field col s12 m6">
                    <a class="active" href="productos.html" id="cerrar_form">Cerrar</a>
                    <button id="agregar" type="submit">Actualizar</button>
                </div>                          
        `;
    // Se agregan agregan todos los campos al formulario mediante su id para crear un registro.
    document.getElementById('save-form').innerHTML = update;
    // Se asigna el título para el formulario.
    document.getElementById('modal-titulo').textContent = 'Actualizar producto';
    // Se deshabilitan los campos de alias y contraseña.
    document.getElementById('id_producto').hidden = false;
    document.getElementById('id_p').hidden = false;
    document.getElementById('id_producto').disabled = false;
    document.getElementById('id_p').disabled = false;
    //Se deshabilita el empleado
    document.getElementById('empleado_producto').disabled = true;
    // Se define un objeto con los datos del registro seleccionado.
    const data = new FormData();
    data.append('id_producto', id);
    // Petición para obtener los datos del registro solicitado.
    fetch(API_PRODUCTO + 'readOne', {
        method: 'post',
        body: data
    }).then(function (request) {
        // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
        if (request.ok) {
            request.json().then(function (response) {
                // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
                if (response.status) {
                    // Se inicializan los campos del formulario con los datos del registro seleccionado.
                    document.getElementById('id_producto').value = response.dataset.id;
                    document.getElementById('nombre_producto').value = response.dataset.nombre;
                    document.getElementById('costo').value = response.dataset.costo;
                    document.getElementById('descripcion_producto').value = response.dataset.descripcion;                    
                    document.getElementById('cantidad_producto').value = response.dataset.cantidad;
                    fillSelect(ENDPOINT_CATEGORIAS, 'categoria_producto', response.dataset.categoria);
                    document.getElementById('empleado_producto').value = response.dataset.empleado;
                    fillSelect(ENDPOINT_MARCA, 'marca_producto', response.dataset.marca);
                    fillSelect(ENDPOINT_GENERO, 'genero_producto', response.dataset.genero);
                    fillSelect(ENDPOINT_ESTADO, 'estado_producto', response.dataset.estado);
                    fillSelect(ENDPOINT_PRESENTACION, 'presentacion_producto', response.dataset.presentacion);
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
    if (document.getElementById('id_producto').disabled==true){
        action = 'create';
    } else if (document.getElementById('id_producto').disabled==false){
        action = 'update';
    }    
    // Se llama a la función para guardar el registro. Se encuentra en el archivo components.js
    saveRow(API_PRODUCTO, action, 'save-form');
});

// Función para establecer el registro a eliminar y abrir una caja de diálogo de confirmación.
function openDelete(id) {
    // Se define un objeto con los datos del registro seleccionado.
    const data = new FormData();
    data.append('id_producto', id);
    // Se llama a la función que elimina un registro. Se encuentra en el archivo components.js
    confirmDelete(API_PRODUCTO, data);
}