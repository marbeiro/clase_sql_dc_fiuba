--DROP TABLE IF EXISTS materias;

CREATE TABLE materias (
    codigo INTEGER NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    CONSTRAINT pk_materias PRIMARY KEY 
        (codigo)
);

INSERT INTO materias (codigo, nombre) VALUES
    (6109, 'Probabilidad y Estadística B') ,
    (6670, 'Estructura del Computador') ,
    (7114, 'Modelos y Optimización I') ,
    (7115, 'Modelos y Optimización II') ,
    (7501, 'Computación') ,
    (7506, 'Organización de Datos') ,
    (7515, 'Base de datos');

--DROP TABLE IF EXISTS alumnos;

CREATE TABLE alumnos (
    padron INTEGER NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    intercambio BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_ingreso DATE NOT NULL,
    CONSTRAINT pk_alumnos PRIMARY KEY (padron)
);

INSERT INTO alumnos (padron, nombre, apellido, intercambio, fecha_ingreso) VALUES
    (91000,'Daniel','Molina',false,'2016-03-01') ,
    (92000,'Paula','Pérez Alonso',false,'2017-08-02') ,
    (93000,'José Agustín','Molina',true,'2018-03-07') ,
    (94000,'Miguel','Mazzeo',false,'2018-03-07') ,
    (95000,'Clemente','Onelli',false,'2018-03-07') ,
    (96000,'Graciela','Lecube',true,'2018-08-01');

--DROP TABLE IF EXISTS notas;

CREATE TABLE notas(
    padron_alumno INTEGER NOT NULL,
    codigo_materia INTEGER NOT NULL,
    fecha DATE NOT NULL,
    nota INTEGER NOT NULL,
    CONSTRAINT pk_notas PRIMARY KEY
        (padron_alumno, codigo_materia, fecha),
    CONSTRAINT fk_nota_alumno FOREIGN KEY (padron_alumno) 
        REFERENCES alumnos (padron) 
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_nota_materia FOREIGN KEY 
        (codigo_materia) REFERENCES materias 
        (codigo)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

INSERT INTO notas (padron_alumno, codigo_materia, nota, fecha) VALUES
    (93000, 7114, 5, '2019-12-09'), 
    (93000, 7115, 9, '2021-07-07'), 
    (93000, 6109, 9, '2017-05-15'), 
    (93000, 7501, 5, '2018-07-14'), 
    (93000, 6670, 8, '2020-02-04'), 
    (93000, 7506, 10, '2018-07-18'), 
    (93000, 7515, 4, '2019-07-10'), 
    (92000, 7114, 6, '2019-07-08'), 
    (92000, 7115, 2, '2019-12-09'), 
    (92000, 7501, 4, '2018-12-16'),
    (92000, 7506, 4, '2018-07-25'), 
    (92000, 7515, 1, '2020-07-10'), 
    (92000, 7515, 6, '2020-07-17'), 
    (95000, 7114, 7, '2020-12-16'), 
    (95000, 7115, 2, '2021-07-07'), 
    (95000, 7501, 8, '2017-07-21'), 
    (95000, 6109, 7, '2018-07-11'), 
    (95000, 7506, 4, '2022-02-28'), 
    (95000, 7515, 2, '2019-07-24'), 
    (91000, 7114, 4, '2019-12-09'), 
    (91000, 7501, 4, '2017-12-16'), 
    (91000, 7506, 2, '2019-07-18'), 
    (91000, 7506, 6, '2019-07-25'), 
    (91000, 7515, 7, '2020-07-10'), 
    (96000, 6670, 7, '2019-12-18'),
    (96000, 7515, 2, '2020-07-17'), 
    (96000, 7515, 10, '2020-07-24'); 
