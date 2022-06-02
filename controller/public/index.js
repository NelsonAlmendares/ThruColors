//Establecemos la ruta de comunicación con la API
const API_CATALOGO = SERVER + 'publico/catalogo.php?action=';

// Metodo para manejar los eventos
document.addEventListener(DOMContentLoaded, function(){
    // Funcion que muestra todas las categorias diponibles
    readAllCategorias();
    //Variable para establecer las opciones del Slider
    let options = {
        height: 300
    }
    //Iniciamos el componente
    M.Slider.init(document.querySelector('.lider'), options);
});

//Funcion para traer y mostrar las categorías disponibles
function readAllCategorias () {
    //Realizamos la petición a la API
    fetch(API_CATALOGO + 'readAll',{
        method: 'get'
    }).then(function (request){
        //Verificamos si la respuesta es correcta
        if(request.ok){
            //Obetenemos la respuesta en Json
            request.json().then(function (response){
                if(response.status){
                    let content = '';
                    let url = '';

                    response.dataset.map(function (row){
                        url = ``;
                    })
                }
            });
        }
    });
}