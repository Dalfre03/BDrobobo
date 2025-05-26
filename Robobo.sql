CREATE DATABASE ROBOBO;

USE ROBOBO;

CREATE TABLE Pedido (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY ,
    Precio_Total DECIMAL(10,2),
    Gastos_envio DECIMAL(10,2),
    Fecha_de_Salida DATETIME DEFAULT CURRENT_TIMESTAMP,
    Fecha_de_pago DATE
);


CREATE TABLE Compras (
    ID_Compra INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pedido INT,
    ID_Pieza VARCHAR(10),
    Opcion ENUM('1', '2', '3'),
    Web VARCHAR(255),
    Unidades INT,
    Precio_ud DECIMAL(10,4),
    Gastos_Envio DECIMAL(10,2),
    Entrega DATE,
    Valoración INT,
    tipo_de_pieza ENUM('1', '2', '3'),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);


CREATE TABLE Piezas (
    ID_Pieza VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(100),
    Caracteristica TEXT,
    Tipo_de_Pieza ENUM('1', '2', '3'),
    Unidades_Disponibles INT
);

/*  CREATE TABLE SubPedido (
    ID_Subpedido INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pieza VARCHAR(10),
    ID_Pedido INT,
    ID_Compra INT,
    Unidades INT,
    Proveedor VARCHAR(100),
    FOREIGN KEY (ID_Pieza) REFERENCES piezas(ID_Pieza),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Compra) REFERENCES Compras(ID_Compra)
); 

select * from subpedido;*/

DELIMITER $$

CREATE TRIGGER insertar_o_sumar_en_piezas
AFTER INSERT ON Compras
FOR EACH ROW
BEGIN
    INSERT INTO Piezas (
        ID_Pieza,
        Tipo_de_Pieza,
        Nombre,
        Caracteristica,
        Unidades_Disponibles
    ) VALUES (
        NEW.ID_Pieza,
        NEW.tipo_de_pieza,
        NULL,
        NULL,
        NEW.Unidades
    )
    ON DUPLICATE KEY UPDATE
        Unidades_Disponibles = Unidades_Disponibles + NEW.Unidades;
END$$

DELIMITER ;

/*       
CREATE TABLE Articulo (
    ID_Articulo VARCHAR(20) PRIMARY KEY,
    Tipo ENUM('Robot', 'Adicional')
);
*/

CREATE TABLE Robot (
    ID_Robot VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(100),
    Codigo_Caja VARCHAR(50),
    Manual ENUM('SI', 'NO'),
    Tornillos ENUM('SI', 'NO'),
    Cable ENUM('SI', 'NO'),
    Garantía ENUM('SI', 'NO'),
    Vendido ENUM('SI','NO')
   -- FOREIGN KEY (ID_Robot) REFERENCES Articulo(ID_Articulo) --
);


CREATE TABLE Adicionales (
    ID_Adicionales VARCHAR(20) PRIMARY KEY,
    Tipo_Elemento VARCHAR(50),
    Nombre VARCHAR(100) NULL,
    Talla VARCHAR(20) NULL,    -- R
    Unidades INT NULL         -- A
   -- FOREIGN KEY (ID_Adicionales) REFERENCES Articulo(ID_Articulo)
);

CREATE TABLE Reparaciones (
    ID_Reparacion INT PRIMARY KEY AUTO_INCREMENT,
    ID_Robot VARCHAR(100),
    Fallo TEXT,
    Reparado boolean,
    FOREIGN KEY (ID_Robot) REFERENCES Robot(ID_Robot)
);

CREATE TABLE SubReparacion(
    ID_SubReparacion INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pieza VARCHAR(10),
    Unidades INT,
    ID_Reparacion INT,
    FOREIGN KEY (ID_Pieza) REFERENCES Piezas(ID_Pieza),
    FOREIGN KEY (ID_Reparacion) REFERENCES Reparaciones(ID_Reparacion)
);

DELIMITER $$

CREATE TRIGGER validar_stock_reparacion
BEFORE INSERT ON SubReparacion
FOR EACH ROW
BEGIN
    DECLARE disponibles INT;

    SELECT Unidades_Disponibles INTO disponibles
    FROM Piezas
    WHERE ID_Pieza = NEW.ID_Pieza;

    IF disponibles < NEW.Unidades THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay suficientes unidades en stock';
    END IF;
END$$

CREATE TRIGGER restar_unidades_pieza_reparacion
AFTER INSERT ON SubReparacion
FOR EACH ROW
BEGIN
    UPDATE Piezas
    SET Unidades_Disponibles = Unidades_Disponibles - NEW.Unidades
    WHERE ID_Pieza = NEW.ID_Pieza;
END$$

DELIMITER ;


CREATE TABLE Usuarios (
	DNI VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR (20),
    Apellidos VARCHAR (40),
    Teléfono VARCHAR (20),
    Correo VARCHAR (20)
);

CREATE TABLE Venta_Robot (
    ID_venta INT PRIMARY KEY AUTO_INCREMENT,
    DNI VARCHAR(20),
    Localización VARCHAR(100),
    Fecha_de_Salida DATETIME DEFAULT CURRENT_TIMESTAMP,
    Fecha_de_pago DATE,
    FOREIGN KEY (DNI) REFERENCES Usuarios(DNI)
);


CREATE TABLE SubVenta_Robot (
    ID_Subventa INT PRIMARY KEY AUTO_INCREMENT,
    ID_Articulo VARCHAR(20) NULL,
    ID_venta INT,
    Cantidad INT,
    -- FOREIGN KEY (ID_Articulo) REFERENCES Articulo(ID_Articulo),
    FOREIGN KEY (ID_venta) REFERENCES Venta_Robot(ID_venta)
);

select * from subventa_robot

DELIMITER $$

/*
CREATE TRIGGER trg_after_insert_subventa
AFTER INSERT ON SubVenta_Robot
FOR EACH ROW
BEGIN
    DECLARE tipo_articulo ENUM('Robot', 'Adicional');

    SELECT Tipo INTO tipo_articulo FROM Articulo WHERE ID_Articulo = NEW.ID_Articulo;

    IF tipo_articulo = 'Adicional' THEN
        UPDATE Adicionales
        SET Unidades = Unidades - NEW.Cantidad
        WHERE ID_Adicionales = NEW.ID_Articulo;
        
        DELETE FROM Adicionales WHERE ID_Adicionales = NEW.ID_Articulo AND Unidades <= 0;
        
    ELSEIF tipo_articulo = 'Robot' THEN
       
        UPDATE Robot
        SET VENDIDO = 'SI'
        WHERE ID_Robot = NEW.ID_Articulo;
    END IF;
END$$

DELIMITER ;

*/

DELIMITER //

CREATE TRIGGER after_insert_subventa_robot
AFTER INSERT ON SubVenta_Robot
FOR EACH ROW
BEGIN
    -- Si el ID_Articulo está en la tabla Robot: actualizar Vendido
    IF EXISTS (SELECT 1 FROM Robot WHERE ID_Robot = NEW.ID_Articulo) THEN
        UPDATE Robot
        SET Vendido = 'SI'
        WHERE ID_Robot = NEW.ID_Articulo;
    
    -- Si el ID_Articulo está en la tabla Adicionales: disminuir Unidades
    ELSEIF EXISTS (SELECT 1 FROM Adicionales WHERE ID_Adicionales = NEW.ID_Articulo) THEN
        UPDATE Adicionales
        SET Unidades = Unidades - NEW.Cantidad
        WHERE ID_Adicionales = NEW.ID_Articulo;
    END IF;
END;
//

DELIMITER ;










 

