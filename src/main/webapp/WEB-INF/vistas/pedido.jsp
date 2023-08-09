<!DOCTYPE html>
<html>
<head>
    <title>Crear Pedido</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Crear Pedido</h1>
        <form action="/crearpedido" method="post">
            <div class="mb-3">
                <label for="cliente">Cliente:</label>
                <select class="form-select" name="cliente" id="cliente">
                    <!-- Agregar opciones de clientes aquí -->
                </select>
            </div>
            <div class="mb-3">
                <label for="producto">Producto:</label>
                <select class="form-select" name="producto" id="producto">
                    <!-- Agregar opciones de productos aquí -->
                </select>
            </div>
            <div class="mb-3">
                <label for="cantidad">Cantidad:</label>
                <input type="number" class="form-control" name="cantidad" id="cantidad" min="1">
            </div>
            <div class="mb-3">
                <label for="indicaciones">Indicaciones:</label>
                <textarea class="form-control" name="indicaciones" id="indicaciones"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Crear Pedido</button>
        </form>
    </div>
</body>
</html>

