<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-black">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img
				src="/sushipe/res/img/logo-sushipe.png" alt="logo de la empresa"
				style="max-width: 200px; width: 100%;">
			</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<%-- Verificar si el usuario NO está autenticado --%>
					<%
					if (request.getRemoteUser() == null) {
					%>
					<li class="nav-item"><a class="nav-link" href="contacto"
						style="color: white;">Contacto</a></li>
					<li class="nav-item"><a class="nav-link" href="login"
						style="color: white;">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="/sushipe/"
						style="color: white;">Inicio</a></li>
					<li class="nav-item"><a class="nav-link"
						href="registroUsuario" style="color: white;">Registro</a></li>
					<%
					}
					%>

					<%-- Verificar si el usuario tiene el rol "cliente" --%>
					<%
					if (request.isUserInRole("ROLE_cliente")) {
					%>
					<li class="nav-item"><a class="nav-link" href="/sushipe/"
						style="color: white;">Inicio</a></li>
					<li class="nav-item"><a class="nav-link" href="contacto"
						style="color: white;">Contacto</a></li>
					<li class="nav-item"><a class="nav-link" href="carta"
						style="color: white;">Carta</a></li>
					<li class="nav-item"><a class="nav-link" href="crearPedido"
						style="color: white;">Haz tu pedido</a></li>
					<li class="nav-item">
						<form action="${pageContext.request.contextPath}/logout"
							method="post">
							<button type="submit" class="btn btn-link" style="color: white;">Logout</button>
						</form>
					</li>
					<%
					}
					%>

					<%-- Verificar si el usuario tiene el rol "administrador" --%>
					<%
					if (request.isUserInRole("ROLE_administrador")) {
					%>
					<li class="nav-item"><a class="nav-link" href=""
						style="color: white;">Inicio</a></li>
					<li class="nav-item"><a class="nav-link" href="verPedidos"
						style="color: white;">Ver Pedidos</a></li>
					<li class="nav-item">
						<form action="${pageContext.request.contextPath}/logout"
							method="post">
							<button type="submit" class="btn btn-link" style="color: white;">Logout</button>
						</form>
					</li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
	</nav>
	
	    <script>
        // Añadir evento para ocultar el menú al hacer clic en un enlace
        $('.nav-link').on('click', function() {
            $('.navbar-collapse').collapse('hide');
        });
    </script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>



















