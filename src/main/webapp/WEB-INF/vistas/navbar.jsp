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
<link rel="stylesheet" type="text/css"
	href="/sushipe/res/css/styles.css">

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-black">
		<div class="container-fluid">

			<div
				class="d-flex justify-content-center align-items-center flex-column">
				<a class="navbar-brand" href="#"> <img
					src="/sushipe/res/img/logo-sushipe.png" alt="logo de la empresa">
				</a>

				<div class="navbar-nav">
					<%-- Verificar si el usuario NO está autenticado --%>
					<%
					if (request.getRemoteUser() == null) {
					%>
					<a class="nav-link" href="contacto" style="color: white;">Contacto</a>
					<a class="nav-link" href="login" style="color: white;">Login</a> <a
						class="nav-link" href="inicio" style="color: white;">Inicio</a>
					<%
					}
					%>
					<%-- Verificar si el usuario tiene el rol "cliente" --%>
					<%
					if (request.isUserInRole("ROLE_cliente")) {
					%>
					<a class="nav-link" href="inicio" style="color: white;">Inicio</a>
					<a class="nav-link" href="contacto" style="color: white;">Contacto</a>
					<a class="nav-link" href="carta" style="color: white;">Carta</a>
					<a class="nav-link" href="registroCliente" style="color: white;">Ingresa tus datos</a>
					<a class="nav-link" href="crearpedido" style="color: white;">Haz tu pedido</a>  
					<form action="${pageContext.request.contextPath}/logout"
						method="post">
						<button type="submit" class="btn btn-link" style="color: white;">Logout</button>
					</form>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</nav>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>















