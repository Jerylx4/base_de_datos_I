--1.5.4 Consultas sobre una tabla
--1.Devuelve un listado con el primer apellido, segundo apellido y el nombre de
--todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor
--por el primer apellido, segundo apellido y nombre.
SELECT apellido1 AS "Primer apellido", apellido2 AS "Segundo apellido",  nombre AS "Nombre"
FROM "universidad_A"."persona"
WHERE tipo = 'alumno'
ORDER BY apellido1,apellido2,nombre;      

--2.Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT p.nombre||'  '|| apellido1||'  '||apellido2 as nombre_alumno
FROM "universidad_A".persona p
WHERE tipo = 'alumno' AND telefono IS NULL;

--3 Devuelve el listado de los alumnos que nacieron en 1999.
SELECT * FROM "universidad_A".persona p
WHERE p.tipo = 'alumno' AND EXTRACT(YEAR FROM p.fecha_nacimiento)  = 1999;

--4.Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además 
--su nif termina en K.
SELECT p.*
FROM "universidad_A".persona p
INNER JOIN "universidad_A".profesor prof ON p."ID" = prof.id_profesor
WHERE p.telefono IS NULL
  AND p.nif LIKE '%K';
 
--5.Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, 
--en el tercer curso del grado que tiene el identificador 7.
SELECT a.nombre 
FROM "universidad_A".asignatura a
WHERE a.cuatrimestre = 1 
AND  a.curso = 3 
AND a.id_grado = 7;

-- 1.5.5 Consultas multitabla (Composición interna)
--1.Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna 
--vez en el Grado en Ingeniería Informática (Plan 2015).   
SELECT DISTINCT al.nombre, al.apellido1, al.apellido2
FROM "universidad_A".persona al 
INNER JOIN "universidad_A".alumno_se_matricula_asignatura asm ON al."ID" = asm.id_alumno
INNER JOIN "universidad_A".asignatura asig ON asig."ID" = asm.id_asignatura
INNER JOIN "universidad_A".grado g ON g."ID" = asig.id_grado
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)' AND al.sexo = 'M';


--2.Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).*/
SELECT a.nombre AS asignatura
FROM "universidad_A".asignatura a
INNER JOIN "universidad_A".grado g ON a.id_grado = g."ID"
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

--3 Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. 
--El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre 
--del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos 
--y el nombre.
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS nombre_del_departamento
FROM "universidad_A".profesor prof
JOIN "universidad_A".persona p ON prof.id_profesor = p."ID"
JOIN "universidad_A".departamento d ON prof.id_departamento = d."ID"
ORDER BY p.apellido1, p.apellido2, p.nombre;


--4.Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso 
--escolar del alumno con nif 26902806M.
SELECT 
    asig.nombre AS asignatura,
    ce.anyo_inicio AS Año_inicio,
    ce.anyo_fin AS Año_fin
FROM "universidad_A".persona p
JOIN "universidad_A".alumno_se_matricula_asignatura a ON p."ID" = a.id_alumno
JOIN "universidad_A".asignatura asig ON a.id_asignatura = asig."ID"
JOIN "universidad_A".curso_escolar ce ON a.id_curso_escolar = ce."ID"
WHERE p.nif = '26902806M';

--5.Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura
--en el Grado en Ingeniería Informática (Plan 2015).*/
SELECT DISTINCT d.nombre
FROM "universidad_A".departamento d
INNER JOIN "universidad_A".profesor prof ON d."ID" = prof.id_departamento
INNER JOIN "universidad_A".asignatura a ON prof.id_profesor = a.id_profesor
INNER JOIN "universidad_A".grado g ON a.id_grado = g."ID"
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

--6. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso
--escolar 2018/2019.
SELECT DISTINCT 
    p.apellido1,
    p.apellido2,
    p.nombre
FROM 
    "universidad_A".alumno_se_matricula_asignatura ama
JOIN 
    "universidad_A".persona p ON ama.id_alumno = p."ID"
JOIN 
    "universidad_A".curso_escolar ce ON ama.id_curso_escolar = ce."ID"
WHERE 
    ce.anyo_inicio = 2018
    AND ce.anyo_fin = 2019
    AND p.tipo = 'alumno';

-- 1.5.6 Consultas multitabla (Composición externa)
--Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

--1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar
--aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, 
--segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos 
--y el nombre.
SELECT d.nombre AS nombre_departamento,p.apellido1 AS primer_apellido,p.apellido2 AS segundo_apellido,p.nombre AS nombre_profesor
FROM "universidad_A"."profesor" prof
LEFT JOIN "universidad_A"."persona" p ON prof.id_profesor = p."ID"
LEFT JOIN  "universidad_A"."departamento" d ON prof.id_departamento = d."ID"
ORDER BY 
    nombre_departamento ASC NULLS FIRST,
    p.apellido1 ASC,
    p.apellido2 ASC,
    p.nombre ASC;
	
--2. Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT * FROM "universidad_A".profesor p
LEFT JOIN "universidad_A".departamento d ON p.id_departamento = d."ID"
WHERE p.id_departamento IS NULL;

--3. Devuelve un listado con los departamentos que no tienen profesores
--asociados.
SELECT departamento.nombre, departamento."ID"
FROM "universidad_A".departamento
LEFT JOIN "universidad_A".profesor ON departamento."ID" = profesor.id_departamento
WHERE profesor.id_profesor IS NULL;
Ventas

--4. Devuelve un listado con los profesores que no imparten ninguna asignatura.
SELECT 
    p.apellido1,
    p.apellido2,
    p.nombre
FROM 
    "universidad_A".profesor prof
JOIN 
    "universidad_A".persona p ON prof.id_profesor = p."ID"
LEFT JOIN 
    "universidad_A".asignatura a ON prof.id_profesor = a.id_profesor
WHERE 
    a.id_profesor IS NULL;

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
--1.Devuelve todos los datos del alumno más joven.
select * 
from "universidad_A".persona
where tipo='alumno'
and fecha_nacimiento=(select max(fecha_nacimiento)  
from "universidad_A".persona);
--2.Devuelve un listado con los profesores que no están asociados a un departamento.
select *
from "universidad_A".persona p
left join"universidad_A".profesor pr ON p."ID" = pr.id_profesor
where p.tipo = 'profesor' AND pr.id_profesor IS NULL;

--3.Devuelve un listado con los departamentos que no tienen profesores asociados.
select *
from "universidad_A".departamento d
left join "universidad_A".profesor p on d."ID"=p.id_departamento
where p.id_departamento is null;

--4.Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
select *
from "universidad_A".profesor pr
inner join "universidad_A".persona p on pr.id_profesor=p."ID"
left join "universidad_A".asignatura a on pr.id_profesor=a.id_profesor
where a.id_profesor is null; 

--5.Devuelve un listado con las asignaturas que no tienen un profesor asignado.
select *
from "universidad_A".asignatura a 
where id_profesor is null;

--6.Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
select *
from "universidad_A".departamento d
left join "universidad_A".profesor p on d."ID"=p.id_departamento
left join "universidad_A".asignatura a on p.id_profesor=a.id_profesor
where a.id_profesor is null;

