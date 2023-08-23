<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Enlace al archivo de estilos personalizados -->
<link rel="stylesheet" type="text/css" href="/sushipe/res/css/styles.css">

<title>Login</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<%
	// Verifica si hay un error de autenticación
	String error = (String) request.getAttribute("error");
	if (error != null && error.equals("true")) {
		// Código JavaScript para mostrar la alerta de error
		out.println("<script>Swal.fire('Error de Autenticación', 'Verifica tus credenciales', 'error');</script>");
	}
	%>

	<!-- Contenedor del logotipo -->
	<div class="logo-container mb-4">
		<img src="/sushipe/res/img/logo-sushipe.png" alt="logo de la empresa"
			style="max-width: 200px;">
	</div>

	<div class="contacto" style="display: flex; justify-content: center;">
		<!-- Sección del formulario de inicio de sesión -->
		<section class="form-login">
			<h1 class="tituloContacto">Ingresa</h1>
			<form name="loginForm" class="form"
				action="${pageContext.request.contextPath}/login" method="post">
				<div class="campo">
					<label for="username" class="mb-2">Usuario:</label>
					<input class="form-control" type="text" name="username"
						placeholder="Introduce nombre">
				</div>
				<div class="campo">
					<label for="password" class="mb-2">Clave de acceso:</label>
					<input class="form-control" type="password" name="password"
						placeholder="Introduce contraseña">
				</div>
				<div style="display: flex; justify-content: center;" class="mb-5">
					<input type="submit" value="Enviar" class="boton-enviar">
				</div>
			</form>
		</section>
	</div>

	<!-- Inclusión de la librería SweetAlert2 y el script de validaciones personalizadas -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="/sushipe/res/js/validaciones.js"></script>
	<!-- Inclusión de la librería Bootstrap con JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>























