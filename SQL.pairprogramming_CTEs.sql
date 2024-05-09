USE northwind;

/* 1. Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente y el nombre de la compañia de la tabla Customers.*/

WITH info_compañia AS (SELECT customer_id,company_name
						FROM customers)
SELECT *
FROM info_compañia;

/* 2. Selecciona solo los de que vengan de "Germany"
Ampliemos un poco la query anterior. En este caso, queremos un resultado similar al anterior, pero solo queremos 
los que pertezcan a "Germany".*/

WITH info_compañia AS (SELECT customer_id,company_name, country
						FROM customers
                        WHERE country ="Germany")
SELECT *
FROM info_compañia;


/*3. Extraed el id de las facturas y su fecha de cada cliente.
En este caso queremos extraer todas las facturas que se han emitido a un cliente, su fecha la compañia a la que pertenece.
📌 NOTA En este caso tendremos columnas con elementos repetidos(CustomerID, y Company Name).*/

WITH info_facturas AS ( SELECT ship_name, order_id, order_date
						FROM orders
                        GROUP BY ship_name)
SELECT C.customer_id, C.company_name, I.order_id, I.order_date
FROM customers AS C
INNER JOIN info_facturas AS I
ON I.ship_name = C.company_name;



/*4. Contad el número de facturas por cliente
Mejoremos la query anterior. En este caso queremos saber el número de facturas emitidas por cada cliente.*/

 WITH info_can_facturas AS (SELECT ship_name, COUNT( order_id) AS numero_facturas , order_date
						FROM orders
                        GROUP BY ship_name)
SELECT C.customer_id, C.company_name, I.numero_facturas
FROM customers AS C
INNER JOIN info_can_facturas AS I
ON I.ship_name = C.company_name;

/*5. Cuál la cantidad media pedida de todos los productos ProductID.
Necesitaréis extraer la suma de las cantidades por cada producto y calcular la media.*/

 WITH info_can_facturas AS (SELECT ship_name, COUNT( order_id) AS numero_facturas , order_date
						FROM orders
                        GROUP BY ship_name)             

SELECT I. sum(numero_facturas) C.customer_id, C.company_name, I. sum(numero_facturas)
FROM customers AS C
INNER JOIN info_can_facturas AS I
ON I.ship_name = C.company_name;





SELECT COUNT(order_id) AS numero_facturas
FROM  ( WITH media_num_facturas AS (SELECT AVG(numero_facturas)
									FROM orders AS O
                                    GROUP BY ship_name)
		SELECT O.media_num_facturas , 
		FROM orders;
        INNER JOIN 

		



/*DE AQUI HASTA ABAJO ES UN BONUS:
6. Usando una CTE, extraer el nombre de las diferentes categorías de productos, con su precio medio, máximo y mínimo*/

/*7. La empresa nos ha pedido que busquemos el nombre de cliente,
 su teléfono y el número de pedidos que ha hecho cada uno de ellos.*/
 
 /*8. Modifica la consulta anterior para obtener los mismos resultados pero con los pedidos por año que ha hecho cada cliente.
 
 /*9. Modifica la cte del ejercicio anterior, úsala en una subconsulta para saber el nombre del cliente y su teléfono,
 para aquellos clientes que hayan hecho más de 6 pedidos en el año 1998.*/
 
 /*10. Nos piden que obtengamos el importe total (teniendo en cuenta los descuentos)
 de cada pedido de la tabla orders y el customer_id asociado a cada pedido.*/


