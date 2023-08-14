<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html>
<head>
<title>Ver Pedidos - Administrador</title>
<link rel="stylesheet" type="text/css"
	href="/sushipe/res/css/styles.css">
</head>
<body>
	<%@ include file='navbar.jsp'%>
	<!-- Incluir la barra de navegación del administrador -->

	<div class="container">
		<h1>Lista de Pedidos</h1>
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Cliente</th>
					<th>Dirección</th>
					<th>Productos Solicitados</th>
					<th>Cantidad</th>
					<th>Precio Total</th>
					<th>Tiempo Transcurrido</th>
					<th>Fecha de Ingreso</th>
					<th>Fecha de Despacho</th>
					<th>Estado</th>
					<th>Actualizar Estado</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pedido" items="${pedidos}">
					<tr>
						<td><br>${pedido.id}</td>
						<td><br>${pedido.clienteNombres}<br>${pedido.clienteApellidos}</td>
						<td><br>${pedido.clienteCalle}<br>${pedido.clienteNumeracion}
							<br>${pedido.clienteIndicaciones}</td>
						<td><br>${pedido.productoNombre}</td>
						<td><br>${pedido.cantidad}</td>
						<td><br>${pedido.precioTotal}</td>
						<td class="contador" id="contador-${pedido.id}"
							data-fechaIngreso="${pedido.fechaIngreso}"
							data-estado="${pedido.estado}">0.00 <!-- Agregar el salto de línea aquí -->
						</td>

						<td><br>${pedido.fechaIngreso.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))}</td>
						<td><br>${pedido.fechaDespacho.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))}</td>

						<td><br>${pedido.estado}</td>

						<td class="formulario-celda"><br><c:choose>
								<c:when test="${pedido.estado ne 'Despachado'}">
									<form action="/sushipe/actualizarEstadoPedido" method="post"
										class="formulario-inline">
										<input type="hidden" name="Id" value="${pedido.id}"> <select
											name="nuevoEstado">
											<option value="En Preparación">En Preparación</option>
											<option value="En Reparto">En Reparto</option>
											<option value="Despachado">Despachado</option>
										</select>
										<button type="submit">Actualizar Estado</button>
									</form>
								</c:when>
								<c:otherwise>
                    Despachado
                </c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
	<div id="pedidos-data" data-pedidos="${pedidosJson}"
		style="display: none;"></div>


	<%@ include file='footer.jsp'%>
	<!-- Incluir el pie de página -->

	<script src="/sushipe/res/js/verPedidos.js"></script>

</body>
</html>

