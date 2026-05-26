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