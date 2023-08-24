<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="/sushipe/res/css/styles.css">
</head>

<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 error-container">
				<h1>Error!</h1>
				<p>Usuario o contraseña incorrecto, intente nuevamente...</p>
				<!-- Agregar imagen vinculada desde la carpeta "img" en el proyecto -->
				<div>
					<img src="/sushipe/res/img/gato negro.jpg" alt="gato negro">
				</div>
				<p>Serás redirigido automáticamente al inicio de sesión en 5
					segundos.</p>
			</div>
		</div>
	</div>

	<%@ include file='footer.jsp'%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>

	<script src="/sushipe/res/js/error.js"></script>
</body>
</html>


