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

// Variables de campos de validación
var userInput = document.getElementById('user');
var passwordInput = document.getElementById('password');
var emailInput = document.getElementById('email');
var rolInput = document.getElementById('rol');
var tipoInput = document.getElementById('tipo');

// Validar Campo user
userInput.addEventListener('input', function() {
	validarUser(); // Llamamos a la función de validación en cada entrada
});

function validarUser() {
	var userValue = userInput.value.trim();

	if (userValue.length < 5 || userValue.length > 12) {
		mostrarMensajeValidacion(userInput, 'El usuario debe tener entre 5 y 12 caracteres.');
		return false;
	} else {
		ocultarMensajeValidacion(userInput);
		return true;
	}
}

// Validar Campo password
passwordInput.addEventListener('input', function() {
	validarPassword(); // Llamamos a la función de validación en cada entrada
});

function validarPassword() {
	var passwordValue = passwordInput.value.trim();

	if (passwordValue.length < 4) {
		mostrarMensajeValidacion(passwordInput, 'La contraseña debe tener al menos 4 caracteres.');
		return false;
	} else {
		ocultarMensajeValidacion(passwordInput);
		return true;
	}
}

// Validar Campo email
emailInput.addEventListener('input', function() {
	validarEmail(); // Llamamos a la función de validación en cada entrada
});

function validarEmail() {
	var emailValue = emailInput.value.trim();

	if (!emailValue.includes('@')) {
		mostrarMensajeValidacion(emailInput, 'El email debe contener el carácter "@"');
		return false;
	} else {
		ocultarMensajeValidacion(emailInput);
		return true;
	}
}

// Validar Campo tipo
tipoInput.addEventListener('input', function() {
    validarTipo(); // Llamamos a la función de validación en cada entrada
});

function validarTipo() {
    var tipoValue = tipoInput.value;

    if (tipoValue === '') {
        mostrarMensajeValidacion(tipoInput, 'Selecciona un tipo.');
        return false;
    } else {
        ocultarMensajeValidacion(tipoInput);
        actualizarRolesSegunTipo(); // Actualizamos los roles según el tipo seleccionado
        return true;
    }
}

function actualizarRolesSegunTipo() {
    var rolValue = tipoInput.value === 'Cliente' ? 'ROLE_cliente' : 'ROLE_administrador';
    rolInput.value = rolValue;
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

	if (validarUser() && validarPassword() && validarEmail() && validarTipo()) {
		// Todas las validaciones son exitosas, enviar el formulario
		document.getElementById('formularioRegistroUsuario').submit();
	} else {
		// Al menos una validación falló, mostrar mensaje de error
		mostrarMensajeError('Campos requeridos incompletos');
	}
}






