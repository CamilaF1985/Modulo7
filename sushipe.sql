-- Crear la base de datos
CREATE DATABASE sushipe;

-- Utilizar la base de datos
USE sushipe;

-- Crear usuario y otorgar permisos
CREATE USER 'sushipe'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON sushipe.* TO 'sushipe'@'localhost';

-- Crear tabla clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    telefono INT,
    comuna VARCHAR(45),
    calle VARCHAR(50),
    numeracion INT,
    indicaciones VARCHAR(70)
);

-- Crear tabla login
CREATE TABLE login (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(100)
);

-- Crear tabla contacto
CREATE TABLE contacto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(70),
    email VARCHAR(255),
    comentario VARCHAR(100)
);

-- Crear tabla productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    categoria VARCHAR(50),
    precio INT
);

-- Crear tabla pedidos
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    cantidad INT,
    indicaciones VARCHAR(70),
    precio_total INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
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
ALTER TABLE login
ADD COLUMN rol VARCHAR(20);
INSERT INTO login (username, password, rol)
VALUES ('cliente', '$2a$12$bj5aSF.N1YCVAMgIwQmNweS3xEIHdQKWtDTZRA1mUXu/rW.TB/Peq', 'ROLE_cliente'),
       ('administrador', '$2a$12$WsE6eEoY1ximj4dsX/6HseH94C5BcKhJzgvyRG6JnXxJjPWl5rDc2', 'ROLE_administrador');
       
ALTER TABLE login CHANGE COLUMN username user VARCHAR(50);

ALTER TABLE login
ADD COLUMN email VARCHAR(100) AFTER password;



  


