SELECT * FROM northwind.customers;
SELECT id, last_name, first_name FROM EMPLOYEES;
-- Productos con precios entre 0 y 5.
SELECT product_name, list_price FROM products
WHERE list_price BETWEEN 0 and 5
ORDER BY list_price;
-- Buscar datos nulos:
SELECT product_name, list_price FROM products
WHERE list_price IS NULL; -- No hay ninguno

-- Comparamos productos:
SELECT id, list_price FROM products
WHERE list_price < 15 AND id <20;

-- Cambiamos operadores: 
SELECT id, list_price FROM products
WHERE NOT list_price < 15 AND NOT id <20;

-- Paises que vendemos:
SELECT DISTINCT ship_country_region FROM orders;

-- tipo productos, 10 segun el id:
SELECT id, product_name, list_price FROM products
LIMIT 10;
-- BUSCAMOS NUMERO DE PRODUCTOS:
SELECT list_price FROM products;
-- tenemos 45
SELECT id, product_name, list_price FROM products
ORDER BY id DESC
LIMIT 10;
-- pedidos unicos
SELECT  DISTINCT id, product_id FROM order_details;

-- pedidos los 3 con más gasto
SELECT unit_price, quantity FROM order_details
ORDER BY quantity DESC 
LIMIT 3;
-- SACAMOS IPORTE TOTAL MULTIPLICANDO COLUMUNAS unit_price *quantity 
SELECT unit_price * quantity AS importe_total FROM order_details
ORDER BY importe_total DESC
LIMIT 3; 

-- ID de los 5-10 coste economico total:

SELECT id, (unit_price * quantity) AS importe_total  FROM order_details
ORDER BY importe_total DESC 
LIMIT 5 OFFSET 5;

-- LISTA CATEGORIAS TIPO PRODUCTOS 

