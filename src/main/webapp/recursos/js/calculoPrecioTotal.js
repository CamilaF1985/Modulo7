function actualizarPrecioTotal(selectElement) {
    const cantidadesInput = document.querySelector('.cantidades-input');
    const precioElement = document.getElementById('precioTotal');

    const cantidadInputs = cantidadesInput.value.split(',');
    const precios = [];

    for (let i = 0; i < selectElement.selectedOptions.length; i++) {
        const precio = parseFloat(selectElement.selectedOptions[i].getAttribute('data-precio'));
        precios.push(precio);
    }

    let precioTotal = 0;

    for (let i = 0; i < cantidadInputs.length; i++) {
        const cantidad = parseInt(cantidadInputs[i]);
        if (!isNaN(cantidad) && !isNaN(precios[i])) {
            precioTotal += cantidad * precios[i];
        }
    }

    precioElement.textContent = precioTotal.toFixed(2);
}

const cantidadesInput = document.querySelector('.cantidades-input');
cantidadesInput.addEventListener('input', () => {
    const selectElement = document.querySelector('select[name="productoIds"]');
    actualizarPrecioTotal(selectElement);
});
actualizarPrecioTotal(document.querySelector('select[name="productoIds"]'));

