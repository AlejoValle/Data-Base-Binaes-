USE BINAES
GO 
insert into IDIOMA (id, idioma) values (1, 'Español');
insert into IDIOMA (id, idioma) values (2, 'Ingles');
GO
insert into FORMATO (id, formato) values (1, 'Digital');
insert into FORMATO (id, formato) values (2, 'Fisico');
GO
insert into PALABRAS_CLAVE (id,palabra_clave,id_ejemplar) VALUES (1,'interesante',1);
GO
insert into EDITORIAL (id, nombre) values (1, 'Santillana');
GO
insert into EJEMPLAR (id,Nombre,fecha_publicacion,id_idioma,id_formato,id_palabra_clave,id_editorial) 
values (1,'Camasutra',CONVERT (DATE, '08/12/2001',103),2,1,1,1);
GO
insert into TIPO (id,tipo) values (1,'libro');
GO
insert into GENERO (id,genero,id_coleccion) values (1,'sexual',1);
GO
insert into COLECCION (id,nombre_coleccion,id_tipo,id_genero,id_ejemplar) values (1,'donaciones +18',1,1,1);
GO
insert into MATERIAL_BIBLIOGRAFICO (id,id_coleccion) values (1,1);
GO
insert into PISO (id,piso) values (1,1);
GO
insert into AREA (id,nombre,descripcion,id_piso,id_material_bibliografico) values (1,'biblioteca','descripcion',1,1);


