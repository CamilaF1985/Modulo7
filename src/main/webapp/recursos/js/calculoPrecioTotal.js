// Función para actualizar el precio total basado en las selecciones y cantidades
function actualizarPrecioTotal() {
	// Obtener el elemento donde se muestra el precio total
	const precioElement = document.getElementById('precioTotal');

	// Obtener todos los checkboxes seleccionados de productos
	const checkboxes = document.querySelectorAll('input[name="productoIds"]:checked');

	let precioTotal = 0;
	const cantidades = []; // Almacenar las cantidades de los productos seleccionados

	// Recorrer cada checkbox seleccionado
	checkboxes.forEach(checkbox => {
		// Obtener el precio del producto desde el atributo "data-precio"
		const precio = parseFloat(checkbox.getAttribute('data-precio'));

		// Obtener el input de cantidad asociado a este producto
		const cantidadInput = document.querySelector(`input[name="cantidades[${checkbox.value}]"]`);

		// Obtener la cantidad y asegurarse de que sea un número válido
		const cantidad = parseInt(cantidadInput.value) || 0;

		// Imprimir los valores para depuración
		console.log(`Producto: ${checkbox.value}, Cantidad: ${cantidad}, Precio: ${precio}`);

		// Calcular el total del producto y agregarlo al total general
		precioTotal += cantidad * precio;
		cantidades.push(cantidad); // Agregar la cantidad a la lista de cantidades
	});

	// Mostrar el precio total con dos decimales
	precioElement.textContent = precioTotal.toFixed(2);

	// Asignar las cantidades al input oculto antes de enviar el formulario
	const cantidadesInput = document.querySelector('.cantidades-input');
	cantidadesInput.value = cantidades.join(','); // Unir las cantidades con comas
}

// Obtener todos los checkboxes de productos
const checkboxes = document.querySelectorAll('input[name="productoIds"]');
// Agregar un listener para actualizar el precio total cuando cambie la selección
checkboxes.forEach(checkbox => {
	checkbox.addEventListener('change', () => {
		actualizarPrecioTotal();
	});
});

// Obtener todos los inputs de cantidad
const cantidadInputs = document.querySelectorAll('.cantidad-input');
// Agregar un listener para actualizar el precio total cuando cambie la cantidad
cantidadInputs.forEach(input => {
	input.addEventListener('input', () => {
		actualizarPrecioTotal();
	});
});
// Función para validar que al menos un producto ha sido seleccionado con cantidad
function validarProductosSeleccionados() {
    const checkboxes = document.querySelectorAll('input[name="productoIds"]:checked');
    let alMenosUnProductoSeleccionado = false;

    checkboxes.forEach(checkbox => {
        const cantidadInput = document.querySelector(`input[name="cantidades[${checkbox.value}]"]`);
        const cantidad = parseInt(cantidadInput.value) || 0;

        if (cantidad > 0) {
            alMenosUnProductoSeleccionado = true;
        }
    });

    return alMenosUnProductoSeleccionado;
}

// Función para validar que todos los campos estén completos
function validarFormularioCompletoPedido() {
    const checkboxes = document.querySelectorAll('input[name="productoIds"]:checked');
    if (checkboxes.length === 0) {
        return false; // Ningún producto seleccionado
    }

    // Puedes agregar más validaciones para otros campos aquí si es necesario
    return true; // Todos los campos están completos
}

// Obtener el formulario
const formularioPedido = document.getElementById('formularioCrearPedido');

// Función para mostrar mensaje de error
function mostrarMensajeError(mensaje) {
    Swal.fire({
        icon: 'error',
        title: 'Error en el ingreso de tu pedido',
        text: mensaje,
    });
}

formularioPedido.addEventListener('submit', function(event) {
    event.preventDefault();

    if (!validarFormularioCompletoPedido() || !validarProductosSeleccionados()) {
        // Utiliza la función personalizada para mostrar el mensaje de error
        mostrarMensajeError('Selecciona al menos un producto y su cantidad correspondiente.');
    } else {
        // Continuar con el envío del formulario
        this.submit();
    }
});













