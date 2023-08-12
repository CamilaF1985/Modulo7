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

// Validar Campo rut
var rutInput = document.getElementById('rut');
var rutValidationMessage = document.getElementById('rutValidationMessage');

rutInput.addEventListener('input', function() {
    var rutValue = rutInput.value.trim();

    // Validar si el valor es un entero menor a 99999999
    if (!/^\d+$/.test(rutValue) || parseInt(rutValue) >= 99999999) {
        mostrarMensajeValidacion(rutInput, 'El Rut debe ser un entero menor a 99999999.');
    } else {
        ocultarMensajeValidacion(rutInput);
    }
});

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

// Validar Campo fechaIngreso
var fechaIngresoInput = document.getElementById('fechaIngreso');
var fechaIngresoValidationMessage = document.getElementById('fechaIngresoValidationMessage');

fechaIngresoInput.addEventListener('input', function() {
    var fechaIngresoValue = fechaIngresoInput.value.trim();

    // Validar el formato de fecha dd/MM/aaaa
    var datePattern = /^\d{2}\/\d{2}\/\d{4}$/;
    if (!datePattern.test(fechaIngresoValue)) {
        mostrarMensajeValidacion(fechaIngresoInput, 'El formato de fecha debe ser dd/MM/aaaa.');
    } else {
        ocultarMensajeValidacion(fechaIngresoInput);
    }
});