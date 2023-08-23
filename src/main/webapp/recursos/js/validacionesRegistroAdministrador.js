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

// Función para validar campo
function validarCampo(input, minLength, maxLength, mensaje) {
    var value = input.value.trim();
    if (value.length < minLength || value.length > maxLength) {
        mostrarMensajeValidacion(input, mensaje);
        return false;
    } else {
        ocultarMensajeValidacion(input);
        return true;
    }
}

// Validar Campo rut
var rutInput = document.getElementById('rut');
var rutValidationMessage = document.getElementById('rutValidationMessage');

rutInput.addEventListener('input', function() {
    validarRut(); // Llamamos a la función de validación en cada entrada
});

function validarRut() {
    var rutValue = rutInput.value.trim();

    // Validar si el valor es un entero menor a 99999999
    if (!/^\d+$/.test(rutValue) || parseInt(rutValue) >= 99999999) {
        mostrarMensajeValidacion(rutInput, 'El Rut debe ser un entero menor a 99999999.');
        return false;
    } else {
        ocultarMensajeValidacion(rutInput);
        return true;
    }
}

// Validar Campo nombres
var nombresInput = document.getElementById('nombres');
var nombresValidationMessage = document.getElementById('nombresValidationMessage');

nombresInput.addEventListener('input', function() {
    validarNombres(); // Llamamos a la función de validación en cada entrada
});

function validarNombres() {
    return validarCampo(nombresInput, 5, 30, 'El nombre debe tener entre 5 y 30 caracteres.');
}

// Validar Campo apellidos
var apellidosInput = document.getElementById('apellidos');
var apellidosValidationMessage = document.getElementById('apellidosValidationMessage');

apellidosInput.addEventListener('input', function() {
    validarApellidos(); // Llamamos a la función de validación en cada entrada
});

function validarApellidos() {
    return validarCampo(apellidosInput, 5, 30, 'El apellido debe tener entre 5 y 30 caracteres.');
}

// Validar Campo fechaIngreso
var fechaIngresoInput = document.getElementById('fechaIngreso');
var fechaIngresoValidationMessage = document.getElementById('fechaIngresoValidationMessage');

fechaIngresoInput.addEventListener('input', function() {
    validarFechaIngreso(); // Llamamos a la función de validación en cada entrada
});

function validarFechaIngreso() {
    var fechaIngresoValue = fechaIngresoInput.value.trim();

    // Validar el formato de fecha dd/MM/aaaa
    var datePattern = /^\d{2}\/\d{2}\/\d{4}$/;
    if (!datePattern.test(fechaIngresoValue)) {
        mostrarMensajeValidacion(fechaIngresoInput, 'El formato de fecha debe ser dd/MM/aaaa.');
        return false;
    } else {
        ocultarMensajeValidacion(fechaIngresoInput);
        return true;
    }
}

// Función para mostrar mensaje de error
function mostrarMensajeError(mensaje) {
    Swal.fire({
        icon: 'error',
        title: 'Error en el proceso de registro',
        text: mensaje,
    });
}

// Función para validar el formulario completo
function validarFormulario(event) {
    event.preventDefault(); // Evitar la acción por defecto del formulario
    
    if (validarRut() && validarNombres() && validarApellidos() && validarFechaIngreso()) {
        // Todas las validaciones son exitosas, enviar el formulario
        document.getElementById('formularioRegistroAdministrador').submit();
    } else {
        // Al menos una validación falló, mostrar mensaje de error
        mostrarMensajeError('Campos requeridos incompletos');
    }
}



