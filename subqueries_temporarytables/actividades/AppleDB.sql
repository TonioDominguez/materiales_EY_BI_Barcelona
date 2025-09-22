
-- DROP DATABASE AppleDB;

CREATE DATABASE AppleDB;

USE AppleDB;

-- Crear tabla Clientes
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    ciudad VARCHAR(100),
    pais VARCHAR(50),
    genero VARCHAR(10),
	edad INT
);

-- Crear tabla Productos
CREATE TABLE productos (
    producto_id INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    categoria VARCHAR(50),
    precio DECIMAL(10, 2)
);

-- Crear tabla Ventas
CREATE TABLE ventas (
    venta_id INT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    cantidad INT,
    fecha_venta DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Insertar datos en Clientes
INSERT INTO clientes VALUES
(1, 'Juan Perez', 'juan.perez@gmail.com', 'Madrid', 'España', 'Masculino', 34),
(2, 'Laura Gómez', 'laura.gomez@gmail.com', 'Barcelona', 'España', 'Femenino', 28),
(3, 'Carlos Díaz', 'carlos.diaz@hotmail.com', 'Sevilla', 'España', 'Masculino', 42),
(4, 'Marta Torres', 'marta.torres@yahoo.com', 'Lisboa', 'Portugal', 'Femenino', 30),
(5, 'Ana Sanchez', 'ana.sanchez@gmail.com', 'Paris', 'Francia', 'Femenino', 27),
(6, 'Pedro Garcia', 'pedro.garcia@hotmail.com', 'Madrid', 'España', 'Masculino', 39),
(7, 'Sofia Martinez', 'sofia.martinez@gmail.com', 'Valencia', 'España', 'Femenino', 26),
(8, 'David López', 'david.lopez@hotmail.com', 'Madrid', 'España', 'Masculino', 31),
(9, 'Elena Rodríguez', 'elena.rodriguez@yahoo.com', 'Sevilla', 'España', 'Femenino', 35),
(10, 'Mario Hernández', 'mario.hernandez@gmail.com', 'Madrid', 'España', 'Masculino', 40),
(11, 'Clara Jiménez', 'clara.jimenez@gmail.com', 'Lisboa', 'Portugal', 'Femenino', 29),
(12, 'Pablo González', 'pablo.gonzalez@gmail.com', 'Madrid', 'España', 'Masculino', 37),
(13, 'Sandra Núñez', 'sandra.nunez@hotmail.com', 'Barcelona', 'España', 'Femenino', 33),
(14, 'Jorge Vidal', 'jorge.vidal@gmail.com', 'Bilbao', 'España', 'Masculino', 45),
(15, 'Lucía Ortiz', 'lucia.ortiz@gmail.com', 'Madrid', 'España', 'Femenino', 38),
(16, 'Raúl Fernández', 'raul.fernandez@hotmail.com', 'Valencia', 'España', 'Masculino', 32),
(17, 'Carla Suárez', 'carla.suarez@gmail.com', 'Oporto', 'Portugal', 'Femenino', 25),
(18, 'Francisco Torres', 'francisco.torres@gmail.com', 'Madrid', 'España', 'Masculino', 46),
(19, 'Verónica Castro', 'veronica.castro@gmail.com', 'Barcelona', 'España', 'Femenino', 29),
(20, 'Álvaro Ruiz', 'alvaro.ruiz@hotmail.com', 'Sevilla', 'España', 'Masculino', 41);

-- Insertar datos en Productos 
INSERT INTO productos (producto_id, nombre_producto, categoria, precio) VALUES
(1, 'Laptop', 'Electrónica', 1000.00),
(2, 'Smartphone', 'Electrónica', 800.00),
(3, 'Tablet', 'Electrónica', 600.00),
(4, 'Auriculares', 'Accesorios', 50.00),
(5, 'Monitor', 'Accesorios', 200.00),
(6, 'Teclado', 'Accesorios', 40.00),
(7, 'Ratón Inalámbrico', 'Accesorios', 35.00),
(8, 'Impresora', 'Oficina', 150.00),
(9, 'Altavoces Bluetooth', 'Accesorios', 70.00),
(10, 'Cámara Web', 'Accesorios', 80.00),
(11, 'Disco Duro Externo', 'Almacenamiento', 120.00),
(12, 'Pendrive 64GB', 'Almacenamiento', 15.00),
(13, 'Router Wi-Fi', 'Redes', 90.00),
(14, 'Switch de Red', 'Redes', 60.00),
(15, 'Cargador Portátil', 'Accesorios', 25.00),
(16, 'Silla de Oficina', 'Mobiliario', 180.00),
(17, 'Escritorio Ajustable', 'Mobiliario', 250.00),
(18, 'Lámpara LED', 'Iluminación', 35.00),
(19, 'Cargador USB', 'Accesorios', 20.00),
(20, 'Adaptador HDMI', 'Accesorios', 15.00),
(21, 'Estuche para Laptop', 'Accesorios', 45.00),
(22, 'Cámara Digital', 'Electrónica', 650.00),
(23, 'Smartwatch', 'Electrónica', 300.00),
(24, 'Dron', 'Electrónica', 1200.00),
(25, 'Proyector', 'Electrónica', 500.00),
(26, 'Micrófono USB', 'Accesorios', 100.00),
(27, 'Panel Solar', 'Energía', 800.00),
(28, 'Batería Externa', 'Accesorios', 60.00),
(29, 'Auriculares Gaming', 'Accesorios', 120.00),
(30, 'Consola de Videojuegos', 'Electrónica', 400.00);


-- Insertar datos en Ventas
INSERT INTO ventas (venta_id, cliente_id, producto_id, cantidad, fecha_venta) VALUES
(1, 1, 2, 1, '2024-09-01'),
(2, 1, 5, 2, '2024-09-02'),
(3, 2, 1, 1, '2024-09-03'),
(4, 2, 10, 3, '2024-09-04'),
(5, 3, 3, 1, '2024-09-05'),
(6, 4, 12, 2, '2024-09-06'),
(7, 5, 7, 1, '2024-09-07'),
(8, 5, 8, 1, '2024-09-08'),
(9, 6, 9, 1, '2024-09-09'),
(10, 7, 6, 1, '2024-09-10'),
(11, 7, 11, 2, '2024-09-11'),
(12, 8, 4, 1, '2024-09-12'),
(13, 9, 15, 1, '2024-09-13'),
(14, 10, 16, 2, '2024-09-14'),
(15, 11, 20, 1, '2024-09-15'),
(16, 12, 1, 1, '2024-09-16'),
(17, 12, 18, 1, '2024-09-17'),
(18, 13, 22, 1, '2024-09-18'),
(19, 14, 23, 1, '2024-09-19'),
(20, 14, 27, 1, '2024-09-20'),
(21, 15, 4, 2, '2024-09-21'),
(22, 16, 30, 1, '2024-09-22'),
(23, 17, 14, 1, '2024-09-23'),
(24, 18, 25, 1, '2024-09-24'),
(25, 19, 29, 1, '2024-09-25'),
(26, 20, 3, 1, '2024-09-26'),
(27, 1, 13, 1, '2024-09-27'),
(28, 2, 2, 2, '2024-09-28'),
(29, 3, 12, 1, '2024-09-29'),
(30, 4, 6, 1, '2024-09-30'),
(31, 5, 24, 1, '2024-10-01'),
(32, 6, 21, 1, '2024-10-02'),
(33, 7, 19, 1, '2024-10-03'),
(34, 8, 8, 1, '2024-10-04'),
(35, 9, 2, 3, '2024-10-05'),
(36, 10, 4, 1, '2024-10-06'),
(37, 11, 26, 1, '2024-10-07'),
(38, 12, 14, 2, '2024-10-08'),
(39, 13, 7, 1, '2024-10-09'),
(40, 14, 15, 1, '2024-10-10'),
(41, 15, 28, 1, '2024-10-11'),
(42, 16, 17, 1, '2024-10-12'),
(43, 17, 9, 2, '2024-10-13'),
(44, 18, 5, 1, '2024-10-14'),
(45, 19, 30, 1, '2024-10-15'),
(46, 20, 1, 1, '2024-10-16'),
(47, 1, 10, 1, '2024-10-17'),
(48, 2, 25, 1, '2024-10-18'),
(49, 3, 3, 1, '2024-10-19'),
(50, 4, 29, 1, '2024-10-20');


