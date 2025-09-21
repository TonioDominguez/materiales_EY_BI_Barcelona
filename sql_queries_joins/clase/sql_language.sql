USE bank;

/* Al finalizar esta lección, usted podrá:

Leer tablas con SELECT… FROM
Seleccione valores únicos con DISTINCT
Cambiar el formato de las variables
Ordenar una tabla usando ORDER BY
Agregue una tabla usando GROUP BY y HAVING
Filtrar tablas con cláusula WHERE
Utilize operadores como IN, BETWEEN, LIKE, AND, OR, =, >=…
Buscar valores según patrones de texto
Establecer condiciones con CASE
Crear nuevas variables calculadas */


-- ==================================================
-- CONSULTAS BÁSICAS DE LECTURA
-- ==================================================



-- Leer todas las columnas o una selección con la instrucción SELECT



-- Seleccionar los valores únicos de una columna



-- Renombrar columnas para una mayor legibilidad



-- Marcar un límite de rows en nuestra selección




-- ==================================================
-- CONSULTAS ARITMÉTICAS Y AGREGACIONES
-- ==================================================

-- MOSTRAR LA DIFERENCIA ENTRE COLUMNAS



-- MOSTRAR VALORES CALCULADOS SOBRE COLUMNAS ESPECÍFICAS



-- REALIZAR UN CONTEO DE FILAS



-- SUMAR VALORES DE UNA COLUMNA



-- MOSTRAR LA MEDIA DE UNA COLUMNA



-- MOSTRAR EL NÚMERO MÁXIMO DE UNA COLUMNA



-- MOSTRAR EL NÚMERO MÍNIMO DE UNA COLUMNA


-- REDONDEAR CUALQUIER ELEMENTO DE NUESTRA CONSULTA


-- TAMBIEN PODEMOS CONVERTIR EL VALOR DECIMAL AL MAYOR INT MAS CERCANO


-- LA CLAUSULA GROUP BY NOS PERMITE AGRUPAR FILAS POR VALORES, PARA COMBINAR CON AGREGACIONES



-- CON GROUP BY PODEMOS CREAR VARIAS AGRUPACIONES EN UNA SOLA CONSULTA



-- ==================================================
-- WHERE VS HAVING
-- ==================================================

-- CUANDO OPERAMOS CON UNA AGRUPACIÓN, NO USAMOS WHERE, USAMOS HAVING Y LO HACEMOS POST FILTRO



-- ==================================================
-- OPERADORES DE COMPARACIÓN, ORDEN Y FILTROS
-- ==================================================

-- FILTRAR FILAS CON UNA CONDICIÓN ESPECÍFICA



-- FILTRAR POR FILAS QUE NO TENGAN ESA CONDICIÓN



-- FILTRAR POR MULTIPLES VALORES EN UNA COLUMNA



-- FILTRAR POR RANGO EN UNA COLUMNA



-- FILTRAR POR VARIAS CONDICIONES



-- Ordenar una consulta por una columna



-- Ordenar una consulta de forma ascedente o descendente



-- Ordenar una consulta por varias columnas



-- Ordenar una consulta por dos columnas con sentidos de filtro diferente


-- ==================================================
-- OPERADORES DE LÓGICA
-- ==================================================

-- PODEMOS AÑADIR CUANTAS CONDICIONES DESEEMOS EN UNA CONSULTA



-- PODEMOS MOSTRAR UN TIPO DE VALOR U OTRO



-- Y PODEMOS COMBINAR AND Y OR



-- PODEMOS USAR EL OPERADOR NOT FRENTE A NUESTRA CONDICION PARA MOSTRAR LO CONTRARIO



-- ==================================================
-- OPERADORES DE TEXTO
-- ==================================================

-- USAMOS CONCAT PARA COMBINAR COLUMNAS CON CADENAS DE TEXTO



-- PODEMOS CAMBIAR A UPPER O LOWER CASE TAMBIÉN CON FUNCIONES



-- USAMOS LAS FUNCIONES LEFT Y RIGHT PARA EXTRAER VALORES SEGÚN SU POSICION



-- ==================================================
-- BUSCADOR DE PATRONES
-- ==================================================

-- USAMOS FUNCION LIKE PARA ENCOTNRAR STRINGS QUE EMPIECEN POR DET CARACTERES



-- USAMOS FUNCION LIKE PARA ENCOTNRAR STRINGS QUE TERMINEN POR DET CARECTERES



-- USAMOS FUNCION LIKE PARA ENCOTNRAR STRINGS QUE CONTENGAN POR DET CARECTERES



-- ==================================================
-- SENTENCIAS CASE (COLUMNA CONDICIONAL)
-- ==================================================

-- AGREGAMOS UNA COLUMNA CONDICIONAL CON CASE
