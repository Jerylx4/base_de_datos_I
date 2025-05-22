-- 1.3.3 Consultas sobre una tabla

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

-- 1.3.7.2 Subconsultas con ALL y ANY

-- 1.3.7.3 Subconsultas con IN y NOT IN

-- 1.3.7.4 Subconsultas con EXISTS y NOT EXISTS

