-- 1.2.3 Consultas sobre una tabla
--1.Lista el primer apellido de todos los empleados:
SELECT apellido1 FROM gestion_empleados.empleado;

--2.Lista el primer apellido de los empleados eliminando duplicados:
SELECT DISTINCT apellido1 FROM gestion_empleados.empleado;

--3.Lista todas las columnas de la tabla empleado:
SELECT * FROM gestion_empleados.empleado;

--4.Lista el nombre y los apellidos de todos los empleados:
SELECT nombre, apellido1, apellido2 FROM gestion_empleados.empleado;

--5.Lista el identificador de los departamentos de los empleados:
SELECT id_departamento FROM gestion_empleados.empleado;

--6.Lista el identificador de los departamentos sin repetir:
SELECT DISTINCT id_departamento FROM gestion_empleados.empleado;

--7.Lista nombre y apellidos en una única columna:
SELECT CONCAT(nombre, ' ', apellido1, ' ', COALESCE(apellido2, '')) AS nombre_completo 
FROM gestion_empleados.empleado;

--8.Lista nombre y apellidos en mayúsculas:
SELECT UPPER(CONCAT(nombre, ' ', apellido1, ' ', COALESCE(apellido2, ''))) AS nombre_completo 
FROM gestion_empleados.empleado;

--9.Lista nombre y apellidos en minúsculas:
SELECT LOWER(CONCAT(nombre, ' ', apellido1, ' ', COALESCE(apellido2, ''))) AS nombre_completo 
FROM gestion_empleados.empleado;
--10.Lista identificador de empleados con NIF separado en dígitos y letra:
SELECT 
    id,
    SUBSTRING(nif, 1, 8) AS digitos_nif,
    SUBSTRING(nif, 9, 1) AS letra_nif
FROM gestion_empleados.empleado;

  --11. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para calcular este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) los gastos que se han generado (columna gastos). 
  --Tenga en cuenta que en algunos casos pueden existir valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.
  SELECT * FROM departamento
  SELECT * FROM empleado
  SELECT nombre,presupuesto,gastos,(presupuesto-gastos) AS presupuesto_actual FROM departamento
  
  --12. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
  SELECT nombre,presupuesto,gastos,(presupuesto-gastos) AS presupuesto_actual FROM departamento
  ORDER BY presupuesto_actual ASC
  
  --13.Lista el nombre de todos los departamentos ordenados de forma ascendente.
  SELECT nombre FROM departamento
  ORDER BY nombre ASC
  
  --14. Lista el nombre de todos los departamentos ordenados de forma descendente.
  SELECT nombre FROM departamento
  ORDER BY nombre DESC
  
  --15. Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.
  SELECT apellido1,apellido2,nombre FROM empleado
  ORDER BY apellido1 ASC
  
  --16.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
  SELECT nombre,presupuesto FROM departamento
  ORDER BY presupuesto DESC
  LIMIT 3
  
  --17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
  SELECT nombre,presupuesto FROM departamento
  ORDER BY presupuesto ASC
  LIMIT 3
  
  --18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
  SELECT nombre,gastos FROM departamento
  ORDER BY gastos DESC
  LIMIT 2
  
  --19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
  SELECT nombre,gastos FROM departamento
  ORDER BY gastos ASC
  LIMIT 2

  -- 1.2.4 Consultas multitabla (Composición interna)
  --7. Devuelve un listado con los datos de los empleados que trabajan en el --departamento de I+D. Ordena el resultado alfabéticamente.
  SELECT e.*
  FROM empleado.empleado e
  JOIN empleado.departamento d ON e.id_departamento = d.id
  WHERE d.nombre = 'I+D'
  ORDER BY e.nombre, e.apellido1, e.apellido2;
  --8. Devuelve un listado con los datos de los empleados que trabajan en el --departamento de Sistemas, Contabilidad o I+D.
  --Ordena el resultado alfabéticamente.
  SELECT e.*
  FROM empleado.empleado e
  JOIN empleado.departamento d ON e.id_departamento = d.id
  WHERE d.nombre IN ('Sistemas', 'Contabilidad', 'I+D')
  ORDER BY e.nombre, e.apellido1, e.apellido2;

  --9.Devuelve una lista con el nombre de los empleados que tienen los 
  --departamentos que no tienen un presupuesto entre 100000 y 200000 
  --euros. 
  SELECT e.nombre, e.apellido1, e.apellido2, e.nif
  FROM empleado.departamento d 
  INNER JOIN empleado.empleado e ON d.id = e.id_departamento
  WHERE d.presupuesto NOT BETWEEN 100000 AND 200000;
  
  --10. Devuelve un listado con el nombre de los departamentos donde existe algún empleado 
  --cuyo segundo apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.
  --SQL1
  SELECT DISTINCT d.nombre
  FROM "empleado".departamento d, "empleado".empleado e
  WHERE d.id = e.id_departamento
    AND e.apellido2 IS NULL;
  --SQL2
  SELECT DISTINCT d.nombre FROM "empleado".departamento d
  INNER JOIN "empleado".empleado e ON d.id = e.id_departamento
  WHERE e.apellido2 IS NULL;
      
  -- 1.2.5 Consultas multitabla (Composición externa)
  
  --Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
  --1. Devuelve un listado con todos los empleados junto con los datos de los
  --departamentos donde trabajan. Este listado también debe incluir los
  --empleados que no tienen ningún departamento asociado
  SELECT e.*, d.nombre AS nombre_departamento, d.presupuesto, d.gastos
  FROM empleado.empleado e
  LEFT JOIN empleado.departamento d ON e.id_departamento = d.id
  ORDER BY e.id;
  
  --2. Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
  SELECT e.*
  FROM empleado.empleado e
  LEFT JOIN empleado.departamento d ON e.id_departamento = d.id
  WHERE d.id IS NULL;
  
  --3. Devuelve un listado donde sólo aparezcan aquellos departamentos que 
  --no tienen ningún empleado asociado.
  SELECT d.nombre
  FROM empleado.empleado e 
  RIGHT JOIN empleado.departamento d ON e.id_departamento = d.id
  WHERE e.id IS NULL;
  
  --4. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. 
  --El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos que no 
  --tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
  -- Empleados con o sin departamento (LEFT JOIN)
  SELECT e.id AS id_empleado, e.nombre AS nombre_empleado, e.apellido1, e.apellido2,
         d.id AS id_departamento, d.nombre AS nombre_departamento, d.presupuesto, d.gastos
  FROM "empleado".empleado e
  LEFT JOIN "empleado".departamento d ON e.id_departamento = d.id
  
  UNION
  
  -- Departamentos sin empleados (RIGHT JOIN)
  SELECT e.id AS id_empleado, e.nombre AS nombre_empleado, e.apellido1, e.apellido2,
         d.id AS id_departamento, d.nombre AS nombre_departamento, d.presupuesto, d.gastos
  FROM "empleado".empleado e
  RIGHT JOIN "empleado".departamento d ON e.id_departamento = d.id
  WHERE e.id IS NULL  -- Solo los departamentos sin empleados
  ORDER BY nombre_departamento;
  
  --5. Devuelve un listado con los empleados que no tienen ningún
  --departamento asociado y los departamentos que no tienen ningún
  --empleado asociado. Ordene el listado alfabéticamente por el nombre del
  --departamento.
  (SELECT 
          e.id AS empleado_id,
          e.nombre AS nombre_empleado,
          e.apellido1,
          e.apellido2,
          NULL AS departamento_id,
          NULL AS nombre_departamento
      FROM 
          empleado.empleado e
      LEFT JOIN 
          empleado.departamento d ON e.id_departamento = d.id
      WHERE 
          e.id_departamento IS NULL
  )
  UNION
  (SELECT 
          NULL AS empleado_id,
          NULL AS nombre_empleado,
          NULL AS apellido1,
          NULL AS apellido2,
          d.id AS departamento_id,
          d.nombre AS nombre_departamento
      FROM 
          empleado.empleado e
      RIGHT JOIN 
          empleado.departamento d ON e.id_departamento = d.id
      WHERE 
          e.id_departamento IS NULL
  )
  ORDER BY 
      COALESCE(nombre_departamento, 'ZZZZZZZZ') ASC,
      apellido1 ASC,
      apellido2 ASC,
      nombre_empleado ASC;
  
  -- 1.2.6 Consultas resumen
  
  --1. Calcula la suma del presupuesto de todos los departamentos.
  SELECT SUM(presupuesto) AS suma_presupuesto_total
  FROM empleado.departamento;
  
  --2. Calcula la media del presupuesto de todos los departamentos. 
  SELECT AVG(d.presupuesto) AS Promedio
  FROM empleado.departamento d;
  
  --3. Calcula el valor mínimo del presupuesto de todos los departamentos.
  SELECT MIN(presupuesto)
  FROM "empleado".departamento;
  
  --4. Calcula el nombre del departamento y el presupuesto que tiene
  --asignado, del departamento con menor presupuesto.
  
  SELECT nombre, presupuesto
  FROM empleado.departamento
  WHERE presupuesto = (SELECT MIN(presupuesto) FROM empleado.departamento);
  
  --5. Calcula el valor máximo del presupuesto de todos los departamentos.
  SELECT MAX(presupuesto) AS presupuesto_maximo
  FROM empleado.departamento;
  
  --6. Calcula el nombre del departamento y el presupuesto que tiene 
  --asignado, del departamento con mayor presupuesto. 
  SELECT d.nombre ,MAX(d.presupuesto) AS Presupuesto_maximo
  FROM empleado.departamento d;
  
  --7. Calcula el número total de empleados que hay en la tabla empleado.
  SELECT DISTINCT COUNT(id)
  FROM "empleado".empleado;

  --20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
  SELECT * FROM gestion_empleados.empleado LIMIT 5 OFFSET 2;
  
  --21. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.
  SELECT nombre, presupuesto FROM gestion_empleados.departamento WHERE presupuesto >=150000 ORDER BY presupuesto ASC
  
  --22. Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
  SELECT nombre, gastos FROM gestion_empleados.departamento WHERE gastos <= 5000 ORDER BY gastos ASC
  
  --23. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
  SELECT nombre, presupuesto FROM gestion_empleados.departamento WHERE (presupuesto>=100000 AND presupuesto <=200000) ORDER BY presupuesto ASC
  
  --24. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
  SELECT nombre, presupuesto FROM gestion_empleados.departamento WHERE (presupuesto>=200000 OR presupuesto<=100000)
  
  --25. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
  SELECT nombre, presupuesto FROM gestion_empleados.departamento WHERE presupuesto BETWEEN 100000 AND 200000 ORDER BY presupuesto ASC
  
  --26. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
  SELECT nombre, presupuesto FROM gestion_empleados.departamento WHERE presupuesto NOT BETWEEN 100000 AND 200000 ORDER BY presupuesto ASC

-- 1.2.7 Subconsultas

-- 1.2.7.1 Con operadores básicos de comparación

-- 1.2.7.2 Subconsultas con ALL y ANY

-- 1.2.7.3 Subconsultas con IN y NOT IN

-- 1.2.7.4 Subconsultas con EXISTS y NOT EXISTS

