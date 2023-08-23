<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<!-- Enlace al archivo CSS de Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM">

<!-- Enlace al archivo de estilos personalizados -->
<link rel="stylesheet" type="text/css"
	href="/sushipe/res/css/styles.css">

<meta charset="UTF-8">

<title>Registro de Usuario</title>
</head>

<body>
	<%@ include file='navbar.jsp'%>

	<div class="contacto" style="display: flex; justify-content: center;">

		<form id="formularioRegistroUsuario" action="/sushipe/registroUsuario"
			method="post" class="mb-5 mt-5" onsubmit="validarFormulario(event)">
			<!-- Título del formulario -->
			<h1 class="tituloContacto">Ingresa tus datos</h1>

			<!-- Sección de ingreso de usuario -->
			<div class="form-group">
				<div class="campo">
					<label for="user">Usuario:</label> <input type="text" id="user"
						name="user" required> <span id="userValidationMessage"
						class="validation-message"></span>
				</div>
			</div>

			<!-- Sección de ingreso de contraseña -->
			<div class="form-group">
				<div class="campo">
					<label for="password">Contraseña:</label> <input type="password"
						id="password" name="password" required> <span
						id="passwordValidationMessage" class="validation-message"></span>
				</div>
			</div>

			<!-- Sección de ingreso de email -->
			<div class="form-group">
				<div class="campo">
					<label for="email">Email:</label> <input type="email" id="email"
						name="email" required> <span id="emailValidationMessage"
						class="validation-message"></span>
				</div>
			</div>

			<!-- Sección de selección de tipo -->
			<div class="form-group">
				<div class="campo">
					<label for="tipo">Tipo:</label> <select id="tipo" name="tipo"
						required>
						<option value="Cliente">Cliente</option>
						<option value="Administrador">Administrador</option>
					</select> <span id="tipoValidationMessage" class="validation-message"></span>
				</div>
			</div>

			<input type="hidden" id="rol" name="rol" value="">

			<div style="display: flex; justify-content: center;" class="mb-5">
				<input type="submit" value="Registrar" class="boton-enviar">
			</div>
		</form>
	</div>

	<!-- Inclusión de la librería SweetAlert2 y el script de validaciones personalizado -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="/sushipe/res/js/validacionesRegistroUsuario.js"></script>

	<!-- Inclusión de la librería Bootstrap con JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<%@ include file='footer.jsp'%>

</body>

</html>


