CREATE TABLE libros(
    codigo VARCHAR(5) PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    paginas INT NOT NULL
);

CREATE TABLE autores(
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    pais VARCHAR(30) NOT NULL
);

CREATE TABLE libro_autor(
    la_libro_codigo_fk VARCHAR(5) NOT NULL,
    la_autor_id_fk INT NOT NULL,
    anio_publicacion INT NOT NULL,

    PRIMARY KEY(la_libro_codigo_fk, la_autor_id_fk),

    FOREIGN KEY(la_libro_codigo_fk)
        REFERENCES libros(codigo),

    FOREIGN KEY(la_autor_id_fk)
        REFERENCES autores(id)
);

INSERT INTO libros(codigo, titulo, paginas)
VALUES
('L001','Java Basico',250),
('L002','Spring Boot',320),
('L003','SQL Avanzado',280),
('L004','Hibernate Practico',400);

INSERT INTO autores(id, nombre, pais)
VALUES
(1,'Carlos Perez','Ecuador'),
(2,'Ana Torres','Colombia'),
(3,'Luis Gomez','Peru');

INSERT INTO libro_autor
(la_libro_codigo_fk, la_autor_id_fk, anio_publicacion)
VALUES
('L001',1,2019),
('L002',1,2023),
('L002',2,2023),
('L003',3,2021),
('L004',2,2024);

SELECT l.titulo,
       a.nombre,
       a.pais,
       la.anio_publicacion
FROM libros l
INNER JOIN libro_autor la
    ON l.codigo = la.la_libro_codigo_fk
INNER JOIN autores a
    ON a.id = la.la_autor_id_fk;

SELECT l.titulo,
       la.anio_publicacion
FROM libros l
INNER JOIN libro_autor la
    ON l.codigo = la.la_libro_codigo_fk
WHERE la.anio_publicacion > 2020;

SELECT *
FROM autores
WHERE pais = 'Ecuador';

SELECT l.titulo,
       la.anio_publicacion
FROM libros l
INNER JOIN libro_autor la
    ON l.codigo = la.la_libro_codigo_fk
ORDER BY la.anio_publicacion DESC;

SELECT a.nombre,
       COUNT(la.la_libro_codigo_fk) AS cantidad_libros
FROM autores a
INNER JOIN libro_autor la
    ON a.id = la.la_autor_id_fk
GROUP BY a.nombre;