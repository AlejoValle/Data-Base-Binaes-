USE BINAES
GO
SELECT Ej.id, Ej.Nombre as 'libro',fo.formato,pc.palabra_clave,ed.nombre as 'editorial',et.etiqueta ,au.nombre as 'autor' ,col.nombre_coleccion,gen.genero,idi.idioma,Ej.fecha_publicacion
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
INNER JOIN IDIOMA idi on id.id=Ej.id_idioma




SELECT * FROM PRESTAMO
WHERE id_ejemplar= '022409LB'     

SELECT * FROM PRESTAMO
WHERE id_cliente= '0000147'    

SELECT cl.id,cl.Nombre,cl.nombre_usuario,cl.Contraseña,cl.Telefono,cl.Fotografia,cl.Direccion,cl.Email,ins.Nombre as 'institucion' ,oc.Nombre as 'ocupacion' FROM CLIENTE cl 
INNER JOIN INSTITUCION ins 
ON ins.id=cl.id_Institucion
INNER JOIN OCUPACION oc 
ON oc.id=cl.id_Ocupacion

select * from EJEMPLAR

DELETE FROM EJEMPLAR
WHERE id = '022100LB'

SELECT ev.id,ev.Titulo,ev.Objetivos,ev.Cantidad_Asistentes,a.nombre as 'Area',pi.piso FROM EVENTO ev 
INNER JOIN AREA a 
ON  A.id=ev.id_Area
INNER JOIN PISO pi 
ON pi.id=a.id_piso

select * from ADMINISTRADOR

SELECT * FROM AREA