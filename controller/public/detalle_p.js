const API_CATALOGO = SERVER + 'publico/catalogo.php?action=';

// Método manejador de eventos que se ejecuta cuando el documento ha cargado.
document.addEventListener('DOMContentLoaded', function () {
    // Se busca en la URL las variables (parámetros) disponibles.
    let params = new URLSearchParams(location.search);
    // Se obtienen los datos localizados por medio de las variables.
    const ID = params.get('id');
    // Se llama a la función que muestra los productos de la categoría seleccionada previamente.
    readOneProducto(ID);
});

function readOneProducto(id) {
    // Se define un objeto con los datos del producto seleccionado.
    const data = new FormData();
    data.append('id_producto', id);    
    // Petición para obtener los datos del producto solicitado.
    fetch(API_CATALOGO + 'readOne', {
        method: 'post',
        body: data
    }).then(function (request) {
        // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
        if (request.ok) {
            // Se obtiene la respuesta en formato JSON.
            request.json().then(function (response) {
                // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
                if (response.status) {
                    // Se crean y concatenan las tarjetas con los datos de cada producto.
                    let foto = '';
                    foto += `
                        <img src="${SERVER}imagenes/productos/${response.dataset.foto}" class="img-fluid meustra" alt="">
                    `;
                    let producto = '';
                    producto += `
                        <h2 class="titulo">${response.dataset.nombre}</h2>
					    <h1 class="mt-3 precio">$${response.dataset.costo}</h1>
					    <p class="desciption">${response.dataset.descripcion}</p>
                    `;
                    let marca = '';
                    marca += `
                        <p>${response.dataset.marca}</p>
                    `;
                    let presentacion = '';
                    presentacion += `
                        <p>${response.dataset.presentacion}</p>
                    `;

                    document.getElementById('img-container').innerHTML = foto;
                    document.getElementById('producto-container').innerHTML = producto;
                    document.getElementById('marca-container').innerHTML = marca;
                    document.getElementById('presentacion-container').innerHTML = presentacion; 
                } else {
                    // Se presenta un mensaje de error cuando no existen datos para mostrar.
                    document.getElementById('detalle-producto').innerHTML = `<i class="material-icons small">cloud_off</i><span class="red-text"> ${response.exception}</span>`;
                    // Se limpia el contenido cuando no hay datos para mostrar.
                    document.getElementById('detalle-producto').innerHTML = '';
                }
            });
        } else {
            console.log(request.status + ' ' + request.statusText);
        }
    });
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