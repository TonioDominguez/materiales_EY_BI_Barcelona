-- ==================================================
-- SELF-GUIDED:
-- ==================================================

-- Estableciendo la base de datos de trabajo
USE bank;

-- ==================================================
-- Tablas Temporales
-- ==================================================
-- Una tabla temporal es una tabla de corta duración que existe solo durante la duración de una sesión o una tarea específica dentro de esa sesión.
-- Es útil para almacenar resultados intermedios, procesamiento de datos en lotes, o como una copia de trabajo para evitar la modificación de los datos originales.
-- Estas tablas se eliminan automáticamente al final de la sesión de la base de datos o cuando la conexión se cierra.

-- Creando una tabla temporal 'loan_and_account' para almacenar detalles combinados de préstamos y cuentas.
CREATE TEMPORARY TABLE bank.loan_and_account AS
SELECT l.loan_id, l.account_id, a.district_id, l.amount, l.payments, a.frequency
FROM bank.loan l
JOIN bank.account a ON l.account_id = a.account_id;

-- Extrayendo todos los registros de la nueva tabla temporal 'loan_and_account'.
SELECT * FROM bank.loan_and_account;

-- Creando otra tabla temporal 'disp_and_account' para almacenar detalles combinados de disp y cuenta.
CREATE TEMPORARY TABLE bank.disp_and_account AS
SELECT d.disp_id, d.client_id, d.account_id, a.district_id, d.type
FROM bank.disp d
JOIN bank.account a ON d.account_id = a.account_id;

-- Extrayendo todos los registros de la nueva tabla temporal 'disp_and_account'.
SELECT * FROM bank.disp_and_account;



-- ==================================================
-- CTEs (Expresiones de Tabla Común)
-- ==================================================
-- Un CTE proporciona una forma de definir un conjunto de resultados temporal que se puede referenciar dentro de una declaración SELECT, INSERT, UPDATE o DELETE.
-- Un CTE, o Expresión de Tabla Común, es una técnica en SQL que permite crear un conjunto de resultados temporal que se puede referenciar dentro de una instrucción SQL.
-- Es similar a una subconsulta, pero más legible y potente, permitiendo referencias recursivas y siendo especialmente útil en consultas complejas.


-- Un ejemplo muy simple para mostrar la sintaxis general
-- La consulta después de la palabra clave AS puede ser cualquier consulta (desde una simple hasta una muy compleja)

-- Usando un CTE para extraer datos de la tabla 'loan' donde el estado es 'B'.
WITH cte_loan AS (
  SELECT * FROM bank.loan
)
SELECT * FROM cte_loan
WHERE status = 'B';

-- El mismo resultado se puede lograr sin el CTE, como se muestra a continuación:
SELECT * FROM bank.loan
WHERE status = 'B';

-- Supongamos que queremos encontrar el monto total y el saldo total de cada cliente en la 
-- tabla 'transactions' y almacenarlo en un CTE. Luego, obtener más información sobre esos clientes mediante un join entre el CTE y la tabla de cuentas.

-- Comencemos calculando el monto total y el saldo total para cada 'account_id'
-- Para cada 'account_id' en la tabla 'trans', esta consulta calcula el monto total y el saldo total.

SELECT account_id, 
       ROUND(SUM(amount),2) AS Total_amount, 
       ROUND(SUM(balance),2) AS Total_balance
FROM bank.trans
GROUP BY account_id;


-- Usando CTE para agregar datos de la tabla 'trans' y luego hacer un join con la tabla 'account'.
WITH cte_transactions AS (
  SELECT account_id, ROUND(SUM(amount),2) AS Total_amount, ROUND(SUM(balance),2) AS Total_balance
  FROM bank.trans
  GROUP BY account_id
)
SELECT 
       ct.account_id, 
       ct.Total_amount, 
       ct.Total_balance, 
       a.district_id, 
       a.frequency,
       a.date
FROM cte_transactions AS ct
JOIN bank.account a ON ct.account_id = a.account_id;

-- ==================================================
-- COMPROBACIÓN DE LA COMPRENSIÓN
-- ==================================================

-- Encuentra al cliente más activo de cada distrito en Bohemia Central usando al menos un CTE.

-- ==================================================


-- ==================================================
-- Vistas
-- ==================================================

-- Las vistas son como tablas virtuales en la base de datos que se pueden usar para consultar al igual que una tabla regular, pero no almacenan información 
-- de forma permanente como lo hace una tabla; es decir, una tabla ocupa memoria real en la base de datos pero las vistas no. 
-- Las vistas pueden construirse con consultas sobre una o varias tablas.
-- Son útiles para:
-- 1. Simplificar consultas complejas: Si tienes una consulta que es compleja y se usa frecuentemente, puedes crear una vista que 
--    encapsule esta complejidad y luego usar la vista en lugar de repetir la consulta completa cada vez.

-- 2. Seguridad: Puedes utilizar vistas para restringir el acceso a los datos, mostrando solo ciertos campos de las tablas subyacentes 
--    a los usuarios finales, protegiendo así los datos sensibles.

-- 3. Reutilización de código y consistencia: Las vistas permiten la reutilización de consultas y aseguran una interpretación consistente 
--    de los datos, ya que todos los usuarios acceden a los mismos datos a través de la misma "lente" (la vista).

-- Creando una vista para identificar posibles clientes de riesgo basándonos en sus saldos.
-- Aquí, estamos considerando préstamos con estado 'C' y comparando sus saldos con el saldo promedio del mismo estado.
CREATE VIEW running_contract_ok_balances AS
WITH cte_running_contract_OK_balances AS (
  SELECT *, amount - payments AS Balance
  FROM bank.loan
  WHERE status = 'C'
  ORDER BY Balance
)
SELECT * FROM cte_running_contract_OK_balances
WHERE Balance > (
  SELECT AVG(Balance)
