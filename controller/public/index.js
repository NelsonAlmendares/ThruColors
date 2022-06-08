//Establecemos la ruta de comunicación con la API
const API_CATALOGO = SERVER + 'publico/catalogo.php?action=';

// Metodo para manejar los eventos
document.addEventListener('DOMContentLoaded', function(){
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
                    fillCarrusel(response.dataset);
                } else {
                    // Se presenta un mensaje de error cuando no existen datos para mostrar.
                    document.getElementById('title').innerHTML = `<i class="material-icons small">cloud_off</i><span class="red-text"> ${response.exception}</span>`;
                }
            });
        } else {
            console.log(request.status + ' ' + request.statusText);
        }
    });
}

function fillCarrusel(dataset) {
    let content = '';
    // Se recorre el conjunto de registros (dataset) fila por fila a través del objeto row.
    dataset.map(function (row) {
  
        content += `    
        <div class="swiper-slide">
            <div class="card">
              <div class="img-container">
                <img src="${SERVER}imagenes/productos/${row.foto}" class="image card-img-top img-fluid" alt="..." />
                <div class="overlay">
                  <div class="col">
                    <button type="button" class="btn btn-outline-danger btn-sm">
                      Agregar al carrito <i class="bi bi-bag"></i>
                    </button>
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
    document.getElementById('carrusel').innerHTML = content;
    // Se inicializa el componente Tooltip para que funcionen las sugerencias textuales.
    //M.Tooltip.init(document.querySelectorAll('.tooltipped'));
