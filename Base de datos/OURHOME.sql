DROP DATABASE IF EXISTS ourhome;
CREATE DATABASE ourhome;
USE ourhome;

CREATE TABLE usuarios(
    id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) DEFAULT NULL,
    edad INT NOT NULL,
    telefono INT NULL,
    correo VARCHAR(100) NOT NULL,
    contraseña VARCHAR(100) NOT NULL,
    rol ENUM('tengo_casa', 'busco_casa', 'admin') NOT NULL,
    respuestas_test_defecto MEDIUMTEXT NOT NULL,
    mostrar_telefono bit DEFAULT NULL,
    fecha_creacion DATE NOT NULL,
    fecha_actualizacion DATE NOT NULL
);

INSERT INTO usuarios (nombre, apellidos, edad, telefono, correo, contraseña, rol, respuestas_test_defecto, mostrar_telefono, fecha_creacion, fecha_actualizacion) VALUES 
('Daniel', 'Rodrigues', 15, 699873544, 'danielrodrigues@gmail.com', '$2a$10$XURPShQNCsLjp1ESc2laoObo9QZDhxz73hJPaEv7/cBha4pk0AgP.', '2', 'as', 1, CURRENT_DATE(), CURRENT_DATE()),
('Marco', 'Polo', 20, 633254182, 'marcololo@hotmail.com', 'marco00', '1', 'sa', 0, CURRENT_DATE(), CURRENT_DATE()),
('Anna', 'mota', 25, 124512325, 'annamota@gmail.com', 'anna00', '2', 'as', 1, CURRENT_DATE(), CURRENT_DATE()),
('Maria', 'Aguilea', 34, 489562558, 'mariaguilera@yahoo.com', 'maria00', '1', 'sa', 1, CURRENT_DATE(), CURRENT_DATE()),
('Sergi', 'Lopez', 23, 152248621, 'sergilopez@hotmail.com', 'sergi00', '2', 'as', 1, CURRENT_DATE(), CURRENT_DATE()),
('Jose', 'Pablo', 24, 162584759, 'josepablo@hotmail.com', 'jose00', '1', 'sa', 0, CURRENT_DATE(), CURRENT_DATE()),
('Max', 'Ten', 29, 157448526, 'maxten@gmail.com', 'max00', '2', 'as', 0, CURRENT_DATE(), CURRENT_DATE()),
('Laura', 'Mandez', 30, 524886695, 'lauramendez@yahoo.com', 'laura00', '1', 'sa', 1, CURRENT_DATE(), CURRENT_DATE()),
('Amapola', 'Guarana', 18, 188526785, 'amapolaguarana@hotmail.com', 'amapola00', '2', 'sa', 0, CURRENT_DATE(), CURRENT_DATE()),
('Paco', 'Marquez', 19, 632251856, 'pacomarquez@gmail.com', 'paco00', '2', 'sa', 0, CURRENT_DATE(), CURRENT_DATE());

CREATE TABLE casas(
	id_casa INT AUTO_INCREMENT PRIMARY KEY,
	id_usuario INT NOT NULL,
    url_fotos MEDIUMTEXT DEFAULT NULL,
    descripcion MEDIUMTEXT DEFAULT NULL,
    precio DOUBLE NOT NULL,
    numero_habitaciones INT NOT NULL,
    numero_baños INT NOT NULL,
    direccion VARCHAR(100) DEFAULT NULL,
    metros DECIMAL DEFAULT NULL,
    plantas INT NOT NULL,
	extras MEDIUMTEXT DEFAULT NULL,
	fecha_creacion DATE NOT NULL,
	fecha_actualizacion DATE DEFAULT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO casas (id_usuario, url_fotos, descripcion, precio, numero_habitaciones, numero_baños, direccion, metros, plantas, fecha_creacion, fecha_actualizacion) VALUES
(10, 'https://imgur.com/a/9kTvflF', 'Lorem Ipsum es simplemente texto de relleno de la industria de la impresión y la composición tipográfica.', 350, 2, 1, 'C/ Tarragona', 120, 1, CURRENT_DATE(), CURRENT_DATE()),
(8, 'https://imgur.com/a/9kTvflF', 'Lorem Ipsum es simplemente texto de relleno de la industria de la impresión y la composición tipográfica.', 500, 4, 2, 'C/ San Pere', 220, 3, CURRENT_DATE(), CURRENT_DATE()),
(5, 'https://imgur.com/a/9kTvflF', 'Lorem Ipsum es simplemente texto de relleno de la industria de la impresión y la composición tipográfica.', 400, 3, 1, 'C/ Alcalá', 155, 1, CURRENT_DATE(), CURRENT_DATE()),
(3, 'https://imgur.com/a/9kTvflF', 'Lorem Ipsum es simplemente texto de relleno de la industria de la impresión y la composición tipográfica.', 350, 3, 1, 'C/ Larios', 90, 1, CURRENT_DATE(), CURRENT_DATE()),
(6, 'https://imgur.com/a/9kTvflF', 'Lorem Ipsum es simplemente texto de relleno de la industria de la impresión y la composición tipográfica.', 390, 4, 1, 'C/ de lo Ciegos', 120, 2, CURRENT_DATE(), CURRENT_DATE()),
(4, 'https://imgur.com/a/9kTvflF', 'Lorem Ipsum es simplemente texto de relleno de la industria de la impresión y la composición tipográfica.', 480, 6, 2, 'C/ Betis', 170, 3, CURRENT_DATE(), CURRENT_DATE()),
(7, 'https://imgur.com/a/9kTvflF','Lorem Ipsum es simplemente texto de relleno de la industria de la impresión y la composición tipográfica.', 300, 4, 1, 'C/ Alfonso', 100, 1, CURRENT_DATE(), CURRENT_DATE()),
(1, 'https://imgur.com/a/9kTvflF', 'Lorem Ipsum es simplemente texto de relleno de la industria de la impresión y la composición tipográfica.', 200, 2, 1, 'C/ del Ángel', 100, 1, CURRENT_DATE(), CURRENT_DATE()),
(9, 'https://imgur.com/a/9kTvflF', 'Lorem Ipsum es simplemente texto de relleno de la industria de la impresión y la composición tipográfica.', 525, 6, 3, 'Avenida Constitución ', 200, 2, CURRENT_DATE(), CURRENT_DATE()),
(2, 'https://imgur.com/a/9kTvflF', 'Lorem Ipsum es simplemente texto de relleno de la industria de la impresión y la composición tipográfica.', 445, 2, 2, 'C/ de la Compañia', 150, 2, CURRENT_DATE(), CURRENT_DATE());

CREATE TABLE procesos(
	id_proceso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuario_1 INT NOT NULL,
    id_usuario_2 INT NOT NULL,
    estado ENUM('En Contacto', 'Cancelado', 'Finalizado') NOT NULL,
	fecha_creacion DATE DEFAULT NULL,
	fecha_actualizacion DATE DEFAULT NULL,
    FOREIGN KEY (id_usuario_1) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_usuario_2) REFERENCES usuarios(id_usuario)
);

INSERT INTO procesos (id_usuario_1, id_usuario_2, estado, fecha_creacion, fecha_actualizacion) VALUES
(3, 1, 1, CURRENT_DATE(), CURRENT_DATE()),
(9, 7, 2, CURRENT_DATE(), CURRENT_DATE()),
(8, 8, 1, CURRENT_DATE(), CURRENT_DATE()),
(7, 2, 3, CURRENT_DATE(), CURRENT_DATE()),
(2, 6, 2, CURRENT_DATE(), CURRENT_DATE()),
(10, 5, 1, CURRENT_DATE(), CURRENT_DATE()),
(6, 9, 2, CURRENT_DATE(), CURRENT_DATE()),
(5, 4, 3, CURRENT_DATE(), CURRENT_DATE()),
(4, 3, 3, CURRENT_DATE(), CURRENT_DATE()),
(1, 10, 1, CURRENT_DATE(), CURRENT_DATE());

CREATE TABLE test_personalizados(
	id_test_personalizados INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuario_creador INT NOT NULL,
    respuestas_correctas MEDIUMTEXT NOT NULL,
    minimas_respuestas_correctas INT NOT NULL,
	fecha_creacion DATE DEFAULT NULL,
    FOREIGN KEY (id_usuario_creador) REFERENCES usuarios(id_usuario)
);

INSERT INTO test_personalizados (id_usuario_creador, respuestas_correctas, minimas_respuestas_correctas, fecha_creacion) VALUES
(3, 'a', 1, CURRENT_DATE()),
(3, 'a', 5, CURRENT_DATE()),
(3, 'a', 6, CURRENT_DATE()),
(3, 'a', 4, CURRENT_DATE()),
(3, 'a', 7, CURRENT_DATE()),
(3, 'a', 2, CURRENT_DATE()),
(3, 'a', 10, CURRENT_DATE()),
(3, 'a', 8, CURRENT_DATE()),
(3, 'a', 3, CURRENT_DATE()),
(3, 'a', 9, CURRENT_DATE());

CREATE TABLE respuestas_tests_personalizados(
	id_respuestas_test_personalizado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_test_personalizado INT NOT NULL,
    respuestas MEDIUMTEXT NOT NULL,
    compatibilidad DECIMAL NOT NULL,
	fecha_creacion DATE DEFAULT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_test_personalizado) REFERENCES test_personalizados(id_test_personalizados)
);

INSERT INTO respuestas_tests_personalizados (id_usuario, id_test_personalizado, respuestas, compatibilidad, fecha_creacion) VALUES 
(1, 10, 'a', 90, CURRENT_DATE()),
(2, 9, 'a', 30, CURRENT_DATE()),
(3, 8, 'a', 60, CURRENT_DATE()),
(4, 7, 'a', 70, CURRENT_DATE()),
(5, 6, 'a', 85, CURRENT_DATE()),
(6, 5, 'a', 44, CURRENT_DATE()),
(7, 4, 'a', 23, CURRENT_DATE()),
(8, 3, 'a', 95, CURRENT_DATE()),
(9, 2, 'a', 34, CURRENT_DATE()),
(10, 1, 'a', 77, CURRENT_DATE());

