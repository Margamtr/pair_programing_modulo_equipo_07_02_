SELECT  'Hola!'  AS tipo_nombre
FROM customers;
-- Ciudades que empiezan con "A" o "B".
SELECT customer_name AS COMPANY_NAME, city, contact_first_name AS CONTACT_NAME
FROM customers
WHERE city LIKE 'A%' OR city LIKE 'B%';

-- Número de pedidos que han hecho en las ciudades que empiezan con L.
SELECT customers.customer_name AS COMPANY_NAME, customers.city, customers.contact_first_name AS CONTACT_NAME, count(order_number) as NUM_PEDIDOS
FROM customers
INNER JOIN orders ON orders.customer_number= customers.customer_number
WHERE customers.city LIKE 'L%'
GROUP BY orders.customer_number , customers.customer_number;

-- Todos los clientes cuyo "country" no incluya "USA".
SELECT customer_name, city,contact_first_name
FROM customers
WHERE country NOT LIKE 'USA';

-- Todos los clientes que no tengan una "A" en segunda posición en su nombre.
SELECT contact_first_name
FROM customers
WHERE contact_first_name NOT LIKE '_A%';

-- Extraer toda la información sobre las compañias que tengamos en la BBDD

SELECT city, customer_name AS COMPANY_NAME, contact_first_name, 'CUSTOMERS' AS RELATIONSHIP
FROM customers
UNION
SELECT product_vendor AS COMPANY_NAME, 'NO EXISTE' AS CONTACT_FIRST_NAME, 'PROVEEDOR' AS RELATIONSHIP 
FROM products;


