SELECT apellido1, apellido2, nombre FROM universidad.persona WHERE tipo = "alumno" ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE telefono IS null AND tipo = "alumno";
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE fecha_nacimiento LIKE "%1999%" AND tipo = "alumno";
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE telefono IS null AND tipo = "profesor" AND nif LIKE "%K";
SELECT nombre FROM universidad.asignatura WHERE cuatrimestre = "1" AND curso = "3" AND id_grado ="7";
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS "Departamento" FROM universidad.persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM universidad.asignatura JOIN alumno_se_matricula_asignatura asma ON asignatura.id = asma.id_asignatura JOIN curso_escolar ON curso_escolar.id = asma.id_curso_escolar JOIN persona ON asma.id_alumno = persona.id WHERE nif = "26902806M";


SELECT * FROM universidad.departamento;
SELECT * FROM universidad.persona;
SELECT * FROM universidad.profesor;
SELECT * FROM universidad.asignatura;
SELECT * FROM universidad.grado;