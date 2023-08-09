<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Éxito</title>
<!-- Hoja de estilo -->
<link rel="stylesheet" type="text/css"
	href="/sushipe/res/css/styles.css">
	
</head>
<body>

	<div class="exito-container">
		<h1>Éxito!</h1>
		<p>Registro exitoso</p>
		<!-- Agregar imagen vinculada desde la carpeta "img" en el proyecto -->
		<div style="text-align: center;">
			<img src="/sushipe/res/img/gato de la suerte.jpg"
				alt="Imagen de éxito">
		</div>
		<p>Redireccionando...</p>
	</div>

	<%@ include file='footer.jsp'%>
	<!-- Si tienes un pie de página, inclúyelo aquí -->

	<script>
		// Redireccionar automáticamente a /sushipe/ después de 5 segundos (5000 milisegundos)
		setTimeout(function() {
			window.location.href = "/sushipe/";
		}, 5000);
	</script>
</body>
</html>

