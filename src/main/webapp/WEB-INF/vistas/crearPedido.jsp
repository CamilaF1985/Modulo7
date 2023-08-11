<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Crear Pedido</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/sushipe/res/css/styles.css">
<!-- Agrega esta línea -->
</head>

<body>
	<%@ include file='navbar.jsp'%>
	<div class="contacto" style="display: flex; justify-content: center;">

		<form action="crearPedido" method="post" class="mb-5 mt-5">
			<h1 class="tituloContacto">Crear Pedido</h1>

			<div class="form-group">
				<label for="clienteId">Seleccionar Cliente:</label> <br> <select
					name="clienteId">
					<c:forEach var="cliente" items="${clientes}">
						<option value="${cliente.id}">${cliente.nombres}
							${cliente.apellidos}</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<label>Cantidad:</label> <select name="productoId"
					onchange="actualizarPrecioTotal(this)">
					<c:forEach var="producto" items="${productos}">
						<option value="${producto.id}" data-precio="${producto.precio}">
							${producto.nombre}</option>
					</c:forEach>
				</select> <input type="number" class="form-control cantidad-input"
					name="cantidad" min="0" value="0">
			</div>


			<div class="form-group">
				<label for="indicaciones">Indicaciones:</label> <br>
				<textarea class="form-control" name="indicaciones"></textarea>
			</div>

			<div class="form-group">
				<label for="precioTotal">Precio Total:</label> <span
					id="precioTotal">0.00</span>
			</div>

			<div style="display: flex; justify-content: center;" class="mb-5">
				<input type="submit" value="Enviar Pedido" class="boton-enviar">
			</div>
		</form>
	</div>

	<script src="/sushipe/res/js/calculoPrecioTotal.js"></script>
	<%@ include file='footer.jsp'%>
	<!-- Incluir el footer -->

</body>
</html>
