USE northwind;
-- 1 Pedidos por empresa en UK.
SELECT customers.customer_id, customers.company_name, count(order_id) AS numero_pedidos
FROM customers
INNER JOIN orders 
ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK'
GROUP BY customers.customer_id, customers.company_name;

-- 2 Productos pedidos por empresa en UK por año. -- YEAR(SACA SOLO EL AÑO), 

SELECT customers.company_name, YEAR(orders.order_date) AS "Año", SUM(order_details.quantity) AS NumObjetos
FROM customers
INNER JOIN orders
ON customers.customer_id= orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.Order_id
WHERE customers.country = "UK"
GROUP BY customers.company_name, YEAR(orders.order_date);

-- 3 Mejorad la query anterior.

SELECT customers.company_name, YEAR(orders.order_date) AS "Año", SUM(order_details.quantity) AS NumObjetos, SUM((order_details.unit_price * order_details.quantity) * (1 - order_details.discount)) AS DineroTotal
FROM customers
INNER JOIN orders
ON customers.customer_id= orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.Order_id
WHERE customers.country = "UK"
GROUP BY customers.company_name, YEAR(orders.order_date);

-- 4 BONUS: Pedidos que han realizado cada compañía y su fecha.

SELECT orders.order_id, customers.company_name, orders.order_date
FROM customers
INNER JOIN orders
ON customers.customer_id= orders.customer_id
WHERE customers.country = "UK"
GROUP BY customers.company_name, orders.order_date;

-- 5 BONUS: Tipos de producto vendidos:

SELECT categories.category_id, categories.category_name, products.product_name, SUM((order_details.unit_price * order_details.quantity) * (1 - order_details.discount)) AS ProductSales
FROM categories
INNER JOIN products
using (category_id)       -- no funciona este saca solo uno
INNER JOIN order_details
USING (product_id);

SELECT categories.category_id, categories.category_name, products.product_name, SUM((order_details.unit_price * order_details.quantity) * (1 - order_details.discount)) AS ProductSales
FROM products
NATURAL JOIN order_details
NATURAL JOIN categories
GROUP BY products.Category_ID, categories.Category_Name, products.Product_Name;

-- 6 Qué empresas tenemos en la BBDD Northwind.




-- Pedidos por cliente de UK.
-- Empresas de UK y sus pedidos.
-- Empleadas que sean de la misma ciudad. (SELFJOIN)
-- BONUS: FULL OUTER JOIN ( si no se entrega, no pasa nada)