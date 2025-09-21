	USE bank;
    

-- ==================================================
-- TIPOS DE JOINS
-- ==================================================


------------------------ INNER JOIN -------------------------------
-- TAMBIEN SON CONOCIDAS COMO "JOIN" UNICAMENTE
-- NOS MOSTRARÁ SOLO LAS COINCIDENCIAS EXACTAS ENTRE LAS DOS TABLAS



-- AL UNIR DOS TABLAS, PODEMOS PERMITIRNOS OPERAR CON COLUMNAS DE TABLAS RELACIONADAS



------------------------ LEFT JOIN -------------------------------
-- CUANDO USAMOS LEFT JOIN, USAMOS TODA LA INFORMACIÓN DE LA IZQUIERDA AUNQUE NO TENGA COINCIDENCIAS



------------------------ RIGHT JOIN -------------------------------
-- DE LA MISMA FORMA, CUANDO USAMOS RIGHT JOIN MOSTRAREMOS TODOS LOS VALORES DE LA TABLA DERECHA

SELECT * FROM bank.account AS a
RIGHT JOIN bank.loan AS l
ON a.account_id = l.account_id;


-- ==================================================
-- JOINS CON MAS DE DOS TABLAS
-- ==================================================

-- PODEMOS UNIR MÁS DE DOS TABLAS SI AÑADIMOS MÁS JOINS A NUESTRA CONSULTA

