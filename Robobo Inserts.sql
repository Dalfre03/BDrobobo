-- Nuevo pedido
INSERT INTO Pedido (Precio_Total, Gastos_envio) VALUES (0, 0);

-- Guardar ID
SET @id_pedido := LAST_INSERT_ID();

INSERT INTO compras()
values ('1',@id_pedido, 'RB0201','1','https://de.screwerk.com/es/shop/detail/stp/STP22A0220080S.html',
'37','0.102','0','2025-06-14','4','1');

INSERT INTO compras()
values ('2',@id_pedido,'RB0202','1','https://es.rs-online.com/web/p/tornillos-para-metal/9087683',
'2','0.0529','10.69','2025-06-14','4','2');

UPDATE 	Piezas
SET Nombre = 'tornillo plástico',
    Caracteristica = 'tornillo plastico, 2,2 x 8mm'
WHERE id_pieza = 'RB0201';

UPDATE 	Piezas
SET Nombre = 'tornillo rueda',
    Caracteristica = 'M4x5mm, cabeza estrella'
WHERE id_pieza = 'RB0202' ;

select * from compras;
select * from pedido;
select * from piezas;

INSERT INTO Robot ()
values
('NS01120917GCS0004', 'ROB-WMP', 'RBEX0004', 'NO', 'NO', 'NO', 'NO', 'NO'),
  ('NS01120917GCS0007', 'ROB-0HG', 'RBEX0007', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0008', 'ROB-WHS', 'RBEX0008', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0009', 'ROB-WH1', 'RBEX0009', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0010', 'ROB-WLL', 'RBEX0010', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0011', 'ROB-5D1', 'RBEX0011', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0013', 'ROB-WGR', 'RBEX0013', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0014', 'ROB-7RC', 'RBEX0014', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0015', 'ROB-WMQ', 'RBEX0015', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0016', 'ROB-VL4', 'RBEX0016', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0017', 'ROB-6HR', 'RBEX0017', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0018', 'ROB-231', 'RBEX0018', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0019', 'ROB-5DF', 'RBEX0019', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0020', 'ROB-VL7', 'RBEX0020', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0021', 'ROB-WLR', 'RBEX0021', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0022', 'ROB-23C', 'RBEX0022', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0023', 'ROB-WGT', 'RBEX0023', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0024', 'ROB-230', '', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0025', 'ROB-235', 'RBEX0025', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0026', 'ROB-7CZ', 'RBEX0026', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0027', 'ROB-7RH', 'RBEX0027', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0028', 'ROB-6HB', 'RBEX0028', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0029', 'ROB-WM3', 'RBEX0029', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0031', 'ROB-5RM', 'RBEX0031', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0032', 'ROB-7FB', 'RBEX0032', 'NO', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0033', 'ROB-VKY', 'RBEX0033', 'SI', 'SI', 'SI', 'SI', 'SI'),
  ('NS01120917GCS0034', 'ROB-WGS', 'RBEX0034', 'SI', 'SI', 'SI', 'SI', 'SI'),
  ('NS01120917GCS0035', 'ROB-7GG', 'RBEX0035', 'SI', 'SI', 'SI', 'SI', 'SI'),
  ('NS01120917GCS0037', 'ROB-VQB', 'RBEX0037', 'SI', 'SI', 'SI', 'SI', 'SI'),
  ('NS01120917GCS0038', 'ROB-VMN', 'RBEX0038', 'SI', 'SI', 'SI', 'SI', 'SI'),
  ('NS01120917GCS0039', 'ROB-VGM', 'RBEX0039', 'SI', 'SI', 'SI', 'SI', 'SI'),
  ('NS01120917GCS0040', 'ROB-234', 'RBEX0040', 'SI', 'SI', 'SI', 'SI', 'SI'),
  ('NS01120917GCS0041', 'ROB-6JQ', 'RBEX0041', 'SI', 'SI', 'SI', 'SI', 'SI'),
  ('NS01120917GCS0042', 'ROB-7LJ', 'RBEX0042', 'SI', 'SI', 'SI', 'SI', 'SI'),
  ('NS01120917GCS0043', 'ROB-0J9', 'RBEX0043', 'SI', 'SI', 'SI', 'SI', 'SI'),
  ('NS01120917GCS0044', 'ROB-7G0', 'RBEX0044', 'SI', 'NO', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0045', 'ROB-7G5', 'RBEX0045', 'NO', 'SI', 'NO', 'NO', 'SI'),
  ('NS01120917GCS0046', 'ROB-7MQ', 'RBEX0046', 'NO', 'NO', 'SI', 'NO', 'SI'),
  ('NS01120917GCS0047', 'ROB-7C6', 'RBEX0047', 'SI', 'SI', 'SI', 'SI', 'SI'),
  ('NS01120917GCS0048', 'ROB-7D1', 'RBEX0048', 'SI', 'SI', 'SI', 'SI', 'SI'),
  ('NS01120917GCS0049', 'ROB-7MP', 'RBEX0049', 'SI', 'SI', 'SI', 'SI', 'SI'),
  ('NS01120917GCS0050', 'ROB-7D7', 'RBEX0050', 'SI', 'SI', 'SI', 'SI', 'SI');


INSERT INTO Adicionales(ID_Adicionales, Tipo_elemento, Nombre, talla, Unidades)
values('C1','camiseta','Camisa XL','XL','4'),
('C2','camiseta','Camisa L','L','3'),
('C3','camiseta','Camisa M','M','4');

INSERT INTO Adicionales(ID_Adicionales, Tipo_Elemento, Nombre, Unidades)
values('A1','accesorio','Pusher','12'),
('A2','accesorio','cilindro azul','4'),
('A3','accesorio','Penholder','12'),
('A4','accesorio','Lego cortos','10'),
('A5','accesorio','Lego largos','6');


select * from robot;
select * from adicionales;

INSERT INTO Usuarios()
VALUES('12345678R','Armando','Paredes','123 45 67 89','Armando@gmail.com');

insert into Reparaciones()
values ('1','NS01120917GCS0004','12345678R','Faltan Tornillos','1');

INSERT INTO Subreparacion()
values ('1','RB0201','10','1');

SELECT * FROM REPARACIONES;
SELECT * FROM SUBREPARACION;

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