
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS favoritos;
DROP TABLE IF EXISTS resenias;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS descuentos;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS usuarios;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE usuarios (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE productos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    categoria VARCHAR(50)
);

CREATE TABLE descuentos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    porcentaje DECIMAL(5,2) NOT NULL,
    categoria VARCHAR(50),
    valido_hasta DATE,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pedidos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    usuario_id BIGINT NOT NULL,
    producto_id BIGINT NOT NULL,
    cantidad INT NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'PENDIENTE',
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

CREATE TABLE resenias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    usuario_id BIGINT NOT NULL,
    producto_id BIGINT NOT NULL,
    calificacion DECIMAL(2,1) NOT NULL,
    comentario TEXT,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    CHECK (calificacion BETWEEN 1.0 AND 5.0)
);

CREATE TABLE favoritos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    usuario_id BIGINT NOT NULL,
    producto_id BIGINT NOT NULL,
    fecha_agregado DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    UNIQUE (usuario_id, producto_id)
);


INSERT INTO usuarios (nombre, email, contrasena) VALUES
('Juan Perez', 'juan.perez@mail.com', 'JuanPass123'),
('Maria Garcia', 'maria.garcia@mail.com', 'MariaPass456'),
('Carlos Lopez', 'carlos.lopez@mail.com', 'CarlosPass789'),
('Ana Martinez', 'ana.martinez@mail.com', 'AnaPass012'),
('Luisa Fernandez', 'luisa.fernandez@mail.com', 'LuisaPass345'),
('Pedro Sanchez', 'pedro.sanchez@mail.com', 'PedroPass678'),
('Laura Gonzalez', 'laura.gonzalez@mail.com', 'LauraPass901'),
('Diego Ramirez', 'diego.ramirez@mail.com', 'DiegoPass234'),
('Sofia Torres', 'sofia.torres@mail.com', 'SofiaPass567'),
('Miguel Castro', 'miguel.castro@mail.com', 'MiguelPass890');


INSERT INTO productos (nombre, descripcion, precio, stock, categoria) VALUES
('Bolsa Tela Orgánica', 'Bolsa grande de algodón orgánico', 12.99, 50, 'hogar'),
('Cepillo Bambú', 'Cepillo dental con mango de bambú', 5.50, 100, 'higiene'),
('Jabón Natural', 'Jabón artesanal sin químicos', 4.25, 80, 'higiene'),
('Botella Acero', 'Botella térmica de acero inoxidable', 18.75, 30, 'hogar'),
('Paneles Solares', 'Kit básico para energía solar', 350.00, 15, 'energia'),
('Compresas Reusables', 'Pack de 3 compresas de tela', 22.50, 40, 'bebe'),
('Semillas Huerto', 'Variedad de semillas orgánicas', 8.99, 200, 'jardin'),
('Cepillos Bambú Set', 'Set de 4 cepillos de bambú', 15.99, 60, 'higiene'),
('Taza Café Bambú', 'Taza reusable con asa de bambú', 14.50, 45, 'hogar'),
('Pañales Ecológicos', 'Pack de 5 pañales reusables', 45.99, 25, 'bebe');


INSERT INTO descuentos (codigo, porcentaje, categoria, valido_hasta) VALUES
('ECO15', 15.00, 'todos', '2025-12-31'),
('VERANO20', 20.00, 'hogar', '2025-08-31'),
('BEBE10', 10.00, 'bebe', '2025-11-30'),
('BAMBÚ25', 25.00, 'higiene', '2025-07-15'),
('ENERGIA30', 30.00, 'energia', '2025-09-30'),
('JARDIN15', 15.00, 'jardin', '2025-10-15'),
('NAVIDAD10', 10.00, 'todos', '2025-12-25'),
('PRIMAVERA20', 20.00, 'jardin', '2025-09-22'),
('HOGAR10', 10.00, 'hogar', '2025-08-15'),
('ZERO5', 5.00, 'todos', '2025-12-31');


INSERT INTO pedidos (usuario_id, producto_id, cantidad, estado) VALUES
(1, 3, 2, 'COMPLETADO'),
(2, 5, 1, 'ENVIADO'),
(3, 2, 3, 'PENDIENTE'),
(4, 7, 5, 'COMPLETADO'),
(5, 1, 1, 'CANCELADO'),
(6, 9, 2, 'ENVIADO'),
(7, 4, 1, 'COMPLETADO'),
(8, 10, 3, 'PENDIENTE'),
(9, 6, 2, 'ENVIADO'),
(10, 8, 4, 'COMPLETADO');


INSERT INTO resenias (usuario_id, producto_id, calificacion, comentario) VALUES
(1, 3, 4.5, 'El jabón huele muy bien y dura bastante'),
(2, 5, 5.0, 'Los paneles funcionan perfectamente, gran ahorro'),
(3, 2, 4.0, 'Buen cepillo pero las cerdas son algo duras'),
(4, 7, 3.5, 'Algunas semillas no germinaron, pero otras sí'),
(5, 1, 5.0, 'La bolsa es resistente y muy espaciosa'),
(6, 9, 4.5, 'Muy buena taza, mantiene el calor bien'),
(7, 4, 2.5, 'Botella genial pero se cayó y se abolló'),
(8, 10, 5.0, 'Los pañales son cómodos y fáciles de lavar'),
(9, 6, 4.0, 'Buenas compresas pero el precio es algo alto'),
(10, 8, 3.0, 'Los cepillos son buenos pero uno se rompió pronto');

INSERT INTO favoritos (usuario_id, producto_id) VALUES
(1, 5),
(2, 3),
(3, 7),
(4, 2),
(5, 9),
(6, 1),
(7, 10),
(8, 4),
(9, 6),
(10, 8);

SELECT 
    (SELECT COUNT(*) FROM usuarios) AS usuarios,
    (SELECT COUNT(*) FROM productos) AS productos,
    (SELECT COUNT(*) FROM descuentos) AS descuentos,
    (SELECT COUNT(*) FROM pedidos) AS pedidos,
    (SELECT COUNT(*) FROM resenias) AS resenias,
    (SELECT COUNT(*) FROM favoritos) AS favoritos;