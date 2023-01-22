use laboratorio;

/* 1. Utilizando la tabla productos_neptuno, obtener una lista de todos aquellos productos
cuyo precio supere el precio promedio. Esta debe contener todos los campos de la tabla.
Por último, ordenar alfabéticamente el resultado según los Nombres de los productos. */

select * from productos_neptuno
WHERE PrecioUnidad >
(select AVG(PrecioUnidad) from productos_neptuno)
ORDER BY NombreProducto;

/* 2. Tomando la tabla productos_neptuno, obtener una lista de todos aquellos productos
cuyo precio sea superior al producto más caro de la tabla PRODUCTOS_SUSPENDIDOS. 
Esta debe contener todos los campos de la tabla. Luego, ordenar el resultado de mayor a
menor de acuerdo con los precios obtenidos. */

select * from productos_neptuno;
select * from productos_suspendidos;

select * from productos_neptuno
WHERE PrecioUnidad >
(select MAX(PrecioUnidad) FROM productos_suspendidos)
ORDER BY PrecioUnidad desc;

/* 3. Utilizando la tabla VARONES, obtener una lista de todos aquellos bebés que hayan
nacido con una cantidad de semanas de gestación menor que el bebé de sexo
indeterminado con menor gestación. La lista debe mostrar todos los campos de la tabla. */

select * from varones WHERE SEMANAS < (select MIN(SEMANAS) from indeterminados);

/* 4. Dada la tabla productos_neptuno, obtener una lista de todos los productos cuyo
Nombre comience con la inicial del apellido del empleado cuyo IDEMPLEADO es el
número 8. Esta debe mostrar todos los campos de la tabla productos_neptuno
y se debe ordenar alfabéticamente según los Nombres de los productos. */

select * from productos_neptuno WHERE LEFT(NombreProducto, 1) =
(select LEFT(Nombre, 1) from empleados WHERE IdEmpleado = 8)
ORDER BY NombreProducto;

/* 5. Utilizando la tabla productos_neptuno, obtener una lista de todos los productos que
pertenezcan al proveedor con el ID más alto. La lista debe mostrar todos los campos de la
tabla productos_neptuno y debe ordenarse alfabéticamente por los Nombres de los productos. */

select * from productos_neptuno WHERE IdProveedor = (select MAX(IdProveedor) FROM proveedores)
ORDER BY NombreProducto;

/* 6. Dada la tabla productos_neptuno, extraer una lista de todos aquellos productos
que pertenezcan a la categoría BEBIDAS y cuyo precio sea superior al producto más
caro de la categoría CONDIMENTOS. La lista debe mostrar todos los campos de la tabla. */

select * from productos_neptuno WHERE NombreCategoria = 'BEBIDAS' AND
PrecioUnidad > (SELECT MAX(PrecioUnidad) FROM productos_neptuno WHERE NombreCategoria = 'CONDIMENTOS');

/* 7. A partir de la tabla MUJERES, obtener una lista de todas aquellas bebas que hayan
nacido de madres con una edad superior a la madre más longeva que figure en la tabla
VARONES. La lista debe mostrar todos los campos de la tabla MUJERES. */

select * from mujeres WHERE EDAD_MADRE > (SELECT MAX(EDAD_MADRE) FROM varones);

/* 8. Utilizando la tabla clientes_NEPTUNO, extraer una lista de todos los clientes que hayan realizado compras
por un cargo superior a 500 dólares. La lista debe mostrar los campos NombreCOMPANIA, CIUDAD y
PAÍS y debe estar ordenada alfabéticamente por los Nombres de las compañías. */

select * from productos_neptuno WHERE NombreCategoria = 'BEBIDAS' AND
PrecioUnidad > (SELECT MAX(PrecioUnidad) FROM productos_neptuno WHERE NombreCategoria = 'CONDIMENTOS');

############################################################

/* 1. Utilizando la tabla clientes_NEPTUNO, generar una consulta que muestre los campos
IDCLIENTE, NombreCOMPANÍA, CIUDAD y PAÍS. Agregar una columna cuyo Nombre
sea CONTINENTE, en la que se muestren los siguientes valores:
a. América del Norte si el cliente está radicado en México, Canadá o USA.
b. América del Sur si el cliente está radicado en Argentina, Brasil o Venezuela.
c. Europa en el caso de que no se cumplan ninguna de las condiciones anteriores.
Ordenar el resultado alfabéticamente por los campos CONTINENTE y PAÍS. */

select IdCliente, NombreCompania, Ciudad, Pais,
CASE
WHEN Pais IN ('ARGENTINA', 'BRASIL', 'VENEZUELA') THEN 'AMERICA DEL SUR'
WHEN Pais IN ('MÉXICO', 'USA', 'CANADÁ') THEN 'AMERICA DEL NORTE'
ELSE 'EUROPA'
END AS Continente
from clientes_neptuno
ORDER BY Continente, Pais;

/* 2. Utilizar la tabla PEDIDOS_NEPTUNO, generar una consulta que muestre los
campos IDPEDIDO, NombreCOMPAÑÍA, FECHAPEDIDO y CARGO. Luego, agregar
una columna llamada EVALUACIÓN en la que se muestren los siguientes valores:
a. EXCELENTE si el cargo supera los 700 dólares.
b. MUY BUENO si el cargo oscila entre 500 y 700 dólares.
c. BUENO si el cargo oscila entre 250 y 500 dólares.
d. REGULAR si el cargo oscila entre 50 y 250 dólares.
e. MALO si el cargo es inferior a 50 dólares.
Por último, ordenar el resultado de mayor a menor según los cargos de cada pedido.*/

select IdPedido, NombreCompania, FechaPedido, Cargo,
CASE
WHEN Cargo > 700 THEN 'EXCELENTE'
WHEN Cargo > 500 THEN 'MUY BUENO'
WHEN Cargo > 250 THEN 'BUENO'
WHEN Cargo > 50 THEN 'REGULAR'
ELSE 'MALO'
END AS 'EVALUACION'
FROM pedidos_neptuno
ORDER BY Cargo DESC;

/* 3. Utilizando la tabla productos_neptuno, generar una consulta que muestre los campos
IdProducto, NombreProducto, NombreCATEGORÍA y PrecioUnidad.
Agregar una columna con el Nombre TIPO en la que se muestren los siguientes valores:
a. DELUXE si el precio del producto supera los 100 dólares.
b. REGULAR si el precio del producto oscila entre 10 y 100 dólares.
c. ECONÓMICO si el precio del producto es inferior a los 10 dólares.
Por último, ordenar los productos de mayor a menor según sus precios. */

select IdProducto, NombreProducto, NombreCategoria, PrecioUnidad,
CASE
WHEN PrecioUnidad > 100 THEN 'DELUXE'
WHEN PrecioUnidad > 10 THEN 'REGULAR'
ELSE 'ECONOMICO'
END AS Tipo
FROM productos_neptuno
ORDER BY PrecioUnidad DESC;

####################################################

/* 1. Obtener una lista de todos aquellos bebés nacidos con menos de 20 semanas de
gestación. La lista mostrará los bebés de cualquier sexo, por lo tanto, la consulta se
debe llevar a cabo en las tablas VARONES, MUJERES e INDETERMINADOS. */

select * from varones WHERE SEMANAS < 20 UNION
select * from mujeres WHERE SEMANAS < 20 UNION
select * from indeterminados WHERE SEMANAS < 20;

/* 2. Luego, obtener una lista de todos aquellos bebés nacidos durante el mes de septiembre,
con más de 40 semanas de gestación y nacidos de madres chilenas casadas. La lista debe mostrar los bebés de cualquier
sexo, por lo tanto, debe llevar adelante la consulta en las tablas VARONES, MUJERES e INDETERMINADOS. */

select * from varones WHERE FECHA LIKE '%/09/%' AND NACIONALIDAD =
'CHILENA' AND ESTADO_CIVIL_MADRE = 'CASADA' AND SEMANAS > 40
UNION
select * from mujeres WHERE FECHA LIKE '%/09/%' AND NACIONALIDAD =
'CHILENA' AND ESTADO_CIVIL_MADRE = 'CASADA' AND SEMANAS > 40
UNION
select * from indeterminados WHERE FECHA LIKE '%/09/%' AND NACIONALIDAD =
'CHILENA' AND ESTADO_CIVIL_MADRE = 'CASADA' AND SEMANAS > 40;

/* 3. Obtener una lista de todos aquellos productos (a la venta y suspendidos) cuyo
precio supere los 80 dólares. La búsqueda se debe llevar a cabo en las tablas
productos_neptuno y PRODUCTOS_SUSPENDIDOS. Después, ordenar el resultado alfabéticamente según
los Nombres de los productos. */

select * from productos_neptuno
WHERE PrecioUnidad > 80
UNION
select * from productos_suspendidos
WHERE PrecioUnidad > 80
ORDER BY NombreProducto;

/* 4. Modificar la consulta anterior y agregar una columna con el Nombre CONDICIÓN en la
que se muestre el texto “A LA VENTA” en el caso de que el registro provenga de la tabla
productos_neptuno; o que se muestre el texto SUSPENDIDO si el registro proviene
de la tabla PRODUCTOS_SUSPENDIDOS. */

select *, 'A LA VENTA' AS Condicion from productos_neptuno
WHERE PrecioUnidad > 80
UNION
select *, 'SUSPENDIDO' AS Condicion from productos_suspendidos
WHERE PrecioUnidad > 80
ORDER BY NombreProducto;

/*5. Generar una lista de todos los productos que pertenezcan a la categoría BEBIDAS,
sin importar si los mismos se encuentran a la venta o suspendidos (la búsqueda se debe
hacer en las tablas productos_neptuno y la tabla PRODUCTOS_SUSPENDIDOS).
Luego, ordenar la lista alfabéticamente según los Nombres de los productos. */

select * from productos_neptuno
WHERE NombreCategoria = 'BEBIDAS'
UNION
select * from productos_suspendidos
WHERE NombreCategoria = 'BEBIDAS'
ORDER BY NombreProducto;

/* 6. Duplicar el producto cuyo ID es el número 43 de la tabla productos_neptuno en
la tabla PRODUCTOS_SUSPENDIDOS a través de una consulta de datos anexados. */

insert into productos_suspendidos
(IdProducto, NombreProducto, NombreContacto, NombreCategoria, PrecioUnidad,
Suspendido, IdProveedor)
select IdProducto, NombreProducto, NombreContacto, NombreCategoria,
PrecioUnidad, Suspendido, IdProveedor
from productos_neptuno
WHERE IdProducto = 43 ;

# 7. Repetir la consulta generada en el paso 5 (cinco) para observar que la cantidad de productos obtenida siga siendo la misma.

select * from productos_neptuno WHERE NombreCategoria = 'BEBIDAS'
UNION
select * from productos_suspendidos WHERE NombreCategoria = 'BEBIDAS'
ORDER BY NombreProducto;

# 8. Modificar la consulta del paso 5 (cinco) para mostrar el producto duplicado.

select * from productos_neptuno WHERE NombreCategoria = 'BEBIDAS'
UNION ALL
select * from productos_suspendidos WHERE NombreCategoria = 'BEBIDAS'
ORDER BY NombreProducto;

# 9. Eliminar el producto cuyo ID es el número 43 de la tabla PRODUCTOS_SUSPENDIDOS.

SET SQL_SAFE_UPDATES = 0;
delete from productos_suspendidos WHERE IdProducto = 43;

############################################

/* 1. Generar una tabla con el Nombre EQUIPOS, en la que sólo se cree un campo cuyo Nombre
sea EQUIPO. Este campo debe ser de tipo VARCHAR, almacenar hasta 20 caracteres
y debe ser PRIMARY KEY de la tabla. */

CREATE TABLE EQUIPOS (EQUIPO VARCHAR(20) PRIMARY KEY);

/* 2. Luego, cargar los Nombres de las siguientes selecciones en la tabla EQUIPOS:
ARGENTINA, BRASIL, PARAGUAY, CHILE, URUGUAY, COLOMBIA, ECUADOR, PERÚ, BOLIVIA, VENEZUELA. */

INSERT INTO EQUIPOS VALUES ('ARGENTINA'), ('BRASIL'), ('CHILE'), ('PARAGUAY'), ('URUGUAY'),
('COLOMBIA'), ('ECUADOR'), ('PERÚ'), ('BOLIVIA'), ('VENEZUELA');

/* 3. Generar un producto cartesiano en base a la misma tabla, para lograr un fixture en
el cual cada selección juegue con las otras selecciones (un partido como local y otro
como visitante). Ordenar alfabéticamente el resultado, según el Nombre del equipo local. */

select * from EQUIPOS L CROSS JOIN EQUIPOS V WHERE L.EQUIPO <> V.EQUIPO ORDER BY L.EQUIPO;

/* 4. Crear un producto cartesiano restringido por el que se unan las tablas PRODUCTOS
NEPTUNO y EMPLEADOS. Luego, mostrar en el resultado de la consulta los siguientes
campos IdProducto, NombreProducto y Nombre_EMPLEADO y sólo aquellas filas
en las que el IdProducto coincida con el IDEMPLEADO. */

select IdProducto, NombreProducto, Nombre from productos_neptuno, empleados WHERE productos_neptuno.IdProducto = empleados.IdEmpleado;

#############################################################################

/* 1. Generar un listado en el que se muestre el campo NombreContacto de la tabla
proveedores y los campos IdProducto, NombreProducto y PrecioUnidad de
la tabla PRODUCTOS NEPTUNO. Generar el JOIN a través de la cláusula FROM. Después,
ordenar el resultado alfabéticamente por los Nombres de los contactos y cuando el Nombre
del contacto (Nombre del proveedor) se repita, ordena los productos, también de manera
alfabética, provistos por el proveedor. */

SELECT PN.NombreContacto, IdProducto, NombreProducto, PrecioUnidad
FROM proveedores P JOIN productos_neptuno PN
ON P.IdProveedor = PN.IdProveedor
ORDER BY PN.NombreContacto, NombreProducto;

# 2. Modificar la consulta anterior para generar el JOIN a través de la cláusula WHERE.

SELECT PN.NombreContacto, IdProducto, NombreProducto, PrecioUnidad
FROM proveedores P, productos_neptuno PN
WHERE P.IdProveedor = PN.IdProveedor
ORDER BY PN.NombreContacto, NombreProducto;

/* 3. Crear un listado en la que se muestre el campo EMPRESA de la tabla clientes y los
campos NUMERO_PEDIDO, FECHA_PEDIDO y FORMA_PAGO de la tabla PEDIDOS.
Generar el JOIN a través de la cláusula FROM. Luego, ordenar el listado alfabéticamente por los Nombres de las empresas. */

SELECT EMPRESA, NUMERO_PEDIDO, FECHA_PEDIDO, FORMA_PAGO
FROM clientes C JOIN PEDIDOS P
ON C.COD_CLIENTE = P.CODIGO_CLIENTE
ORDER BY EMPRESA;

# 4. Modificar la consulta anterior para mostrar únicamente aquellos clientes que no hayan efectuado ningún pedido.

SELECT EMPRESA, NUMERO_PEDIDO, FECHA_PEDIDO, FORMA_PAGO
FROM clientes C LEFT JOIN PEDIDOS P
ON C.COD_CLIENTE = P.CODIGO_CLIENTE
WHERE P.NUMERO_PEDIDO IS NULL
ORDER BY EMPRESA;

# 5. Por último, modificar la consulta anterior para mostrar únicamente el campo EMPRESA.

SELECT EMPRESA
FROM clientes C LEFT JOIN PEDIDOS P
ON C.COD_CLIENTE = P.CODIGO_CLIENTE
WHERE P.NUMERO_PEDIDO IS NULL
ORDER BY EMPRESA;

/* 6. ¿Existe algún proveedor que en este momento no le esté vendiendo ningún producto a
nuestra empresa? Responder esta pregunta a través de una consulta en la que utilices las
tablas proveedores y PRODUCTOS NEPTUNO. Mostrar todos los campos de ambas tablas en el resultado de la consulta. */

SELECT * FROM proveedores P LEFT JOIN productos_neptuno PN
ON P.IdProveedor = PN.IdProveedor
WHERE PN.IdProducto IS NULL;

/* 7. ¿Existe algún producto que no se sepa quién es el proveedor que lo provee a nuestra
empresa? Responder esta pregunta a través de una consulta en la que utilices las tablas
proveedores y PRODUCTOS NEPTUNO. Puedes mostrar todos los campos de ambas tablas en el resultado de la consulta. */

SELECT * FROM proveedores P RIGHT JOIN productos_neptuno PN
ON P.IdProveedor = PN.IdProveedor
WHERE P.IdProveedor IS NULL;