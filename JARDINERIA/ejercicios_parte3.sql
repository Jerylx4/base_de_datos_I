----------
--PARTE 3
----------

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
