INSERT INTO Usuarios()
VALUES('12345678R','Armando','Paredes','123 45 67 89','Armando@gmail.com');

INSERT INTO Venta_robot(DNI)
values('12345678R');

SET @id_venta := LAST_INSERT_ID();

INSERT INTO SubVenta_Robot ()
VALUES ('1','NS01120917GCS0004',@id_venta,'1'),
('2','C1',@id_venta,'2'),
('3','A1',@id_venta,'3');

UPDATE Venta_Robot
SET Localización = 'Madrid',
    Fecha_de_pago = CURDATE()
WHERE ID_venta = 1;

select * from venta_robot;
select * from subventa_robot;