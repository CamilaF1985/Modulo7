<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Agrega esta línea -->
<title>Ver Pedidos - Administrador</title>
<link rel="stylesheet" type="text/css"
	href="/sushipe/res/css/styles.css">
</head>
<body>
	<%@ include file='navbar.jsp'%>
	<!-- Incluir la barra de navegación del administrador -->

	<div class="container">
		<h1>Lista de Pedidos</h1>
		<div class="table-responsive">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>ID</th>
					<th>Cliente</th>
					<th>Dirección</th>
					<th>Productos Solicitados</th>
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
						<td><br>${pedido.cliente.nombres}<br>${pedido.cliente.apellidos}</td>
						<td><br>${pedido.cliente.calle}<br>${pedido.cliente.numeracion}<br>${pedido.cliente.indicaciones}</td>
						<td>
							<ul>
								<c:forEach var="pp" items="${pedido.pedidosProductos}">
									<br>
									<li>${pp.producto.nombre}(Cantidad:${pp.cantidad})</li>
								</c:forEach>
							</ul>
						</td>
						<td><br>${pedido.precioTotal}</td>
						<td class="contador" id="contador-${pedido.id}"
							data-fechaIngreso="${pedido.fechaIngreso}"
							data-estado="${pedido.estado}">0.00</td>
						<td><br>${pedido.fechaIngreso.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))}</td>
						<td><br>${pedido.fechaDespacho.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))}</td>
						<td><br>${pedido.estado}</td>
						<td class="formulario-celda"><c:choose>
								<c:when test="${pedido.estado ne 'Despachado'}">
									<form action="/sushipe/actualizarEstadoPedido" method="post"
										class="formulario-inline" accept-charset="UTF-8">
										<input type="hidden" name="Id" value="${pedido.id}"> <label>
											<input type="checkbox" class="estado-checkbox"
											name="nuevoEstado" value="En Preparación"
											data-pedido-id="${pedido.id}"> En Preparación
										</label> <label> <input type="checkbox"
											class="estado-checkbox" name="nuevoEstado" value="En Reparto"
											data-pedido-id="${pedido.id}"> En Reparto
										</label> <label> <input type="checkbox"
											class="estado-checkbox" name="nuevoEstado" value="Despachado"
											data-pedido-id="${pedido.id}"> Despachado
										</label>
										<button type="submit">Actualizar Estado</button>
									</form>
								</c:when>
								<c:otherwise>Despachado</c:otherwise>
							</c:choose></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
	<div id="pedidos-data" data-pedidos="${pedidosJson}"
		style="display: none;"></div>

	<script src="/sushipe/res/js/verPedidos.js"></script>

</body>
</html>


