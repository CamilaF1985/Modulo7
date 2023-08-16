function actualizarPrecioTotal(checkboxes) {
    const cantidadesInput = document.querySelector('.cantidades-input');
    const precioElement = document.getElementById('precioTotal');

    const cantidadInputs = cantidadesInput.value.split(',');
    const precios = [];

    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            const precio = parseFloat(checkboxes[i].getAttribute('data-precio'));
            precios.push(precio);
        }
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
    const checkboxes = document.querySelectorAll('input[name="productoIds"]');
    actualizarPrecioTotal(checkboxes);
});

const checkboxes = document.querySelectorAll('input[name="productoIds"]');
checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', () => {
        const checkboxes = document.querySelectorAll('input[name="productoIds"]:checked');
        actualizarPrecioTotal(checkboxes);
    });
});

actualizarPrecioTotal(document.querySelectorAll('input[name="productoIds"]:checked'));


