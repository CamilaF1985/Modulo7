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









