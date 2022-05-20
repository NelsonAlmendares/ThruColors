const API_PRODUCTOS = SERVER + 'privado/productos.php?actions=';
const ENDPOINT_CATEGORIAS = SERVER + 'privado/categorias.php?actions=';

/* Metodo para manejar los eventos que se ejecutan cuando el sitio es cargado */
document.addEventListener('DOMContentLoader', function(){

    // Llamamos a la función que obtiene los registros para llenar la base
    readRows(API_PRODUCTOS);

    let options = {
        dismissible: false,
        onOpenStart: function(){
            // Restauramos los elementos del formulario
            document.getElementById('save-form').reset();
            // Establecemos el valor minimo para un producto
            document.getElementById('precio').setAttribute('min', 0.01);
            //Estableceos el valor maximo de un producto
            document.getElementById('precio').setAttribute('max', 999.99);
        }
    }
    // Se inicializa el componente Modal para que funcionen los combo-box
    M.Modal.init(document.querySelectorAll('.modal'), options);
});

function fillTable(dataset){
    let content = '';
    // Recorremos el conjunto de los registros con el objeto "dataset" fila por fila
    dataset.map(function (row){
        (row.estado_producto);
    })
}

document.getElementById('search-form').addEventListener('submit', function (event){
    event.preventDefault();
    searchRows(API_PRODUCTOS, 'search-form');
});

// Funcion para preparar el formulario para insertar un registro
function openCreate(params) {
    //Se abre el modal del formulario
    M.Modal.getInstance(document.getElementById('save-modal')).open();
    // Se asigo el titulo del modal
    document.getElementById('modal-title').textContent = 'Crear producto';
    // Se establece como un campo obligatorio
    document.getElementById('archivo').required = true;
    // Se llama a la funcion que llena el select del formulario
    fillSelect(ENDPOINT_CATEGORIAS, 'categoria', null);
}

// Funcion para preparar el formulario de Editar
function openUpdate(id){
    // Abrimos el modal
    M.Modal.getInstance(document.getElementById('save-modal')).open();
    // Asiganomos el nombre del modal
    document.getElementById('modal-title').textContent = 'Actualizar producto';
    // Se establece como un campo opcional
    document.getElementById('archivo').required = true;
    //Se define un objeto con los datos del registro seleccionado
    const data = new FormData();
    fetch(API_PRODUCTOS + 'readOne', {
        method: 'post',
        body: data
    }).then(function (request){
        if(request.ok){
            request.json().then(function (response){
                if(response.status){
                    document.getElementById('id').value = response.dataset.id_producto;
                    document.getElementById('nombre').value = response.dataset.nombre_prodcuto;
                    document.getElementById('descripcion').value = response.dataset.descripcion_producto;
                }else{

                }
            });
        } else{
            console.log(request.status + ' ' + request.statusText);
        }
    });
}