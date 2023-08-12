<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
        crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="/sushipe/res/css/styles.css">

    <meta charset="UTF-8">

    <title>Registro de Usuario</title>
</head>

<body>
    <%@ include file='navbar.jsp' %>

    <div class="contacto" style="display: flex; justify-content: center;">

        <form action="/sushipe/registroUsuario" method="post" class="mb-5 mt-5">
            <h1 class="tituloContacto">Ingresa tus datos</h1>

            <div class="form-group">
                <div class="campo">
                    <label for="user">Usuario:</label>
                    <input type="text" id="user" name="user" required>
                </div>
            </div>

            <div class="form-group">
                <div class="campo">
                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" required>
                </div>
            </div>

            <div class="form-group">
                <div class="campo">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
            </div>

            <div class="form-group">
                <div class="campo">
                    <label for="rol">Rol:</label>
                    <select id="rol" name="rol" required>
                        <option value="ROLE_cliente">Cliente</option>
                        <option value="ROLE_administrador">Administrador</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <div class="campo">
                    <label for="tipo">Tipo:</label>
                    <select id="tipo" name="tipo" required>
                        <option value="Cliente">Cliente</option>
                        <option value="Administrador">Administrador</option>
                    </select>
                </div>
            </div>

            <!-- Agrega aquí los campos adicionales para cada tipo (Cliente o Administrador) -->

            <div style="display: flex; justify-content: center;" class="mb-5">
                <input type="submit" value="Registrar" class="boton-enviar">
            </div>

        </form>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="/sushipe/res/js/validacionesRegistro.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">
    </script>

    <%@ include file='footer.jsp' %>

</body>

</html>
