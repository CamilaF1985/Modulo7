document.getElementById('loginForm').addEventListener('submit', function(event) {
  event.preventDefault(); // Evitar el envío automático del formulario

  var usuarioInput = document.getElementById('username');
  var passwordInput = document.getElementById('password');

  var usuarioValue = usuarioInput.value.trim();
  var passwordValue = passwordInput.value.trim();

  // Restaurar mensajes de validación si existían previamente
  ocultarMensajeValidacion(usuarioInput);
  ocultarMensajeValidacion(passwordInput);

  if (usuarioValue === '') {
    mostrarMensajeValidacion(usuarioInput, 'El nombre de usuario no puede quedar vacío.');
  } else if (passwordValue === '') {
    mostrarMensajeValidacion(passwordInput, 'La contraseña no puede quedar vacía.');
  } else {
    // Si no hay errores de validación, enviar el formulario manualmente mediante AJAX
    var formData = new FormData(this);

    // Realizar una solicitud AJAX para enviar el formulario
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/ingreso", true);
    xhr.onload = function() {
      if (xhr.status === 200) {
        // No haremos redirección o manejo de mensajes aquí
      }
    };
    xhr.send(formData);
  }
});


// Función para mostrar mensaje de validación
function mostrarMensajeValidacion(input, mensaje) {
    var validationMessage = document.getElementById(input.id + "ValidationMessage");
    validationMessage.textContent = mensaje;
    validationMessage.style.display = "block"; // Mostramos el mensaje

    // Ajustar el margen superior para colocar el mensaje debajo del campo
    input.style.marginBottom = "20px";
}

// Función para ocultar mensaje de validación
function ocultarMensajeValidacion(input) {
    var validationMessage = document.getElementById(input.id + "ValidationMessage");
    validationMessage.style.display = "none"; // Ocultamos el mensaje

    // Restaurar el margen inferior original del campo
    input.style.marginBottom = "0";
}

document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Evitar el envío automático del formulario

    var usuarioInput = document.getElementById('username');
    var passwordInput = document.getElementById('password');

    var usuarioValue = usuarioInput.value.trim();
    var passwordValue = passwordInput.value.trim();

    // Restaurar mensajes de validación si existían previamente
    ocultarMensajeValidacion(usuarioInput);
    ocultarMensajeValidacion(passwordInput);

    if (usuarioValue === '') {
        mostrarMensajeValidacion(usuarioInput, 'El nombre de usuario no puede quedar vacío.');
    } else if (passwordValue === '') {
        mostrarMensajeValidacion(passwordInput, 'La contraseña no puede quedar vacía.');
    } else {
        // Si no hay errores de validación, enviar el formulario manualmente
        this.submit();
    }
});

function mostrarMensajeAlerta(mensaje, tipo) {
    var alertaMensaje = document.getElementById('alertaMensaje');
    alertaMensaje.textContent = mensaje;
    alertaMensaje.className = 'alerta-mensaje alert alert-' + tipo;
}














