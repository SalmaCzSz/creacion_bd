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



# AGREGAR Y QUITAR PK ADD
    # ALTER TABLE <nombre tabla> ADD PRIMARY KEY (<nombre columna>);
    # ALTER TABLE <nombre tabla> DROP PRIMARY KEY;

    # CREATE TABLE <nombre tabla>(
        # <nombre columna> <tipo de dato> NOT NULL,
        # ...
        # PRIMARY KEY (<nombre columna>)
        #);

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