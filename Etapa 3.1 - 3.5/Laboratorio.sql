use laboratorio;

/* 1. Utiliza la tabla CLIENTES_NEPTUNO y genera una consulta que muestre las columnas
IDCLIENTE y NOMBRECOMPANIA. En el resultado de la consulta, se debe mostrar una
nueva columna con el nombre UBICACION que concatene las columnas DIRECCION,
CIUDAD y PAIS, separando los valores de estos campos por un guión. Para este primer
ejercicio, utiliza la función CONCAT */

select idcliente, NombreCompania, concat(Direccion, ' - ', Ciudad, ' - ', Pais) AS Ubicacion from clientes_neptuno;

/* 2. Repite el ejercicio anterior, utilizando la función CONCAT_WS. */

select idcliente, NombreCompania, CONCAT_WS(' - ', Direccion, Ciudad, Pais) AS Ubicacion from clientes_neptuno;

/* 3. Modifica el ejercicio anterior para mostrar en mayúsculas los valores cargados en el campo cuyo nombre es
NOMBRECOMPANIA. Esta columna debe mostrarse con el nombre EMPRESA. */

select idcliente, UPPER(NOMBRECOMPANIA) AS EMPRESA, CONCAT_WS(' - ', Direccion, Ciudad, Pais) AS Ubicacion from clientes_neptuno;

/* 4. Modifica el ejercicio anterior para mostrar los valores cargados en el campo IDCLIENTE en minúsculas. Esta
columna debe mostrarse con el nombre CODIGO. */

select LOWER(idcliente) AS CODIGO, UPPER(NOMBRECOMPANIA) AS EMPRESA, CONCAT_WS(' - ', Direccion, Ciudad, Pais) AS Ubicacion from clientes_neptuno;

/* 5. Utiliza la tabla NACIMIENTOS y genera una consulta que muestre la columna FECHA. En el resultado de la
consulta, se debe mostrar una nueva columna con el nombre SEXO que muestre la inicial de los datos
cargados en el campo SEXO y otra columna con el nombre TIPO que muestre la inicial de los datos
cargados en el campo TIPO_PARTO. */

select FECHA, LEFT(SEXO, 1) AS SEXO, LEFT(TIPO_PARTO, 1) AS Tipo from nacimientos;

/* 6. Utiliza la tabla CLIENTES_NEPTUNO y genera una consulta que muestre todos los campos de la tabla.
Agrega una nueva columna a la consulta con el nombre CODIGO. La misma, debe concatenar la
primera letra del campo CIUDAD y la primera y las 2 últimas letras del campo PAIS. Los datos de esta
nueva columna se deben mostrar en mayúsculas. */

select *, UPPER(CONCAT(LEFT(Ciudad, 1), LEFT(Pais, 1), RIGHT(Pais, 2))) AS Codigo from clientes_neptuno;

/* 7. Utiliza la tabla NACIMIENTOS y genera una consulta que muestre las 5 primeras columnas de la tabla.
Agrega una nueva columna a la consulta con el nombre MES que tome el mes de nacimiento de los
bebés del campo FECHA. Ordena el resultado de menor a mayor por los valores de la columna MES.*/

select SEXO, FECHA, TIPO_PARTO, ATENC_PART, LOCAL_PART, SUBSTRING(FECHA, 4, 2) AS Mes from nacimientos ORDER BY MES;

/* 8. Utiliza la tabla NACIMIENTOS y genera una consulta que muestre las columnas SEXO, FECHA
y TIPO_PARTO. En el resultado de la consulta, se debe mostrar una nueva columna llamada NACIONALIDAD
donde se reemplazan los valores Chilena de la columna NACIONALIDAD original por Ciudadana */

select SEXO, FECHA, TIPO_PARTO, replace(NACIONALIDAD, 'Chilena', 'Ciudadana') AS Nacionalidad from nacimientos;

#############################################################################

/* 1. Utilizando la tabla PEDIDOS_NEPTUNO, obtener una lista de todos aquellos pedidos efectuados a lo largo del año 1998. */

select * from pedidos_neptuno;

select * from pedidos_neptuno where YEAR(FechaPedido) = 1998;

/* 2. Utilizando la tabla PEDIDOS_NEPTUNO, obtén una lista de todos aquellos pedidos efectuados durante los meses de agosto 
y septiembre del año 1997. */

select * from pedidos_neptuno where MONTH(FechaPedido) BETWEEN 8 AND 9 AND YEAR(FechaPedido) = 1997;

/* 3. Utilizando la tabla PEDIDOS_NEPTUNO, obtén una lista de todos aquellos pedidos efectuados el primer día de cada mes de
cualquier año */

select * from pedidos_neptuno where DAY(FechaPedido) = 1;

/* 4. Utiliza la tabla PEDIDOS_NEPTUNO y obtén una lista de todos los registros contenidos en la tabla. En una
nueva columna llamada DIAS TRANSCURRIDOS, muestra la cantidad de días transcurridos desde la fecha en que fue 
realizado cada pedido, al día de hoy. */

select *, DATEDIFF(CURDATE(), FechaPedido) AS 'Dias transcurridos' from pedidos_neptuno;

/* 5. Modifica la consulta anterior y agrega otra columna con el nombre DIA, que refleje el nombre del día en
el que se efectuó cada uno de los pedidos. */

select *, DATEDIFF(CURDATE(), FechaPedido) AS 'Dias transcurridos', DAYNAME(FechaPedido) AS Dia from pedidos_neptuno;

/* 6. Modifica la consulta anterior y agrega otra columna llamada DIA DEL AÑO, que refleje el número del día
del año en el que se efectuó cada uno de los pedidos. */

select *, DATEDIFF(CURDATE(), FechaPedido) AS 'Dias transcurridos', DAYNAME(FechaPedido) AS Dia, DAYOFYEAR(FechaPedido) AS 'Dia del año' from pedidos_neptuno;

/* 7. Modifica la consulta anterior y agrega otra columna con el nombre MES, que refleje el nombre del mes del año en el 
que se efectuó cada uno de los pedidos. */

select *, DATEDIFF(CURDATE(), FechaPedido) AS 'Dias transcurridos', DAYNAME(FechaPedido) AS Dia, DAYOFYEAR(FechaPedido) AS 'Dia del año',
MONTHNAME(FechaPedido) AS 'Mes' FROM pedidos_neptuno;

/* 8. Modifica la consulta anterior y agrega otra columna llamada PRIMER VENCIMIENTO que calcule el primer
vencimiento de cada factura, suponiendo que dicho vencimiento es a los 30 días de haber sido emitida. */

select *, DATEDIFF(CURDATE(), FechaPedido) AS 'Dias transcurridos', DAYNAME(FechaPedido) AS Dia, DAYOFYEAR(FechaPedido) AS 'Dia del año',
MONTHNAME(FechaPedido) AS 'Mes', ADDDATE(FechaPedido, INTERVAL 30 DAY) AS 'Primer vencimiento' FROM pedidos_neptuno;

/* 9. Modifica la consulta anterior y agrega otra columna llamada SEGUNDO VENCIMIENTO que calcule el
segundo vencimiento de cada factura, suponiendo que el mismo es a los 2 meses de haber sido emitida. */

select *, DATEDIFF(CURDATE(), FechaPedido) AS 'Dias transcurridos', DAYNAME(FechaPedido) AS Dia, DAYOFYEAR(FechaPedido) AS 'Dia del año',
MONTHNAME(FechaPedido) AS 'Mes', ADDDATE(FechaPedido, INTERVAL 30 DAY) AS 'Primer vencimiento',
ADDDATE(FechaPedido, INTERVAL 2 MONTH) AS 'Segundo vencimiento' FROM pedidos_neptuno;

########################################################
/* 1. Utiliza la tabla PEDIDOS_NEPTUNO y obtén una lista de todos los registros cargados en la tabla.
Genera una nueva columna con el nombre IVA que calcule el 21% del cargo de cada pedido,
obteniendo un valor numérico que, como máximo, contenga 2 decimales. */

select *, ROUND(Cargo * 0.21, 2) AS IVA FROM pedidos_neptuno;

/* 2. Modifica la consulta anterior, agregando una nueva columna con el nombre NETO, que calcule el total a
pagar por cada cliente por las compras realizadas (es decir, sumándole el IVA al cargo original, manteniendo como máximo 2 decimales). */

select *, ROUND(Cargo * 0.21, 2) AS IVA, ROUND(CARGO * 1.21, 2) AS Neto FROM pedidos_neptuno;

/* 3. Modifica la consulta anterior, agregando una nueva columna con el nombre REDONDEO A FAVOR CLIENTE que devuelva el valor entero
inferior del neto calculado anteriormente. */

select *, ROUND(Cargo * 0.21, 2) AS IVA, ROUND(Cargo * 1.21, 2) AS Neto, FLOOR(ROUND(Cargo * 1.21, 2)) AS 'Redondeo a favor cliente' 
FROM pedidos_neptuno;

/* 4. Modifica la consulta anterior, agregando una nueva columna con el nombre REDONDEO A
FAVOR EMPRESA que devuelva el valor entero superior del neto antes calculado. */

select *, ROUND(Cargo * 0.21, 2) AS IVA, ROUND(Cargo * 1.21, 2) AS Neto,
FLOOR(ROUND(Cargo * 1.21, 2)) AS 'Redondeo a favor del cliente', CEIL(ROUND(Cargo * 1.21, 2)) AS 'Redondeo a favor empresa'
FROM pedidos_neptuno;

#############################################################

/* 1. Calcula la cantidad de registros cargados en la tabla PEDIDOS_NEPTUNO */

select COUNT(*) from pedidos_neptuno;

/* 2. Calcula la cantidad de pedidos cargados en la tabla PEDIDOS_NEPTUNO que hayan sido entregados
por el transportista con el nombre SPEEDY EXPRESS. La columna en la que se obtiene el resultado se mostrará 
con el nombre ENTREGAS SPEEDY EXPRESS. */

select COUNT(Transportista) AS 'Entregas Speedy Express' from pedidos_neptuno WHERE Transportista = 'Speedy express';

/* 3. Calcula la cantidad de pedidos cargados en la tabla PEDIDOS_NEPTUNO que hayan sido atendidos por
empleados cuyo apellido comience con la letra C. La columna en la que se obtiene el resultado debe mostrarse con el nombre VENTAS. */

select COUNT(Empleado) Ventas from pedidos_neptuno WHERE empleado LIKE 'C%';

/* 4. Calcula el precio promedio de todos los productos cargados en la tabla llamada
PRODUCTOS_NEPTUNO. La columna del resultado, debe mostrarse con el nombre PRECIO PROMEDIO. Y
el resultado debe mostrar, como máximo, sólo 2 decimales.*/

select ROUND(AVG(PrecioUnidad), 2) 'Precio promedio' FROM productos_neptuno;

/* 5. Modifica la consulta anterior, para obtener el precio más bajo de la tabla. La columna en la que se obtiene
el resultado, debe mostrarse con el nombre PRECIO INFERIOR. */

select ROUND(AVG(PrecioUnidad), 2) 'Precio promedio', MIN(PrecioUnidad) 'Precio minimo' from productos_neptuno;

/* 6. Modifica la consulta anterior para obtener el precio más alto de la tabla. La nueva columna
debe mostrarse con el nombre PRECIO MAXIMO. */

select ROUND(AVG(PrecioUnidad), 2) 'Precio promedio', MIN(PrecioUnidad) 'Precio minimo',
MAX(PrecioUnidad) 'Precio maximo' from productos_neptuno;

/* 7. En base a la tabla PRODUCTOS_NEPTUNO, genera una consulta que muestre el precio
más alto correspondiente a cada categoría. La columna en la que se obtiene dicho precio
debe mostrarse con el nombre PRECIO MAXIMO. La columna que muestra las
categorías debe mostrarse con el nombre CATEGORIA. */

select NombreCategoria AS Categoria, MAX(PrecioUnidad) AS 'Precio maximo' from productos_neptuno GROUP BY Categoria;

/* 8. Calcula la cantidad de entregas efectuadas por cada transportista, utilizando la tabla
PEDIDOS_NEPTUNO. La columna en la que se obtienen los resultados debe mostrarse con
el nombre ENTREGAS. */

select Transportista, COUNT(IdPedido) AS Entregas from pedidos_neptuno GROUP BY Transportista;

/* 9. Utiliza la tabla NACIMIENTOS y calcula la cantidad de nacimientos según el sexo de los bebés. La columna
en la que se obtienen los resultados debe mostrarse con el nombre NACIMIENTOS. */

select SEXO, COUNT(SEXO) AS Nacimientos from nacimientos GROUP BY SEXO;

/* 10. Utilizando la tabla PEDIDOS_NEPTUNO, calcula el total de gastos por cliente. La columna en la que se
obtienen los resultados debe mostrarse con el nombre TOTAL GASTOS y debe mostrar como máximo 2
decimales. La columna en la que figuran los nombres de los clientes debe tener el título CLIENTE. */

select NombreCompania AS Cliente, ROUND(SUM(Cargo), 2) AS 'Total gastos' from pedidos_neptuno GROUP BY Cliente;

/* 11. Utilizando la tabla PRODUCTOS, calcula la cantidad de productos pertenecientes a cada sección. La
columna en la que se obtienen los resultados debe mostrarse con el nombre CANTIDAD. Ordena la
consulta de mayor a menor según los valores de la columna CANTIDAD */

select SECCION, COUNT(SECCION) AS CANTIDAD from productos GROUP BY SECCION ORDER BY CANTIDAD DESC;

/* 12. Utilizando la tabla PEDIDOS_NEPTUNO, calcula la cantidad de ventas efectuadas por mes y año. Las
columnas deben mostrarse con los nombres AÑO, MES y VENTAS respectivamente. Ordena el resultado
por año y mes, para obtener un listado cronológico de las ventas. */

select YEAR(FechaPedido) AS 'Año', MONTHNAME(FechaPedido) AS Mes, COUNT(IDPEDIDO) AS Ventas
from pedidos_neptuno GROUP BY Año, Mes ORDER BY Año, MONTH(FechaPedido);

/* 13. Utilizar la tabla PEDIDOS_NEPTUNO y
calcular las siguientes estadísticas:
a. El total facturado por empleado.
b. El promedio de facturación por empleado.
c. La mejor venta efectuada por cada
empleado.
d. La peor venta efectuada por cada
empleado.
e. La cantidad de ventas efectuadas por
cada empleado.
f. Tener en cuenta las siguientes especificaciones: las columnas deben recibir los
nombres FACTURACION, PROMEDIO,
MEJOR VENTA, PEOR VENTA y VENTAS.
Las columnas llamadas FACTURACION y
PROMEDIO deben mostrar, como máximo,
2 decimales. */

select Empleado, ROUND(SUM(Cargo), 2) AS Facturacion, 
MAX(Cargo) AS 'MEJOR VENTA', MIN(Cargo) AS 'PEOR VENTA', ROUND(AVG(Cargo), 2) AS Promedio, COUNT(Cargo) AS Ventas
from pedidos_neptuno GROUP BY Empleado;
