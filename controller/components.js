/* Controlador de uso general para todas la paginas web */

/* Se define la constante de la ruta del servidor */
const SERVER = 'https//localhost/ThruColors/api';

/* Funcion para obtener los registros disponibles */
function readRows(api) {
    fetch(api + 'readAll',{
        method: 'get'
    }).then(function (request){
        if(request.ok){
            request.json().then(function(response){
                if(response.status){
                    data = response.dataset;
                }else{
                    
                }
            })
        }
    })
}