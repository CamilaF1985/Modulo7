<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>Formulario de Contacto</title>
</head>

<body>
	<%@ include file='navbar.jsp'%>

	<div class=contacto style="display: flex; justify-content: center;">

<form action="/sushipe/contacto" method="post" class="mb-5 mt-5">
  <h1 class="tituloContacto">Contáctanos</h1>

  <div class="form-group">
    <div class="campo">
      <label for="nombre">Nombre completo:</label>
      <input type="text" id="nombre" name="nombre">
      <span id="nombreValidationMessage" class="validation-message"></span>
    </div>
  </div>

  <div class="form-group">
    <div class="campo">
      <label for="email">Correo electrónico:</label>
      <input type="email" id="email" name="email">
      <span id="emailValidationMessage" class="validation-message"></span>
    </div>
  </div>

  <div class="form-group">
    <div class="campo">
      <label for="comentario">Tus Comentarios:</label>
      <textarea id="comentario" name="comentario"></textarea>
      <span id="comentarioValidationMessage" class="validation-message"></span>
    </div>
  </div>

  <div style="display: flex; justify-content: center;" class="mb-5">
    <input type="submit" value="Enviar" class="boton-enviar">
  </div>

</form>


	</div>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="/sushipe/res/js/validaciones.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>

	<%@ include file='footer.jsp'%>

</body>

</html>