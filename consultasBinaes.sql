USE BINAES
GO
SELECT Ej.Nombre as 'libro',fo.formato,pc.palabra_clave,ed.nombre as 'editorial',et.etiqueta ,au.nombre as 'autor' ,col.nombre_coleccion,gen.genero
FROM EJEMPLAR Ej
INNER JOIN IDIOMA id 
ON ej.id_idioma=id.id
INNER JOIN FORMATO fo 
ON fo.id=ej.id_formato
INNER JOIN PALABRAS_CLAVE pc
ON pc.id=Ej.id_palabra_clave
INNER JOIN EDITORIAL ed 
ON ed.id=Ej.id_editorial
INNER JOIN ETIQUETA et 
ON et.id=Ej.id_etiqueta
INNER JOIN AUTOR au
ON au.id=Ej.id_autor
INNER JOIN COLECCION col 
ON col.id=Ej.id_coleccion
INNER JOIN GENERO gen 
ON gen.id=col.id_genero


SELECT * FROM PRESTAMO
WHERE id_ejemplar= '022409LB'     

SELECT * FROM PRESTAMO
WHERE id_cliente= '0000147'    



