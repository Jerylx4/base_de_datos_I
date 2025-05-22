-- 1.4.4 Consultas sobre una tabla

-- 1.4.5 Consultas multitabla (Composición interna)

-- 1.4.6 Consultas multitabla (Composición externa)

-- 1.4.7 Consultas resumen

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

-- 1.4.8.5 Subconsultas correlacionadas

-- 1.4.9 Consultas variadas
