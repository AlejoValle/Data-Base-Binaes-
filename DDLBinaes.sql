CREATE DATABASE BINAES
GO
USE BINAES
GO
    CREATE TABLE PALABRAS_CLAVE (
        id                        CHAR      (10) PRIMARY KEY NOT NULL,
        palabra_clave             VARCHAR   (20)             NOT NULL
    );
GO
    CREATE TABLE FOTO(
        id                        CHAR      (10) PRIMARY KEY NOT NULL,
        foto                      VARBINARY (MAX)                    ,
        id_ejemplar               CHAR      (10)             NOT NULL
    );
GO
    CREATE TABLE EDITORIAL(
        id                        CHAR      (10) PRIMARY KEY NOT NULL,
        nombre                    VARCHAR   (20)             NOT NULL
    );
GO
    CREATE TABLE FORMATO(
        id                        CHAR      (10) PRIMARY KEY NOT NULL,
        formato                   VARCHAR   (20)             NOT NULL
    );
GO    
    CREATE TABLE IDIOMA(
        id                        CHAR      (10) PRIMARY KEY NOT NULL,
        idioma                    VARCHAR   (20)             NOT NULL
    );
GO
    CREATE TABLE EJEMPLAR(
        id                        CHAR      (10) PRIMARY KEY NOT NULL,
        Nombre                    VARCHAR   (20)             NOT NULL,
        fecha_publicacion         DATE                       NOT NULL,
        id_idioma                 CHAR      (10)             NOT NULL,
        id_formato                CHAR      (10)             NOT NULL,
        id_palabra_clave          CHAR      (10)             NOT NULL,
        id_foto                   CHAR      (10)                     ,
        id_editorial              CHAR      (10)             NOT NULL
    );
GO
    CREATE TABLE GENERO(
        id                        CHAR      (10) PRIMARY KEY NOT NULL,
        genero                    VARCHAR   (20)             NOT NULL,
        id_coleccion              CHAR      (10)             NOT NULL
    );
GO
    CREATE TABLE TIPO(
        id                        CHAR      (10) PRIMARY KEY NOT NULL,
        tipo                      VARCHAR   (20)             NOT NULL
    );
GO
    CREATE TABLE COLECCION(
        id                        CHAR      (10) PRIMARY KEY NOT NULL,
        nombre_coleccion          VARCHAR   (20)             NOT NULL,
        id_genero                 CHAR      (10)             NOT NULL,
        id_tipo                   CHAR      (10)             NOT NULL,
        id_ejemplar               CHAR      (10)             NOT NULL
    );
GO
    CREATE TABLE MATERIAL_BIBLIOGRAFICO(
        id                        CHAR      (10) PRIMARY KEY NOT NULL,
        id_coleccion              CHAR      (10)             NOT NULL
    );
GO
    CREATE TABLE AREA(
        id                        CHAR      (10) PRIMARY KEY NOT NULL,
        nombre                    VARCHAR   (20)             NOT NULL,
        descripcion               VARCHAR   (20)             NOT NULL,
        id_piso                   CHAR      (10)             NOT NULL,
        id_material_bibliografico CHAR      (10)             NOT NULL
    );
GO
    CREATE TABLE PISO(
        id                        CHAR      (10) PRIMARY KEY NOT NULL,
        piso                      INT                        NOT NULL
    );
GO
    CREATE TABLE GESTIONA_AM(
        id_administrador          CHAR      (10)             NOT NULL,
        id_material_bibliografico CHAR      (10)             NOT NULL
    );
GO
    CREATE TABLE PRESTAMO(
        id_material_bibliografico CHAR      (10)             NOT NULL,
        id_cliente                CHAR      (10)             NOT NULL,
        fecha_prestamo            DATE                       NOT NULL,
        fecha_devolucion          DATE                       NOT NULL
    );
GO
    CREATE TABLE UTILIZA(
        id_area                   CHAR      (10)             NOT NULL,
        id_cliente                CHAR      (10)             NOT NULL
    );
GO
    CREATE TABLE IMAGEN (
    id                            CHAR      (10) PRIMARY KEY NOT NULL,
    imagen                        VARBINARY (MAX)                    ,
    id_evento                     CHAR      (10)             NOT NULL
    );
GO
    CREATE TABLE RESERVA_LIBRO (
    id_material_bibliografico     CHAR      (10)             NOT NULL,
    id_cliente                    CHAR      (10)             NOT NULL,
    fecha_reserva                 DATE NOT NULL
    );
GO
    CREATE TABLE EVENTO (
    id                            CHAR      (10) PRIMARY KEY NOT NULL,
    Titulo                        VARCHAR   (20)             NOT NULL,
    Objetivos                     VARCHAR   (500)            NOT NULL,
    Cantidad_Asistentes           INT                        NOT NULL,
    id_Area                       CHAR      (10)             NOT NULL,
    id_Imagenes                   CHAR      (10)             NOT NULL 
    );
GO
    CREATE TABLE GESTIONA_EA (
    id_evento                     CHAR      (10)             NOT NULL,
    id_administrador              CHAR      (10)             NOT NULL,
    );
GO
    CREATE TABLE ADMINISTRADOR (
    id                            CHAR      (10) PRIMARY KEY NOT NULL,
    Nombre                        VARCHAR   (25)             NOT NULL,
    Contraseña                    VARCHAR   (20)             NOT NULL
    );
GO
    CREATE TABLE RESERVA_EVENTO (
    id_evento                     CHAR      (10)             NOT NULL,
    id_cliente                    CHAR      (10)             NOT NULL,
    check_in                      DATE                       NOT NULL,
    check_out                     DATE                       NOT NULL
    );
GO
    CREATE TABLE INSTITUCION (
    id                            CHAR      (10) PRIMARY KEY NOT NULL,
    Nombre                        VARCHAR   (25)             NOT NULL
    );
GO
    CREATE TABLE OCUPACION (
    id                            CHAR      (10) PRIMARY KEY NOT NULL,
    Nombre                        VARCHAR   (25)             NOT NULL
    );
GO
    CREATE TABLE GESTIONA_UA (
    id_cliente                    CHAR      (10)             NOT NULL,
    id_administrador              CHAR      (10)             NOT NULL
    );
GO
    CREATE TABLE CLIENTE (
    id                           CHAR       (10) PRIMARY KEY NOT NULL,
    nombre_usuario               VARCHAR    (25)             NOT NULL,
    Contraseña                   VARCHAR    (20)             NOT NULL,  
    Nombre                        VARCHAR   (25)             NOT NULL,
    Fotografia                    VARBINARY (MAX)                    ,
    Email                         VARCHAR   (30)             NOT NULL,
    Direccion                     VARCHAR   (100)            NOT NULL,
    Telefono                      CHAR      (13)             NOT NULL,
    id_Institucion                CHAR      (10)             NOT NULL,
    id_Ocupacion                  CHAR      (10)             NOT NULL
    );

--FKS
GO
ALTER TABLE EJEMPLAR               ADD FOREIGN KEY (id_idioma)                       REFERENCES IDIOMA (id);
ALTER TABLE EJEMPLAR               ADD FOREIGN KEY (id_formato)                      REFERENCES FORMATO (id);
ALTER TABLE EJEMPLAR               ADD FOREIGN KEY (id_foto)                         REFERENCES EJEMPLAR (id);
ALTER TABLE EJEMPLAR               ADD FOREIGN KEY (id_editorial)                    REFERENCES EDITORIAL (id);
GO
ALTER TABLE COLECCION              ADD FOREIGN KEY (id_tipo)                         REFERENCES TIPO (id);
ALTER TABLE COLECCION              ADD FOREIGN KEY (id_genero)                       REFERENCES GENERO (id);
ALTER TABLE COLECCION              ADD FOREIGN KEY (id_ejemplar)                     REFERENCES EJEMPLAR (id);
GO
ALTER TABLE MATERIAL_BIBLIOGRAFICO ADD FOREIGN KEY (id_coleccion)                    REFERENCES COLECCION (id);
GO
ALTER TABLE AREA                   ADD FOREIGN KEY (id_piso)                         REFERENCES PISO (id);
GO
ALTER TABLE COLECCION              ADD FOREIGN KEY (id_genero)                       REFERENCES GENERO (id);
GO
ALTER TABLE GESTIONA_AM            ADD CONSTRAINT pk_gestiona_AM                     PRIMARY KEY (id_administrador, id_material_bibliografico);
ALTER TABLE GESTIONA_AM            ADD FOREIGN KEY (id_administrador)                REFERENCES ADMINISTRADOR (id);
ALTER TABLE GESTIONA_AM            ADD FOREIGN KEY (id_material_bibliografico)       REFERENCES MATERIAL_BIBLIOGRAFICO (id);
GO
ALTER TABLE PRESTAMO               ADD CONSTRAINT pk_gestiona                        PRIMARY KEY (id_cliente, id_material_bibliografico);
ALTER TABLE PRESTAMO               ADD FOREIGN KEY (id_cliente)                      REFERENCES CLIENTE (id);
ALTER TABLE PRESTAMO               ADD FOREIGN KEY (id_material_bibliografico)       REFERENCES MATERIAL_BIBLIOGRAFICO (id);
GO
ALTER TABLE RESERVA_LIBRO          ADD CONSTRAINT pk_reseva_libro                    PRIMARY KEY (id_cliente, id_material_bibliografico);
ALTER TABLE RESERVA_LIBRO          ADD FOREIGN KEY (id_cliente)                      REFERENCES CLIENTE (id);
ALTER TABLE RESERVA_LIBRO          ADD FOREIGN KEY (id_material_bibliografico)       REFERENCES MATERIAL_BIBLIOGRAFICO (id);
GO
ALTER TABLE UTILIZA                ADD CONSTRAINT pk_utiliza_libro                   PRIMARY KEY (id_cliente, id_area);
ALTER TABLE UTILIZA                ADD FOREIGN KEY (id_cliente)                      REFERENCES CLIENTE (id);
ALTER TABLE UTILIZA                ADD FOREIGN KEY (id_area)                         REFERENCES MATERIAL_BIBLIOGRAFICO (id);
GO
ALTER TABLE GESTIONA_UA            ADD CONSTRAINT pk_gestiona_UA                     PRIMARY KEY (id_administrador, id_cliente);
ALTER TABLE GESTIONA_UA            ADD FOREIGN KEY (id_administrador)                REFERENCES ADMINISTRADOR (id);
ALTER TABLE GESTIONA_UA            ADD FOREIGN KEY (id_cliente)                      REFERENCES CLIENTE (id);
GO
ALTER TABLE CLIENTE                ADD FOREIGN KEY (id_Institucion)                  REFERENCES INSTITUCION (id);
ALTER TABLE CLIENTE                ADD FOREIGN KEY (id_Ocupacion)                    REFERENCES OCUPACION (id);
GO
ALTER TABLE RESERVA_EVENTO         ADD CONSTRAINT pk_reserva_evento                  PRIMARY KEY (id_evento, id_cliente);
ALTER TABLE RESERVA_EVENTO         ADD FOREIGN KEY (id_evento)                       REFERENCES EVENTO (id);
ALTER TABLE RESERVA_EVENTO         ADD FOREIGN KEY (id_cliente)                      REFERENCES CLIENTE (id);
GO
ALTER TABLE GESTIONA_EA            ADD CONSTRAINT pk_gestiona_EA                     PRIMARY KEY (id_administrador, id_evento);
ALTER TABLE GESTIONA_EA            ADD FOREIGN KEY (id_administrador)                REFERENCES ADMINISTRADOR (id);
ALTER TABLE GESTIONA_EA            ADD FOREIGN KEY (id_evento)                       REFERENCES EVENTO (id);
GO
ALTER TABLE EVENTO                 ADD FOREIGN KEY (id_area)                         REFERENCES AREA (id);
ALTER TABLE EVENTO                 ADD FOREIGN KEY (id_Imagenes)                     REFERENCES IMAGEN (id);
ALTER TABLE IMAGEN                 ADD FOREIGN KEY (id_evento)                       REFERENCES EVENTO (id);
GO
ALTER TABLE FOTO                   ADD FOREIGN KEY (id_ejemplar)                     REFERENCES EJEMPLAR (id);

