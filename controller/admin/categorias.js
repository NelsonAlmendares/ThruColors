//Constante para  establecer la ruta y los parametros de comunicación con la API
const API_CATEGORIAS = SERER + 'privado/categorias.php';

//Metodo para manejar los evenntos que se cargan en el Documento
document.addEventListener('DOMContentLoarder', function(){
    //Se llama a la funcion que obtiene los registros para llenar la tabla
    readRows(API_CATEGORIAS);
    //Definimos las variables que se van a cargar en el Modal
    let options = {
        dismissible: false,
        onOpenStart: function(){
            //Restauramos los valores del formulario
            document.getElementById('save-form').reset();
        }     
    }
});

//Funcion para llenar la tabla con los datos
function fillTable(dataset){
  let content = "";
  //Recorremos los regsitros con el objeto (dataset) fila por fila
  dataset.map(function (row) {
    content += `
            <tr>
                <td><img src="${SERVER}images/categorias/${row.imagen_categoria}" class="materialboxed" heigth="100" ></td>
                <td>${row.nombre_categoria}</td>
                <td>$${row.descripcion_categoria}</td>
                <td>
                    <a onclick="openUpdate(${row.id_categoria})" class="btn" data-tooltip="Actualizar">
                        <i class="icons">mode_edit</i>

                    <a onclick="openDelete(${row.id_categoria})" class="btn" data-tooltip="Eliminar">
                        <i class="icons">delete</i>

                    <a onclick="openReport(${row.id_categoria})" class="btn" data-tooltip="Reporte">
                        <i class="icons">assignment</i>
                </td>
            <t/r>
         `;
  });
  //Se agregan las filas al cuerpo de la taba mediante su id para motrar los registros
  document.getElementById("tbody-rows").innerHTML = content;
  //Se inicia el componenete Material box
  M.Materialbox.init(document.querySelectorAll('.materialboxed'));
  // Se inician los ToolTip
  M.Tooltip.init(document.querySelectorAll('.tooltipped'));
}

//Metodo manejador de eventos que se ejecuta cuando es utiliazado el formulario de buscar
document.getElementById('search-form').addEventListener('submit', function (event){
    //se evita recargar la página
    event.preventDefault();
    //Se llama a la funcion para cargar la busqueda
    searchRows(API_CATEGORIAS, 'search-form');
});

//Función para prepara el formulario para una actualizacion  
function openUpdate(id){
    //Se abre el modal que contiene el form
    M.modal.getInstance(document.getElementById('save-modal')).open();
    //Asignamos el titulo
    document.getElementById('modal-title').textContent = 'Actualizar categoria';
    //Establecemos el campo de archivo como opcional
    document.getElementById('archivo').required = false;
    //Definimos un objeto con los datos del registro seleccionado
    const data = new FormData();
    //Se hace la petición de los datos del registro
    fetch(API_CATEGORIAS + 'readOne', {
        method: 'post',
        body: data
    }).then(function (request) {
        if(request.ok){
            request.json().then(function (response){
                if (request.ok) {
                    document.getElementById('id').value = response.dataset.id_categoria;
                    document.getElementById('nombre').value = response.dataset.nombre_categoria;
                    document.getElementById('descripcion').value = response.dataset.descripcion_categoria;
                    M.updateTextFields();
                }else{
                    sweetAlert(2, response.excpetion, null);
                }
            });
        }else{
            console.log(request.status+ ' ' + request.statusText);
        }
    })
}

document.getElementById('save-form').addEventListener('submit', function (event){
    event.preventDefault();
    let action = '';
    (document.getElementById('id').value) ? action = 'update' : action = 'create';
    saveRow(API_CATEGORIAS, action, 'save-form', 'save-modal');
});

function openDelete(id) {
    const data = new FormData();
    data.append('id', id);
    confirmDelete(API_CATEGORIAS, data);
}