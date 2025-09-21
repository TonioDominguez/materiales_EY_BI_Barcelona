-- Crear bases de datos

CREATE DATABASE refugio;

CREATE DATABASE IF NOT EXISTS refugio;

USE refugio;

-- CREAR TABLAS

CREATE TABLE IF NOT EXISTS especies (
	id_especie INT NOT NULL UNIQUE,
    especie VARCHAR(100),
    PRIMARY KEY (id_especie));
    
CREATE TABLE IF NOT EXISTS mascotas (
	id_mascota INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    nacionalidad Varchar(100),
    edad INT,
    peso FLOAT,
    id_especie INT,
    CONSTRAINT fk_especies_mascotas 
    FOREIGN KEY (id_especie) REFERENCES especies(id_especie));
    
    -- RELLENAR NUESTRAS TABLAS
    
    INSERT INTO especies (id_especie, especie)
    VALUES (1, "Perro");
    
    INSERT INTO especies (id_especie, especie)
    VALUES (2, "Gato"), 
		(3, "Vaca"), 
        (4, "Cerdo");
        
	INSERT INTO mascotas (nombre, nacionalidad, edad, id_especie)
    VALUES ("Pedro", "España", 25, 1),
		("Pepe", "España", 1, 2);