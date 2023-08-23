<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Crear Pedido</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="/sushipe/res/css/styles.css">

</head>
<body>

<%@ include file='navbar.jsp'%>
<div class="contacto-container">
	<div class="contacto" style="display: flex; justify-content: center;">

		<form action="crearPedido" method="post" class="mt-5 mb-5">
			<h1 class="tituloContacto mb-5 custom-h1"
				style="margin-left: auto; margin-right: auto; height: auto; display: table;">Crear
				Pedido</h1>

			<!-- Campo oculto para enviar el clienteId -->
			<input type="hidden" name="clienteId" value="${cliente.id}">
			<input type="hidden" name="fechaIngreso"
				value="<%=java.time.LocalDateTime.now()%>"> <input
				type="hidden" name="fechaDespacho" value="">

			<!-- Sección para seleccionar productos y cantidades -->
			<div class="form-group"
				style="margin-left: auto; margin-right: auto; display: table;">
				<label class="mb-3 col-md-12 mb-2 custom-label">Selecciona
					los productos e introduce las cantidades:</label> <br>
				<div class="row">
					<c:set var="currentCategory" value="" />

					<c:forEach var="producto" items="${productos}">
						<c:if test="${producto.categoria ne currentCategory}">
							<!-- Mostrar la categoría solo si es diferente de la anterior -->
							<div class="col-12 mt-5">
								<h3 class="custom-h3">${producto.categoria}</h3>
							</div>
							<c:set var="currentCategory" value="${producto.categoria}" />
						</c:if>

						<div class="col-md-3 col-sm-6 col-xs-6 mt-2">
							<div class="producto-cantidad">
								<label> <!-- Checkbox para seleccionar el producto --> <input
									type="checkbox" name="productoIds" value="${producto.id}"
									data-precio="${producto.precio}"> ${producto.nombre}
								</label> <img src="${producto.imagenUrl}" alt="${producto.nombre}"
									class="product-image">
								<div class="input-group small-input-group mt-2">
									<!-- Campo para ingresar la cantidad del producto -->
									<input type="number"
										class="form-control form-control-sm cantidad-input"
										name="cantidades[${producto.id}]" placeholder="Cantidad">
								</div>
								<!-- Campo oculto para enviar el id del detalle del producto -->
								<input type="hidden" name="detallesProductoIds[${producto.id}]"
									value="${pedidosProductosMap[producto.id].id}">
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- Sección para indicaciones del pedido -->
			<div class="form-group mt-5"
				style="margin-left: auto; margin-right: auto; display: table;">
				<label for="indicaciones">Indicaciones ("sin queso crema",
					"soya extra", etc.):</label><br>
				<textarea class="form-control" name="indicaciones"
					style="max-width: 600px;"></textarea>
			</div>

			<!-- Sección para mostrar el precio total -->
			<div class="form-group mt-4"
				style="margin-left: auto; margin-right: auto; display: table;">
				<label for="precioTotal">Precio Total:</label> <span
					id="precioTotal">0.00</span>
			</div>

			<!-- Botón para enviar el pedido -->
			<div style="display: flex; justify-content: center;" class="mb-5">
				<input type="submit" value="Enviar Pedido" class="boton-enviar">
			</div>
		</form>
	</div>
	</div>

	<script src="/sushipe/res/js/calculoPrecioTotal.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</body>
</html>







