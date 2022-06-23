
select Ej.Nombre as 'libro',fo.formato,pc.palabra_clave,ed.nombre as 'editorial',co.nombre_coleccion
from EJEMPLAR Ej
INNER JOIN IDIOMA id 
on ej.id_idioma=id.id
INNER JOIN FORMATO fo 
on fo.id=ej.id_formato
INNER JOIN PALABRAS_CLAVE pc
ON pc.id=Ej.id_palabra_clave
INNER JOIN EDITORIAL ed 
ON ed.id=Ej.id_editorial
INNER join COLECCION co 
on co.id_ejemplar=Ej.id

DROP DATABASE BINAES

