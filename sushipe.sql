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
    id INT AUTO_INCREMENT PRIMARY KEY,
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

-- Insertar registros en la tabla usuarios, la contraseña sin encriptar para ambos usuarios de prueba es 1234
INSERT INTO usuarios (user, password, email, rol, tipo)
VALUES
    ('Administrador 1', '$2a$10$UQ/n9QYFApKz.lecCqghqOHps2uvf0zUU2SLpaJjBXP/M4qe4RQmq', 'admin1@gmail.com', 'ROLE_administrador', 'Administrador'),
    ('Cliente 1', '$2a$10$IuQGX3LYc3jKROUuSzkK2un.cZnZ7fHkwaSySUjQ3bf8jYO6mloSK', 'cliente1@gmail.com', 'ROLE_cliente', 'Cliente');

-- Insertar registros en la tabla administradores
INSERT INTO administradores (rut, nombres, apellidos, fecha_ingreso, id_usuario)
VALUES
    ('12312312', 'Administrador 1', 'Administrador 1', '09/07/2021', 1);

-- Insertar registros en la tabla clientes
INSERT INTO clientes (nombres, apellidos, telefono, comuna, calle, numeracion, indicaciones, id_usuario)
VALUES
    ('Cliente', 'Cliente 1', '912345678', 'las condes', 'las flores', '123', 'depto 1', 2);


-- Script para agregar la FK en la tabla Administradores
ALTER TABLE administradores
ADD CONSTRAINT fk_administrador_usuario FOREIGN KEY (id_usuario)
REFERENCES usuarios(id);

-- Crear tabla productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    categoria VARCHAR(50),
    precio INT,
    imagenUrl VARCHAR(255)
);

-- Insertar valores en la tabla productos
INSERT INTO productos (nombre, categoria, precio, imagenUrl)
VALUES
    ('Gyosas', 'Picoteo japonés', 4200, '/sushipe/res/img/gyosas.jpg'),
    ('Hosomaki', 'Picoteo japonés', 4200, '/sushipe/res/img/hosomaki.jpg'),
    ('Nigiri', 'Picoteo japonés', 4200, '/sushipe/res/img/nigiri.jpg'),
    ('Sakana Tataki', 'Picoteo japonés', 5200, '/sushipe/res/img/sakana-tataki.jpg'),
    ('Sashimi', 'Picoteo japonés', 5200, '/sushipe/res/img/sashimi.jpg'),
    ('Temaki', 'Picoteo japonés', 4200, '/sushipe/res/img/temaki.jpg'),
    ('Ceviche tradicional', 'Picoteo pe', 7200, '/sushipe/res/img/ceviche-tradicional.jpg'),
    ('Chicharrón Criollo', 'Picoteo pe', 5200, '/sushipe/res/img/chicharron-criollo.jpg'),
    ('Pulpo al Olivo', 'Picoteo pe', 5200, '/sushipe/res/img/pulpo-al-olivo.jpg'),
    ('Empanaditas Pe', 'Picoteo pe', 4200, '/sushipe/res/img/empanadas-pe.jpg'),
    ('California Ebi', 'California Rolls', 6800, '/sushipe/res/img/california.ebi.jpg'),
    ('California Pe', 'California Rolls', 6800, '/sushipe/res/img/california-pe.jpg'),
    ('California Roll', 'California Rolls', 6800, '/sushipe/res/img/california-roll.jpg'),
    ('California Sake', 'California Rolls', 6800, '/sushipe/res/img/california-sake.jpg'),
    ('California Ebi Cheese', 'California Rolls', 6800, '/sushipe/res/img/california-ebi-cheese.jpg'),
    ('Avocado Roll', 'Envueltos en palta', 7200, '/sushipe/res/img/avocado-roll.jpg'),
    ('Tai Roll', 'Envueltos en palta', 7200, '/sushipe/res/img/Tai-roll.jpg'),
    ('Ebi Furai', 'Envueltos en palta', 7200, '/sushipe/res/img/ebi-furai.jpg'),
    ('Cai Roll', 'Envueltos en Salmón', 7200, '/sushipe/res/img/Cai roll.JPG'),
    ('Salmon Roll', 'Envueltos en Salmón', 7200, '/sushipe/res/img/salmon-roll.jpg'),
    ('Salmon Cheese Roll', 'Envueltos en Salmón', 7200, '/sushipe/res/img/salmon-cheese-roll.jpg'),
    ('Sayonara Roll', 'Envueltos en Salmón', 7200, '/sushipe/res/img/sayonara-roll.jpg'),
    ('Acevichado Roll', 'Nikkei', 7200, '/sushipe/res/img/acevichado-roll.jpg'),
    ('Huancaína Roll', 'Nikkei', 6200, '/sushipe/res/img/huancaina-roll.jpg'),
    ('Ají de Gallina Roll', 'Nikkei', 6200, '/sushipe/res/img/aji-de-gallina-roll.jpg'),
    ('Pe Nikkei', 'Nikkei', 6200, '/sushipe/res/img/pe-nikkei.jpg'),
    ('Ají de Gallina', 'Platos Pe', 6200, '/sushipe/res/img/aji-de-gallina.jpg'),
    ('Arroz Chaufa', 'Platos Pe', 6200, '/sushipe/res/img/arroz chaufa.jpg'),
    ('Lomo Saltado', 'Platos Pe', 6200, '/sushipe/res/img/lomo-saltado.jpg');

    
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

-- Crear tabla intermedia para productos en pedidos
CREATE TABLE pedidos_productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Insertar el registro del pedido en la tabla pedidos
INSERT INTO pedidos (cliente_id, indicaciones, precio_total, estado, fecha_ingreso, fecha_despacho)
VALUES (1, 'Indicaciones del pedido', @total, 'Pendiente', NOW(), NULL);

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

-- Query para seleccionar datos de clientes y productos asociados a un pedido
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
WHERE ped.id = 1; 

-- Ordenar productos por categoría
SELECT * FROM productos ORDER BY categoria, nombre;






















  






















  


