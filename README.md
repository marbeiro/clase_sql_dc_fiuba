# Clase de introducción a SQL - 18/08/2022 - Departamento de Computación (FIUBA)

En este repositorio se encuentran las indicaciones para cargar los dos conjuntos de datos utilizados en la clase. Para comenzar a trabajar con ellos es necesario entender (1) qué es un dump SQL y (2) cómo instalar el gestor PostgreSQL, que es el que utilizaremos en la clase.

## 1 - SQL dumps

Un *SQL dump* es un conjunto de líneas en lenguaje SQL que al ser ejecutadas de una sola pasada en el gestor de base de datos (en este caso, PostgreSQL) permiten crear una nueva base de datos, crear las tablas dentro de ella, y cargar los datos en las tablas. Los SQL dumps se usan para hacer copias de seguridad (backups) y recargas (restores) de la base de datos, además de migrarla de un servidor a otro.

El lenguaje SQL es estándar, lo cual quiere decir que cualquier gestor de bases de datos de tipo relacional utilizará el mismo lenguaje para interactuar con los datos, con lo que estos dos dumps podrían también ser cargados en cualquier otro gestor de bases de datos relacional (ej., SQL Server, Oracle, MySQL, ...) 

Sin embargo, a veces los gestores extienden el lenguaje con nuevas funcionalidades que pueden no ser reconocidas por otros gestores. Adicionalmente, es común que los gestores de bases de datos generen versiones comprimidas de los dumps con un formato propio. Estos dos motivos hacen que en general no sea inmediato migrar bases de datos de un gestor a otro. En nuestro caso, para evitar estos problemas y también por cuestiones didácticas, para el primer conjunto de datos que usaremos generamos un dump en formato 'plano' (es decir, se puede leer con cualquier editor de textos) y con instrucciones 100% estándar del lenguaje. Este dump debería funcionar tanto en PostgreSQL como en cualquier otro gestor de bases de datos relacional.

Para nuestro segundo conjunto de datos, en vez de ofrecer un SQL dump, tenemos un pequeño script en SQL que al ser ejecutado crea las tablas, y luego los datos se copian desde archivos CSV. El script y los CSVs se encuentran dentro de un único archivo comprimido .tar.gz.

## 2 - Instalación de PostgreSQL

PostgreSQL es un gestor de bases de datos relacionales open-source. Puede ser descargado a partir de las indicaciones en https://www.postgresql.org/download/ .

Una vez instalado, PostgreSQL es un servicio que se ejecuta en background en el sistema operativo, y escucha conexiones a partir de un puerto que por defecto es el `5432`. Al conectarnos nos pedirá un usuario:contraseña que por defecto es `postgres`:`postgres`.

*¿Cómo nos conectamos al servidor? Existen múltiples formas:*

- Utilizando el cliente de línea de comandos que viene con PostgreSQL, llamado `psql`. `psql` puede ser ejecutado con el parámetro -U que permite indicar el nombre de usuario, o bien desde el usuario `postgres` del sistema operativo, que es un usuario que se crea durante la instalación de PostgreSQL:

```
mariano@localhost:~/$ psql -U postgres
Contraseña para usuario postgres: ************
```

```
postgres@localhost:~/$ psql
Contraseña para usuario postgres: ************
```

- Utilizando un cliente con interfaz gráfica, como VS Code (con la extensión de PostgreSQL) o pgAdmin (que es el cliente gráfico oficial de PostgreSQL). Al conectarnos, el cliente nos pedirá la dirección del servidor (en este caso, `localhost`), el puerto (`5432`), usuario y contraseña.

- Conectándonos desde otro programa que utiliza una biblioteca específica. Por ejemplo, si desarrollamos en Python podemos utilizar `psycopg`, o desde Go la combinación de `lib/pq` con `database/sql`.

En cualquiera de estos casos, no sólo podremos conectarnos a una base de datos local, sino también a una en otro servidor, indicando la dirección IP del mismo.

Atención porque no siempre PostgreSQL permite por defecto cualquier tipo de conexión. Cuando lo instalamos en Ubuntu por ejemplo, es posible que nos permita conectarnos con el usuario `postgres` del sistema operativo, pero que no nos funcione con la opción -U. Esto es sólo una cuestión de configuración de las reglas de autenticación, que se pueden editar en `etc/postgresql/14/main/pg_hba.conf`.

## 3 - Datos

Ahora sí, detallamos los dos conjuntos de datos que vamos a utilizar:

- `base_fiuba.sql`: Contiene el SQL dump de la base de datos de ejemplo FIUBA, que es un pequeño conjunto ficticio de datos de alumnos, materias y notas de la carrera de Ingeniería Informática en FIUBA. Para cargar este SQL dump en la instalación local de PostgreSQL se debe ejecutar el siguiente comando con el usuario `postgres` del sistema operativo:

`psql clase_sql < base_fiuba.sql`

Como este dump es pequeño, también puede ser cargado en el sitio https://www.db-fiddle.com/, que permite hacer pruebas de consultas SQL sobre pequeños conjuntos de datos sin tener que instalar el gestor, y que soporta varios gestores. 

- `base_libros.tar.gz`: Contiene una base de datos con calificaciones de libros construída a partir de *USCD Book Graph* (https://sites.google.com/eng.ucsd.edu/ucsdbookgraph/home). Debido al tamaño de la base (~470MB), en vez de ofrecer un SQL dump, los datos de las tablas están en archivos CSV, y la carga a PostgreSQL se realiza mediante un script que crea las tablas y copia los datos de esos CSVs dentro de ellas. El archivo comprimido no se encuentra en este repositorio, sino que puede descargarse de: http://antiguos.fi.uba.ar/base_libros.tar.gz.


### Bibliografía

- Documentación de PostgreSQL: Se puede encontrar en https://www.postgresql.org/docs/current/index.html, y es muy completa como referencia del gestor y del lenguaje SQL. El capítulo sobre consultas (queries) en SQL es https://www.postgresql.org/docs/14/queries.html.

- Libros de texto:

  - [ELM16] R. Elmasri, S. Navathe, “Fundamentals of Database Systems”, 7ma Edición, Pearson, 2016. **Capítulos 6 y 7**.

  - [SILB19] A. Silberschatz, H. Korth, S. Sudarshan, “Database System Concepts”, 7ta Edición, McGraw-Hill, 2019. **Capítulos 3 y 4**.
