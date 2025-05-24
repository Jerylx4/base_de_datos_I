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

 --4.Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
SELECT c.id, c.nombre, c.apellido1, c.apellido2
FROM gestion_ventas.comercial c
LEFT JOIN gestion_ventas.pedido p ON c.id = p.id_comercial
WHERE p.id IS NULL
ORDER BY c.apellido1, c.apellido2, c.nombre;

--5.Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre. En en listado deberá diferenciar de algún modo los clientes y los comerciales.
SELECT 
    'Cliente' AS tipo,
    cl.id,
    cl.nombre,
    cl.apellido1,
    cl.apellido2
FROM 
    gestion_ventas.cliente cl
LEFT JOIN 
    gestion_ventas.pedido p ON cl.id = p.id_cliente
WHERE 
    p.id IS NULL

UNION ALL

SELECT 
    'Comercial' AS tipo,
    c.id,
    c.nombre,
    c.apellido1,
    c.apellido2
FROM 
    gestion_ventas.comercial c
LEFT JOIN 
    gestion_ventas.pedido p ON c.id = p.id_comercial
WHERE 
    p.id IS NULL

ORDER BY 
    apellido1, apellido2, nombre;
--6.¿Se podrían realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT JOIN? Justifique su respuesta.
/*No se recomienda usar NATURAL LEFT JOIN o NATURAL RIGHT JOIN para estas consultas porque:

Falta de claridad: NATURAL JOIN une las tablas automáticamente por columnas con el mismo nombre, lo que puede ser confuso y propenso a errores si la estructura de la tabla cambia.

Problemas con esquemas: Si las tablas tienen otras columnas con nombres coincidentes que no son claves foráneas, el NATURAL JOIN podría unir por columnas incorrectas.

Mantenimiento: Es más difícil de entender y mantener para otros desarrolladores.

Especificidad: En este caso necesitamos unir explícitamente por id_comercial o id_cliente, no por todas las columnas con nombres coincidentes.*/
	  
-- 1.3.6 Consultas resumen
--1.Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT SUM(total) AS cantidad_total
FROM gestion_ventas.pedido;

--2.Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT AVG(total) AS cantidad_media
FROM gestion_ventas.pedido;

--3.Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
SELECT COUNT(DISTINCT id_comercial) AS total_comerciales
FROM gestion_ventas.pedido;

--4.Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT COUNT(*) AS total_clientes
FROM gestion_ventas.cliente;

--5.Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT MAX(total) AS mayor_cantidad
FROM gestion_ventas.pedido;

--6.Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT MIN(total) AS menor_cantidad
FROM gestion_ventas.pedido;

--7.Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
SELECT ciudad, MAX(categoria) AS max_categoria
FROM gestion_ventas.cliente
GROUP BY ciudad;

--8.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
SELECT 
    c.id AS id_cliente,
    c.nombre,
    c.apellido1,
    c.apellido2,
    p.fecha,
    MAX(p.total) AS max_cantidad
FROM 
    gestion_ventas.cliente c
JOIN 
    gestion_ventas.pedido p ON c.id = p.id_cliente
GROUP BY 
    c.id, c.nombre, c.apellido1, c.apellido2, p.fecha
ORDER BY 
    c.apellido1, c.apellido2, c.nombre, p.fecha;
	
--9.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
SELECT 
    c.id AS id_cliente,
    c.nombre,
    c.apellido1,
    c.apellido2,
    p.fecha,
    MAX(p.total) AS max_cantidad
FROM 
    gestion_ventas.cliente c
JOIN 
    gestion_ventas.pedido p ON c.id = p.id_cliente
GROUP BY 
    c.id, c.nombre, c.apellido1, c.apellido2, p.fecha
HAVING 
    MAX(p.total) > 2000
ORDER BY 
    c.apellido1, c.apellido2, c.nombre, p.fecha;
	
--10.Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
SELECT 
    co.id AS id_comercial,
    co.nombre,
    co.apellido1,
    co.apellido2,
    MAX(p.total) AS total_maximo
FROM 
    gestion_ventas.comercial co
JOIN 
    gestion_ventas.pedido p ON co.id = p.id_comercial
WHERE 
    DATE(p.fecha) = '2016-08-17'
GROUP BY 
    co.id, co.nombre, co.apellido1, co.apellido2
ORDER BY 
    total_maximo DESC;
	
--11.Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. 
--Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
SELECT 
    c.id AS id_cliente,
    c.nombre,
    c.apellido1,
    c.apellido2,
    COUNT(p.id) AS total_pedidos
FROM 
    gestion_ventas.cliente c
LEFT JOIN 
    gestion_ventas.pedido p ON c.id = p.id_cliente
GROUP BY 
    c.id, c.nombre, c.apellido1, c.apellido2
ORDER BY 
    c.apellido1, c.apellido2, c.nombre;
	
--12.Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
SELECT 
    c.id AS id_cliente,
    c.nombre,
    c.apellido1,
    c.apellido2,
    COUNT(p.id) AS total_pedidos_2017
FROM 
    gestion_ventas.cliente c
LEFT JOIN 
    gestion_ventas.pedido p ON c.id = p.id_cliente AND EXTRACT(YEAR FROM p.fecha) = 2017
GROUP BY 
    c.id, c.nombre, c.apellido1, c.apellido2
ORDER BY 
    c.apellido1, c.apellido2, c.nombre;
	
--13.Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0. Puede hacer uso de la función IFNULL.
SELECT 
    c.id AS id_cliente,
    c.nombre,
    c.apellido1,
    COALESCE(MAX(p.total), 0) AS max_cantidad
FROM 
    gestion_ventas.cliente c
LEFT JOIN 
    gestion_ventas.pedido p ON c.id = p.id_cliente
GROUP BY 
    c.id, c.nombre, c.apellido1
ORDER BY 
    c.apellido1, c.nombre;
	
--14.Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT 
    DATE_PART('year', fecha) AS año,
    MAX(total) AS max_pedido
FROM 
    gestion_ventas.pedido
GROUP BY 
    DATE_PART('year', fecha)
ORDER BY 
    año;
	
--15.Devuelve el número total de pedidos que se han realizado cada año.

SELECT 
    DATE_PART('year', fecha) AS año,
    COUNT(*) AS total_pedidos
FROM 
    gestion_ventas.pedido
GROUP BY 
    DATE_PART('year', fecha)
ORDER BY 
    año;

-- 1.3.7 Subconsultas
/1.Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN)./
select*from ventas.pedido
where id_cliente=( 
	select id 
	from ventas.cliente
	where nombre ilike 'adela'
	and apellido1 ilike 'salas'
	and apellido2 ilike'díaz');
/2.Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)/
Select count(*) as total
from ventas.pedido
where id_comercial = (
  select id
  from ventas.comercial
  where nombre ilike  'daniel'
    and apellido1 ilike  'sáez'
    and apellido2 ilike  'vega'
);
/*3. Devuelve los datos del cliente que realizó el pedido más caro en el 
año 2019. (Sin utilizar INNER JOIN)*/ 

SELECT *
FROM ventas.cliente
WHERE id= ANY(SELECT id_cliente
FROM ventas.pedido
WHERE total=(SELECT MAX(total)FROM ventas.pedido WHERE fecha BETWEEN '2019-01-01' AND '2019-12-31'));

--4. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT fecha, total
FROM ventas.pedido p
INNER JOIN ventas.cliente c ON p.id_cliente = c.id
WHERE nombre = 'Pepe'
		AND apellido1 = 'Ruiz'
		AND apellido2 = 'Santana'
ORDER BY p.total ASC 
LIMIT 1;

/*5. Devuelve un listado con los datos de los clientes y los pedidos, de todos
los clientes que han realizado un pedido durante el año 2017 con un valor
mayor o igual al valor medio de los pedidos realizados durante ese
mismo año*/

SELECT c., p.
FROM ventas.cliente c
JOIN ventas.pedido p ON c.id = p.id
WHERE EXTRACT(YEAR FROM p.fecha) = 2017
AND p.total >= (
    SELECT AVG(total)
    FROM ventas.pedido
    WHERE EXTRACT(YEAR FROM fecha) = 2017
)
ORDER BY p.fecha;

-- 1.3.7.1 Con operadores básicos de comparación
1.Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN)./
select*from ventas.pedido
where id_cliente=( 
	select id 
	from ventas.cliente
	where nombre ilike 'adela'
	and apellido1 ilike 'salas'
	and apellido2 ilike'díaz');

/2.Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)/
Select count(*) as total
from ventas.pedido
where id_comercial = (
  select id
  from ventas.comercial
  where nombre ilike  'daniel'
    and apellido1 ilike  'sáez'
    and apellido2 ilike  'vega'
);

/*3. Devuelve los datos del cliente que realizó el pedido más caro en el 
año 2019. (Sin utilizar INNER JOIN)*/ 

SELECT *
FROM ventas.cliente
WHERE id= ANY(SELECT id_cliente
FROM ventas.pedido
WHERE total=(SELECT MAX(total)FROM ventas.pedido WHERE fecha BETWEEN '2019-01-01' AND '2019-12-31'));


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
