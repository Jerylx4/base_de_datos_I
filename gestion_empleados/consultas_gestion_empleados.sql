-- 1.2.3 Consultas sobre una tabla

-- 1.2.4 Consultas multitabla (Composición interna)

-- 1.2.5 Consultas multitabla (Composición externa)

-- 1.2.6 Consultas resumen

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

