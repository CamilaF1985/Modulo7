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
    validarNombres(); // Llamamos a la función de validación en cada entrada
});

function validarNombres() {
    var nombresValue = nombresInput.value.trim();
    
    if (nombresValue.length < 5 || nombresValue.length > 30) {
        mostrarMensajeValidacion(nombresInput, 'El nombre debe tener entre 5 y 30 caracteres.');
        return false;
    } else {
        ocultarMensajeValidacion(nombresInput);
        return true;
    }
}

// Validar Campo apellidos
var apellidosInput = document.getElementById('apellidos');
var apellidosValidationMessage = document.getElementById('apellidosValidationMessage');

apellidosInput.addEventListener('input', function() {
    validarApellidos(); // Llamamos a la función de validación en cada entrada
});

function validarApellidos() {
    var apellidosValue = apellidosInput.value.trim();

    if (apellidosValue.length < 5 || apellidosValue.length > 30) {
        mostrarMensajeValidacion(apellidosInput, 'El apellido debe tener entre 5 y 30 caracteres.');
        return false;
    } else {
        ocultarMensajeValidacion(apellidosInput);
        return true;
    }
}

// Validar Campo telefono
var telefonoInput = document.getElementById('telefono');
var telefonoValidationMessage = document.getElementById('telefonoValidationMessage');

telefonoInput.addEventListener('input', function() {
    validarTelefono(); // Llamamos a la función de validación en cada entrada
});

function validarTelefono() {
    var telefonoValue = telefonoInput.value.trim();

    if (telefonoValue.length > 15) {
        mostrarMensajeValidacion(telefonoInput, 'El teléfono debe tener como máximo 15 dígitos.');
        return false;
    } else if (telefonoValue === '') {
        mostrarMensajeValidacion(telefonoInput, 'El teléfono es obligatorio.');
        return false;
    } else {
        ocultarMensajeValidacion(telefonoInput);
        return true;
    }
}

// Validar Campo comuna
var comunaInput = document.getElementById('comuna');
var comunaValidationMessage = document.getElementById('comunaValidationMessage');

comunaInput.addEventListener('input', function() {
    validarComuna(); // Llamamos a la función de validación en cada entrada
});

function validarComuna() {
    var comunaValue = comunaInput.value.trim();

    if (comunaValue.length < 5 || comunaValue.length > 70) {
        mostrarMensajeValidacion(comunaInput, 'La comuna debe tener entre 5 y 70 caracteres.');
        return false;
    } else {
        ocultarMensajeValidacion(comunaInput);
        return true;
    }
}

// Validar Campo calle
var calleInput = document.getElementById('calle');
var calleValidationMessage = document.getElementById('calleValidationMessage');

calleInput.addEventListener('input', function() {
    validarCalle(); // Llamamos a la función de validación en cada entrada
});

function validarCalle() {
    var calleValue = calleInput.value.trim();

    if (calleValue.length < 5 || calleValue.length > 70) {
        mostrarMensajeValidacion(calleInput, 'La calle debe tener entre 5 y 70 caracteres.');
        return false;
    } else {
        ocultarMensajeValidacion(calleInput);
        return true;
    }
}

// Validar Campo numeracion
var numeracionInput = document.getElementById('numeracion');
var numeracionValidationMessage = document.getElementById('numeracionValidationMessage');

numeracionInput.addEventListener('input', function() {
    validarNumeracion(); // Llamamos a la función de validación en cada entrada
});

function validarNumeracion() {
    var numeracionValue = numeracionInput.value.trim();

    // Se valida que el valor sea numérico y que no sea nulo
    if (isNaN(numeracionValue) || numeracionValue === '') {
        mostrarMensajeValidacion(numeracionInput, 'La numeración no puede quedar vacía. Campo Obligatorio.');
        return false;
    } else {
        ocultarMensajeValidacion(numeracionInput);
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
    
    if (validarNombres() && validarApellidos() && validarTelefono() && validarComuna() && validarCalle() && validarNumeracion()) {
        // Todas las validaciones son exitosas, enviar el formulario
        document.getElementById('formularioRegistroCliente').submit();
    } else {
        // Al menos una validación falló, mostrar mensaje de error
        mostrarMensajeError('Campos requeridos incompletos');
    }
}











