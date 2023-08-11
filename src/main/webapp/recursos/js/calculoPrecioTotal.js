
    function actualizarPrecioTotal(selectElement) {
        const cantidadInput = document.querySelector('.cantidad-input');
        const precioElement = document.getElementById('precioTotal');

        const cantidad = parseInt(cantidadInput.value);
        const precio = parseFloat(selectElement.options[selectElement.selectedIndex].getAttribute('data-precio'));

        if (!isNaN(cantidad) && !isNaN(precio)) {
            const precioTotal = cantidad * precio;
            precioElement.textContent = precioTotal.toFixed(2);
        }
    }

    const cantidadInput = document.querySelector('.cantidad-input');
    cantidadInput.addEventListener('input', () => {
        const selectElement = document.querySelector('select[name="productoId"]');
        actualizarPrecioTotal(selectElement);
    });
    actualizarPrecioTotal(document.querySelector('select[name="productoId"]'));
