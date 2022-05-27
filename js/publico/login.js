let nombre = document.getElementById('nombre');
let password = document.getElementById('password');
let error = document.getElementById('error');
error.style.color = ('red');

let form = document.getElementById('formulario');
form.addEventListener('submit', function(evt){
    evt.preventDefault();
    let mensajeError = [];

    if(nombre.value === null || nombre.value === ''){
        mensajeError.push(`
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Ingresa tu nombre</strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        `);
    }
    if(password.value === null || password.value === ''){
        mensajeError.push(`
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Ingresa tu contraseña</strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        `);
    }
    else{
        window.location.replace('index.html');
    }
    error.innerHTML = mensajeError.join(', ');
});