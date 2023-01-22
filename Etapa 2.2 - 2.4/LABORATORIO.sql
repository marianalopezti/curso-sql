show databases;
use laboratorio;

select * from clientes_neptuno;

select NombreCompania, Ciudad, Pais from clientes_neptuno;

select NombreCompania, Ciudad, Pais from clientes_neptuno ORDER BY Pais;

select NombreCompania, Ciudad, Pais from clientes_neptuno ORDER BY Pais, Ciudad;

select NombreCompania, Ciudad, Pais from clientes_neptuno ORDER BY Pais, Ciudad LIMIT 10;

select NombreCompania, Ciudad, Pais from clientes_neptuno ORDER BY Pais, Ciudad LIMIT 5 OFFSET 10;

######### TABLA NACIMIENTOS #########

select * from nacimientos where NACIONALIDAD = 'EXTRANJERA';

# select * from nacimientos where NACIONALIDAD = 'EXTRANJERA' ORDER BY EDAD_MADRE;

select * from nacimientos where EDAD_MADRE < 18 ORDER BY EDAD_MADRE;

select * from nacimientos where EDAD_PADRE = EDAD_MADRE;

select * from nacimientos where EDAD_PADRE - EDAD_MADRE > 40;

select * from nacimientos where SEMANAS < 20 ORDER BY SEMANAS desc;

select * from nacimientos where SEXO = 'Femenino' AND NACIONALIDAD = 'Extranjera' AND ESTADO_CIVIL_MADRE = 'Soltera' AND EDAD_MADRE > 40;

select * from nacimientos where SEMANAS BETWEEN 20 AND 25 ORDER BY SEMANAS;

select * from nacimientos where COMUNA IN (1101, 3201, 5605, 8108, 9204, 13120, 15202) ORDER BY COMUNA;

select * from nacimientos where HIJOS_TOTAL > 10;


########## TABLA CLIENTES_NEPTUNO #########
select * from clientes_neptuno where Pais = 'Argentina';

select * from clientes_neptuno where Pais <> 'Argentina' ORDER BY Pais;

select * from clientes_neptuno where Pais = 'ARGENTINA' OR Pais = 'VENEZUELA' OR Pais = 'BRASIL' ORDER BY Pais, Ciudad;

select * from clientes_neptuno where IDCLIENTE LIKE 'C%';

select * from clientes_neptuno WHERE CIUDAD LIKE 'B____';

