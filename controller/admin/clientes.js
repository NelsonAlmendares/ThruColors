/*se establece ruta y parametros para la comunicacion con API */
const API_CIENTES = SERVER + 'privado/clientes.php?action=';



/*manejador de events cuando el documento a cargado*/
document.addEventListener('DOMContentLoaded', function () {



    /*se llama a la funcion read o leer que obtiene los registros*/
    readRows(API_CLIENTES)



    /*definimos una variable para establecer las opciones del modal */
    let options = {
        dismissible: false,
        onOpenStart: function () {
            // Se restauran los elementos del formulario.
            document.getElementById('save-form').reset();
        }
    }
}
)