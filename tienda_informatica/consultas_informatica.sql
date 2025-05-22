--1.1.3 Consultas sobre una tabla

--1.1.4 Consultas multitabla (Composición interna)

--1.1.5 Consultas multitabla (Composición externa)

--1.1.6 Consultas resumen

  --26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
  SELECT f.nombre, COUNT(p.id) AS num_productos FROM tienda_informatica.fabricante f JOIN tienda_informatica.producto p ON f.id = p.id_fabricante
  WHERE p.precio >= 220 GROUP BY f.nombre HAVING COUNT(p.id) > 0

  --27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
  SELECT f.nombre, COUNT(p.id) AS num_productos FROM tienda_informatica.fabricante f 
  LEFT JOIN tienda_informatica.producto p ON f.id = p.id_fabricante AND p.precio >= 220 GROUP BY f.nombre

  --28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
  SELECT f.nombre, SUM(p.precio) AS suma_precios FROM tienda_informatica.fabricante f
  JOIN tienda_informatica.producto p ON f.id = p.id_fabricante GROUP BY f.nombre HAVING SUM(p.precio) > 1000

  --29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
  SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM tienda_informatica.producto p
  JOIN tienda_informatica.fabricante f ON p.id_fabricante = f.id WHERE p.precio = (SELECT MAX(p2.precio) 
  FROM tienda_informatica.producto p2 WHERE p2.id_fabricante = p.id_fabricante) ORDER BY f.nombre ASC

--1.1.7 Subconsultas (En la cláusula WHERE)
--1.1.7.1 Con operadores básicos de comparación
    
  --1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
  SELECT * FROM tienda_informatica.producto WHERE id_fabricante = (SELECT id FROM tienda_informatica.fabricante WHERE nombre = 'Lenovo')

  --2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
  SELECT * FROM tienda_informatica.producto WHERE precio = (SELECT MAX(precio) FROM tienda_informatica.producto 
  WHERE id_fabricante = (SELECT id FROM tienda_informatica.fabricante WHERE nombre = 'Lenovo'))

  --3. Lista el nombre del producto más caro del fabricante Lenovo
  SELECT p.nombre
  FROM tiendainformatica.fabricante f
  INNER JOIN tiendainformatica.producto p ON f.id = p.id_fabricante
  WHERE f.nombre='Lenovo' and p.precio = (
    SELECT MAX(p1.precio)
    FROM tiendainformatica.producto p1
	WHERE p1.id_fabricante = f.id
  );

  --4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
  SELECT p.nombre
  FROM tiendainformatica.fabricante f
  INNER JOIN tiendainformatica.producto p ON f.id = p.id_fabricante
  WHERE f.nombre='Hewlett-Packard' and p.precio = (
    SELECT min(p1.precio)
    FROM tiendainformatica.producto p1
	WHERE p1.id_fabricante = f.id
  );

  --5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
  SELECT p.nombre, p.precio
  FROM tiendainformatica.producto p
  WHERE p.precio >= (
      SELECT MAX(p1.precio)
      FROM tiendainformatica.producto p1
      INNER JOIN tiendainformatica.fabricante f ON p1.id_fabricante = f.id
      WHERE f.nombre = 'Lenovo'
  );

  --6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
  SELECT p.nombre FROM tiendainformatica.producto p where p.precio>= (select avg(p.precio) from tiendainformatica.producto p)

--1.1.7.2 Subconsultas con ALL y ANY

  --7. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
    select p.nombre from tiendainformatica.producto p
    where p.precio>= all (select p1.precio from tiendainformatica.producto p1)
  
  --8. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
  select p.nombre from tiendainformatica.producto p
  where p.precio<= all (select p1.precio from tiendainformatica.producto p1)
  
  --9. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
  select f.nombre from tiendainformatica.fabricante f
  where f.id= any(select p.id_fabricante from tiendainformatica.producto p)

  --10. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
  SELECT f.nombre
  FROM tiendainformatica.fabricante f
  WHERE f.id <> ALL (
      SELECT f1.id
      FROM tiendainformatica.fabricante f1
      INNER JOIN tiendainformatica.producto p ON f1.id = p.id_fabricante
  );

--1.1.7.3 Subconsultas con IN y NOT IN

  --11. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
  SELECT f.nombre FROM tiendainformatica.fabricante f
  WHERE f.id in (SELECT f1.id FROM tiendainformatica.fabricante f1 INNER JOIN tiendainformatica.producto p ON f1.id = p.id_fabricante)
  
  --12. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
  SELECT f.nombre FROM tiendainformatica.fabricante f
  WHERE f.id not in (SELECT f1.id FROM tiendainformatica.fabricante f1 INNER JOIN tiendainformatica.producto p ON f1.id = p.id_fabricante)

--1.1.7.4 Subconsultas con EXISTS y NOT EXISTS

  --13. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
  SELECT f.nombre FROM tiendainformatica.fabricante f
  WHERE EXISTS (SELECT 1 FROM tiendainformatica.producto p WHERE p.id_fabricante = f.id);
  
  --14. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
  SELECT f.nombre FROM tiendainformatica.fabricante f
  WHERE NOT EXISTS (SELECT 1 FROM tiendainformatica.producto p WHERE p.id_fabricante = f.id);

--1.1.7.5 Subconsultas correlacionadas

  --15. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro. 
  SELECT f.nombre, 
         (SELECT p.nombre 
          FROM tiendainformatica.producto p 
          WHERE p.id_fabricante = f.id
          ORDER BY p.precio DESC 
          LIMIT 1) AS producto_mas_caro,
         (SELECT MAX(p.precio) 
          FROM tiendainformatica.producto p 
          WHERE p.id_fabricante = f.id) AS precio_maximo
  FROM tiendainformatica.fabricante f
  
  --16. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
  SELECT p.nombre, p.precio FROM tiendainformatica.producto p
  WHERE p.precio >= (SELECT AVG(p2.precio) FROM tiendainformatica.producto p2 WHERE p2.id_fabricante = p.id_fabricante)
  
  --17. Lista el nombre del producto más caro del fabricante Lenovo.
  SELECT p.nombre, p.precio FROM tiendainformatica.producto pJoin tiendainformatica.fabricante f on p.id_fabricante=f.id
  WHERE f.nombre = 'Lenovo' AND p.precio = (SELECT MAX(p2.precio) FROM tiendainformatica.producto p2 WHERE p2.id_fabricante = p.id_fabricante)

--1.1.8 Subconsultas (En la cláusula HAVING)
