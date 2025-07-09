

DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS usuarios;

-- CREAR TABLAS

-- Tabla usuarios
CREATE TABLE usuarios (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabla productos
CREATE TABLE productos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

-- Tabla pedidos
CREATE TABLE pedidos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    usuario_id BIGINT NOT NULL,
    producto_id BIGINT NOT NULL,
    cantidad INT NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'PENDIENTE',
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- POBLAR TABLAS

-- Insertar 10 usuarios
INSERT INTO usuarios (nombre, email, contrasena) VALUES
('Admin EcoMarket', 'admin@ecomarket.com', 'AdminPass123'),
('Juan Perez', 'juan.perez@ecomarket.com', 'JuanPass456'),
('Maria Garcia', 'maria.garcia@ecomarket.com', 'MariaPass789'),
('Luis Martinez', 'luis.m@ecomarket.com', 'LuisPass000'),
('Ana Lopez', 'ana.lopez@ecomarket.com', 'AnaPass111'),
('Pedro Sanchez', 'pedro.s@ecomarket.com', 'PedroPass222'),
('Laura Fernandez', 'laura.f@ecomarket.com', 'LauraPass333'),
('Carlos Gomez', 'carlos.g@ecomarket.com', 'CarlosPass444'),
('Sofia Ramirez', 'sofia.r@ecomarket.com', 'SofiaPass555'),
('Diego Torres', 'diego.t@ecomarket.com', 'DiegoPass666');

-- Insertar 10 productos
INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Bolsa Reutilizable', 'Bolsa de algodon organico 500ml', 8.99, 100),
('Cepillo Dental Bambu', 'Cepillo dental ecologico de bambu', 4.50, 200),
('Jabon Natural', 'Jabon artesanal sin quimicos', 3.25, 150),
('Taza Reutilizable', 'Taza de cafe de acero inoxidable', 12.75, 80),
('Botella de Agua', 'Botella termica para bebidas', 15.99, 120),
('Paneles Solares', 'Kit basico de energia solar', 299.99, 25),
('Compostera', 'Contenedor para hacer compost', 45.50, 40),
('Semillas Organicas', 'Paquete de semillas para huerto', 7.25, 300),
('Cargador Solar', 'Cargador portatil con energia solar', 39.99, 60),
('Pañales Ecologicos', 'Pañales reutilizables para bebes', 24.95, 90);

-- Insertar 10 pedidos
INSERT INTO pedidos (usuario_id, producto_id, cantidad, estado) VALUES
(2, 1, 2, 'PENDIENTE'),
(2, 3, 5, 'ENVIADO'),
(3, 2, 3, 'COMPLETADO'),
(3, 4, 1, 'CANCELADO'),
(4, 5, 2, 'PENDIENTE'),
(5, 6, 1, 'ENVIADO'),
(6, 7, 3, 'COMPLETADO'),
(7, 8, 10, 'PENDIENTE'),
(8, 9, 1, 'ENVIADO'),
(9, 10, 4, 'COMPLETADO');


SELECT '--- USUARIOS ---' AS '';
SELECT * FROM usuarios;

SELECT '--- PRODUCTOS ---' AS '';
SELECT * FROM productos;

SELECT '--- PEDIDOS ---' AS '';
SELECT * FROM pedidos;