-- 1.4.4 Consultas sobre una tabla

  --1 Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
  SELECT codigo_oficina, ciudad FROM jardineria.oficina;
  
  --2 Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
  SELECT ciudad, pais, telefono FROM jardineria.oficina WHERE pais='España';
  
  --3 Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7
  SELECT nombre, apellido1, apellido2, email,codigo_jefe FROM jardineria.empleado WHERE codigo_jefe=7;
  
  --4 Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
  SELECT puesto, nombre, apellido1, apellido2, email FROM jardineria.empleado WHERE puesto='Director General';
  
  --5 Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas
  SELECT nombre, apellido1, apellido2, puesto FROM jardineria.empleado WHERE puesto<>'Representante Ventas';
  
  --6 Devuelve un listado con el nombre de los todos los clientes españoles
  SELECT nombre_cliente, pais FROM jardineria.cliente WHERE pais='Spain';
  
  --7 Devuelve un listado con los distintos estados por los que puede pasar un pedido
  SELECT DISTINCT estado FROM jardineria.pedido;
  
  --8 Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que
  --deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
  
  	--Usando Extract
  	SELECT DISTINCT codigo_cliente FROM jardineria.pago WHERE EXTRACT(YEAR FROM fecha_pago) = 2008;
  
  	SELECT DISTINCT codigo_cliente FROM jardineria.pago WHERE date_part('year', fecha_pago) = 2008;
  
  		--Usando ToChar
  	SELECT DISTINCT codigo_cliente FROM jardineria.pago WHERE TO_CHAR(fecha_pago, 'YYYY') = '2008';
  
  		--Sin usar ninguna de las anteriores
  	SELECT DISTINCT codigo_cliente FROM jardineria.pago WHERE (fecha_pago >= '2008-01-01' AND fecha_pago <= '2009-01-01');
  
  --9 Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han
  --sido entregados a tiempo.
  SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega FROM jardineria.pedido
  WHERE fecha_entrega>fecha_esperada;
  
  --10 Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha
  --de entrega ha sido al menos dos días antes de la fecha esperada.
  
  	--Utilizando suma
  	SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega FROM jardineria.pedido 
      WHERE fecha_entrega + INTERVAL '2 Days' <= fecha_esperada;
  
  
  	--Utilizando resta
  	SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega FROM jardineria.pedido 
      WHERE (fecha_esperada - fecha_entrega) >= 2;
  
  --11 Devuelve un listado de todos los pedidos que fueron rechazados en 2009
  SELECT codigo_pedido, estado, fecha_pedido FROM jardineria.pedido WHERE EXTRACT(YEAR FROM fecha_pedido)=2009 AND estado ILIKE 'Rechazado';
  
  --12 Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
  SELECT codigo_pedido, estado, fecha_entrega FROM jardineria.pedido WHERE EXTRACT(MONTH FROM fecha_entrega)=01 AND estado ILIKE 'Entregado';
  
  --13 Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor
  SELECT id_transaccion, fecha_pago, forma_pago,total FROM jardineria.pago WHERE EXTRACT(YEAR FROM fecha_pago)=2008 AND forma_pago ILIKE 'PayPal'
  ORDER BY total DESC;
  
  --14 Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer
  --formas de pago repetidas.
  SELECT DISTINCT forma_pago FROM jardineria.pago;
  
  --15 Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en
  --stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
  
  SELECT nombre, gama, cantidad_en_stock, precio_venta FROM jardineria.producto WHERE gama='Ornamentales' AND cantidad_en_stock>=100 
  ORDER BY precio_venta DESC;
  
  --16 Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código
  --de empleado 11 o 30.
  
  SELECT nombre_cliente, ciudad, codigo_empleado_rep_ventas FROM jardineria.cliente 
  WHERE ciudad='Madrid' AND codigo_empleado_rep_ventas IN (11,30);

-- 1.4.5 Consultas multitabla (Composición interna)

  --1 Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
  Select nombre_cliente, nombre, apellido1, apellido2  From jardineria. cliente 
  INNER JOIN jardineria.empleado On jardineria.cliente.codigo_empleado_rep_ventas = jardineria.empleado.codigo_empleado;
  
  --2 Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
  SELECT DISTINCT nombre_cliente, nombre AS nombre_empleado FROM jardineria.cliente 
  INNER JOIN jardineria.pago ON jardineria.cliente.codigo_cliente = jardineria.pago.codigo_cliente 
  INNER JOIN jardineria.empleado ON jardineria.cliente.codigo_empleado_rep_ventas = jardineria.empleado.codigo_empleado;
  
  --3 Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas
  SELECT DISTINCT nombre_cliente, nombre AS nombre_empleado FROM jardineria.cliente 
  LEFT JOIN jardineria.pago ON jardineria.cliente.codigo_cliente = jardineria.pago.codigo_cliente 
  JOIN jardineria.empleado ON jardineria.cliente.codigo_empleado_rep_ventas = jardineria.empleado.codigo_empleado 
  WHERE jardineria.pago.codigo_cliente IS NULL;
  
  --4 Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
  SELECT DISTINCT nombre_cliente, jardineria.empleado.nombre AS nombre_empleado, jardineria.oficina.ciudad AS ciudad_oficina FROM jardineria.cliente 
  INNER JOIN jardineria.pago ON jardineria.cliente.codigo_cliente = jardineria.pago.codigo_cliente 
  JOIN jardineria.empleado ON jardineria.cliente.codigo_empleado_rep_ventas = jardineria.empleado.codigo_empleado 
  INNER JOIN jardineria.oficina ON jardineria.empleado.codigo_oficina = jardineria.oficina.codigo_oficina;
  
  --5 Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
  SELECT DISTINCT nombre_cliente, nombre AS nombre_empleado FROM jardineria.cliente 
  LEFT JOIN jardineria.pago ON jardineria.cliente.codigo_cliente = jardineria.pago.codigo_cliente 
  JOIN jardineria.empleado ON jardineria.cliente.codigo_empleado_rep_ventas = jardineria.empleado.codigo_empleado 
  INNER JOIN jardineria.oficina ON jardineria.empleado.codigo_oficina = jardineria.oficina.codigo_oficina 
  WHERE jardineria.pago.codigo_cliente IS NULL;
  
  --6 Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
  SELECT DISTINCT jardineria.oficina.linea_direccion1, jardineria.oficina.linea_direccion2 FROM jardineria.oficina 
  INNER JOIN jardineria.empleado ON jardineria.oficina.codigo_oficina = jardineria.empleado.codigo_oficina
  JOIN jardineria.cliente ON jardineria.cliente.codigo_empleado_rep_ventas=codigo_empleado 
  WHERE jardineria.cliente.ciudad ILIKE 'fuenlabrada';
  
  --7 Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
  SELECT nombre_cliente, jardineria.empleado.nombre AS nombre_empleado, jardineria.oficina.ciudad FROM jardineria.cliente 
  INNER JOIN jardineria.empleado ON jardineria.cliente.codigo_empleado_rep_ventas = jardineria.empleado.codigo_empleado
  INNER JOIN jardineria.oficina ON jardineria.empleado.codigo_oficina = jardineria.oficina.codigo_oficina;
  
  --8 Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
  SELECT e.nombre AS nombre_empleado, e.apellido1 AS apellido1_empleado, j.nombre AS nombre_jefe, j.apellido1 AS apellido1_jefe FROM jardineria.empleado e
  LEFT JOIN jardineria.empleado j ON e.codigo_jefe = j.codigo_empleado;
  
  --9 Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
  SELECT e.nombre AS nombre_empleado, e.apellido1 AS apellido1_empleado, j.nombre AS nombre_jefe, j.apellido1 AS apellido1_jefe, 
  j2.nombre AS nombre_jefe_jefe, j2.apellido1 AS apellido_jefe_jefe FROM jardineria.empleado e
  INNER JOIN jardineria.empleado j ON e.codigo_jefe = j.codigo_empleado 
  INNER JOIN jardineria.empleado j2 ON j.codigo_jefe=j2.codigo_empleado;
  
  --10 Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
  SELECT DISTINCT jardineria.cliente.nombre_cliente FROM jardineria.cliente 
  INNER JOIN jardineria.pedido ON jardineria.cliente.codigo_cliente = jardineria.pedido.codigo_cliente
  WHERE jardineria.pedido.fecha_entrega > jardineria.pedido.fecha_esperada;
  
  --11 Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
  SELECT DISTINCT jardineria.cliente.nombre_cliente, jardineria.producto.gama FROM jardineria.cliente 
  INNER JOIN jardineria.pedido ON jardineria.cliente.codigo_cliente = jardineria.pedido.codigo_cliente
  INNER JOIN  jardineria.detalle_pedido ON jardineria.pedido.codigo_pedido = jardineria.detalle_pedido.codigo_pedido
  INNER JOIN jardineria.producto ON jardineria.detalle_pedido.codigo_producto = jardineria.producto.codigo_producto;

-- 1.4.6 Consultas multitabla (Composición externa)

-- 1.4.7 Consultas resumen
  --1. ¿Cuántos empleados hay en la compañía?
  SELECT COUNT (*) AS total_empleados
  FROM jardineria.empleado;
  
  --2. ¿Cuántos clientes tiene cada país?
  SELECT pais, COUNT(*) AS total_cliente
  FROM jardineria.cliente
  GROUP BY pais;
  
  --3. ¿Cuál fue el pago medio en 2009?
  SELECT AVG(total) AS promedio_pago_2009 FROM jardineria.pago WHERE EXTRACT(YEAR FROM fecha_pago)=2009
    
  --4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
  SELECT estado, COUNT(estado) AS cantidad_pedidos
  FROM jardineria.pedido 
  GROUP BY estado
  ORDER BY cantidad_pedidos DESC;
  
  --5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.
  SELECT MIN(precio_venta) AS producto_mas_barato,
  MAX(precio_venta) AS producto_mas_caro
  FROM jardineria.producto;
  
  --6. Calcula el número de clientes que tiene la empresa.
  SELECT COUNT(*) AS total_clientes
  FROM jardineria.cliente;
  
  --7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
  SELECT COUNT(*) AS total_clientes_Madrid
  FROM jardineria.cliente
  WHERE ciudad = 'Madrid';
  
  --8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
  SELECT ciudad, COUNT(*) AS clientes_por_ciudad FROM jardineria.cliente WHERE ciudad ILIKE 'M%' GROUP BY ciudad
    
  --9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
  SELECT empleado.nombre AS Representante_de_Ventas, COUNT(cliente.codigo_cliente) AS numero_clientes
  FROM jardineria.empleado 
  INNER JOIN jardineria.cliente
  ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
  GROUP BY empleado.nombre;
  
  --10. Calcula el número de clientes que no tiene asignado representante de ventas.
  SELECT COUNT(cliente) as sin_representante_ventas 
  FROM jardineria.cliente
  WHERE codigo_empleado_rep_ventas is null;
  
  --11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
  SELECT cliente.nombre_contacto AS Nombre_cliente, cliente.apellido_contacto AS Apellidos_cliente,MIN(pago.fecha_pago) 
  AS fecha_primer_pago, MAX(pago.fecha_pago) AS fecha_ultimo_pago FROM jardineria.cliente 
  JOIN jardineria.pago ON cliente.codigo_cliente =  pago.codigo_cliente 
  GROUP BY cliente.codigo_cliente, cliente.nombre_contacto, cliente.apellido_contacto;
  
  --12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.
  SELECT codigo_pedido, COUNT(cantidad) AS total_productos FROM jardineria.detalle_pedido GROUP BY codigo_pedido
  ORDER BY codigo_pedido ASC;
  
  --13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
  SELECT codigo_pedido, SUM(cantidad) AS cantidad_total_pedido FROM jardineria.detalle_pedido GROUP BY codigo_pedido ORDER BY codigo_pedido ASC
  
  --14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total
  --de unidades vendidas.
  SELECT d.codigo_producto, p.nombre as producto, SUM(d.cantidad) as unidades_vendidas FROM jardineria.detalle_pedido d
  JOIN jardineria.producto p ON p.codigo_producto = d.codigo_producto GROUP BY d.codigo_producto,p.nombre ORDER BY unidades_vendidas DESC
  LIMIT 20;
  
  --15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto
  --por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.
  SELECT SUM(dp.precio_unidad * dp.cantidad) AS base_imponible, SUM(dp.precio_unidad * dp.cantidad) * 0.21 AS iva, 
  SUM(dp.precio_unidad * dp.cantidad) + (SUM(dp.precio_unidad * dp.cantidad) * 0.21) AS total_facturado FROM jardineria.detalle_pedido dp
  
  --16. La misma información que en la pregunta anterior, pero agrupada por código de producto.
  SELECT dp.codigo_producto, ROUND(SUM(dp.precio_unidad * dp.cantidad),2) as base_imponible, ROUND(SUM(dp.precio_unidad * dp.cantidad * 0.21),2) as IVA,
  ROUND(SUM(dp.precio_unidad * dp.cantidad * 1.21),2) as total_facturado FROM jardineria.detalle_pedido dp GROUP BY dp.codigo_producto;
  
  --17. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
  SELECT p.codigo_producto, (p.precio_venta * q.cantidad) AS BASE_IMPONIBLE, ((p.precio_venta * q.cantidad)* 0.21) AS IVA, ((p.precio_venta * q.cantidad) + ((p.precio_venta * q.cantidad)* 0.21)) AS TOTAL
  FROM jardineria.producto p INNER JOIN jardineria.detalle_pedido q ON p.codigo_producto = q.codigo_producto WHERE p.codigo_producto LIKE 'OR%'  
  GROUP BY p.codigo_producto,precio_venta, cantidad;
  
  --18. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos
  --(21% IVA).
  SELECT p.nombre AS nombre_producto, SUM(dp.cantidad) AS unidades_vendidas, SUM(dp.cantidad * dp.precio_unidad) AS total_facturado, ROUND(SUM(dp.cantidad * dp.precio_unidad) * 1.21, 2) AS total_con_iva
  FROM jardineria.detalle_pedido dp JOIN jardineria.producto p ON dp.codigo_producto = p.codigo_producto
  GROUP BY p.nombre HAVING SUM(dp.cantidad * dp.precio_unidad) > 3000 ORDER BY total_facturado DESC
  
  --19. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
  SELECT DATE_PART('YEAR',p.fecha_pago) AS año, SUM(p.total) AS suma_total_pagos FROM jardineria.pago p
  GROUP BY DATE_PART('YEAR',p.fecha_pago) ORDER BY año;

-- 1.4.8 Subconsultas

-- 1.4.8.1 Con operadores básicos de comparación

-- 1.4.8.2 Subconsultas con ALL y ANY
  --9. Devuelve el nombre del producto que tenga el precio de venta más caro.
  SELECT * FROM jardineria.producto p  WHERE p.precio_venta >= ALL (SELECT p2.precio_venta FROM jardineria.producto p2)
  
  --10. Devuelve el producto que menos unidades tiene en stock.
  SELECT * FROM jardineria.producto WHERE p.cantidad_en_stock <= ALL(SELECT p2.cantidad_en_stock FROM jardineria.producto p2)

-- 1.4.8.3 Subconsultas con IN y NOT IN
  --11. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
  SELECT nombre, apellido1, puesto FROM jardineria.empleado WHERE codigo_empleado NOT IN (
    SELECT codigo_empleado_rep_ventas FROM jardineria.cliente
    WHERE codigo_empleado_rep_ventas IS NOT NULL)
  --12. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
  SELECT * FROM jardineria.cliente
  WHERE codigo_cliente NOT IN ( SELECT codigo_cliente FROM jardineria.pago)
    
  --13. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
  SELECT * FROM jardineria.cliente
  WHERE codigo_cliente  IN (
    SELECT codigo_cliente FROM jardineria.pago)
    
  --14. Devuelve un listado de los productos que nunca han aparecido en un pedido.
  SELECT * FROM jardineria.producto
  WHERE codigo_producto NOT IN (
    SELECT codigo_producto FROM jardineria.detalle_pedido)
    
  --15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
  SELECT  e.nombre, e.apellido1, e.apellido2, e.puesto, o.telefono FROM jardineria.empleado e
  JOIN jardineria.oficina o ON e.codigo_oficina = o.codigo_oficina
  WHERE e.codigo_empleado NOT IN (
    SELECT codigo_empleado_rep_ventas  FROM jardineria.cliente 
    WHERE codigo_empleado_rep_ventas IS NOT NULL
  )
  
  --16. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
  SELECT * FROM jardineria.oficina
  WHERE codigo_oficina  NOT IN (
    SELECT  e.codigo_oficina  FROM jardineria.empleado e
    JOIN jardineria.cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
    JOIN jardineria.pedido p ON c.codigo_cliente = p.codigo_cliente
    JOIN jardineria.detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
    JOIN jardineria.producto pr ON dp.codigo_producto = pr.codigo_producto
    WHERE pr.gama ILIKE'Frutales'
  )
    
  --17. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
  SELECT c.nombre_cliente FROM jardineria.cliente c
  WHERE c.codigo_cliente IN (
    SELECT p.codigo_cliente FROM jardineria.pedido p
  )
  AND c.codigo_cliente NOT IN (
    SELECT pg.codigo_cliente FROM jardineria.pago pg
    WHERE pg.codigo_cliente IS NOT NULL
  ) 
-- 1.4.8.4 Subconsultas con EXISTS y NOT EXISTS
  --18. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
  SELECT c.nombre_cliente FROM jardineria.cliente c
  WHERE NOT EXISTS (
    SELECT 1 FROM jardineria.pago p
    WHERE p.codigo_cliente = c.codigo_cliente
  )

--19.Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
SELECT cliente.codigo_cliente, cliente.nombre_cliente
FROM jardineria.cliente
WHERE EXISTS (
    SELECT 1
    FROM jardineria.pago
    WHERE pago.codigo_cliente = cliente.codigo_cliente);

--20.Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT producto.codigo_producto, producto.nombre
FROM jardineria.producto
WHERE NOT EXISTS (
    SELECT 1
    FROM jardineria.detalle_pedido
    WHERE detalle_pedido.codigo_producto = producto.codigo_producto);

--21.Devuelve un listado de los productos que han aparecido en un pedido alguna vez.
SELECT producto.codigo_producto, producto.nombre
FROM jardineria.producto
WHERE EXISTS (
    SELECT 1
    FROM jardineria.detalle_pedido
    WHERE detalle_pedido.codigo_producto = producto.codigo_producto);

-- 1.4.8.5 Subconsultas correlacionadas


-- 1.4.9 Consultas variadas
--1.Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
SELECT cliente.nombre_cliente, COUNT(pedido.codigo_pedido) AS cantidad_pedidos
FROM jardineria.cliente
LEFT JOIN jardineria.pedido
  ON cliente.codigo_cliente = pedido.codigo_cliente
GROUP BY cliente.nombre_cliente
ORDER BY cantidad_pedidos DESC;

--2.Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
SELECT cliente.nombre_cliente,
  COALESCE(SUM(pago.total), 0) AS total_pagado
FROM jardineria.cliente
LEFT JOIN jardineria.pago
  ON cliente.codigo_cliente = pago.codigo_cliente
GROUP BY cliente.nombre_cliente
ORDER BY total_pagado DESC;

--3.Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.
SELECT DISTINCT cliente.nombre_cliente
FROM jardineria.cliente
JOIN jardineria.pedido
  ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE EXTRACT(YEAR FROM pedido.fecha_pedido) = 2008
ORDER BY cliente.nombre_cliente ASC;

--4.Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.
SELECT 
  cliente.nombre_cliente,
  empleado.nombre AS nombre_representante,
  empleado.apellido1 AS apellido_representante,
  oficina.telefono AS telefono_oficina
FROM jardineria.cliente
JOIN jardineria.empleado
  ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
JOIN jardineria.oficina
  ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE NOT EXISTS (
  SELECT 1
  FROM jardineria.pago
  WHERE pago.codigo_cliente = cliente.codigo_cliente);

--5.Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.
SELECT 
  cliente.nombre_cliente,
  empleado.nombre AS nombre_representante,
  empleado.apellido1 AS apellido_representante,
  oficina.ciudad AS ciudad_oficina
FROM jardineria.cliente
JOIN jardineria.empleado
  ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
JOIN jardineria.oficina
  ON empleado.codigo_oficina = oficina.codigo_oficina

--6.Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
SELECT 
  empleado.nombre,
  empleado.apellido1,
  empleado.apellido2,
  empleado.puesto,
  oficina.telefono
FROM jardineria.empleado
JOIN jardineria.oficina
  ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE NOT EXISTS (
  SELECT 1
  FROM jardineria.cliente
  WHERE cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado);

--7.Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
SELECT 
  oficina.ciudad,
  COUNT(empleado.codigo_empleado) AS numero_empleados
FROM jardineria.oficina
LEFT JOIN jardineria.empleado
  ON oficina.codigo_oficina = empleado.codigo_oficina
GROUP BY oficina.ciudad
