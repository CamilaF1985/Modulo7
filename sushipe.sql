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
      
ALTER TABLE login CHANGE COLUMN username user VARCHAR(50);

ALTER TABLE login
ADD COLUMN email VARCHAR(100) AFTER password;

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    indicaciones VARCHAR(70),
    precio_total INT,
    cantidad INT,
    cliente_nombres VARCHAR(50),
    cliente_apellidos VARCHAR(50),
    cliente_telefono INT,
    cliente_comuna VARCHAR(45),
    cliente_calle VARCHAR(50),
    cliente_numeracion INT,
    cliente_indicaciones VARCHAR(70),
    producto_nombre VARCHAR(50),
    -- Otros campos de productos si son necesarios
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Script para eliminar todos los registros de la tabla pedidos
DELETE FROM pedidos;

-- Script para eliminar todos los registros de la tabla clientes
DELETE FROM clientes;

INSERT INTO clientes (nombres, apellidos, telefono, comuna, calle, numeracion, indicaciones)
VALUES 
('Paulina Andrea', 'Fuentes Soto', 569736361, 'Vitacura', 'Av. Vitacura', 1234, ''),
('Luis Alberto', 'Gonzalez Fuenzalida', 569745897, 'Santiago Centro', 'Puente', 567, 'Casa esquina'),
('Carlos Patricio', 'Hernandez Flores', 569456871, 'Puente Alto', 'Los Patos', 259, ''),
('Mauricio ', 'Aguirre Gomez', 569345768, 'La Reina', 'Tobalaba', 645, '');

RENAME TABLE login TO usuarios;

CREATE TABLE administradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rut INT NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fecha_ingreso VARCHAR(50) NOT NULL
);

ALTER TABLE usuarios
ADD COLUMN tipo ENUM('Cliente', 'Administrador') NOT NULL;

ALTER TABLE clientes
ADD COLUMN id_usuario INT;

ALTER TABLE administradores
ADD COLUMN id_usuario INT;


-- Script para agregar la FK en la tabla Clientes
ALTER TABLE clientes
ADD CONSTRAINT fk_cliente_usuario FOREIGN KEY (id_usuario)
REFERENCES usuarios(id);

-- Script para agregar la FK en la tabla Administradores
ALTER TABLE administradores
ADD CONSTRAINT fk_administrador_usuario FOREIGN KEY (id_usuario)
REFERENCES usuarios(id);





  






















  


