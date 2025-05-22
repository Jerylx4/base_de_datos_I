-- 1.3.3 Consultas sobre una tabla
--1.Devuelve un listado con todos los pedidos que se han realizado. 
--Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
SELECT * FROM gestion_ventas.pedido
ORDER BY fecha DESC;
--2.Devuelve todos los datos de los dos pedidos de mayor valor.
SELECT * FROM gestion_ventas.pedido
ORDER BY total DESC
LIMIT 2;

--3.Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. 
--Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT DISTINCT id_cliente FROM gestion_ventas.pedido;

--4.Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
SELECT * FROM gestion_ventas.pedido
WHERE fecha BETWEEN '2017-01-01' AND '2017-12-31'
AND total > 500;

--5.Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
SELECT nombre, apellido1, apellido2 
FROM gestion_ventas.comercial
WHERE comision BETWEEN 0.05 AND 0.11;

--6.Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
SELECT MAX(comision) AS max_comision 
FROM gestion_ventas.comercial;

--7.Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. 
--El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
SELECT id, apellido1,apellido2,nombre 
FROM gestion_ventas.cliente
WHERE apellido2 IS NOT NULL
ORDER BY apellido1, apellido2, nombre ASC;

--8.Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. 
--El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM gestion_ventas.cliente
WHERE (nombre LIKE 'A%n') OR (nombre LIKE 'P%')
ORDER BY nombre;

--9.Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM gestion_ventas.cliente
WHERE nombre NOT LIKE 'A%'
ORDER BY nombre;

--10.Devuelve un listado con los nombres de los comerciales que terminan por el o o. 
--Tenga en cuenta que se deberán eliminar los nombres repetidos.
SELECT DISTINCT nombre FROM gestion_ventas.comercial
WHERE nombre LIKE '%el' OR nombre LIKE '%o';

-- 1.3.4 Consultas multitabla (Composición interna)

  --1. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. 
  --El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
  SELECT cliente.nombre AS nombre, cliente.apellido1 AS apellido1, cliente.apellido2 AS apellido2
  FROM gestion_ventas.cliente cliente
  JOIN gestion_ventas.pedido pedido2 ON pedido2.id_cliente = cliente.id
  GROUP BY cliente.nombre, cliente.apellido1, cliente.apellido2
  ORDER BY nombre ASC;
  
  --2. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. 
  --El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
  SELECT cliente.id AS cliente_id, cliente.nombre AS cliente_nombre, cliente.apellido1 AS cliente_apellido1, 
  cliente.apellido2 AS cliente_apellido2,cliente.ciudad AS cliente_ciudad, cliente.categoria AS cliente_categoria,
  pedido.id AS pedido_id, pedido.total AS pedido_total, pedido.fecha AS pedido_fecha, pedido.id_comercial AS comercial_id
  FROM gestion_ventas.cliente cliente
  JOIN gestion_ventas.pedido pedido ON cliente.id = pedido.id_cliente
  ORDER BY cliente.nombre ASC, cliente.apellido1 ASC, cliente.apellido2 ASC;
  
  --3. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. 
  --El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
  SELECT comercial.id AS comercial_id, comercial.nombre AS comercial_nombre, comercial.apellido1 AS comercial_apellido1,
  comercial.apellido2 AS comercial_apellido2, comercial.comision AS comercial_comision, pedido.id AS pedido_id,
  pedido.total AS pedido_total, pedido.fecha AS pedido_fecha, pedido.id_cliente AS cliente_id
  FROM gestion_ventas.comercial comercial
  JOIN gestion_ventas.pedido pedido ON comercial.id = pedido.id_comercial
  ORDER BY comercial.nombre ASC, comercial.apellido1 ASC, comercial.apellido2 ASC;
  
  --4. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
  SELECT c.nombre,c.apellido1,c.apellido2,c.ciudad,c.categoria,c.id,p.total,p.fecha,p.id_comercial,co.nombre,co.apellido1,co.apellido2,co.comision FROM gestion_ventas.cliente c
  LEFT JOIN gestion_ventas.pedido p ON c.id=p.id_cliente
  LEFT JOIN gestion_ventas.comercial co ON p.id_comercial=co.id
  WHERE p.id IS NOT NULL
  
  --5. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
  SELECT c.nombre,c.apellido1,c.apellido2,p.total,p.fecha,p.id_comercial FROM gestion_ventas.cliente c
  LEFT JOIN gestion_ventas.pedido p ON p.id_cliente=c.id
  WHERE (p.fecha BETWEEN '01-01-2017' AND '31-12-2017') AND (p.total BETWEEN 300 AND 1000);
  
  --6. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno
  SELECT DISTINCT comercial.nombre AS comercial_nombre, comercial.apellido1 AS comercial_apellido1, comercial.apellido2 AS comercial_apellido2
  FROM gestion_ventas.comercial comercial
  JOIN gestion_ventas.pedido pedido ON comercial.id = pedido.id_comercial
  JOIN gestion_ventas.cliente cliente ON pedido.id_cliente = cliente.id
  WHERE cliente.nombre = 'María' AND cliente.apellido1 = 'Santana' AND cliente.apellido2 = 'Moreno'
  ORDER BY comercial.apellido1 ASC, comercial.apellido2 ASC;

  --7. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
  SELECT * FROM gestion_ventas.cliente
  SELECT * FROM gestion_ventas.pedido
  SELECT * FROM gestion_ventas.comercial
  SELECT DISTINCT c.nombre,c.apellido1,c.apellido2 FROM gestion_ventas.cliente c
  INNER JOIN gestion_ventas.pedido p ON p.id_cliente=c.id
  INNER JOIN gestion_ventas.comercial co ON co.id=p.id_comercial
  WHERE co.id=1

-- 1.3.5 Consultas multitabla (Composición externa)
  --1. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido.
  --El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
  SELECT  c.apellido1,c.apellido2,c.nombre,p.id,p.total,p.fecha,p.id_cliente,p.id_comercial FROM gestion_ventas.cliente c
  FULL OUTER JOIN gestion_ventas.pedido p ON p.id_cliente=c.id
  --GROUP BY c.apellido1,c.apellido2,c.nombre,p.id,p.total,p.fecha,p.id_cliente,p.id_comercial
  ORDER BY c.apellido1 ASC
  
  --2. Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este listado también debe incluir los comerciales que no han realizado ningún pedido. 
  --El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.
  SELECT co.apellido1,co.apellido2,co.nombre,co.comision,p.total,p.id_cliente,p.id_comercial FROM gestion_ventas.comercial co
  FULL OUTER JOIN gestion_ventas.pedido p ON co.id=p.id_comercial
  ORDER BY co.apellido1 ASC
      
  --3. Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
  SELECT * FROM gestion_ventas.cliente c
  LEFT JOIN gestion_ventas.pedido p ON c.id=p.id_cliente
  WHERE p.id IS NULL

-- 1.3.6 Consultas resumen

-- 1.3.7 Subconsultas

-- 1.3.7.1 Con operadores básicos de comparación

/*3. Devuelve los datos del cliente que realizó el pedido más caro en el 
año 2019. (Sin utilizar INNER JOIN)*/ 

SELECT cliente
FROM ventas.cliente
WHERE id= ANY(SELECT id_cliente
FROM ventas.pedido
WHERE total=(SELECT MAX(total)FROM ventas.pedido WHERE fecha BETWEEN '2019-01-01' AND '2019-12-31'));

--4. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT fecha, total
FROM "ventas".pedido p
INNER JOIN "ventas".cliente c ON p.id_cliente = c.id
WHERE nombre = 'Pepe'
		AND apellido1 = 'Ruiz'
		AND apellido2 = 'Santana'
ORDER BY p.total ASC 
LIMIT 1;

/*5. Devuelve un listado con los datos de los clientes y los pedidos, de todos
los clientes que han realizado un pedido durante el año 2017 con un valor
mayor o igual al valor medio de los pedidos realizados durante ese
mismo año*/

SELECT c.id, c.nombre, p.id, p.total
FROM ventas.cliente c
JOIN ventas.pedido p ON c.id = p.id
WHERE EXTRACT(YEAR FROM p.fecha) = 2017
AND p.total >= (
    SELECT AVG(total)
    FROM ventas.pedido
    WHERE EXTRACT(YEAR FROM fecha) = 2017
)
ORDER BY p.fecha;

-- 1.3.7.2 Subconsultas con ALL y ANY
--6. Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni LIMIT.

SELECT *
FROM "Gestion_Ventas".pedido p
WHERE p.total >= ALL (SELECT p.total FROM "Gestion_Ventas".pedido);

SELECT *
FROM "Gestion_Ventas".pedido p 
WHERE NOT (p.total >= ANY (SELECT p.total FROM "Gestion_Ventas".pedido p2));

/*7. Devuelve un listado de los clientes que no han realizado ningún pedido. 
(Utilizando ANY o ALL).*/
SELECT cliente 
FROM ventas.cliente 
WHERE id != ALL (SELECT id_cliente FROM ventas.pedido);

--8. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).
SELECT *
FROM "ventas".comercial c
WHERE c.id <> ALL (
  SELECT id_comercial
  FROM "ventas".pedido
);


-- 1.3.7.3 Subconsultas con IN y NOT IN

--9. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT cliente
FROM ventas.cliente 
WHERE NOT EXISTS (SELECT id_cliente FROM ventas.pedido WHERE cliente.id = pedido.id_cliente);  

--10. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN)

SELECT *
FROM "Gestion_Ventas".comercial c
WHERE c.id NOT IN (
    SELECT p.id_comercial
    FROM "Gestion_Ventas".pedido p
    WHERE p.id_comercial IS NOT NULL
);


-- 1.3.7.4 Subconsultas con EXISTS y NOT EXISTS
/*11. Devuelve un listado de los clientes que no han realizado ningún pedido. 
(Utilizando EXISTS o NOT EXISTS). */
SELECT cliente
FROM ventas.cliente 
WHERE NOT EXISTS (SELECT id_cliente FROM ventas.pedido WHERE cliente.id = pedido.id_cliente);  

--12. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT *
FROM "ventas".comercial c
WHERE NOT EXISTS (
	SELECT 1
	FROM "ventas".pedido p
	WHERE p.id_comercial = c.id
);
