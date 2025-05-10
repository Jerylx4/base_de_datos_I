----------
--PARTE 1
----------

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