# OBJETIVOS GENERALES: DISEÑAR LA BD DE UN CINE
# OBJETIVOS ESPECÍFICOS:
#   * ESQUEMA DE LA BD
#   * CREACIÓN DE LA TABLA PELICULAS
#   * CREACIÓN DE LA TABLA CLIENTES
#   * CREACIÓN DE LA TABLA SALAS
#   * CREACIÓN DE LA TABLA FUNCIONES
#   * CREACIÓN DE LA TABLA ASIENTOS
#   * CREACIÓN DE LA TABLA RESERVACIONES
#   * CREACIÓN DE LA TABLA ASIENTOS RESERVADOS
#   * INSERTAR LOS DATOS


    SHOW DATABASES;
    CREATE DATABASE SIS_RESERVACIONES;
    USE SIS_RESERVACIONES;

    CREATE TABLE PELICULAS(
        ID INT PRIMARY KEY AUTO_INCREMENT, 
        NOMBRE VARCHAR(45) NOT NULL UNIQUE, 
        DUR_MIN INT NOT NULL
    );
    SHOW TABLES;
    SELECT * FROM PELICULAS;
    DESC PELICULAS;

    CREATE TABLE CLIENTES(
        ID INT PRIMARY KEY AUTO_INCREMENT, 
        NOMBRE VARCHAR(45), 
        APELLIDO VARCHAR(45) NOT NULL,
        EMAIL VARCHAR(45) NOT NULL UNIQUE
    );

    SHOW TABLES;
    SELECT * FROM CLIENTES;
    DESC CLIENTES;

    CREATE TABLE SALAS(
        ID INT PRIMARY KEY AUTO_INCREMENT, 
        NOMBRE VARCHAR(45) NOT NULL, 
        N_ASIENTOS INT NOT NULL
    );

    SHOW TABLES;
    SELECT * FROM SALAS;
    DESC SALAS;

    CREATE TABLE FUNCIONES(
        ID INT PRIMARY KEY AUTO_INCREMENT, 
        ID_PELICULA INT NOT NULL, 
        ID_SALA INT NOT NULL, 
        HORA_INICIO DATETIME NOT NULL, 
        FOREIGN KEY (ID_PELICULA) REFERENCES PELICULAS(ID),
        FOREIGN KEY (ID_SALA) REFERENCES SALAS(ID)
    );

    SHOW TABLES;
    SELECT * FROM FUNCIONES;
    DESC FUNCIONES;

    CREATE TABLE ASIENTOS(
        ID INT PRIMARY KEY AUTO_INCREMENT, 
        FILA CHAR(1) NOT NULL,
        NUMERO INT NOT NULL,
        ID_SALA INT NOT NULL,
        FOREIGN KEY (ID_SALA) REFERENCES SALAS(ID)
    );

    SHOW TABLES;
    SELECT * FROM ASIENTOS;
    DESC ASIENTOS;

    CREATE TABLE RESERVACIONES(
        ID INT PRIMARY KEY AUTO_INCREMENT, 
        ID_FUNCION INT NOT NULL,
        ID_CLIENTE INT NOT NULL,
        FOREIGN KEY (ID_FUNCION) REFERENCES FUNCIONES(ID),
        FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID)
    );

    SHOW TABLES;
    SELECT * FROM RESERVACIONES;
    DESC RESERVACIONES;

    CREATE TABLE ASIENTOS_RESERVADOS(
        ID INT PRIMARY KEY AUTO_INCREMENT, 
        ID_RESERVACION INT NOT NULL,
        ID_ASIENTO INT NOT NULL,
        FOREIGN KEY (ID_RESERVACION) REFERENCES RESERVACIONES(ID),
        FOREIGN KEY (ID_ASIENTO) REFERENCES ASIENTOS(ID)
    );

    SHOW TABLES;
    SELECT * FROM ASIENTOS_RESERVADOS;
    DESC ASIENTOS_RESERVADOS;



    INSERT INTO PELICULAS (NOMBRE, DUR_MIN) VALUES ('Blade Runner 2049', 153),
                                                   ('Dunkirk', 106),
                                                   ('Geostorm', 121),
                                                   ('Thor: Ragnarok', 107),
                                                   ('Jigsaw', 116),
                                                   ('The Death of Stalin', 98),
                                                   ('The Lego Ninjago Movie', 101),
                                                   ('Murder on the Orient Express', 135),
                                                   ('Paddington 2', 88),
                                                   ('Breathe', 117),
                                                   ('Blade Runner', 127),
                                                   ('Victoria and Abdul', 112);
                                
    SELECT * FROM PELICULAS;

    INSERT INTO CLIENTES (NOMBRE, APELLIDO, EMAIL) VALUES ('David', 'May', 'dmay@gmail.com'),
                                                          ('Theresa', 'Davis', 'tdavis@gmail.com'),
                                                          ('Jerry', 'Martín', 'jermar@gmail.com'),
                                                          ('John', 'Smith', 'smithy@gmail.com'),
                                                          ('Martín', 'Watkins', 'mwatto@gmail.com'),
                                                          ('Emma', 'Watson', 'itswingardiumleviosa@gmail.com'),
                                                          ('Javier', 'Pastore', 'jp@gmail.com'),
                                                          ('Charlotte', 'Hare', 'chare@gmail.com'),
                                                          ('Mark', 'Smith', 'markysmith@gmail.com');

    SELECT * FROM CLIENTES;

    INSERT INTO SALAS (NOMBRE, N_ASIENTOS) VALUES ('Iñarritu', 72),
                                                  ('Cuaron', 36),
                                                  ('Del Toro', 36);

    SELECT * FROM SALAS;

    INSERT INTO FUNCIONES (ID_PELICULA, ID_SALA, HORA_INICIO) VALUES (5, 3, '2017-10-31 16:00:00'),
                                                                     (5, 3, '2017-10-31 13:00:00'),
                                                                     (5, 3, '2017-10-31 19:00:00'),
                                                                     (1, 2, '2017-10-30 16:00:00'),
                                                                     (1, 2, '2017-10-30 13:00:00'),
                                                                     (1, 2, '2017-10-30 19:00:00'),
                                                                     (3, 1, '2017-10-30 16:00:00'),
                                                                     (3, 1, '2017-10-30 13:00:00'),
                                                                     (3, 1, '2017-10-30 19:00:00');

    SELECT * FROM FUNCIONES;

    INSERT INTO ASIENTOS (FILA, NUMERO, ID_SALA) VALUES ('A', 1, 1),
                                                        ('A', 2, 1),
                                                        ('A', 3, 1),
                                                        ('A', 4, 1),
                                                        ('B', 1, 1),
                                                        ('B', 2, 1),
                                                        ('B', 3, 1),
                                                        ('B', 4, 1),
                                                        ('C', 1, 1),
                                                        ('C', 2, 1),
                                                        ('C', 3, 1),
                                                        ('C', 4, 1);

    SELECT * FROM ASIENTOS;

    INSERT INTO RESERVACIONES (ID_FUNCION, ID_CLIENTE) VALUES (2, 2),
                                                              (1, 4),
                                                              (2, 6),
                                                              (4, 8),
                                                              (3, 1);

    SELECT * FROM RESERVACIONES;