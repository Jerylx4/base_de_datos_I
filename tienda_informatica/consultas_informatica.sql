--1.1.3 Consultas sobre una tabla

--1.1.4 Consultas multitabla (Composición interna)

--1.1.5 Consultas multitabla (Composición externa)

--1.1.6 Consultas resumen

-- 26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
SELECT f.nombre, COUNT(p.id) AS num_productos FROM tienda_informatica.fabricante f JOIN tienda_informatica.producto p ON f.id = p.id_fabricante
WHERE p.precio >= 220 GROUP BY f.nombre HAVING COUNT(p.id) > 0

-- 27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
SELECT f.nombre, COUNT(p.id) AS num_productos FROM tienda_informatica.fabricante f 
LEFT JOIN tienda_informatica.producto p ON f.id = p.id_fabricante AND p.precio >= 220 GROUP BY f.nombre;

-- 28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.


-- 29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.


--1.1.7 Subconsultas (En la cláusula WHERE)

--1.1.7.1 Con operadores básicos de comparación

--1.1.7.2 Subconsultas con ALL y ANY

--1.1.7.3 Subconsultas con IN y NOT IN

--1.1.7.4 Subconsultas con EXISTS y NOT EXISTS

--1.1.7.5 Subconsultas correlacionadas

--1.1.8 Subconsultas (En la cláusula HAVING)
