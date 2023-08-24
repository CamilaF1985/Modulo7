<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Incluir el archivo CSS de Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<!-- Incluir archivo de estilos personalizados -->
<link rel="stylesheet" type="text/css"
	href="/sushipe/res/css/styles.css">

<!-- Configurar codificación de caracteres -->
<meta charset="UTF-8">

<!-- Establecer título de la página -->
<title>Editar Cliente</title>
</head>

<body>
	<%@ include file='navbar.jsp'%>

	<!-- Contenedor para el formulario de edición de cliente -->
	<div class="contacto" style="display: flex; justify-content: center;">
		<form action="/sushipe/editarCliente" method="post" class="mb-5 mt-5">
			<h1 class="tituloContacto">Edita tu información</h1>

			<div class="form-group">
				<div class="campo">
					<label for="telefono">Teléfono:</label> <input type="text"
						id="telefono" name="telefono" value="${cliente.telefono}"
						class="form-control" required>
				</div>
			</div>

			<div class="form-group">
				<div class="campo">
					<label for="comuna">Comuna:</label> <input type="text" id="comuna"
						name="comuna" value="${cliente.comuna}" class="form-control"
						required>
				</div>
			</div>

			<div class="form-group">
				<div class="campo">
					<label for="calle">Calle:</label> <input type="text" id="calle"
						name="calle" value="${cliente.calle}" class="form-control"
						required>
				</div>
			</div>

			<div class="form-group">
				<div class="campo">
					<label for="numeracion">Numeración:</label> <input type="number"
						id="numeracion" name="numeracion" value="${cliente.numeracion}"
						class="form-control" required>
				</div>
			</div>

			<div class="form-group">
				<div class="campo">
					<label for="indicaciones">Indicaciones:</label>
					<textarea id="indicaciones" name="indicaciones" rows="4"
						class="form-control">${cliente.indicaciones}</textarea>
				</div>
			</div>

			<div class="form-group">
				<div style="display: flex; justify-content: center;" class="mb-5">
					<input type="submit" value="Guardar Cambios" class="boton-enviar">
				</div>
			</div>
		</form>
	</div>

	<!-- Incluir archivo JavaScript de Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>

	<%@ include file='footer.jsp'%>
</body>
</html>



