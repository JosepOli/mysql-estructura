SELECT apellido1, apellido2, nombre FROM universidad.persona WHERE tipo = "alumno" ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE telefono IS null AND tipo = "alumno";
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE fecha_nacimiento LIKE "%1999%" AND tipo = "alumno";
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE telefono IS null AND tipo = "profesor" AND nif LIKE "%K";
SELECT nombre FROM universidad.asignatura WHERE cuatrimestre = "1" AND curso = "3" AND id_grado ="7";
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS "Departamento" FROM universidad.persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM universidad.asignatura JOIN alumno_se_matricula_asignatura asma ON asignatura.id = asma.id_asignatura JOIN curso_escolar ON curso_escolar.id = asma.id_curso_escolar JOIN persona ON asma.id_alumno = persona.id WHERE nif = "26902806M";
SELECT DISTINCT departamento.nombre FROM universidad.departamento JOIN profesor ON profesor.id_departamento = departamento.id JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor JOIN grado ON grado.id = asignatura.id_grado WHERE grado.nombre = "Grado en Ingeniería Informática (Plan 2015)";
SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2 FROM universidad.persona JOIN alumno_se_matricula_asignatura asma ON persona.id = asma.id_alumno JOIN curso_escolar ce ON ce.id= asma.id_curso_escolar WHERE ce.anyo_inicio = "2018";

SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM universidad.persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON departamento.id = profesor.id_departamento ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM universidad.persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON departamento.id = profesor.id_departamento WHERE departamento.nombre IS NULL ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
SELECT DISTINCT departamento.nombre FROM universidad.departamento LEFT JOIN universidad.profesor ON profesor.id_departamento = departamento.id WHERE profesor.id_departamento IS NULL ORDER BY departamento.nombre ASC;
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM universidad.persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON asignatura.id = profesor.id_profesor WHERE asignatura.id_profesor IS NULL ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
SELECT DISTINCT asignatura.nombre FROM universidad.asignatura LEFT JOIN profesor ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL ORDER BY asignatura.nombre ASC;
SELECT departamento.nombre FROM universidad.departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id LEFT JOIN asignatura ON asignatura.id = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;

SELECT COUNT(persona.tipo) FROM universidad.persona WHERE tipo = "alumno";
SELECT COUNT(persona.tipo) FROM universidad.persona WHERE fecha_nacimiento LIKE "%1999%";
SELECT departamento.nombre AS "Nombre de departamento", COUNT(profesor.id_departamento) AS "Cantidad de profesores" FROM universidad.departamento JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre;
SELECT departamento.nombre AS "Nombre de departamento", COUNT(profesor.id_departamento) AS "Cantidad de profesores" FROM universidad.departamento LEFT JOIN universidad.profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre ORDER BY COUNT(profesor.id_departamento) DESC;
SELECT grado.nombre AS "Nombre de grado", COUNT(asignatura.id_grado) AS "Cantidad de asignaturas" FROM universidad.grado LEFT JOIN universidad.asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre ORDER BY COUNT(asignatura.id_grado) DESC;
SELECT grado.nombre AS "Nombre de grado", COUNT(asignatura.id_grado) AS "Cantidad de asignaturas" FROM universidad.grado LEFT JOIN universidad.asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre HAVING COUNT(asignatura.id_grado) > 40 ORDER BY COUNT(asignatura.id_grado) DESC;
SELECT grado.nombre AS "Nombre de grado", asignatura.tipo AS "Tipo de asignatura", COUNT(asignatura.creditos) AS "Cantidad de creditos" FROM universidad.grado JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY asignatura.tipo, grado.nombre;
SELECT curso_escolar.anyo_inicio AS "Año de inicio", COUNT(asma.id_curso_escolar) AS "Numero de alumnos matriculados" FROM universidad.curso_escolar JOIN alumno_se_matricula_asignatura asma ON curso_escolar.id = asma.id_curso_escolar GROUP BY curso_escolar.anyo_inicio;


SELECT * FROM universidad.departamento;
SELECT * FROM universidad.persona;
SELECT * FROM universidad.profesor;
SELECT * FROM universidad.asignatura;
SELECT * FROM universidad.grado;
SELECT * FROM universidad.curso_escolar;