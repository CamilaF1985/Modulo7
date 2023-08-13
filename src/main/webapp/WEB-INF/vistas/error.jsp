<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <!-- Hoja de estilo -->
    <link rel="stylesheet" type="text/css" href="/sushipe/res/css/styles.css">
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
                <p>Serás redirigido automáticamente al inicio de sesión en 5 segundos.</p>
            </div>
        </div>
    </div>
    
    	<%@ include file='footer.jsp'%>
    
    	<script src="/sushipe/res/js/error.js"></script>
</body>
</html>


