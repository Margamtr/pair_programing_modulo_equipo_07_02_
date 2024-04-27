/*Crear base de datos tienda zapatillas*/

CREATE SCHEMA tienda_zapatillas;
USE tienda_zapatillas ;

/* creacion de tabla*/
CREATE TABLE Zapatillas(
id_zapatilla INT AUTO_INCREMENT NOT NULL,
modelo VARCHAR(45) NOT NULL,
color VARCHAR(45) NOT NULL,
PRIMARY KEY(id_zapatilla)
);

CREATE TABLE Clientes(
id_cliente INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(45) NOT NULL,
numero_telefono INT NOT NULL,
email VARCHAR(45) NOT NULL,
direccion VARCHAR(45) NOT NULL,
ciudad VARCHAR(45) NULL,
provincia  VARCHAR(45) NOT NULL,
pais  VARCHAR(45) NOT NULL,
codigo_postal VARCHAR(45) NOT NULL,
PRIMARY KEY(id_cliente)
);

CREATE TABLE Empleados(
id_empleado INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(45) NOT NULL,
tienda VARCHAR(45) NOT NULL,
salario INT NULL,
fecha_incorporacion DATE NOT NULL,
PRIMARY KEY(id_empleado)
);



