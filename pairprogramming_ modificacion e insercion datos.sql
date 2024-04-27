/*En este ejercicio vamos a corregir los errores que hemos encontrado en nuestras tablas.
Tabla Zapatillas:
Se nos ha olvidado introducir la marca y la talla de las zapatillas que tenemos en nuestra BBDD.
 Por lo tanto, debemos incluir:
marca: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
talla: es un entero, no nulo.
Tabla Empleados
salario: es un entero, no nulo. Pero puede que el salario de nuestros empleados tenga decimales,
 por lo que le cambiaremos el tipo a decimal.
Tabla Clientes
pais: la hemos incluido en la tabla pero nuestro negocio solo distribuye a España, 
por lo que es una columna que no hará falta. La eliminaremos.

Tabla Facturas:
total: madre mía!!! Se nos ha olvidado incluir el total de la cada factura generada😨!
Creemos esa columna con un tipo de datos decimal.*/

ALTER TABLE zapatillas
ADD COLUMN marca VARCHAR(45) NOT NULL, ADD COLUMN talla INT NOT NULL;

ALTER TABLE empleados 
MODIFY COLUMN  salario FLOAT NULL;

ALTER TABLE clientes
DROP COLUMN  pais;

ALTER TABLE facturas
ADD COLUMN total FLOAT;

INSERT INTO zapatillas (id_zapatilla,modelo,color,marca,talla)
VALUES (1,'XQYUN','Negro','Nike',42),(2,'UOPMN','Rosas','Nike',39),(3,'OPNYT','Verdes','Adidas',35);

INSERT INTO empleados (nombre,tienda,salario,fecha_incorporacion)
VALUES ( 'Laura', 'Alcobendas', 25987, '2010-09-03'),( 'Maria', 'Sevilla',NULL, '2001-04-11'),
( 'Ester', 'Oviedo',30165.98, '2000-11-29');


INSERT INTO clientes (id_cliente,nombre,numero_telefono,email,direccion,ciudad,provincia,codigo_postal)
VALUES ( 1, 'Monica', 123456789 , 'monica@email.com', 'Calle Felicidad', 'Móstoles', 'Madrid', '28176'),
(2,'Lorena',289345678,'lorena@email.com','Calle Alegria','Barcelona','Barcelona',12346),
(3,'Carmen',298463759,'carmen@email.com','Calle del Color','Vigo','Pontevedra',23456);

INSERT INTO facturas (id_factura,numero_factura,fecha,id_zapatilla,id_empleado,id_cliente,total)
VALUES (1, '123', ' 2001-12-11', 1,2,1,54.98),
(2,'1234', '2005-05-23',1,1,3,89.91),
(3, '12345', '2015-09-18', 2,3,3,76.23);

UPDATE zapatillas
SET color = 'amarillo'
WHERE color = 'rosas';

-- tabla empleados no tiene ciudad de procedencia, cambio la ciudad de la tienda
UPDATE empleados
SET tienda= 'A Coruña'
WHERE id_empleado = 1;

-- cambio telefono Monica, tenia un digito de mas
UPDATE clientes
SET numero_telefono =123456728
WHERE nombre ='Monica';

-- update total factura id 2

UPDATE facturas
SET total = 89.91
WHERE id_factura = 2;
