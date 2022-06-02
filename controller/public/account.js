//Establecemos la ruta de comunicación con la API
const API = SERVER + 'public/clientes.php?action=';

//Metodo manejador de Elementos
document.addEventListener('DOMContentLoaded', function (){
    fetch(API + 'getUser', {
        method: 'get'
    }).then(function (request){
        if(request.ok){
            request.json().then(function (response){
                let header = '';
                if(response.session){
                    header = ``;
                }
            })
        }
    })
})