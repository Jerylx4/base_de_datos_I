----------
--PARTE 2
----------

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
