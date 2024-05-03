-- Productos más baratos y caros BBDD:
SELECT MIN(UnitPrice) AS  precio_minimo
from products;
SELECT max(UnitPrice) as  precio_max
from products;

-- numero productos y precio medio:

SELECT count(UnitPrice)
from products;
Select AVG(UnitPrice)
from products;

-- max carga y min pedidos

SELECT min(Freight), MAX(Freight)  
FROM orders
WHERE ShipCountry = 'UK';

-- PRODUCTOS QUE SEAN MAYORES AL PRECIO MEDIO.

SELECT ProductName, AVG(UnitPrice) AS media_precio
FROM products
GROUP BY ProductName
HAVING media_precio  
ORDER BY media_precio ASC;


    

