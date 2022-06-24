USE BINAES
GO
SELECT Ej.Nombre as 'libro',fo.formato,pc.palabra_clave,ed.nombre as 'editorial',co.nombre_coleccion,Ge.genero
FROM EJEMPLAR Ej
INNER JOIN IDIOMA id 
ON ej.id_idioma=id.id
INNER JOIN FORMATO fo 
ON fo.id=ej.id_formato
INNER JOIN PALABRAS_CLAVE pc
ON pc.id=Ej.id_palabra_clave
INNER JOIN EDITORIAL ed 
ON ed.id=Ej.id_editorial
INNER join COLECCION co 
ON co.id_ejemplar=Ej.id
INNER JOIN GENERO Ge 
on co.id_genero=Ge.id



