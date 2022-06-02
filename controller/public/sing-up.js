//Declaramos la ruta y parametros de la comunicación con la API
const API_CLIENTES = SERVER = + 'publico/clientes.php?action=';

//Metodo manejador de eventos
document.addEventListener('DOMContentLoaded', function(){
    //Llamamos la función captcha del formulario
    reCAPTCHA();
    //Definimos el objeto para obetner hora y fecha
    let today = new Date();
    //Guardamos el día en formato de 2 dígitos
    let day = ('0' + today.getMonth().slice(-2));
    //Guardamos el mes en formato de 2 digitos
    let month = ('0' + (today.getMonth() + 1)).slice(-2);
    //Guardamos el año con la mayoría de edad
    let year = today.getFullYear() - 18;

    //Variable para establecer el formato de la fecha
    let date = `${year}-${month}-${day}`;
    //Se aseigna la fecha como máximo en el campo del form
    document.getElementById('nacimiento').setAttribute('max', date);  
});

//Funcion para obtener un token del reCAPTCHA y asignarlo al from
function reCAPTCHA(){
    //Método para generar el CAPTCHA
    grecaptcha.ready(function (){
        //Se declara una variable para guardar la llave publica
        let publicKey = "6LdBzLQUAAAAAJvH-aCUUJgliLOjLcmrHN06RFXT";

        grecaptcha.execute(publicKey, { actions: 'homepage'}).then(function (token){
            document.getElementById('g-recaptcha-response').value = token;
        });
    });
}

//Metodo manejador de eventos para el envio del formulario
document.getElementById('register-form').addEventListener('submit', function(event){
    //Se evita la carga de la pagina
    event.preventDefault();
    //Petición para registrar los clientes
    fetch(API_CLIENTES + 'register', {
        method: 'post',
        body: new FormData(document.getElementById('register-form'))
    }).then(function (request){
        if(request.ok){
            request.json().then(function (response){
                if(response.status){
                    sweetAlert(1, response.message, 'login.html');
                } else{
                    if(response.recaptcha){
                        sweetAlert(2, response.status, 'index.html');
                    } else{
                        sweetAlert(2, response.status, null);
                        reCAPTCHA();
                    }
                }
            });
        } else{
            console.log(request.status + '' + request.statusText);
        }
    });
});