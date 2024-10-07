# Apuntes para la creación de la BD relacional.

## Notas:
- La base de datos ha sido diseñada directamente sobre MySql workbench.
- En algunos campos, no se si el tamaño de caracteres es adecuado. Opiniones?
- Al reproducir en vuestro ordenador, no os preocupeis por archivos *.bak que genera mysql workbenk, ver .gitinore.

## MySql Workbench
![imagen](./teachersapp_mysql_2024_10_04.png)
## Tabla **admins**
- **id** : clave primaria (INT)
- **name** : nombre del administrador (VARCHAR(20))
- **last_names** : apellidos del administrador (VARCHAR(45))
- **phone** : teléfono del administrador (VARCHAR(20))
- **email** : correo electrónico del administrador (VARCHAR(45))
- **username** : nombre de usuario (VARCHAR(20))
- **passwd** : contraseña (VARCHAR(20))

## Tabla **students**
- **id** : clave primaria (INT)
- **name** : nombre del estudiante (VARCHAR(20))
- **last_names** : apellidos del estudiante (VARCHAR(45))
- **phone** : teléfono del estudiante (VARCHAR(20))
- **email** : correo electrónico del estudiante (VARCHAR(45))
- **adress** : dirección del estudiante (VARCHAR(45))
- **username** : nombre de usuario (VARCHAR(20))
- **passwd** : contraseña (VARCHAR(20))
- **logical_deletion** : eliminación lógica (TINYINT) - Indica si el estudiante fue eliminado lógicamente, en este caso no deberia mostrarse.

## Tabla **teachers**
- **id** : clave primaria (INT)
- **name** : nombre del profesor (VARCHAR(20))
- **last_names** : apellidos del profesor (VARCHAR(45))
- **phone** : teléfono del profesor (VARCHAR(20))
- **email** : correo electrónico del profesor (VARCHAR(45))
- **adress** : dirección del profesor (VARCHAR(45))
- **username** : nombre de usuario (VARCHAR(20))
- **passwd** : contraseña (VARCHAR(20))
- **about_me** : información sobre el profesor (VARCHAR(250))
- **resume** : currículum del profesor (VARCHAR(2000))
- **validated** : estado de validación del profesor (VARCHAR(45))

## Tabla **teacher_reviews**
- **students_id** : clave foránea, referencia a la tabla `students` (INT)
- **teachers_id** : clave foránea, referencia a la tabla `teachers` (INT)
- **score** : puntuación del profesor (INT)
- **review** : reseña sobre el profesor (VARCHAR(1000))

## Tabla **knowledge_branch**
- **id** : clave primaria (INT)
- **name** : nombre de la rama de conocimiento (VARCHAR(45))

## Tabla **teachers_has_knowledge_branch**
- **teachers_id** : clave foránea, referencia a la tabla `teachers` (INT)
- **knowledge_branch_id** : clave foránea, referencia a la tabla `knowledge_branch` (INT)
- **price_hour** : precio por hora (INT)

## Tabla **student_registrations**
- **id** : clave primaria (INT)
- **students_id** : clave foránea, referencia a la tabla `students` (INT)
- **teachers_id** : clave foránea, referencia a la tabla `teachers` (INT)
- **register_data** : fecha de inscripción (DATE)
- **withdraw_data** : fecha de retiro (DATE) - Puede ser nulo.
