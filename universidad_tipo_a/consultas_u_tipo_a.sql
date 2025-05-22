-- 1.5.4 Consultas sobre una tabla


-- 1.5.5 Consultas multitabla (Composición interna)


-- 1.5.6 Consultas multitabla (Composición externa)


-- 1.5.7 Consultas resumen

  --4. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. 
  --Estos departamentos también tienen que aparecer en el listado.
  SELECT departamento.nombre AS nombre_departamento, COUNT(profesor.id_profesor) AS numero_profesores 
  FROM "universidad_A".departamento departamento
  LEFT JOIN "universidad_A".profesor profesor ON departamento."ID" = profesor.id_departamento
  GROUP BY departamento.nombre;
  
  --5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. 
  --Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. 
  --El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
  SELECT grado.nombre AS nombre_grado, COUNT(asignatura."ID") AS numero_asignaturas 
  FROM "universidad_A".grado grado
  LEFT JOIN "universidad_A".asignatura asignatura ON grado."ID" = asignatura.id_grado
  GROUP BY grado.nombre
  ORDER BY numero_asignaturas DESC;
  
  --6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
  SELECT grado.nombre AS nombre_grado, COUNT(asignatura."ID") AS numero_asignaturas 
  FROM "universidad_A".grado grado
  LEFT JOIN "universidad_A".asignatura asignatura ON grado."ID" = asignatura.id_grado
  GROUP BY grado.nombre
  HAVING COUNT(asignatura."ID")>40;
  
  --7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para 
  --cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos 
  --de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.
  SELECT grado.nombre AS nombre_grado, asignatura.tipo AS tipo_asignatura, SUM(asignatura.creditos) AS suma_creditos  
  FROM "universidad_A".grado grado
  INNER JOIN "universidad_A".asignatura asignatura ON grado."ID" = asignatura.id_grado
  GROUP BY grado.nombre, asignatura.tipo
  ORDER BY suma_creditos DESC;
  
  --8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. 
  --El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
  SELECT curso.anyo_inicio AS inicio_anio, COUNT(alumno_matriculado_asignatura.id_curso_escolar) AS cantidad_alumnos_matriculados 
  FROM "universidad_A".alumno_se_matricula_asignatura alumno_matriculado_asignatura
  JOIN "universidad_A".curso_escolar curso ON alumno_matriculado_asignatura.id_curso_escolar = curso."ID"
  GROUP BY curso."ID";
  
  --9. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. 
  --El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
  SELECT persona.nombre AS nombre, persona.apellido1 AS apellido1, persona.apellido2 AS apellido2, COUNT(asignatura."ID") AS numero_asignaturas
  FROM "universidad_A".profesor profe
  JOIN "universidad_A".persona persona ON profe.id_profesor = persona."ID" 
  LEFT JOIN "universidad_A".asignatura asignatura ON profe.id_profesor = asignatura.id_profesor
  GROUP BY persona."ID", persona.nombre, persona.apellido1, persona.apellido2
  ORDER BY numero_asignaturas DESC;

-- 1.5.8 Subconsultas


