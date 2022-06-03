// Constante para establecer la ruta y parámetros de comunicación con la API.
const API = SERVER + 'publico/publicClientes.php?action=';

// Método manejador de eventos que se ejecuta cuando el documento ha cargado.
document.addEventListener('DOMContentLoaded', function () {
    // Petición para determinar si se ha iniciado sesión.
    fetch(API + 'getUser', {
        method: 'get'
    }).then(function (request) {
        // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
        if (request.ok) {
            // Se obtiene la respuesta en formato JSON.
            request.json().then(function (response) {
                // Se define una variable para asignar el encabezado del documento.
                let header = '';
                // Se comprueba si el usuario está autenticado para establecer el encabezado respectivo.
                if (response.session) {
                    header = `
                    <img src="${SERVER}imagenes/clientes/${response.foto_cliente}" style="height: 25px;" class="img-fluid profile mt-1" alt="">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDarkDropdownMenuLink" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            ${response.nombre_cliente} ${response.apellido_cliente}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarDarkDropdownMenuLink">
                                <li><a class="dropdown-item" onclick="logOut()">Cerrar sesión <img
                                        src="../../resources/iconos/cerrar-sesion.png" id="actions" alt=""></a></li>
                                <li><a class="dropdown-item" href="#">Ajustes <img
                                        src="../../resources/iconos/icons8_settings_96px.png" id="actions" alt=""></a></li>
                            </ul>
                        </li>
                    </ul>
                    `;
                } else {
                    header = `                    
                    <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active text-white" aria-current="page" href="#">Home</a>
                    </li>
                    <!-- <img src="../../resources/perfil/media_.jpeg" class="img-fluid profile mt-1" alt=""> -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDarkDropdownMenuLink" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        Iniciar sesión
                        </a>
                        <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarDarkDropdownMenuLink">
                        <li><a class="dropdown-item" href="login.html"">Iniciar sesión <img
                                src="../../resources/iconos/iniciar-sesion.png" id="actions" alt=""></a></li>
                        <li><a class="dropdown-item" href="#">Ajustes <img
                                src="../../resources/iconos/icons8_settings_96px.png" id="actions" alt=""></a></li>
                        </ul>
                    </li>
                    </ul>
                    `;                                                                                        
                }
                // Se asigna a la página web el contenido del encabezado.
                document.getElementById('info_client').innerHTML = header;
                
                // Se establece el pie del encabezado.
                const footer = `
                <div class="container">
                <img src="../../resources/butterfly.png" class="logo-brand mb-2" alt="logo">
                <ul class="list-inline">
                  <li class="list-inline-item footer-menu"><a href="#">Home</a></li>
                  <li class="list-inline-item footer-menu"><a href="#">Portfolio</a></li>
                  <li class="list-inline-item footer-menu"><a href="#">About us</a></li>
                  <li class="list-inline-item footer-menu"><a href="#">Pricing</a></li>
                  <li class="list-inline-item footer-menu"><a href="#">Contact</a></li>
                </ul>
                <ul class="list-inline">
                  <li class="list-inline-item"><a href="https://www.instagram.com/" target="_blank"><img src="https://cdn-icons-png.flaticon.com/512/174/174855.png"
                        class="img-fluid icon"></a></li>
                  <li class="list-inline-item"><a href="https://twitter.com/?lang=ES" target="_blank"><img src="https://cdn-icons-png.flaticon.com/512/733/733579.png"
                        class="img-fluid icon"></a></li>
                  <li class="list-inline-item"><a href="https://www.youtube.com/" target="_blank"><img src="https://cdn-icons-png.flaticon.com/512/174/174883.png"
                        class="img-fluid icon"></a></li>
                  <li class="list-inline-item"><a href="https://dribbble.com/" target="_blank"><img src="https://cdn-icons-png.flaticon.com/512/733/733544.png"
                        class="img-fluid icon"></a></li>
                  <li class="list-inline-item"><a href="https://www.facebook.com/" target="_blank"><img src="https://cdn-icons-png.flaticon.com/512/174/174848.png"
                        class="img-fluid icon"></a></li>
                </ul>
                <small>©2022 All Rights Reserved. Created by <a href="https://github.com/NelsonAlmendares/ThruColors.git"
                    class="font-weight-bold" target="_blank" rel="noopener">Thru Colors Team</a></small>
              </div>
                `;
                // Se asigna a la página web el contenido del pie.
                document.querySelector('footer').innerHTML = footer;
                // Se inicializa el componente Sidenav para que funcione la navegación lateral.
                //M.Sidenav.init(document.querySelectorAll('.sidenav'));
                // Se declara e inicializa un arreglo con los nombres de las imagenes que se pueden utilizar en el efecto parallax.
                let images = ['img01.jpg', 'img02.jpg', 'img03.jpg', 'img04.jpg', 'img05.jpg'];
                // Se declara e inicializa una variable para obtener un elemento del arreglo de forma aleatoria.
                let element = Math.floor(Math.random() * images.length);
                // Se asigna la imagen a la etiqueta img por medio del atributo src.
                document.getElementById('parallax').setAttribute('src', '../../resources/img/parallax/' + images[element]);
                // Se inicializa el efecto Parallax.
                //M.Parallax.init(document.querySelectorAll('.parallax'));
            });
        } else {
            console.log(request.status + ' ' + request.statusText);
        }
    });
});