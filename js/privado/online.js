/*
*   Controlador de uso general en las páginas web del sitio privado cuando se ha iniciado sesión.
*   Sirve para manejar las plantillas del encabezado y pie del documento.
*/

// Constante para establecer la ruta y parámetros de comunicación con la API.
const API = SERVER + 'privado/empleados.php?action=';

// Método manejador de eventos que se ejecuta cuando el documento ha cargado.
document.addEventListener('DOMContentLoaded', function () {
    // Petición para obtener en nombre del usuario que ha iniciado sesión.
    fetch(API + 'getUser', {
        method: 'get'
    }).then(function (request) {
        // Se verifica si la petición es correcta, de lo contrario se muestra un mensaje en la consola indicando el problema.
        if (request.ok) {
            // Se obtiene la respuesta en formato JSON.
            request.json().then(function (response) {
                // Se revisa si el usuario está autenticado, de lo contrario se envía a iniciar sesión.
                if (response.session) {
                    // Se comprueba si la respuesta es satisfactoria, de lo contrario se direcciona a la página web principal.
                    if (response.status) {
                        const header = `
                        <nav class="main-nav--bg">
                            <div class="container main-nav">
                                <div class="main-nav-start">
                                    <div class="search-wrapper buscar">
                                        <i data-feather="search" aria-hidden="true"></i>
                                        <input type="text" placeholder="Buscar" required />
                                    </div>
                                </div>
                                <div class="main-nav-end">
                                    <button class="sidebar-toggle transparent-btn" title="Menu" type="button">
                                        <span class="sr-only">Toggle menu</span>
                                        <span class="icon menu-toggle-gray" aria-hidden="true"></span>
                                    </button>
                                    <button class="theme-switcher gray-circle-btn" type="button" title="Tema">
                                        <span class="sr-only">Tema</span>
                                        <i class="sun-icon" data-feather="sun" aria-hidden="true"></i>
                                        <i class="moon-icon" data-feather="moon" aria-hidden="true"></i>
                                    </button>
                                    <div class="notification-wrapper">
                                        <button class="gray-circle-btn dropdown-btn" title="Configuracion" type="button">
                                            <span class="sr-only">Configuración</span>
                                            <i class="fa-solid fa-gear"></i>
                                        </button>
                                        <ul class="users-item-dropdown notification-dropdown dropdown">									
                                            <li>
                                                <a class="sidebar-user" onclick="logOut()">Cerrar sesión</a>
                                            </li>
                                        </ul>
                                    </div>							
                                </div>
                            </div>
                        </nav>
                        `;
                        const footer = `
                            <div class="container">
                                <div class="row">
                                    <div class="col s12 m6">
                                        <h6 class="white-text">Dashboard</h6>
                                        <a class="white-text" href="mailto:dacasoft@outlook.com">
                                            <i class="material-icons left">email</i>Ayuda
                                        </a>
                                    </div>
                                    <div class="col s12 m6">
                                        <h6 class="white-text">Enlaces</h6>
                                        <a class="white-text" href="../public/" target="_blank">
                                            <i class="material-icons left">store</i>Sitio público
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="footer-copyright">
                                <div class="container">
                                    <span>© 2018-2022 Copyright CoffeeShop. Todos los derechos reservados.</span>
                                    <span class="right">Diseñado con
                                        <a href="http://materializecss.com/" target="_blank">
                                            <img src="../../resources/img/materialize.png" height="20" style="vertical-align:middle" alt="Materialize">
                                        </a>
                                    </span>
                                </div>
                            </div>
                        `;
                        //document.querySelector('header').innerHTML = header;                        
                    } else {
                        sweetAlert(3, response.exception, 'index.html');
                    }
                } else {
                    location.href = 'index.html';
                }
            });
        } else {
            console.log(request.status + ' ' + request.statusText);
        }
    });
});
