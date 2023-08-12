<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="/sushipe/res/css/styles.css">

<meta charset="UTF-8">

<title>Registro de Administrador</title>
</head>

<body>
	<%@ include file='navbar.jsp'%>

	<div class="contacto" style="display: flex; justify-content: center;">

		<form action="/sushipe/registroAdministrador" method="post"
			class="mb-5 mt-5">
			<h1 class="tituloContacto">Ingresa tus datos</h1>

			<div class="form-group">
				<div class="campo">
					<label for="rut">Rut:</label> <input type="number"
						id="rut" name="rut"> <span
						id="rutValidationMessage" class="validation-message"></span>
				</div>
			</div>

			<div class="form-group">
				<div class="campo">
					<label for="nombres">Nombres:</label> <input type="text"
						id="nombres" name="nombres"> <span
						id="nombresValidationMessage" class="validation-message"></span>
				</div>
			</div>

			<div class="form-group">
				<div class="campo">
					<label for="apellidos">Apellidos:</label> <input type="text"
						id="apellidos" name="apellidos"> <span
						id="apellidosValidationMessage" class="validation-message"></span>
				</div>
			</div>



			<div class="form-group">
				<div class="campo">
					<label for="fechaIngreso">Fecha de Ingreso:</label> <input type="text" id="fechaIngreso"
						name="fechaIngreso"> <span id="fechaIngresoValidationMessage"
						class="validation-message"></span>
				</div>
			</div>

			<!-- Agrega un campo oculto para enviar el usuarioId -->
			<input type="hidden" id="usuarioId" name="usuarioId"
				value="${usuarioId}">


			<div style="display: flex; justify-content: center;" class="mb-5">
				<input type="submit" value="Registrar" class="boton-enviar">
			</div>


		</form>

	</div>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="/sushipe/res/js/validacionesRegistroAdministrador.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous">
		
	</script>

	<%@ include file='footer.jsp'%>

</body>

</html>