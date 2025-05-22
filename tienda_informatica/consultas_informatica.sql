--1.1.3 Consultas sobre una tabla
--1.Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre  FROM tienda_informatica.producto;

--2.Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM tienda_informatica.producto;

--3.Lista todas las columnas de la tabla producto.
SELECT * FROM tienda_informatica.producto;

--4.Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio AS euros, precio * 1.07 AS dolares 
FROM tienda_informatica.producto;

--5.Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). 
--Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS "nombre de producto", precio AS euros, precio * 1.07 AS dolares 
FROM tienda_informatica.producto;

--6.Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio 
FROM tienda_informatica.producto;

--7.Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre), precio 
FROM tienda_informatica.producto;

--8.Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los 
--dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) AS primeros_caracteres 
FROM tienda_informatica.fabricante;

--9.Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio) AS precio_redondeado 
FROM tienda_informatica.producto;

--10.Lista los nombres y los precios de todos los productos de la tabla producto, 
--truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNC(precio) AS precio_truncado 
FROM tienda_informatica.producto;

--11.Lista el identificador de los fabricantes que tienen productos en la tabla producto.
SELECT id_fabricante 
FROM tienda_informatica.producto;

--12.Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
SELECT DISTINCT id_fabricante 
FROM tienda_informatica.producto;

--13Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre
FROM tienda_informatica.fabricante
ORDER BY nombre asc;

--14.Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre
FROM tienda_informatica.fabricante 
ORDER BY nombre desc;

--15.Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre
FROM tienda_informatica.producto
ORDER BY nombre asc, precio desc;

--16.Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * 
FROM tienda_informatica.fabricante 
LIMIT 5;

--17.Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * 
FROM tienda_informatica.fabricante 
LIMIT 5
OFFSET 3;

--18.Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT).
SELECT t.nombre,t.precio
FROM tienda_informatica.producto t
ORDER BY t.precio asc 
LIMIT 1;

--19.Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT).
SELECT t.nombre,t.precio
FROM tienda_informatica.producto t
ORDER BY t.precio desc 
LIMIT 1;

--20.Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
SELECT nombre
FROM tienda_informatica.producto
WHERE id_fabricante = 2;

--21.Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre,precio as precio_USD,(precio*0.93) as precio_Euro
FROM tienda_informatica.producto
WHERE (precio*0.93) <= 120;

--22.Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre,precio as precio_USD,(precio*0.93) as precio_Euro
FROM tienda_informatica.producto
WHERE (precio*0.93)>= 400;

--23.Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre,precio as precio_USD,(precio*0.93) as precio_Euro
FROM tienda_informatica.producto
WHERE NOT (precio*0.93)>= 400;

--24.Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT nombre,precio as precio_USD,(precio*0.93) as precio_Euro
FROM tienda_informatica.producto
WHERE (precio*0.93)>= 80 AND (precio*0.93)<=300;

--25.Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT nombre,precio as precio_USD,(precio*0.93) as precio_Euro
FROM tienda_informatica.producto
WHERE (precio*0.93) BETWEEN 60 AND 200;

--26.Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
SELECT *,(precio*0.93) as precio_Euro
FROM tienda_informatica.producto
WHERE (precio*0.93)>=200 AND id_fabricante=6;

--27.Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT *
FROM tienda_informatica.producto
WHERE id_fabricante=1 OR id_fabricante=3 OR id_fabricante=5;

--28.Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT *
FROM tienda_informatica.producto
WHERE id_fabricante IN (1,3,5);

--29.Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT p.nombre,p.precio*100 AS centimos
FROM tienda_informatica.producto p;

--30.Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.

SELECT f.nombre
FROM tienda_informatica.fabricante f
WHERE f.nombre LIKE 'S%';

--31.Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre 
FROM tienda_informatica.fabricante 
WHERE nombre LIKE '%e';

--32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre 
FROM tienda_informatica.fabricante 
WHERE nombre LIKE '%w%';

--33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre
FROM tiendainformatica.fabricante
WHERE LENGTH(nombre) = 4;

--34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT p.nombre 
FROM "Tienda_Informatica".producto p
WHERE p.nombre LIKE '%Portátil%';

--35. Devuelve una lista con el nombre de todos los productos que contienen 
la cadena Monitor en el nombre y tienen un precio inferior a 215 €. */
SELECT nombre 
FROM "tiendaInformatica"."producto" 
WHERE nombre LIKE '%Monitor%' AND precio < 215;

--36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. 
--Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre 
--(en orden ascendente).
SELECT p.nombre, p.precio
FROM "tienda".producto p
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;
--1.1.4 Consultas multitabla (Composición interna)
--1. Devuelve una lista con el nombre del producto, precio y nombre
de fabricante de todos los productos de la base de datos.*/

SELECT 
    p.nombre AS nombre_producto,
    p.precio,
    f.nombre AS nombre_fabricante
FROM 
    tiendainformatica.producto p
JOIN 
    tiendainformatica.fabricante f ON p.id_fabricante = f.id
ORDER BY 
    p.nombre;

--2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos 
--los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
--SQL1
SELECT p.nombre, p.precio, p.id_fabricante
FROM "Tienda_Informatica".producto p, "Tienda_Informatica".fabricante f
WHERE p.id_fabricante = f.id
ORDER BY f.nombre;
--SQL2
SELECT p.nombre, p.precio, p.id_fabricante
FROM "Tienda_Informatica".producto p
JOIN "Tienda_Informatica".fabricante f 
ON p.id_fabricante = f.id
ORDER BY f.nombre;

/*3. Devuelve una lista con el identificador del producto, nombre del 
producto, identificador del fabricante y nombre del fabricante, de 
todos los productos de la base de datos.*/
SELECT pro.id, pro.nombre, fa.id AS fabricante_id, fa.nombre AS fabricante_nombre
FROM "tiendaInformatica"."producto" AS pro
INNER JOIN "tiendaInformatica"."fabricante" AS fa ON pro.id_fabricante = fa.id;

--4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
--SQL2
SELECT p.nombre, p.precio, f.nombre
FROM "tienda".producto p
JOIN "tienda".fabricante f ON p.id_fabricante = f.id
ORDER BY p.precio ASC 
LIMIT 1;

--SQL1
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante
FROM "tienda".producto p, "tienda".fabricante f
WHERE p.id_fabricante = f.id
  AND p.precio = (
    SELECT MIN(precio)
    FROM "tienda".producto
  );

/*5. Devuelve el nombre del producto, su precio y el nombre de su
fabricante, del producto más caro.*/

SELECT 
    p.nombre AS nombre_producto,
    p.precio,
    f.nombre AS nombre_fabricante
FROM 
    tiendainformatica.producto p
JOIN 
    tiendainformatica.fabricante f ON p.id_fabricante = f.id
WHERE 
    p.precio = (SELECT MAX(precio) FROM tiendainformatica.producto);

--6. Devuelve una lista de todos los productos del fabricante Lenovo.
--SQL1
SELECT *, f.nombre AS Fabricante
FROM "Tienda_Informatica".producto p, "Tienda_Informatica".fabricante f
WHERE p.id_fabricante = f.id
AND f.nombre = 'Lenovo';
--SQL2
SELECT *, f.nombre AS Fabricante
FROM "Tienda_Informatica".producto p
JOIN "Tienda_Informatica".fabricante f 
ON p.id_fabricante = f.id
WHERE f.nombre LIKE '%Lenovo%';

/*7. Devuelve una lista de todos los productos del 
fabricante Crucial que tengan un precio mayor que 200€. */
SELECT pro.nombre, pro.precio, fa.nombre
FROM "tiendaInformatica"."producto" AS pro
INNER JOIN "tiendaInformatica"."fabricante" AS fa ON pro.id_fabricante = fa.id
WHERE fa.nombre = 'Crucial' AND pro.precio > 200;

--8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. 
--Sin utilizar el operador IN.

--SQL1
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante
FROM "tienda".producto p, "tienda".fabricante f
WHERE p.id_fabricante = f.id
  AND (
       f.nombre = 'Asus'
    OR f.nombre = 'Hewlett-Packard'
    OR f.nombre = 'Seagate'
  );
--SQL2
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante
FROM "tienda".producto p
JOIN "tienda".fabricante f ON p.id_fabricante = f.id
WHERE f.nombre = 'Asus'
   OR f.nombre = 'Hewlett-Packard'
   OR f.nombre = 'Seagate';

/*9. Devuelve un listado con todos los productos de los
fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el
operador IN*/

SELECT 
    p.nombre AS nombre_producto,
    p.precio,
    f.nombre AS nombre_fabricante
FROM 
    tiendainformatica.producto p
JOIN 
    tiendainformatica.fabricante f ON p.id_fabricante = f.id
WHERE 
    f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate')
ORDER BY 
    f.nombre, p.nombre;

--10. Devuelve un listado con el nombre y el precio de todos los productos de los 
--fabricantes cuyo nombre termine por la vocal e.

--SQL1
SELECT p.nombre, p.precio , f.nombre
FROM "Tienda_Informatica".producto p, "Tienda_Informatica".fabricante f
WHERE p.id_fabricante = f.id
AND f.nombre LIKE '%e';
  
--SQL2
SELECT p.nombre, p.precio , f.nombre
FROM "Tienda_Informatica".producto p
JOIN "Tienda_Informatica".fabricante f 
ON p.id_fabricante = f.id
WHERE f.nombre LIKE '%e';

/*11. Devuelve un listado con el nombre y el precio de todos los 
productos cuyo nombre de fabricante contenga el carácter w en su 
nombre.*/
SELECT pro.nombre, pro.precio, fa.nombre AS nombre_fabricante
FROM "tiendaInformatica"."producto" AS pro
JOIN "tiendaInformatica"."fabricante" AS fa ON pro.id_fabricante = fa.id
WHERE fa.nombre LIKE '%w%';

--12.	Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos 
--que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) 
--y en segundo lugar por el nombre (en orden ascendente)
--SQL1
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante
FROM "tienda".producto p, "tienda".fabricante f
WHERE p.id_fabricante = f.id
  AND p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

--SQL2
SELECT p.nombre, p.precio, f.nombre 
FROM "tienda".producto p
INNER JOIN "tienda".fabricante f ON p.id_fabricante = f.id
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

--13.Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos 
--fabricantes que tienen productos asociados en la base de datos.

SELECT DISTINCT f.id, f.nombre
FROM tienda_informatica.fabricante f, tienda_informatica.producto p
WHERE f.id = p.id_fabricante;

--1.1.5 Consultas multitabla (Composición externa)

--1. Devuelve un listado de todos los fabricantes que existen en la base de datos, 
--junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también 
--aquellos fabricantes que no tienen productos asociados

SELECT f.*, p.*
FROM "Tienda_Informatica".fabricante f
LEFT JOIN "Tienda_Informatica".producto p
ON f.id = p.id_fabricante;

/*2. Devuelve un listado donde sólo aparezcan aquellos fabricantes 
que no tienen ningún producto asociado. */
SELECT f.nombre
FROM "tiendaInformatica"."producto" p 
RIGHT JOIN "tiendaInformatica"."fabricante" f ON p.id_fabricante = f.id
WHERE p.id_fabricante IS NULL;
GROUP BY  d.nombre;

--3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.

/*La columna id_fabricante está definida como NOT NULL, lo que obliga a que cada producto tenga un valor 
en esa columna (es decir, debe tener un fabricante asociado). id_fabricante integer NOT NULL
Además, id_fabricante es una clave foránea (FOREIGN KEY) que referencia fabricante(id), por lo que:
Ese valor debe coincidir con un id válido de la tabla fabricante.*/

--1.1.6 Consultas resumen

--1. Calcula el número total de productos que hay en la
tabla productos.

SELECT COUNT(*) AS total_productos
FROM tiendainformatica.producto;
--2. Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(*) AS total_fabricantes
FROM "Tienda_Informatica".fabricante;

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

	-- 18. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
	SELECT f.nombre, COUNT(p.nombre) AS numero_producto FROM tienda_informatica.fabricante f
	INNER JOIN tienda_informatica.producto p ON p.id_fabricante = f.id
	WHERE f.nombre NOT ILIKE 'lenovo'
	GROUP BY f.nombre 
	HAVING COUNT(p.nombre) = (
	SELECT COUNT(p.nombre) FROM tienda_informatica.fabricante f
	INNER JOIN tienda_informatica.producto p ON p.id_fabricante = f.id 
	WHERE f.nombre ILIKE 'lenovo'
	)
