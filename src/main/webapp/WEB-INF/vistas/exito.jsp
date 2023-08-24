<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Éxito</title>

<!-- Incluir el archivo CSS de Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<!-- Hoja de estilo -->
<link rel="stylesheet" type="text/css"
	href="/sushipe/res/css/styles.css">

</head>
<body>

	<div class="exito-container">
		<h1>Éxito!</h1>
		<p>Su pedido ha sido ingresado con éxito</p>
		<!-- Agregar imagen vinculada desde la carpeta "img" en el proyecto -->
		<div style="text-align: center;">
			<img src="/sushipe/res/img/gato de la suerte.jpg"
				alt="Imagen de éxito">
		</div>
		<p>Redireccionando...</p>
	</div>

	<%@ include file='footer.jsp'%>


	<!-- Incluir archivo JavaScript de Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<script>
		// Redireccionar automáticamente a /sushipe/ después de 5 segundos (5000 milisegundos)
		setTimeout(function() {
			window.location.href = "/sushipe/";
		}, 5000);
	</script>
</body>
</html>

