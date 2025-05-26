-- Nuevo pedido
INSERT INTO Pedido (Precio_Total, Gastos_envio) VALUES (0, 0);

-- Guardar ID
SET @id_pedido := LAST_INSERT_ID();

INSERT INTO compras()
values ('1',@id_pedido, 'RB0201','1','https://de.screwerk.com/es/shop/detail/stp/STP22A0220080S.html',
'37','0.102','0','2025-06-14','4','1'),
('2',@id_pedido,'RB0202','1','https://es.rs-online.com/web/p/tornillos-para-metal/9087683',
'2','0.0529','10.69','2025-06-14','4','2');


select * from compras;
select * from pedido;
select * from piezas;