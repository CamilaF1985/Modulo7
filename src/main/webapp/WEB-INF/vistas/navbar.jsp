<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/css/bootstrap.min.css">

</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-expand-md navbar-dark bg-black">
		<div class="container-fluid d-flex text-center">
			<!-- Contenedor para el logo -->
			<div class="navbar-brand-container">
				<div class="col-md-12 col-lg-12 col-sm-6">
					<a class="navbar-brand" href="#"> <img
						src="/sushipe/res/img/logo-sushipe.png" alt="logo de la empresa"
						style="max-width: 200px; width: 100%;">
					</a>
				</div>

				<!-- Botón para el menú desplegable en pantallas pequeñas -->
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<!-- Contenedor para los enlaces -->
				<div
					class="collapse navbar-collapse justify-content-end col-md-12 col-lg-12 col-sm-6"
					id="navbarNav">
					<ul class="navbar-nav">
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
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/logout" class="nav-link"
							style="color: white;">Logout</a></li>


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
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/logout" class="nav-link"
							style="color: white;">Logout</a></li>


						<%
						}
						%>
					</ul>
				</div>
			</div>
		</div>
	</nav>



	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-N1S0zO3lg8DIWDHN7SxszhGPIAqE0j0jXKufoiJ5O7ALgCE3dRNaJi+od9K0sMOT"
		crossorigin="anonymous"></script>
</body>
</html>




















