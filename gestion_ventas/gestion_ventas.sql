--ejercicio7 composicion interna gestion_ventas
--Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
SELECT * FROM gestion_ventas.cliente
SELECT * FROM gestion_ventas.pedido
SELECT * FROM gestion_ventas.comercial
SELECT DISTINCT c.nombre,c.apellido1,c.apellido2 FROM gestion_ventas.cliente c
INNER JOIN gestion_ventas.pedido p ON p.id_cliente=c.id
INNER JOIN gestion_ventas.comercial co ON co.id=p.id_comercial
WHERE co.id=1
--ejercicio 1 composicion externa gestion_ventas
--Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. 
--Este listado también debe incluir los clientes que no han realizado ningún pedido.
--El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
SELECT  c.apellido1,c.apellido2,c.nombre,p.id,p.total,p.fecha,p.id_cliente,p.id_comercial FROM gestion_ventas.cliente c
FULL OUTER JOIN gestion_ventas.pedido p ON p.id_cliente=c.id
--GROUP BY c.apellido1,c.apellido2,c.nombre,p.id,p.total,p.fecha,p.id_cliente,p.id_comercial
ORDER BY c.apellido1 ASC
--ejercicio 2 composicion externa gestion_ventas
--Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. 
--Este listado también debe incluir los comerciales que no han realizado ningún pedido. 
--El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.
SELECT co.apellido1,co.apellido2,co.nombre,co.comision,p.total,p.id_cliente,p.id_comercial FROM gestion_ventas.comercial co
FULL OUTER JOIN gestion_ventas.pedido p ON co.id=p.id_comercial
ORDER BY co.apellido1 ASC
--ejercicio 3 composicion externa gestion_ventas
--Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT * FROM gestion_ventas.cliente c
LEFT JOIN gestion_ventas.pedido p ON c.id=p.id_cliente
WHERE p.id IS NULL
