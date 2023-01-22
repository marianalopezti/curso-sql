use laboratorio;

/* 1. Generar, a partir de la tabla NACIMIENTOS, una nueva tabla con el nombre VARONES
con todos los campos de la tabla original y copia en esta nueva tabla todos los registros
en los que figure el sexo MASCULINO. Al ejecutar la consulta, debería generarse la
tabla con 98.397 filas. No olvidar actualizar los esquemas para verificar la creación de
la tabla dentro de la base de datos. */

create table varones
select * from nacimientos WHERE SEXO = 'MASCULINO';

/* 2. Generar, a partir de la tabla NACIMIENTOS, una nueva tabla con el nombre MUJERES con
todos los campos de la tabla original y copiar en esta nueva tabla todos los registros en los
que figure el sexo FEMENINO. Al ejecutar la consulta, debería generarse la tabla con
94.763 filas. Actualizar los esquemas para verificar la creación de la tabla dentro de la
base de datos. */

create table mujeres
select * from nacimientos WHERE SEXO = 'femenino';

/* 3. Generar, a partir de la tabla NACIMIENTOS, una nueva tabla con el nombre INDETERMINADOS con todos los
campos de la tabla original y copiar en esta nueva tabla todos los registros en los que figure el sexo
INDETERMINADO. Al ejecutar la consulta, debería generarse la tabla con 24 filas. No olvidar actualizar
los esquemas para verificar la creación de la tabla dentro de la base de datos. */

create table indeterminados
select * from nacimientos where SEXO = 'INDETERMINADO';

# 4. Eliminar la tabla NACIMIENTOS.

drop table nacimientos;

#############################################

/* 1. Actualizar la tabla CLIENTES_NEPTUNO. Cuando figure el valor ESTADOS UNIDOS en
el campo PAIS, cambiar dicho valor por USA. Para verificar el cambio realizado, mostrar el
contenido de la tabla CLIENTES_NEPTUNO. */

set SQL_SAFE_UPDATES = 0;
update clientes_neptuno
set Pais = 'USA' WHERE Pais = 'Estados Unidos';
select * from clientes_neptuno;

/* 2. Actualiza la tabla CLIENTES_NEPTUNO para mostrar todos los valores del campo NOMBRECOMPANIA en
mayúsculas. Para verificar el cambio realizado, muestra el contenido de la tabla CLIENTES_NEPTUNO. */

update clientes_neptuno SET NombreCompania = UPPER(NombreCompania);
select * from clientes_neptuno;

/* 3. Actualizar la tabla CLIENTES_NEPTUNO para mostrar todos los valores de los campos
CIUDAD y PAIS en mayúsculas. Mostrar el contenido de la tabla CLIENTES_NEPTUNO
para verificar el cambio llevado a cabo */

update clientes_neptuno
set Ciudad = UPPER(Ciudad), Pais = UPPER(Pais);
select * from clientes_neptuno;

/* 4. En la tabla EMPLEADOS generar una nueva columna llamada NOMBRE_EMPLEADO
que admita cadenas de texto con un máximo de 30 caracteres. Ubica esta columna a la
derecha del campo IDEMPLEADO. Completar esta nueva columna concatenando los
valores cargados en los campos APELLIDOS y NOMBRE, separando dichos valores por
una coma y un espacio. Eliminar las columnas APELLIDOS y NOMBRE. Mostrar el
contenido de la tabla EMPLEADOS para verificar el cambio llevado a cabo. */

alter table empleados ADD Nombre_Empleado VARCHAR(30) AFTER IdEmpleado;
update empleados
set Nombre_Empleado = CONCAT(apellidos, ', ', Nombre);
alter table empleados DROP Apellidos, DROP Nombre;
select * from empleados;

/* 5. En la tabla CLIENTES generar una nueva columna con el nombre TIPO que admita
cadenas de texto con un máximo de 3 caracteres. Esta columna debe ubicarse
al final de la tabla. Completar esta nueva columna estableciendo el valor VIP para
todos aquellos clientes que residan en la ciudad de MADRID. Para verificar el cambio
llevado a cabo, mostrar el contenido de la tabla CLIENTES. */

use laboratorio;

set SQL_SAFE_UPDATES = 0;
alter table clientes ADD TIPO VARCHAR(3);
update clientes set TIPO = 'VIP' WHERE CIUDAD = 'MADRID';
SELECT * FROM clientes;

/* 6. Dado que todos los clientes que figuran en la tabla CLIENTES residen en España, agregar
el prefijo +34- a cada uno de los teléfonos que figuran en el campo TELEFONO. En caso
de que un cliente no tuviera el teléfono cargado, a ese teléfono no se le debería
agregar el prefijo. Mostrar el contenido de la tabla CLIENTES para verificar el cambio
realizado. */

set SQL_SAFE_UPDATES = 0;
alter table clientes MODIFY TELEFONO VARCHAR(20);
update clientes
set TELEFONO = CONCAT('+34-', TELEFONO) WHERE TELEFONO is not null;
select * from clientes;

/* 7. En la tabla PRODUCTOS generar una nueva columna con el nombre FECHA que admita la
carga de fechas. Completar la nueva columna con fechas coherentes, concatenando los
campos DIA, MES y ANO. Cargados los datos en la nueva columna, eliminar las columnas
originales (DIA, MES y ANO). Además, actualizar el campo ORIGEN de manera que,
donde figure el valor ESPANA, sea reemplazado por ESPAÑA. Mostrar el contenido de la
tabla PRODUCTOS para verificar el cambio llevado a cabo. */

alter table productos ADD FECHA DATE;
update productos set FECHA = CONCAT(ANO, '-', MES, '-', DIA);
alter table productos DROP DIA, DROP MES, DROP ANIO;
update productos set ORIGEN = 'ESPAÑA'
WHERE ORIGEN = 'ESPANA';
select * from productos;

/* 8. Actualizar el campo SUSPENDIDO de la tabla PRODUCTOS_NEPTUNO de manera que:
a. Donde figure el valor 0, éste se reemplace por la palabra NO.
b. Donde figure el valor 1, éste se reemplace por la palabra SI.
c. Tener en cuenta que el campo SUSPENDIDO es de tipo INT actualmente. Cambiar el tipo de dato para
que admita el reemplazo.
d. Para verificar el cambio llevado a cabo, mostrar el contenido de la tabla PRODUCTOS_NEPTUNO */

alter table productos_neptuno MODIFY Suspendido VARCHAR(2);
update productos_neptuno
set Suspendido = IF(Suspendido = '0', 'NO', 'SI');
select * from productos_neptuno;

/* 9. Actualizar los precios de todos los productos de la tabla PRODUCTOS_NEPTUNO,
recargándolos un 10% y manteniendo un total de 2 decimales para cada uno de los
precios. Mostrar el contenido de la tabla PRODUCTOS_NEPTUNO para verificar el
cambio llevado a cabo. */

update productos_neptuno set PrecioUnidad = ROUND(PrecioUnidad * 1.1, 2);
select * from productos_neptuno;

/* 10. Observar la tabla PROVEEDORES y su contenido. Para todos aquellos proveedores
que no tengan cargado un valor en el campo REGION, mostrar el valor NULL en dicho
campo. Mostrar el contenido de la tabla PROVEEDORES para verificar el cambio
llevado a cabo. */

update proveedores set Region = null WHERE Region = '';
select * from proveedores;

/* 11. Observar el contenido de la tabla CLIENTES. Actualizar el campo CIUDAD de manera que
todos los valores cargados en esta columna muestren la primera letra en mayúsculas y el
resto en minúsculas. Mostrar el contenido de la tabla PROVEEDORES para verificar el
cambio llevado a cabo. */

update clientes
set CIUDAD = CONCAT(UPPER(LEFT(CIUDAD, 1)),
LOWER(SUBSTRING(CIUDAD, 2, LENGTH(CIUDAD))));
select * from clientes;

/* 12. Generar una nueva tabla con el nombre PRODUCTOS_SUSPENDIDOS a partir de la tabla
PRODUCTOS_NEPTUNO. Volcar en esta nueva tabla todos los campos de la tabla PRODUCTOS_NEPTUNO,
pero sólo aquellos registros en los que en el campo SUSPENDIDO figure la palabra SI. Mostrar el
contenido de la tabla PRODUCTOS_SUSPENDIDOS una vez generada. La nueva tabla debería contener 8
productos (registros). */

create table Productos_Suspendidos
select * from productos_neptuno
WHERE Suspendido = 'SI';
select * from productos_neptuno;

#######################################################

/* 1. Desde ahora, todos los productos provistos
por el proveedor 1 pasan a estar suspendidos
por tiempo indeterminado. Por lo tanto:
a. Ejecutar una consulta de actualización por
la que, todos los productos de la tabla
PRODUCTOS_NEPTUNO que pertenecen
al proveedor cuyo IDPROVEEDOR sea el
número 1 pasen a mostrar el valor SI en
el campo SUSPENDIDO.

b. Ejecutar una consulta de datos anexados
por la que, todos los productos que ahora
se encuentran suspendidos en la tabla
PRODUCTOS_NEPTUNO se copien en
la tabla PRODUCTOS_SUSPENDIDOS.

c. Ejecutar una consulta de eliminación
por la que, todos los productos de la tabla
PRODUCTOS_NEPTUNO que fueron
copiados, se eliminen de la tabla
PRODUCTOS_SUSPENDIDOS.
*/
use laboratorio;
UPDATE productos_neptuno SET Suspendido = 'SI' WHERE IdProveedor =1;
INSERT INTO productos_suspendidos (IDPRODUCTO,
NOMBREPRODUCTO, NOMBRECONTACTO, NOMBRECATEGORIA, PRECIOUNIDAD, SUSPENDIDO, IDPROVEEDOR)
SELECT IDPRODUCTO, NOMBREPRODUCTO, NOMBRECONTACTO, NOMBRECATEGORIA, PRECIOUNIDAD,
SUSPENDIDO, IDPROVEEDOR
FROM productos_neptuno
WHERE Suspendido = 'SI';
DELETE FROM productos_neptuno WHERE Suspendido = 'SI';

select * from productos_neptuno;
select * from productos_suspendidos;

################################################

/* 1. En la etapa anterior, se creó una tabla nueva con el nombre PRODUCTOS_SUSPENDIDOS
y se copió en ella, todos los productos que se encontraban suspendidos de la tabla
PRODUCTOS_NEPTUNO. Sin embargo, estos registros se copiaron de una tabla a la otra;
es decir, aún se encuentran cargados en la tabla PRODUCTOS_NEPTUNO.
Por lo tanto, llevar a cabo una consulta de eliminación por la que los productos
suspendidos se eliminen de la tabla PRODUCTOS_NEPTUNO. Al ejecutar esta
consulta deberían eliminarse de la tabla PRODUCTOS_NEPTUNO 8 registros. */

set SQL_SAFE_UPDATES = 0;
delete from productos_neptuno WHERE Suspendido = 'SI';



