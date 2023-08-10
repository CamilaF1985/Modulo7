<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Crear Pedido</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>Crear Pedido</h1>
		<form action="crearPedido" method="post">
			<div class="mb-3">
				<label for="clienteId">Cliente:</label> <select class="form-select"
					name="clienteId" id="clienteId">
					<c:forEach var="cliente" items="${clientes}">
						<option value="${cliente.id}">${cliente.nombres}
							${cliente.apellidos}</option>
					</c:forEach>
				</select>
			</div>
			<div class="mb-3">
				<label for="productoId">Producto:</label> <select
					class="form-select" name="productoId" id="productoId">
					<c:forEach var="producto" items="${productos}">
						<option value="${producto.id}">${producto.nombre}-${producto.categoria}
							${producto.precio}</option>
					</c:forEach>
				</select>
			</div>

			<div class="mb-3">
				<label for="cantidad">Cantidad:</label> <input type="number"
					class="form-control" name="cantidad" id="cantidad" min="1">
			</div>
			<div class="mb-3">
				<label for="indicaciones">Indicaciones:</label>
				<textarea class="form-control" name="indicaciones" id="indicaciones"></textarea>
			</div>

			<div class="mb-3">
				<label for="precioTotal">Precio Total:</label> <span
					id="precioTotal">0.00</span>
			</div>

			<button type="submit" class="btn btn-primary">Crear Pedido</button>
		</form>
	</div>

	<!-- Agrega el siguiente script en tu formulario -->
	<script>
		// Función para calcular el precio total en tiempo real
		function calcularPrecioTotal() {
			const productoSelect = document.getElementById('productoId');
			const cantidadInput = document.getElementById('cantidad');
			const precioElement = document.getElementById('precioTotal');

			const selectedOption = productoSelect.options[productoSelect.selectedIndex];
			const precioProducto = parseFloat(selectedOption
					.getAttribute('data-precio'));
			const cantidad = parseInt(cantidadInput.value);

			if (!isNaN(precioProducto) && !isNaN(cantidad)) {
				const precioTotal = precioProducto * cantidad;
				precioElement.textContent = precioTotal.toFixed(2);
			} else {
				precioElement.textContent = '0.00';
			}
		}

		// Asociar la función al cambio de selección y al cambio de cantidad
		document.getElementById('productoId').addEventListener('change',
				calcularPrecioTotal);
		document.getElementById('cantidad').addEventListener('input',
				calcularPrecioTotal);

		// Calcular el precio total inicial
		calcularPrecioTotal();
	</script>

</body>
</html>

