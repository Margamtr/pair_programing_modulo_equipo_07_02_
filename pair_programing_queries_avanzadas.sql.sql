USE northwind;

-- 1. Productos más baratos y caros de nuestra BBDD.
SELECT  MAX(unit_price) AS highestprice , MIN(unit_price) AS lowestprice
FROM products;

-- 2. Conociendo el numero de productos y su precio medio. (AVG)

SELECT COUNT(product_id), AVG (unit_price)
FROM products;

-- 3. Sacad la máxima y mínima carga de los pedidos de UK.alter (MIN - MAX)

SELECT  MAX(freight)  , MIN(freight)
FROM orders
WHERE ship_country = 'UK'
ORDER BY ship_country;


-- 4. Qué productos se venden por encima del precio medio. (DESC- 

SELECT  unit_price,
CASE
	WHEN unit_price > AVG(Unit_price)  THEN 'encima_precio_medio'
    ELSE 'Ningun precio es mayor'
    END AS PrecioMedio
FROM products;

-- 5. Qué productos se han descontinuado. ( CON SOLO UNA CONSULTA)
SELECT COUNT(*),
 CASE 
		WHEN discontinued = 1 THEN 'descontinuado'
        ELSE 'articulo no descontinuado'
        END AS consulta_des
FROM products;

-- 6. Detalles de los productos de la query anterior. (LIMIT- MAX O DESC)
SELECT product_id,product_name
FROM products
WHERE discontinued = ( SELECT CASE 
		WHEN discontinued = 1 THEN 'descontinuado'
        ELSE 'articulo no descontinuado'
        END)	
ORDER BY  product_id DESC
LIMIT 10;
-- ------------------ O ASI!!!!!!-------------------------
SELECT Product_ID, Product_Name
FROM products
WHERE Discontinued = 0
ORDER BY Product_ID DESC
LIMIT 10;

-- 7. Relación entre número de pedidos y máxima carga. 

SELECT COUNT(*),MAX(freight),employee_id
FROM orders
GROUP BY employee_id;

-- 8. Descartar pedidos sin fecha y ordénalos.

SELECT COUNT(*),MAX(freight),employee_id
FROM orders
WHERE shipped_date IS NOT NULL
GROUP BY employee_id
ORDER BY  employee_id;



-- 9. Números de pedidos por día.

SELECT COUNT(*), DAY(order_date)
FROM orders
GROUP BY DAY(order_date);


-- 10. Número de pedidos por mes y año.
SELECT COUNT(*),MONTH(order_date),YEAR(order_date) 
FROM orders
GROUP BY MONTH(order_date); 

-- 11. Seleccionad las ciudades con 4 o más empleadas.
SELECT city, COUNT(*) AS numero_empleadas
FROM employees
GROUP BY city
HAVING  numero_empleadas >= 4;
     
-- 12. Cread una nueva columna basándonos en la cantidad monetaria.

SELECT (unit_price * quantity) AS cantidades_vendidas,
 CASE 
	WHEN (unit_price * quantity)> 2000 THEN 'alto'
	WHEN (unit_price * quantity) < 2000 THEN 'bajo'
	END AS cantidad_monetaria
FROM order_details
ORDER BY (unit_price * quantity) desc ;
 
