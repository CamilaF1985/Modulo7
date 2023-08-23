<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <!-- Incluir el archivo CSS de Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <!-- Incluir archivo de estilos personalizados -->
    <link rel="stylesheet" type="text/css" href="/sushipe/res/css/styles.css">

    <!-- Configurar codificación de caracteres -->
    <meta charset="UTF-8">

    <!-- Establecer título de la página -->
    <title>Formulario de Contacto</title>
</head>

<body>
    <%@ include file='navbar.jsp'%>

    <!-- Contenedor para el formulario de contacto -->
    <div class=contacto style="display: flex; justify-content: center;">

        <!-- Formulario de contacto -->
        <form action="/sushipe/contacto" method="post" class="mb-5 mt-5">
            <h1 class="tituloContacto">Contáctanos</h1>

            <!-- Campo para el nombre completo -->
            <div class="form-group">
                <div class="campo">
                    <label for="nombre">Nombre completo:</label>
                    <input type="text" id="nombre" name="nombre">
                    <span id="nombreValidationMessage" class="validation-message"></span>
                </div>
            </div>

            <!-- Campo para el correo electrónico -->
            <div class="form-group">
                <div class="campo">
                    <label for="email">Correo electrónico:</label>
                    <input type="email" id="email" name="email">
                    <span id="emailValidationMessage" class="validation-message"></span>
                </div>
            </div>

            <!-- Campo para los comentarios -->
            <div class="form-group">
                <div class="campo">
                    <label for="comentario">Tus Comentarios:</label>
                    <textarea id="comentario" name="comentario"></textarea>
                    <span id="comentarioValidationMessage" class="validation-message"></span>
                </div>
            </div>

            <!-- Botón de envío -->
            <div style="display: flex; justify-content: center;" class="mb-5">
                <input type="submit" value="Enviar" class="boton-enviar">
            </div>
        </form>
    </div>

    <!-- Incluir la librería SweetAlert2 para alertas personalizadas -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Incluir archivo de validaciones JavaScript -->
    <script src="/sushipe/res/js/validaciones.js"></script>
    <!-- Incluir archivo JavaScript de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    <%@ include file='footer.jsp'%>
</body>

</html>
