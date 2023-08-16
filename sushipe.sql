-- Crear la base de datos
CREATE DATABASE sushipe;

-- Utilizar la base de datos
USE sushipe;

-- Crear usuario y otorgar permisos
CREATE USER 'sushipe'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON sushipe.* TO 'sushipe'@'localhost';

-- Crear tabla contacto
CREATE TABLE contacto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(70),
    email VARCHAR(255),
    comentario VARCHAR(100)
);

-- Crear tabla usuarios
CREATE TABLE usuarios (
    id INT PRIMARY KEY,
    user VARCHAR(50),
    password VARCHAR(100),
    rol VARCHAR(20),
    email VARCHAR(100),
    tipo ENUM('Cliente', 'Administrador') NOT NULL
);

-- Crear tabla clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    telefono INT,
    comuna VARCHAR(45),
    calle VARCHAR(50),
    numeracion INT,
    indicaciones VARCHAR(70),
    id_usuario INT
);

-- Script para agregar la FK en la tabla Clientes
ALTER TABLE clientes
ADD CONSTRAINT fk_cliente_usuario FOREIGN KEY (id_usuario)
REFERENCES usuarios(id);

CREATE TABLE administradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rut INT NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fecha_ingreso VARCHAR(50) NOT NULL,
    id_usuario INT
);

-- Script para agregar la FK en la tabla Administradores
ALTER TABLE administradores
ADD CONSTRAINT fk_administrador_usuario FOREIGN KEY (id_usuario)
REFERENCES usuarios(id);

-- Crear tabla productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    categoria VARCHAR(50),
    precio INT
);

-- Insertar valores en la tabla productos
INSERT INTO productos (nombre, categoria, precio)
VALUES
    ('Gyosas', 'Picoteo japonés', 4200),
    ('Hosomaki', 'Picoteo japonés', 4200),
    ('Nigiri', 'Picoteo japonés', 4200),
    ('Sakana Tataki', 'Picoteo japonés', 5200),
    ('Sashimi', 'Picoteo japonés', 5200),
    ('Temaki', 'Picoteo japonés', 4200),
    ('Ceviche tradicional', 'Picoteo pe', 7200),
    ('Chicharrón Criollo', 'Picoteo pe', 5200),
    ('Pulpo al Olivo', 'Picoteo pe', 5200),
    ('Empanaditas Pe', 'Picoteo pe', 4200),
    ('California Ebi', 'California Rolls', 6800),
    ('California Pe', 'California Rolls', 6800),
    ('California Roll', 'California Rolls', 6800),
    ('California Sake', 'California Rolls', 6800),
    ('California Ebi Cheese', 'California Rolls', 6800),
    ('Avocado Roll', 'Envueltos en palta', 7200),
    ('Tai Roll', 'Envueltos en palta', 7200),
    ('Ebi Furai', 'Envueltos en palta', 7200),
    ('Cai Roll', 'Envueltos en Salmón', 7200),
    ('Salmon Roll', 'Envueltos en Salmón', 7200),
    ('Ebi Cheese Roll', 'Envueltos en Salmón', 7200),
    ('Sayonara Roll', 'Envueltos en Salmón', 7200),
    ('Acevichado Roll', 'Nikkei', 7200),
    ('Huancaína Roll', 'Nikkei', 6200),
    ('Ají de Gallina Roll', 'Nikkei', 6200),
    ('Pe Nikkei', 'Nikkei', 6200),
    ('Ají de Gallina', 'Platos Pe', 6200),
    ('Arroz Chaufa', 'Platos Pe', 6200),
    ('Lomo Saltado', 'Platos Pe', 6200)
    ;
    
-- Crear tabla de pedidos
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    indicaciones VARCHAR(70),
    precio_total INT,
    estado VARCHAR(20),
    fecha_ingreso TIMESTAMP,
    fecha_despacho TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Script para eliminar todos los registros de una tabla
DELETE FROM pedidos;

-- Script para resetear auto_increment en una tabla
ALTER TABLE pedidos AUTO_INCREMENT = 1;

-- Query para seleccionar datos de clientes y productos asociados a un pedido
SELECT p.id AS pedido_id, 
       c.id AS cliente_id, 
       c.nombres AS cliente_nombres,
       c.apellidos AS cliente_apellidos,
       c.telefono AS cliente_telefono,
       c.comuna AS cliente_comuna,
       c.calle AS cliente_calle,
       c.numeracion AS cliente_numeracion,
       c.indicaciones AS cliente_indicaciones,
       pr.id AS producto_id,
       pr.nombre AS producto_nombre,
       p.indicaciones AS indicaciones,
       p.precio_total AS precio_total,
       p.cantidad AS cantidad,
       p.estado AS estado,
       p.fecha_ingreso AS fecha_ingreso,
       p.fecha_despacho AS fecha_despacho
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
JOIN productos pr ON p.producto_id = pr.id;

-- Crear tabla intermedia para productos en pedidos
CREATE TABLE pedidos_productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);
-- Desactivar restricciones de llaves foráneas
SET FOREIGN_KEY_CHECKS = 0;

-- Insertar productos en la tabla pedidos_productos
INSERT INTO pedidos_productos (pedido_id, producto_id, cantidad) VALUES
(1, 2, 1), -- Pedido 1, Producto 2, Cantidad 1
(1, 3, 2); -- Pedido 1, Producto 3, Cantidad 2

-- Calcular el precio total para el pedido
SET @total = (
    SELECT SUM(p.precio * pp.cantidad)
    FROM productos p
    JOIN pedidos_productos pp ON p.id = pp.producto_id
    WHERE pp.pedido_id = 1
);

-- Insertar el registro del pedido en la tabla pedidos
INSERT INTO pedidos (cliente_id, indicaciones, precio_total, estado, fecha_ingreso, fecha_despacho)
VALUES (1, 'Indicaciones del pedido', @total, 'Pendiente', NOW(), NULL);

SELECT
    ped.id AS id_pedido,
    c.nombres AS nombres_cliente,
    c.apellidos AS apellidos_cliente,
    c.calle AS calle_cliente,
    c.numeracion AS numeracion_cliente,
    c.indicaciones AS indicaciones_cliente,
    pr.nombre AS nombre_producto,
    pp.cantidad AS cantidad_producto,
    ped.fecha_ingreso AS fecha_ingreso_pedido,
    ped.fecha_despacho AS fecha_despacho_pedido,
    ped.estado AS estado_pedido
FROM pedidos ped
JOIN clientes c ON ped.cliente_id = c.id
JOIN pedidos_productos pp ON ped.id = pp.pedido_id
JOIN productos pr ON pp.producto_id = pr.id
WHERE ped.id = 1; -- Reemplaza 1 con el ID del pedido que deseas recuperar

-- Modificar la columna "estado" en la tabla "pedidos"
ALTER TABLE pedidos
MODIFY estado VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Cambiar la codificación de caracteres y collation para la base de datos
ALTER DATABASE sushipe
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

SELECT @@character_set_database, @@collation_database;

-- Insertar valores en la tabla contacto
INSERT INTO contacto (nombre, email, comentario) VALUES
('María Pérez', 'maria@example.com', '¡Hola! Me encanta su sitio web.'),
('Andrés López', 'andres@example.com', 'Gracias por su atención.'),
('José Rodríguez', 'jose@example.com', 'Estoy interesado en su producto.'),
('Elena Gómez', 'elena@example.com', '¿Pueden responder a mis preguntas?');

















  






















  


