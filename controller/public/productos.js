// Constante para establecer la ruta y parámetros de comunicación con la API.
const API_CATALOGO = SERVER + 'publico/catalogo.php?action=';
const ENDPOINT_CATEGORIAS = SERVER + 'publico/categorias.php?action=readAll';
const ENDPOINT_MARCAS = SERVER +'publico/marcas.php?action=readAll';
// Método manejador de eventos que se ejecuta cuando el documento ha cargado.
document.addEventListener('DOMContentLoaded', function () {
    
    // Se llama a la función que muestra los productos de la categoría seleccionada previamente.
    readProductos();
});

// Función para obtener y mostrar los productos de acuerdo a la categoría seleccionada.
function readProductos() {    
    // Petición para solicitar los productos de la categoría seleccionada.
    fetch(API_CATALOGO + 'readAll', {
        method: 'get'
    }).then(function (request) {
        // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
        if (request.ok) {
            // Se obtiene la respuesta en formato JSON.
            request.json().then(function (response) {
                // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
                if (response.status) {
                    fillCards(response.dataset);
                } else {
                    // Se presenta un mensaje de error cuando no existen datos para mostrar.
                    document.getElementById('title').innerHTML = `<i class="material-icons small">cloud_off</i><span class="red-text"> ${response.exception}</span>`;
                }
            });
        } else {
            console.log(request.status + ' ' + request.statusText);
        }
        fillSelect(ENDPOINT_CATEGORIAS, 'categorias', null);
        fillSelect(ENDPOINT_MARCAS, 'marca', null);
    });
}
function fillCards(dataset) {
    let content = '';
    // Se recorre el conjunto de registros (dataset) fila por fila a través del objeto row.
    dataset.map(function (row) {
        url = `detalle_producto.html?id=${row.id}&marca=${row.marca}`;
        // Se crean y concatenan las filas de la tabla con los datos de cada registro.
        content += `            
            <div class="col-md-3 mt-3 d-flex" >
            <div class="card">
                <div class="img-container">
                    <img src="${SERVER}imagenes/productos/${row.foto}" class="image card-img-top img-fluid"
                    alt="...">
                    <div class="overlay">
                    <div class="col">
                        <button type="button" class="btn btn-outline-danger btn-sm"> <a
                            href="${url}" class="card_link">ver más...</a> <i
                            class="bi bi-bag"></i></button>
                    </div>
                    </div>
                </div>
                <div class="card-body">
                    <h5 class="card-title text-center">${row.nombre}</h5>
                    <p class="card-description text-center">${row.descripcion} ${row.presentacion}</p>
                    <p class="card-price text-center">$${row.costo}</p>
                    <form action="" class="text-center">
                    <!-- <a href="#" class="btn btn-outline-secondary cards">Go somewhere</a> -->
                    </form>
                </div>
            </div>
        </div>          
        `;
    });
    // Se agregan las filas al cuerpo de la tabla mediante su id para mostrar los registros.
    document.getElementById('productos').innerHTML = content;
    // Se inicializa el componente Tooltip para que funcionen las sugerencias textuales.
    //M.Tooltip.init(document.querySelectorAll('.tooltipped'));
}



document.getElementById('search-form').addEventListener('submit', function (event){
    event.preventDefault();
    searchProducts(API_CATALOGO, 'search-form');
});

function searchProducts(api, form) {
    fetch(api + 'search', {
        method: 'post',
        body: new FormData(document.getElementById(form))
    }).then(function (request) {
        // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
        if (request.ok) {
            // Se obtiene la respuesta en formato JSON.
            request.json().then(function (response) {
                // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
                if (response.status) {
                    // Se envían los datos a la función del controlador para que llene la tabla en la vista y se muestra un mensaje de éxito.
                    fillCards(response.dataset);
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