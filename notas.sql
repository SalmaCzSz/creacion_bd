# I M P O R T A N T E
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

    DESC GRUPO_1;
    ALTER TABLE GRUPO_1 ADD CONSTRAINT U_NOMBRE UNIQUE (NOMBRE);

    CREATE TABLE GRUPO_3 (
        ID INT NOT NULL,
        DIR_ID INT NOT NULL,
        PRIMARY KEY (ID),
        UNIQUE (DIR_ID)
    );

    ALTER TABLE GRUPO_1 DROP INDEX U_NOMBRE;



# CAMBIAR NOMBRE DE UNA COLUMNA
    # ALTER TABLE <nombre tabla> CHANGE <nombre actual columna> <nombre nuevo columna> <tipo de dato>;

    USE GRUPOS;
    DESC GRUPO_1;

    SELECT * FROM GRUPO_1;
    ALTER TABLE GRUPO_1 CHANGE NOMBRE APELLIDO VARCHAR(8);



# CAMBIAR EL DATA TYPE DE UNA COLUMNA
    # ALTER TABLE <nombre tabla> MODIFY <nombre columna> <tipo de dato>;

    USE GRUPOS;
    DESCRIBE GRUPO_2;

    ALTER TABLE GRUPO_2 MODIFY NOMBRE CHAR(12);    
    DESCRIBE GRUPO_2;





# L E N G U A J E  D E  M A N I P U L A C I Ó N  D E  D A T O S #

# INSERTAR DATOS
    CREATE DATABASE BODEGA;
    USE BODEGA;

    CREATE TABLE PRODUCTOS(
        ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        NOMBRE VARCHAR(28),
        PRECIO FLOAT, 
        PROVEEDOR VARCHAR(28)
    );

    DESC PRODUCTOS;
    SELECT * FROM PRODUCTOS;

    INSERT INTO PRODUCTOS (NOMBRE, PRECIO, PROVEEDOR) VALUES ('Café', 3.99, 'Lucky_Lucas_CA');
    SELECT * FROM PRODUCTOS;

    INSERT INTO PRODUCTOS (NOMBRE, PRECIO, PROVEEDOR) VALUES ('Harina de trigo', 1.75, 'El_horno_de_Atenas'),
                                                             ('Gaseosa', 1.50, 'Yorgelis_2007');
                                                                 
    INSERT INTO PRODUCTOS (NOMBRE, PRECIO, PROVEEDOR) VALUES ('Mantequilla', 2, 'Milanat'),
                                                             ('Galletas de vainilla', 2, 'Delicias_Xionamara'),
                                                             ('Encendedores', 0.9, 'Lucky_Lucas_CA'),
                                                             ('Leche', 0.9, 'Milanat'),
                                                             ('Gomitas', 0.9, 'Chuchu_ElDulce');



# ACTUALIZAR DATOS
    USE BODEGA;
    SELECT * FROM PRODUCTOS;

    UPDATE PRODUCTOS SET PROVEEDOR = 'Moltisanti_CA' WHERE ID = 1;
    SELECT * FROM PRODUCTOS;

    # ACTUALIZAR MÁS DE UNA COLUMNA A LA VEZ
    SET SQL_SAFE_UPDATES = 0; # ESTO CAMBIA LA CONFIGURACIÓN PARA UTILIZAR OTROS CAMBIOS COMO CONDICIÓN

    UPDATE PRODUCTOS SET PRECIO = 0.9, PROVEEDOR = 'Milanat' WHERE NOMBRE = 'Gaseosa';
    SELECT * FROM PRODUCTOS;

    # ACTUALIZAR DOS FILAS A LA VEZ
    UPDATE PRODUCTOS SET PROVEEDOR = 'Moltisanti_CA' WHERE PROVEEDOR = 'Lucky_Lucas_CA';
    SELECT * FROM PRODUCTOS;



# BORRAR DATOS
    USE BODEGA;
        
    CREATE TABLE PERSONAS(
        ID INT AUTO_INCREMENT PRIMARY KEY,
        NOMBRE VARCHAR(20),
        EDAD INT, 
        PAIS VARCHAR(20)
    );

    SELECT * FROM PERSONAS;

    INSERT INTO PERSONAS (NOMBRE, EDAD, PAIS) VALUES ('Sergio', 20, 'Cuba'),
                                                     ('Jenny', 24, 'Argentina'),
                                                     ('Rafael', 22, 'México'),
                                                     ('Furiyel', 23, 'Venezuela'),
                                                     ('Berengenio', 19, 'Colombia'),
                                                     ('Joana', 22, 'Mexico');

    # ELIMINAR UNA FILA
    DELETE FROM PERSONAS WHERE NOMBRE = 'Furiyel';
    SELECT * FROM PERSONAS;

    # ELIMIANR VARIAS FILAS
    DELETE FROM PERSONAS WHERE PAIS = 'México';
    SELECT * FROM PERSONAS;

    # ELIMINAR TODAS LAS FILAS
    DELETE FROM PERSONAS;
    SELECT * FROM PERSONAS;




# CONSTRAINTS
    USE BODEGA;

    CREATE TABLE EMPLEADOS(
        IN INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        APELLIDO VARCHAR(28),
        NOMBRE VARCHAR(28),
        EDAD INT NOT NULL,
        LOCAL_NOMBRE VARCHAR(28) DEFAULT 'Los procederes',
        CONSTRAINT CK_EDAD CHECK (EDAD >= 18)
    );

    DESC EMPLEADOS;

    INSERT INTO EMPLEADOS (APELLIDO, NOMBRE, EDAD) VALUES ('Tantamo', 'Ernesto', 23),
                                                          ('Pozo', 'Alejandra', 20);

    SELECT * FROM EMPLEADOS;

    INSERT INTO EMPLEADOS (APELLIDO, NOMBRE, EDAD) VALUES ('Borgia', 'Juan', 15);

    SELECT * FROM EMPLEADOS;

    ALTER TABLE EMPLEADOS ALTER EDAD SET DEFAULT 19;

    INSERT INTO EMPLEADOS (APELLIDO, NOMBRE) VALUES ('Borgia', 'Juan');

    SELECT * FROM EMPLEADOS;
                                                          
                                                          