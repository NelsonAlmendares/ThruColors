// Constante para establecer la ruta y parámetros de comunicación con la API.
const API_MARCA = SERVER + 'privado/marca.php?action=';

// Método manejador de eventos que se ejecuta cuando el documento ha cargado.
document.addEventListener('DOMContentLoaded', function(){
    // Se llama a la función que obtiene los registros para llenar la tabla. Se encuentra en el archivo components.js
    readRows(API_MARCA);
     // Se define una variable para establecer las opciones del componente Modal.
     let options = {
         dismissible: false,
         onOpenStart: function() {
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
            <td class="contenido">${row.id_marca}</td>                            
            <td class="contenido">${row.nombre_marca}</td>
            <td class="contenido">
                <button class="btn-editar" id="openModal" onclick="openUpdate(${row.id_marca})"><i class="fa-solid fa-pen-to-square"></i></button>
                <button class="btn-eliminar" onclick="openDelete(${row.id_marca})" data-swal-toast-template="#my-template"><i class="fa-solid fa-trash"></i></button>
                </a>
            </td>
        </tr>          
    `;
    });
     // Se agregan las filas al cuerpo de la tabla mediante su id para mostrar los registros.
     document.getElementById('table-ma').innerHTML = content;
     // Se inicializa el componente Tooltip para que funcionen las sugerencias textuales.
     //M.Tooltip.init(document.querySelectorAll('.tooltipped'));
}

// Método manejador de eventos que se ejecuta cuando se envía el formulario de buscar.
document.getElementById('search-form').addEventListener('submit', function (event) {
    // Se evita recargar la página web después de enviar el formulario.
    event.preventDefault();
    // Se llama a la función que realiza la búsqueda. Se encuentra en el archivo components.js
    searchRows(API_MARCA, 'search-form');
});


// Función para preparar el formulario al momento de insertar un registro.
function openCreate() {
    // Se crea la variable que guardara todas las etiquetas html.
    let register = '';
    // Se crea todo el formulario.
        register += `            
                <h2 id="modal-titulo"></h2>                
                    <!-- No se coloca el id solo al momento de modificar al momento de modificar -->
                    <div class="input-field">
                        <label class="label" for="id_marca" id="id_ma">ID de la marca:</label>
                        <input type="number" class="form-control" id="id_marca" name="id_marca" step="000" placeholder="1" min="1" required/>
                    </div>
                    <div class="openModal">
                        <label class="label" for="nombre_marca">Marca:</label>
                        <input type="text" class="form-control" id="nombre_marca" name="nombre_marca" placeholder="Esika" required/>											
                    </div>

                    <div class="openModal">
                    <a class="active" href="marcas.html" id="cerrar_form">Cerrar</a>
                        <button id="agregar" type="submit">Agregar</button>
                    </div>                          
        `;
    // Se agregan agregan todos los campos al formulario mediante su id para crear un registro.
    document.getElementById('save-form').innerHTML = register;
    // Se asigna el título para el formulario.
    document.getElementById('modal-titulo').textContent = 'Crear marca';
    //se ocultan y deshabilitan los campos del id
    document.getElementById('id_marca').hidden = true;
    document.getElementById('id_ma').hidden = true;
    document.getElementById('id_ma').disabled = true;
    document.getElementById('id_marca').disabled = true;    
}

// Función para preparar el formulario al momento de modificar un registro.
function openUpdate(id_marca) {
    // Se crea la variable que guardara todas las etiquetas html.
    let update = '';
    // Se crea todo el formulario.
        update += `            
        <h2 id="modal-titulo"></h2>                
                    <!-- No se coloca el id solo al momento de modificar al momento de modificar -->
                    <div class="input-field">
                        <label class="label" for="id_marca" id="id_ma">ID de la marca:</label>
                        <input type="number" class="form-control" id="id_marca" name="id_marca" step="000" placeholder="1" min="1" required/>
                    </div>
                    <div class="openModal">
                        <label class="label" for="nombre_marca">Marca:</label>
                        <input type="text" class="form-control" id="nombre_marca" name="nombre_marca" placeholder="Esika" required/>											
                    </div>

                    <div class="openModal">
                    <a class="active" href="marcas.html" id="cerrar_form">Cerrar</a>
                        <button id="agregar" type="submit">Actualizar</button>
                    </div>                       
        `;
    // Se agregan agregan todos los campos al formulario mediante su id para crear un registro.
    document.getElementById('save-form').innerHTML = update;
    // Se asigna el título para el formulario.
    document.getElementById('modal-titulo').textContent = 'Actualizar Marca';
    // Se deshabilitan los campos de alias y contraseña.
    document.getElementById('id_marca').hidden = false;
    document.getElementById('id_ma').hidden = false;
    document.getElementById('id_ma').disabled = false;
    document.getElementById('id_marca').disabled = false;
    // Se define un objeto con los datos del registro seleccionado.
    const data = new FormData();
    data.append('id_marca', id_marca);
    // Petición para obtener los datos del registro solicitado.
    fetch(API_MARCA + 'readOne', {
        method: 'post',
        body: data
    }).then(function (request) {
        // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
        if (request.ok) {
            request.json().then(function (response) {
                // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
                if (response.status) {
                    // Se inicializan los campos del formulario con los datos del registro seleccionado.
                    document.getElementById('id_marca').value = response.dataset.id_marca;
                    document.getElementById('nombre_marca').value = response.dataset.nombre_marca;                                    
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
    if (document.getElementById('id_marca').disabled==true){
        action = 'create';
    } else if (document.getElementById('id_marca').disabled==false){
        action = 'update';
    }    
    // Se llama a la función para guardar el registro. Se encuentra en el archivo components.js
    saveRow(API_MARCA, action, 'save-form');
});

// Función para establecer el registro a eliminar y abrir una caja de diálogo de confirmación.
function openDelete(id_marca) {
    // Se define un objeto con los datos del registro seleccionado.
    const data = new FormData();
    data.append('id_marca', id_marca);
    // Se llama a la función que elimina un registro. Se encuentra en el archivo components.js
    confirmDelete(API_MARCA, data);
}