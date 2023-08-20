function actualizarPrecioTotal() {
    const precioElement = document.getElementById('precioTotal');
    const checkboxes = document.querySelectorAll('input[name="productoIds"]:checked');

    let precioTotal = 0;
    const cantidades = [];

    checkboxes.forEach(checkbox => {
        const precio = parseFloat(checkbox.getAttribute('data-precio'));
        const cantidadInput = document.querySelector(`input[name="cantidades[${checkbox.value}]"]`);
        const cantidad = parseInt(cantidadInput.value) || 0;

        console.log(`Producto: ${checkbox.value}, Cantidad: ${cantidad}, Precio: ${precio}`); // Imprimir los valores

        precioTotal += cantidad * precio;
        cantidades.push(cantidad); // Agregar la cantidad a la lista de cantidades
    });

    precioElement.textContent = precioTotal.toFixed(2);

    // Asigna el valor de las cantidades al input oculto antes de enviar el formulario
    const cantidadesInput = document.querySelector('.cantidades-input');
    cantidadesInput.value = cantidades.join(','); // Une las cantidades con comas
}

const checkboxes = document.querySelectorAll('input[name="productoIds"]');
checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', () => {
        actualizarPrecioTotal();
    });
});

const cantidadInputs = document.querySelectorAll('.cantidad-input');
cantidadInputs.forEach(input => {
    input.addEventListener('input', () => {
        actualizarPrecioTotal();
    });
});








