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

// Validar Campo nombres
var nombresInput = document.getElementById('nombres');
var nombresValidationMessage = document.getElementById('nombresValidationMessage');

nombresInput.addEventListener('input', function() {
    var nombresValue = nombresInput.value.trim();

    if (nombresValue.length < 5 || nombresValue.length > 30) {
        mostrarMensajeValidacion(nombresInput, 'El nombre debe tener entre 5 y 30 caracteres.');
    } else {
        ocultarMensajeValidacion(nombresInput);
    }
});

// Validar Campo apellidos
var apellidosInput = document.getElementById('apellidos');
var apellidosValidationMessage = document.getElementById('apellidosValidationMessage');

apellidosInput.addEventListener('input', function() {
    var apellidosValue = apellidosInput.value.trim();

    if (apellidosValue.length < 5 || apellidosValue.length > 30) {
        mostrarMensajeValidacion(apellidosInput, 'El apellido debe tener entre 5 y 30 caracteres.');
    } else {
        ocultarMensajeValidacion(apellidosInput);
    }
});

// Validar Campo telefono
var telefonoInput = document.getElementById('telefono');
var telefonoValidationMessage = document.getElementById('telefonoValidationMessage');

telefonoInput.addEventListener('input', function() {
    var telefonoValue = telefonoInput.value.trim();

    // Se valida que el valor no esté vacío, sea numérico y no supere los 15 dígitos
if (telefonoValue.length > 15) {
    mostrarMensajeValidacion(telefonoInput, 'El teléfono debe tener como máximo 15 dígitos.');
} else if (telefonoValue === '') {
    mostrarMensajeValidacion(telefonoInput, 'El teléfono es obligatorio.');
} else {
    ocultarMensajeValidacion(telefonoInput);
}
});

// Validar Campo comuna
var comunaInput = document.getElementById('comuna');
var comunaValidationMessage = document.getElementById('comunaValidationMessage');

comunaInput.addEventListener('input', function() {
    var comunaValue = comunaInput.value.trim();

    if (comunaValue.length < 5 || comunaValue.length > 70) {
        mostrarMensajeValidacion(comunaInput, 'La comuna debe tener entre 5 y 70 caracteres.');
    } else {
        ocultarMensajeValidacion(comunaInput);
    }
});


// Validar Campo calle
var calleInput = document.getElementById('calle');
var calleValidationMessage = document.getElementById('calleValidationMessage');

calleInput.addEventListener('input', function() {
    var calleValue = calleInput.value.trim();

    if (calleValue.length < 5 || calleValue.length > 70) {
        mostrarMensajeValidacion(calleInput, 'La calle debe tener entre 5 y 70 caracteres.');
    } else {
        ocultarMensajeValidacion(calleInput);
    }
});

// Validar Campo numeracion
var numeracionInput = document.getElementById('numeracion');
var numeracionValidationMessage = document.getElementById('numeracionValidationMessage');

numeracionInput.addEventListener('input', function() {
    var numeracionValue = numeracionInput.value.trim();

    // Se valida que el valor sea numérico y que no sea nulo
    if (isNaN(numeracionValue) || numeracionValue === '') {
        mostrarMensajeValidacion(numeracionInput, 'La numeración no puede quedar vacía. Campo Obligatorio.');
    } else {
        ocultarMensajeValidacion(numeracionInput);
    }
});









