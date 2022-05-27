var i = 0;
$("#incrementa").click(function () {
  if (i < 10) {
    /*Cambiar el >= 0 por < 10 si quieres limitar el incremento*/
    i++;
  } else if ((i = i++)) {
    i = 10;
  }
  document.getElementById("display").innerHTML = i;
});

$("#disminuye").click(function () {
  if (i > 1) {
    --i;
  }
  document.getElementById("display").innerHTML = i;
});
