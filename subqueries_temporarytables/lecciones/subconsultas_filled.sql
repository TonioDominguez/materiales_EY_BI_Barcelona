-- =====================================================================================
-- SUBCONSULTAS EN MySQL
-- =====================================================================================


-- ¿QUÉ SON LAS SUBCONSULTAS?
-- Las subconsultas (también llamadas consultas anidadas) son consultas SQL que se 
-- ejecutan dentro de otra consulta. Son una herramienta que nos permite
-- resolver problemas complejos de manera elegante y eficiente.

-- ¿POR QUÉ USAR SUBCONSULTAS?
-- • Permiten dividir problemas complejos en partes más simples
-- • Facilitan la lectura y mantenimiento del código
-- • Evitan la necesidad de crear tablas temporales
-- • Proporcionan mayor flexibilidad en las consultas
-- • Son esenciales para consultas que requieren comparaciones dinámicas

-- UBICACIÓN EN LA CONSULTA:
-- • En WHERE: Para filtrar resultados
-- • En SELECT: Como columnas calculadas
-- • En FROM: Como tablas derivadas
-- • En HAVING: Para filtrar grupos

USE sakila;

-- ===================================================
-- 1. SUBCONSULTAS EN WHERE
-- Una subconsulta dentro de la cláusula WHERE puede filtrar datos basados en el 
-- resultado de otra consulta.
-- ===================================================

-- Ejemplo 1: Encontrar películas con duración mayor al promedio

SELECT title, length FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- Ejemplo 2: Clientes que han realizado pagos superiores a 10

SELECT * FROM customer
WHERE customer_id IN (SELECT DISTINCT customer_id FROM payment
						WHERE amount > 10);
                        


-- ===================================================
-- 2. SUBCONSULTAS EN FROM (Tabla derivada)
-- Una subconsulta dentro de la cláusula FROM puede usarse para crear una tabla 
-- temporal de la cual la consulta principal puede recuperar datos.
-- ===================================================

-- Ejemplo 3: Obtener el promedio de duración de las películas por categoría.

SELECT c.name AS category_name, avg_length_category.avg_film_length
FROM category c
JOIN (
    SELECT fc.category_id, AVG(f.length) AS avg_film_length
    FROM film_category fc
    JOIN film f ON fc.film_id = f.film_id
    GROUP BY fc.category_id
) AS avg_length_category ON c.category_id = avg_length_category.category_id
ORDER BY c.name;

-- ===================================================
-- 3. SUBCONSULTA EN SELECT (columna calculada)
-- Una subconsulta dentro de la cláusula SELECT puede devolver un valor único 
-- utilizado en una columna de la consulta principal.
-- =================================================== 

-- Ejemplo 4: Mostrar el título de la película y el número de actores en cada una.

SELECT f.title, 
	(SELECT COUNT(*) FROM film_actor fa
    WHERE fa.film_id = f.film_id) AS number_of_actors
FROM film f
ORDER BY f.title;

-- Ejemplo 5: Nombre del cliente y el total de pagos que ha realizado.

SELECT 
    c.first_name, 
    c.last_name,
    (SELECT SUM(p.amount) 
     FROM payment p 
     WHERE p.customer_id = c.customer_id) AS total_paid
FROM customer c
ORDER BY c.last_name, c.first_name;


-- =====================================================================================
-- REGLAS PARA SUBCONSULTAS
-- =====================================================================================
-- 1. Las subconsultas deben estar encerradas entre paréntesis.
-- 2. Una subconsulta solo puede tener una columna en la cláusula SELECT, a menos que 
--    en la consulta principal se utilicen múltiples columnas (ej. con operadores como IN).
-- 3. No se puede usar el comando ORDER BY en una subconsulta (excepto en subconsultas
--    en FROM para limitar resultados, pero no afecta el orden de la consulta externa).
-- 4. Las subconsultas que devuelven más de una fila solo pueden usarse con operadores 
--    de valores múltiples como IN, ANY, ALL.
-- 5. La lista SELECT no puede incluir referencias a BLOB, ARRAY, CLOB o NCLOB.
-- 6. Una subconsulta no puede estar inmediatamente encerrada en una función de conjunto.
-- 7. El operador BETWEEN no puede usarse con una subconsulta, pero puede usarse 
--    dentro de la subconsulta.
