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

		<form action="crearPedido" method="post" class="mt-4 mb-5 mx-4">
			<h1 class="tituloContacto mb-5 custom-h1"
				style="margin-left: auto; margin-right: auto; display: table;">Crear
				Pedido</h1>

			<!-- Agrega un campo oculto para enviar el clienteId -->
			<input type="hidden" name="clienteId" value="${cliente.id}">
			<input type="hidden" name="fechaIngreso"
				value="<%=java.time.LocalDateTime.now()%>"> <input
				type="hidden" name="fechaDespacho" value="">

			<div class="form-group"
				style="margin-left: auto; margin-right: auto; display: table;">
				<label class="mb-3 col-md-12 mb-2 custom-label">Selecciona
					los productos e introduce las cantidades:</label> <br>
				<div class="row">
					<c:set var="currentCategory" value="" />

					<c:forEach var="producto" items="${productos}">
						<c:if test="${producto.categoria ne currentCategory}">
							<div class="col-12 mt-3">
								<h3>${producto.categoria}</h3>
							</div>
							<c:set var="currentCategory" value="${producto.categoria}" />
						</c:if>

						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="producto-cantidad">
								<label> <input type="checkbox" name="productoIds"
									value="${producto.id}" data-precio="${producto.precio}">
									${producto.nombre}
								</label>
								<div class="input-group small-input-group">
									<input type="number"
										class="form-control form-control-sm cantidad-input"
										name="cantidades[${producto.id}]" placeholder="Cantidad">
								</div>
								<input type="hidden" name="detallesProductoIds[${producto.id}]"
									value="${pedidosProductosMap[producto.id].id}">
							</div>
						</div>
					</c:forEach>
				</div>
			</div>


			<div class="form-group mt-4"
				style="margin-left: auto; margin-right: auto; display: table;">
				<label for="indicaciones">Indicaciones ("sin queso crema",
					"soya extra", etc.):</label><br>
				<textarea class="form-control" name="indicaciones"
					style="max-width: 600px;"></textarea>
			</div>

			<div class="form-group mt-4"
				style="margin-left: auto; margin-right: auto; display: table;">
				<label for="precioTotal">Precio Total:</label> <span
					id="precioTotal">0.00</span>
			</div>

			<div style="display: flex; justify-content: center;" class="mb-5">
				<input type="submit" value="Enviar Pedido" class="boton-enviar">
			</div>
		</form>
	</div>

	<script src="/sushipe/res/js/calculoPrecioTotal.js"></script>
</body>
</html>




