# I M P O R T A N T 
# PARA ESTA PRÁCTICA SE UTILIZA MySQL Workbench



# L E N G U A J E  D E  D E F I N I C I Ó N  D E  D A T O S #

# AGREGAR Y QUITAR COLUMNAS
    # ALTER TABLE <nombre tabla> ADD COLUMN <nombre columna> <tipo de dato> (tamaño);
    # ALTER TABLE <nombre tabla> DROP COLUMN <nombre columna>;

    USE SAKILA;

    # CREAMOS UNA TABLA A PARTIR DE INFORMACIÓN YA ALMACENADA
    CREATE TABLE KOI SELECT CITY_ID, PHONE, DISTRICT, LOCATION FROM ADDRESS;
    SELECT * FROM KOI;

    # ELIMINAMOS UNA COLUMNA
    ALTER TABLE KOI DROP COLUMN DISTRICT;
    SELECT * FROM KOI;

    # AGREGAMOS UNA COLUMNA NUEVA
    ALTER TABLE KOI ADD COLUMN NUEVO_DISTRITO VARCHAR(20);



# ELIMINAR UNA TABLA
    # DROP TABLE <nombre tabla>

    USE SAKILA;

    SHOW TABLES;

    DROP TABLE KOI;

    SHOW TABLES;



# TRUNCAR UNA TABLA
    # TRUNCATE TABLE <nombre tabla>

    USE SAKILA;

    SELECT * FROM KOI;

    TRUNCATE TABLE KOI;

    SELECT * FROM KOI;



# AGREGAR Y QUITAR PK
    # ALTER TABLE <nombre tabla> ADD PRIMARY KEY (<nombre columna>);
    # ALTER TABLE <nombre tabla> DROP PRIMARY KEY;

    # CREATE TABLE <nombre tabla>(
        # <nombre columna> <tipo de dato> NOT NULL,
        # ...
        # PRIMARY KEY (<nombre columna>)
    # );

    CREATE DATABASE GRUPOS;
    USE GRUPOS;

    CREATE TABLE ZONAS(
        ID INT NOT NULL,
        DIR_COD INT NOT NULL,
        DIR VARCHAR(20),
        NOMBRE VARCHAR(20)
    );
    DESC ZONAS;

    ALTER TABLE ZONAS ADD PRIMARY KEY (ID);
    DESC ZONAS;

    CREATE TABLE GRUPO_1(
        ID INT NOT NULL,
        NOMBRE VARCHAR(20)
        DIR_COD INT NOT NULL,
        PRIMARY KEY (ID)
    );
    DESC GRUPO_1;
    
    ALTER TABLE ZONAS DROP PRIMARY KEY;
    DESC ZONAS;



# AGREGAR Y QUITAR FK
    # ALTER TABLE <nombre tabla hija> ADD CONSTRAINT <nombre restriccion> FOREIGN KEY (<nombre columna>) REFERENCES <nombre tabla madre>;
    # ALTER TABLE <nombre tabla hija> DROP FOREIGN KEY;

    # CREATE TABLE <nombre tabla hija>(
        # <nombre columna> <tipo de dato> NOT NULL,
        # ...
        # PRIMARY KEY (<nombre columna>),
        # FOREIGN KEY (<nombre columna>) REFERENCES <nombre tabla madre>;
    # );

    DESCRIBE ZONAS;
    DESC GRUPO_1;

    ALTER TABLE GRUPO_1 ADD CONSTRAINT FK_ZONASID FOREIGN KEY (DIR_COD) REFERENCES ZONAS(ID);
    DESC GRUPO_1;

    CREATE TABLE GRUPO_1(
        ID INT NOT NULL,
        NOMBRE VARCHAR(20)
        DIR_COD INT NOT NULL,
        PRIMARY KEY (ID),
        FOREIGN KEY (DIR_COD) REFERENCES ZONAS(ID)
    );
    DESC GRUPO_2;

    ALTER TABLE GRUPO_1 DROP FOREIGN KEY FK_ZONASID;



# AGREGAR Y QUITAR UNIQUE CONSTRAINT (restricciones para valores unicos en las columnas)
    # ALTER TABLE <nombre tabla> ADD CONSTRAINT <nombre restriccion> UNIQUE (<nombre columna>);
    # ALTER TABLE <nombre tabla> DROP INDEX <nombre columna>;

    DESC GRUPO1_1;
    ALTER TABLE GRUPO_1 ADD CONSTRAINT U_NOMBRE UNIQUE (NOMBRE);

    CREATE TABLE GRUPO_3 (
        ID INT NOT NULL,
        DIR_ID INT NOT NULL,
        PRIMARY KEY (ID),
        UNIQUE (DIR_ID)
    );

    ALTER TABLE GRUPO_1 DROP INDEX U_NOMBRE;