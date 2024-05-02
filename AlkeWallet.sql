
-- Crear base de datos
CREATE DATABASE IF NOT EXISTS AlkeWallet;
USE AlkeWallet;

-- Crear tabla usuario
CREATE TABLE IF NOT EXISTS usuario (
    rut VARCHAR(10) PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    correo_electronico VARCHAR(50) NOT NULL,
    contraseña VARCHAR(50) NOT NULL,
    saldo INT NOT NULL
);

-- Crear tabla moneda
CREATE TABLE IF NOT EXISTS moneda (
    id_moneda INT AUTO_INCREMENT PRIMARY KEY,
    nombre_moneda VARCHAR(50) NOT NULL,
    simbolo_moneda VARCHAR(10) NOT NULL,
    importe DECIMAL(18, 2) NOT NULL
);

-- Crear tabla transaccion
CREATE TABLE IF NOT EXISTS transaccion (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    rut_usuario_origen VARCHAR(10),
    rut_usuario_destino VARCHAR(10),
    id_moneda INT,
    cantidad DECIMAL(18, 2) NOT NULL,
    fecha_transaccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rut_usuario_origen) REFERENCES usuario(rut),
    FOREIGN KEY (rut_usuario_destino) REFERENCES usuario(rut),
    FOREIGN KEY (id_moneda) REFERENCES moneda(id_moneda)
);

-- Insertar datos de usuarios
INSERT INTO usuario (rut, nombre, correo_electronico, contraseña, saldo) 
VALUES 
    ('123456789', 'Juan Pérez', 'juan@hotmail.com', '123456', 1000),
    ('987654321', 'María García', 'maria@hotmailcom', 'abcdef', 500),
    ('456789123', 'Pedro López', 'pedro@hotmail.com', 'qwerty', 1500),
    ('789123456', 'Ana Martínez', 'ana@hotmail.com', '654321', 200),
    ('321654987', 'Laura Fernández', 'laura@hotmail.com', 'xyz123', 800);
-- Insertar datos de moneda
INSERT INTO moneda (nombre_moneda, simbolo_moneda, importe) 
VALUES 
    ('Euro', '€', 1.00),
    ('Dólar', '$', 1.10);
INSERT INTO moneda (nombre_moneda, simbolo_moneda, importe) 
VALUES ('Peso Chileno', 'CLP', 0.00);

-- Insertar algunas transacciones en CLP
INSERT INTO transaccion (rut_usuario_origen, rut_usuario_destino, id_moneda, cantidad)
VALUES
    ('123456789', '987654321', 3, 1000), -- Juan envía 1000 CLP a María
    ('987654321', '456789123', 3, 500),  -- María envía 500 CLP a Pedro
    ('456789123', '789123456', 3, 200),  -- Pedro envía 200 CLP a Ana
    ('789123456', '321654987', 3, 300);  -- Ana envía 300 CLP a Laura
    
-- ● Consulta para obtener el nombre de la moneda elegida por un
-- usuario específico
SELECT * FROM moneda WHERE nombre_moneda = 'Peso Chileno'; 
-- ● Consulta para obtener las transacciones realizadas por un usuario
-- específico
SELECT *
FROM transaccion
WHERE rut_usuario_origen = '123456789';
-- ● Consulta para obtener todos los usuarios registrados
SELECT * FROM  usuario;
-- ● Consulta para obtener todas las monedas registradas
SELECT * FROM moneda;
-- ● Consulta para obtener todas las transacciones registradas
SELECT *
FROM transaccion;
-- ● Consulta para obtener todas las transacciones realizadas por un
-- usuario específico
SELECT *
FROM transaccion
WHERE  rut_usuario_origen = '456789123';
-- ● Consulta para obtener todas las transacciones recibidas por un
-- usuario específico
SELECT *
FROM transaccion
WHERE  rut_usuario_destino = '456789123';
-- ● Sentencia DML para modificar el campo correo electrónico de un
-- usuario específico
UPDATE usuario
SET correo_electronico = 'juan@gmail.com'
WHERE rut = '123456789';
select * from usuario where rut = '123456789';