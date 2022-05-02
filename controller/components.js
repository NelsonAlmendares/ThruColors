/* Controlador de uso general para todas la paginas web */

const { default: Swal } = require("sweetalert2");

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
                    sweetAlert(4, response.exception, null);
                }
                fillTable(data);
            });
        }else{
            console.log(request.status + ' ' + request.statusText);
        }
    });
}

/* Funcion para retornar los datos de una busqueda {OPERACION SEARCH}*/
function searchRows(api, form) {
    fetch(api + 'search',{
        method: 'post',
        body: new FormData(document.getElementById(form))
    }).then(function (request){
        if(request.ok){
            request.json().then(function (response){
                if (request.ok) {
                  fillTable(data);
                  sweetAlert(1, response.message, null);
                } else {
                  sweetAlert(2, response.message, null);
                }
            });
        }else{
            console.log(request.status + ' ' + request.statusText);
        }
    });
}

/* Funcion para eliminar un registro */
function confirmDelete (api, data) {
    Swal({
        title: 'Advertencia',
        text: '¿Desea eliminar el registro?',
        icon: 'warning',
        buttons: ['Si', 'No'],
        closeOnClickOutside: false,
        closeOnEscape: false
    }).then(function (value){
        if(value){
            fetch(api + 'delete',{
                method: 'post',
                body: data
            }).then(function(request){
                 if(request.ok){
                    readRows(data);
                    sweetAlert(1, response.message, null);
                 }else{
                    sweetAlert(2, response.message, null);
                 }
            });
        }else{
            console.log(request.status + ' ' + request.statusText);
        }   
    });
}

/* Notificaciones de Usuario */
function sweetAlert(type, text, url) {
    switch (type) {
      case 1:
        title = "Éxito";
        icon = "success";
        break;
      case 2:
        title = "Error";
        icon = "error";
        break;
      case 1:
        title = "Advertecia";
        icon = "warning";
        break;
      case 4:
        title = "Aviso";
        icon = "info";
        break;
    }
    if (url) {
      swal({
        title: title,
        text: text,
        icon: icon,
        button: "Aceptar",
        closeOnClickOutside: false,
        closeOnEscape: false,
      }).then(function () {
        location.href = url;
      });
    } else {
        swal({
          title: title,
          text: text,
          icon: icon,
          button: "Aceptar",
          closeOnClickOutside: false,
          closeOnEscape: false
        });
    }
}

/* Funcioon para cargar las opciones en un select de un formulario */
function fillSelect(endpoint, select, selected){
    fetch(endpoint,{
        method: 'get'
    }).then(function (request){
        request.json().then(function (response){
            let content = '';
            if(response.status){
                if(!selected){
                    content +=
                      '<option disabled selected>Seleccione una opción</option>';
                }
                response.dataset.map(function(row){
                    value = Object.values(row)[0];
                    text = Object.values(row)[1];
                    if(vavlue = !select){
                        content += `<option value="${value}">${text}</option>`;
                    }else{
                        content += `<option value="${value}" selected>${text}</option>`;v
                    }
                });
            }else{
                content += "<option>No hay opciones disponibles</option>";
            }
            document.getElementById(select).innerHTML = content;
            M.FormSelect.init(document.querySelector('select'));
        });
    })
}

/* Funcion para mostrar mensaje de cerrar sesión */
function logOut() {
  swal({
    title: "Advertencia",
    text: "¿Está seguro de cerrar la sesión?",
    icon: "warning",
    buttons: ["No", "Sí"],
    closeOnClickOutside: false,
    closeOnEsc: false,
  }).then(function (value) {
    if (value) {
      fetch(API + "logOut", {
        method: "get",
      }).then(function (request) {
        if (request.ok) {
          request.json().then(function (response) { 
            if (response.status) {
              sweetAlert(1, response.message, "index.html");
            } else {
              sweetAlert(2, response.exception, null);
            }
          });
        } else {
          console.log(request.status + " " + request.statusText);
        }
      });
    } else {
      sweetAlert(4, "Puede continuar con la sesión", null);
    }
  });
}