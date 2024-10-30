-- Cambiar 'nombre_base_de_datos'

SET FOREIGN_KEY_CHECKS = 0;
SET SQL_SAFE_UPDATES = 0;

-- Generamos comandos DELETE para todas las tablas
SELECT CONCAT('DELETE FROM ', table_name, ';') 
FROM information_schema.tables 
WHERE table_schema = 'nombre_base_de_datos';

SET FOREIGN_KEY_CHECKS = 1;
SET SQL_SAFE_UPDATES = 1;
