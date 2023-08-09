<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Codificación de Caracteres -->
<meta charset="UTF-8">

<!-- Configuración inicial de ancho y escala -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Título de la página -->
<title>Inicio</title>

<%@ include file="navbar.jsp"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.css" />

<!-- Hoja de estilo -->
<link rel="stylesheet" type="text/css"
	href="/sushipe/res/css/styles.css">
</head>
<body>

	<div class="gallery">
		<a href="/sushipe/res/img/acevichado-roll.jpg" data-fancybox="gallery"
			data-caption="Acevichado roll"> <img
			src="/sushipe/res/img/acevichado-roll.jpg" alt="Acevichado roll">
		</a> <a href="/sushipe/res/img/california-pe.jpg" data-fancybox="gallery"
			data-caption="California pe"> <img
			src="/sushipe/res/img/california-pe.jpg" alt="California pe">
		</a> <a href="/sushipe/res/img/sakana-tataki.jpg" data-fancybox="gallery"
			data-caption="Sakana tataki"> <img
			src="/sushipe/res/img/sakana-tataki.jpg" alt="Sakana Tataki">
		</a> <a href="/sushipe/res/img/temaki.jpg" data-fancybox="gallery"
			data-caption="Temaki"> <img src="/sushipe/res/img/temaki.jpg"
			alt="Temaki">
		</a> <a href="/sushipe/res/img/Tai-roll.jpg" data-fancybox="gallery"
			data-caption="Tai roll"> <img
			src="/sushipe/res/img/Tai-roll.jpg" alt="Tai roll">
		</a> <a href="/sushipe/res/img/furai-sake-roll.jpg" data-fancybox="gallery"
			data-caption="Furai sake roll"> <img src="/sushipe/res/img/furai-sake-roll.jpg"
			alt="Furai sake roll">
		</a>

		<!-- Agrega más imágenes aquí -->
	</div>



	<%@ include file='footer.jsp'%>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js"></script>
	<script src="/sushipe/res/js/fancybox-init.js"></script>
</body>
</html>
