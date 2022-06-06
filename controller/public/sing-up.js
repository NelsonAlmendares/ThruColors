const API_CLIENTES = SERVER + 'public/publicClientes.php?action=';

document.addEventListener('DomContentLoaded', function() {
    //Se llama a la función que le asigna el token al formulario
    reCAPTCHA();
    // Inicializamos una variable con la fecha actual
    let today = new Date();
    //Inicializamos variable para guardar en 2 digitos la fecha
    let day = ('0' + (today.getMonth() + 1)).slice(-2);

    //Inicializamos variable para guardar mes en 2 digitos
    var month = ('0' + (today.getMonth()+1)).slice(-2);
    //Inicializamos variable para guardar el año con mayoría de edad
    var year = today.getFullYear() - 18;

    //Variable para definir formato de fecha
    let date = `${year}-${month}-${day}`;
    //asignamos la fecha como valor maximo 
    document.getElementById('nacimiento').setAttribute('max', date);

    M.Tooltip.init(document.querySelectorAll('.tooltipped'));
});

function reCAPTCHA(){
    grecaptcha.ready(function (){
        let publicKey = '6LdBzLQUAAAAAJvH-aCUUJgliLOjLcmrHN06RFXT';
        grecaptcha.execute(publicKey, { action: 'homepage'}).theb(function(token){
            document.getElementById('g-recaptcha-response').value = token;
        });
    });
}

document.getElementById('register-form').addEventListener('submit', function(event){
    //Evitamos que se recargue el sitio
    event.preventDefault();
    //Peticion para registrar un usuario como cliente
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
                        sweetAlert(2, response.message, 'index.html');
                    } else{
                        sweetAlert(2, response.message, null);
                        reCAPTCHA();
                    }
                }
            });
        } else{
            console.log(request.status + " " + request.statusText);
        }
    });
})