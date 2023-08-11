<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Ver Pedidos - Administrador</title>
<link rel="stylesheet" href="ruta_a_tu_estilo.css">
</head>
<body>
	<%@ include file='navbar.jsp'%>
	<!-- Incluir la barra de navegación del administrador -->

	<div class="container">
		<h1>Lista de Pedidos</h1>
		<table class="table">
			<thead>
				<tr>
					<th>ID del Pedido</th>
					<th>Cliente</th>
					<th>Productos Solicitados</th>
					<th>Cantidad</th>
					<th>Precio Total</th>
					<th>Indicaciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pedido" items="${pedidos}">
					<tr>
						<td>${pedido.productoId}</td>
						<td>${pedido.clienteNombres}${pedido.clienteApellidos}</td>
						<td>${pedido.productoNombre}</td>
						<td>${pedido.cantidad}</td>
						<td>${pedido.precioTotal}</td>
						<td>${pedido.indicaciones}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

	<%@ include file='footer.jsp'%>
	<!-- Incluir el pie de página -->

</body>
</html>

