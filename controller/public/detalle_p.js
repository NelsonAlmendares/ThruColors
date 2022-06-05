const API_CATALOGO = SERVER + 'publico/catalogo.php?action=';

// Método manejador de eventos que se ejecuta cuando el documento ha cargado.
document.addEventListener('DOMContentLoaded', function () {
    // Se busca en la URL las variables (parámetros) disponibles.
    let params = new URLSearchParams(location.search);
    // Se obtienen los datos localizados por medio de las variables.
    const ID = params.get('id');
    const marca = params.get('marca');
    // Se llama a la función que muestra los productos de la categoría seleccionada previamente.
    readOneProducto(ID);
    readProductosRelacionados(ID,marca);
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

function readProductosRelacionados(id, marca) {
    // Se define un objeto con los datos del registro seleccionado.
    const data = new FormData();
    data.append('nombre_marca', marca);
    // Petición para solicitar los productos de la categoría seleccionada.
    fetch(API_CATALOGO + 'readProductosMarca', {
        method: 'post',
        body: data
    }).then(function (request) {
        // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
        if (request.ok) {
            // Se obtiene la respuesta en formato JSON.
            request.json().then(function (response) {
                // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
                if (response.status) {
                    let content = '';
                    // Se recorre el conjunto de registros devuelto por la API (dataset) fila por fila a través del objeto row.
                    response.dataset.map(function (row) {
                        url = `detalle_producto.html?id=${row.id}&marca=${row.marca}`;
                        // Se crean y concatenan las tarjetas con los datos de cada producto.
                        content += `                            
                            <div class="col-md-4">
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
                    // Se agregan las tarjetas a la etiqueta div mediante su id para mostrar los productos.
                    document.getElementById('productos').innerHTML = content;                    
                } else {
                    // Se presenta un mensaje de error cuando no existen datos para mostrar.
                    document.getElementById('productos').innerHTML = `<i class="material-icons small">cloud_off</i><span class="red-text">${response.exception}</span>`;
                }
            });
        } else {
            console.log(request.status + ' ' + request.statusText);
        }
    });
}