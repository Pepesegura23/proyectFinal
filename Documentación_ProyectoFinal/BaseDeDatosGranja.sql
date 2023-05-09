DROP TABLE IF EXISTS venta CASCADE;
DROP TABLE IF EXISTS linea_venta CASCADE;
DROP TABLE IF EXISTS cliente CASCADE;
DROP TABLE IF EXISTS producto CASCADE;
DROP TABLE IF EXISTS categoria CASCADE;
DROP TABLE IF EXISTS tipo_animal CASCADE;
DROP TABLE IF EXISTS animal CASCADE;
DROP TABLE IF EXISTS empleado CASCADE;
DROP TABLE IF EXISTS tipo_cuidado CASCADE;


CREATE TABLE venta(
	cod_venta		serial,
	fecha_pedido	date ,
	fecha_entrega	date,
	estado_venta	varchar,
	cod_cliente     integer,
CONSTRAINT pk_venta	PRIMARY KEY(cod_venta),
CONSTRAINT ck_fecha_pedido CHECK (fecha_pedido < fecha_entrega)							   
) ;
CREATE TABLE linea_venta (
	cod_linea			integer,
	cod_venta			integer,
	num_producto		integer,
CONSTRAINT pk_linea_venta PRIMARY KEY(cod_linea)
);
CREATE TABLE cliente(
	cod_cliente		integer ,
	dni				varchar(12) UNIQUE ,
	nombre			text NOT NULL,
	direccion		text NOT NULL,
	email			text,
CONSTRAINT pk_cliente PRIMARY KEY(cod_cliente)
);
CREATE TABLE producto(
	num_producto		integer,
	nombre				text NOT NULL,
	descripcion			varchar,
	pvp					varchar NOT NULL,
	cantidad_disponible	 integer,
	lista					text ,
	categoria				varchar,
CONSTRAINT pk_producto PRIMARY KEY (num_producto),
CONSTRAINT ck_cantidad_disponible CHECK(cantidad_disponible>=0),
CONSTRAINT uk_categoria UNIQUE(nombre)
);
CREATE TABLE  categoria(
	nombre			varchar,
CONSTRAINT pk_categoria PRIMARY KEY(nombre)
);
CREATE TABLE tipo_animal(
	tipo			varchar,
	zona			varchar(10),
	produce			varchar ,
CONSTRAINT pk_tipo_animal PRIMARY KEY(tipo)
);
CREATE TABLE animal(
	id_animal	integer,
	tipo		varchar,
	raza		varchar ,
	familia		varchar NOT NULL,
	color		varchar NOT NULL,
	encargado	varchar NOT NULL,
CONSTRAINT pk_animal PRIMARY KEY(id_animal)
);
CREATE TABLE empleado(
	cod_empleado	serial,
	nombre			varchar NOT NULL,
	apellido		varchar NOT NULL,
	dni				varchar(12) UNIQUE ,
	direccion		text NOT NULL,
CONSTRAINT pk_empleado PRIMARY KEY(cod_empleado,nombre),
CONSTRAINT uk_empleado UNIQUE(nombre)
		);
CREATE TABLE tipo_cuidado(
	tipo			varchar ,
	observaciones	varchar(200),
CONSTRAINT pk_tipo_cuidado PRIMARY KEY(tipo)
	);
ALTER TABLE venta ADD CONSTRAINT fk_venta_cliente FOREIGN KEY(cod_cliente) REFERENCES cliente;
ALTER TABLE linea_venta 
	ADD CONSTRAINT fk_linea_venta_venta FOREIGN KEY(cod_venta) REFERENCES venta,
	ADD CONSTRAINT fk_linea_venta_producto FOREIGN KEY(num_producto) REFERENCES producto ;
ALTER TABLE producto 
		ADD CONSTRAINT fk_producto_categoria  FOREIGN KEY(categoria) REFERENCES categoria(nombre);
ALTER TABLE  tipo_animal 
		ADD CONSTRAINT fk_tipo_animal_producto FOREIGN KEY(produce) REFERENCES producto(nombre);
ALTER TABLE animal 
ADD CONSTRAINT fk_animal_tipo_animal FOREIGN KEY (tipo) REFERENCES tipo_animal(tipo),
ADD CONSTRAINT fk_animal_empleado FOREIGN KEY(encargado) REFERENCES empleado(nombre);

INSERT INTO categoria (nombre) VALUES 
			('lacteos'),
			('huevos'),
			('Verduras'),
			('carnes'),
			('lana');

INSERT INTO producto (num_producto, nombre, descripcion, pvp, cantidad_disponible, lista, categoria) VALUES
(1, 'Leche fresca de vaca', 'Leche fresca de vaca pasteurizada', '2.50', 200, 'Leche, vaca, fresca', 'lacteos'),
(2, 'Queso de cabra', 'Queso elaborado con leche de cabra', '5.00', 150, 'Queso, cabra', 'lacteos'),
(3, 'Carne de cerdo', 'Carne de cerdo fresca cortada en filetes', '8.00', 100, 'Carne, cerdo, fresca', 'carnes'),
(6, 'Leche fresca de oveja', 'Leche fresca de oveja pasteurizada', '3.00', 100, 'Leche, oveja, fresca', 'lacteos'),
(7, 'Queso de vaca', 'Queso elaborado con leche de vaca', '4.50', 200, 'Queso, vaca', 'lacteos'),
(8, 'Carne de vaca', 'Carne de vaca fresca cortada en filetes', '10.00', 80, 'Carne, vaca, fresca', 'carnes'),
(9, 'Huevos de codorniz', 'Huevos de codorniz frescos', '3.00', 150, 'Huevos, codorniz, frescos', 'huevos'),
(10, 'Lana de alpaca', 'Lana de alpaca recién esquilada', '15.00', 20, 'Lana, alpaca', 'lana'),
(11, 'Leche fresca de cabra', 'Leche fresca de cabra pasteurizada', '3.50', 120, 'Leche, cabra, fresca', 'lacteos'),
(12, 'Queso de oveja', 'Queso elaborado con leche de oveja', '6.00', 100, 'Queso, oveja', 'lacteos'),
(13, 'Carne de cordero', 'Carne de cordero fresca cortada en filetes', '12.00', 60, 'Carne, cordero, fresca', 'carnes'),
(14, 'Huevos de pato', 'Huevos de pato frescos', '4.00', 80, 'Huevos, pato, frescos', 'huevos'),
(15, 'Lana de llama', 'Lana de llama recién esquilada', '20.00', 30, 'Lana, llama', 'lana'),
(19, 'Lomo embuchado', 'Carne de cerdo adobada y curada', '9.99', 40, 'Carnes', 'carnes'),
(20, 'Chorizo ibérico', 'Embutido de cerdo ibérico con especias', '14.99', 60, 'Embutidos', 'carnes'),
(21, 'Salchichón', 'Embutido de cerdo con especias', '7.99', 80, 'Embutidos', 'carnes'),
(22, 'Huevos de corral', 'Huevos de gallinas criadas en libertad', '3.99', 120, 'Huevos', 'huevos'),
(23, 'Huevos camperos', 'Huevos de gallinas criadas en el campo', '4.99', 100, 'Huevos', 'huevos'),
(24, 'Lana de oveja', 'Lana de oveja esquilada a mano', '24.99', 20, 'Lana', 'lana'),
(26, 'Leche de vaca', 'Leche fresca de vaca', '2.99', 250, 'Leche', 'lacteos'),
(27, 'Lechuga', 'Lechuga fresca de la huerta', '1.49', 80, 'Verduras', 'Verduras'),
(28, 'Tomate', 'Tomate de la huerta maduro y fresco', '1.99', 100, 'Verduras', 'Verduras'),
(29, 'Cebolla', 'Cebolla fresca de la huerta', '0.99', 120, 'Verduras', 'Verduras'),
(30, 'Patatas', 'Patatas de la huerta recién recolectadas', '1.29', 150, 'Verduras', 'Verduras'),
(31, 'Pollo entero', 'Pollo de corral entero', '8.99', 30, 'Carnes', 'carnes'),
(32, 'Muslos de pollo', 'Muslos de pollo de corral', '5.99', 50, 'Carnes', 'carnes'),
(33, 'Pechugas de pollo', 'Pechugas de pollo de corral', '6.99', 60, 'Carnes', 'carnes'),
(34, 'Queso fresco de cabra', 'Queso fresco elaborado con leche de cabra de nuestra granja.', '4.50', 15, 'quesos', 'lacteos'),
(35, 'Yogur natural de oveja', 'Yogur natural elaborado con leche de oveja de nuestra granja.', '1.50', 20, 'yogures', 'lacteos'),
(37, 'Lomo de cerdo', 'Lomo de cerdo fresco y de calidad, criado en nuestra granja.', '10.00', 8, 'carnes', 'carnes'),
(38, 'Huevos de gallina', 'Huevos de gallina frescos y de calidad, criados en nuestra granja.', '0.50', 50, 'huevos', 'huevos'),
(39, 'Tocino de cerdo', 'Tocino de cerdo fresco y de calidad, criado en nuestra granja.', '6.00', 7, 'carnes', 'carnes'),
(40, 'Lana natural de oveja', 'Lana natural de oveja de nuestra granja, ideal para tejer y hacer manualidades.', '15.00', 5, 'lana', 'lana'),
(41, 'Queso de cabra curado', 'Queso de cabra curado elaborado con leche de cabra de nuestra granja.', '7.50', 12, 'quesos', 'lacteos'),
(42, 'Yogur de frutas variadas', 'Yogur de frutas variadas elaborado con leche de oveja de nuestra granja.', '2.00', 18, 'yogures', 'lacteos'),
(43, 'Chuletas de cerdo', 'Chuletas de cerdo frescas y de calidad, criadas en nuestra granja.', '12.00', 5, 'carnes', 'carnes'),
(44, 'Solomillo de cerdo', 'Solomillo de cerdo fresco y de calidad, criado en nuestra granja.', '15.00', 4, 'carnes', 'carnes'),
(46, 'Tocino de cerdo ahumado', 'Tocino de cerdo ahumado fresco y de calidad, criado en nuestra granja.', '8.50', 6, 'carnes', 'carnes'),
(47, 'Jersey de lana', 'Jersey de lana natural de oveja de nuestra granja, hecho a mano por artesanos locales.', '30.00', 3, 'lana', 'lana'),
(54, 'Leche de cabra', 'Leche de cabra fresca y natural, ideal para consumo directo o para elaborar productos lácteos', '2.50', 50, 'Leche de cabra', 'lacteos'),
(55, 'Carne de ternera', 'Carne de ternera de pasto, de sabor suave y textura tierna', '12.00', 8, 'Carne de ternera', 'carnes'),
(61, 'Leche semidesnatada', 'Leche fresca de vaca con bajo contenido en grasas.', '1.80', 30, 'Leche fresca de vaca.', 'lacteos'),
(67, 'Yogur de fresa', 'Yogur elaborado con leche fresca de vaca, fermentos lácticos y fresa.', '2.80', 45, 'Leche, fermentos lácticos, fresa.', 'lacteos'),
(68, 'Leche entera', 'Leche fresca de vaca con alto contenido en grasas.', '2.00', 25, 'Leche fresca de vaca.', 'lacteos');
INSERT INTO empleado (nombre, apellido, dni, direccion) 
		VALUES ('Juan', 'González', '12345678A', 'C/ Mayor, 12'),
       ('Maria', 'Rodríguez', '23456789B', 'C/ San José, 8'),
	   ('María', 'Rodríguez', '23456790B', 'C/ San José, 10'),
       ('Pedro', 'Sánchez', '34567890C', 'C/ La Plaza, 5'),
       ('Carmen', 'Martínez', '45678901D', 'C/ Nueva, 2'),
       ('Manuel', 'López', '56789012E', 'C/ La Fuente, 10'),
       ('Jose', 'Pérez', '67890123F', 'C/ Real, 4'),
       ('Pablo', 'García', '78901234G', 'C/ La Cruz, 3'),
       ('Luis', 'Fernández', '89012345H', 'C/ El Pino, 7'),
       ('Antonio', 'Romero', '90123456J', 'C/ La Alameda, 9'),
       ('Lucía', 'Ruiz', '01234567K', 'C/ El Prado, 6'),
       ('Javier', 'Díaz', '12345098L', 'C/ La Higuera, 11'),
       ('Marina', 'Hernández', '23456987M', 'C/ Las Rosas, 15'),
       ('Sofía', 'Gómez', '34567891N', 'C/ El Olivo, 18'),
       ('Laura', 'Santos', '45678902P', 'C/ El Roble, 14'),
       ('Diego', 'Vega', '56789013Q', 'C/ Los Olmos, 22'),
       ('Andres', 'Morales', '67890124R', 'C/ La Encina, 17'),
       ('Ana', 'Navarro', '78901235S', 'C/ El Sauce, 20');

INSERT INTO tipo_animal (tipo, zona) VALUES
			('Cabra', 'A'),

			('Vaca', 'B' ),
			('Oveja', 'C'),
			('Cerdo', 'D'),
			('Pollo', 'E'),
			('Gato', 'F');
			
INSERT INTO animal (id_animal, tipo, raza, familia, color, encargado)
VALUES
		(1, 'Vaca', 'Angus', 'Ganado', 'Negro', 'Pedro'),
		(2, 'Cerdo', 'Duroc', 'Ganado', 'Rosado', 'Juan'),
		(3, 'Cerdo', 'Yorkshire', 'Ganado', 'Blanco', 'Maria'),
		(4, 'Vaca', 'Holstein', 'Ganado', 'Blanco y negro', 'Jose'),
		(5, 'Pollo', 'Cornish', 'Aves', 'Blanco', 'Manuel'),
		(6, 'Pollo', 'Brahma', 'Aves', 'Marron', 'Laura'),
		(7, 'Cabra', 'Alpina', 'Ganado', 'Marron', 'Diego'),
		(8, 'Oveja', 'Merina', 'Ganado', 'Blanco', 'Andres'),
		(9, 'Cerdo', 'Landrace', 'Ganado', 'Blanco', 'Ana'),
		(10, 'Pollo', 'Rhode Island Red', 'Aves', 'Marron', 'Pedro'),
		(11, 'Vaca', 'Jersey', 'Ganado', 'Marron', 'Juan'),
		(12, 'Cabra', 'Saanen', 'Ganado', 'Blanco', 'Maria'),
		(13, 'Oveja', 'Dorper', 'Ganado', 'Blanco', 'Jose'),
		(14, 'Vaca', 'Hereford', 'Ganado', 'Marron', 'Manuel'),
		(15, 'Cerdo', 'Hampshire', 'Ganado', 'Negro', 'Laura'),
		(16, 'Cabra', 'Nubia', 'Ganado', 'Marron', 'Diego'),
		(17, 'Pollo', 'Leghorn', 'Aves', 'Blanco', 'Andres'),
		(18, 'Vaca', 'Limousin', 'Ganado', 'Marron', 'Ana'),
		(19, 'Oveja', 'Rambouillet', 'Ganado', 'Blanco', 'Pedro'),
		(20, 'Cerdo', 'Berkshire', 'Ganado', 'Negro', 'Juan'),
		(21, 'Vaca', 'Simmental', 'Ganado', 'Marron', 'Maria'),
		(22, 'Pollo', 'Plymouth Rock', 'Aves', 'Blanco y negro', 'Jose'),
		(23, 'Cabra', 'LaMancha', 'Ganado', 'Marron', 'Manuel'),
		(24, 'Oveja', 'Cotswold', 'Ganado', 'Blanco', 'Laura'),
		(25, 'Cerdo', 'Chester White', 'Ganado', 'Blanco', 'Diego'),
		(26, 'Vaca', 'Charolais', 'Ganado', 'Blanco', 'Andres'),(27, 'Cabra', 'Murciana-Granadina', 'Lechera', 'Blanca', 'Juan'),
       	(28, 'Oveja', 'Churra', 'Lechera', 'Blanca', 'Pedro'),
       	(29, 'Vaca', 'Asturiana de los Valles', 'Lechera', 'Marrón', 'Ana'),
       	(30, 'Cabra', 'Saanen', 'Lechera', 'Blanca', 'María'),
       	(31, 'Oveja', 'Merina', 'Lechera', 'Blanca', 'Antonio'),
       	(32, 'Vaca', 'Avileña-Negra Ibérica', 'Lechera', 'Negra', 'María'),
       	(33, 'Cabra', 'Alpina', 'Lechera', 'Blanca', 'Juan'),
       	(34, 'Oveja', 'Castellana', 'Lechera', 'Blanca', 'Pedro'),
       (35, 'Vaca', 'Charolais', 'Carne', 'Blanca', 'Antonio'),
       (36, 'Cabra', 'Malagueña', 'Lechera', 'Blanca', 'María'),
       (37, 'Oveja', 'Manchega', 'Lechera', 'Blanca', 'Antonio'),
       (38, 'Vaca', 'Parda Alpina', 'Lechera', 'Marrón', 'Ana'),
       (39, 'Cabra', 'Murciano-Granadina', 'Lechera', 'Blanca', 'Juan'),
       (40, 'Oveja', 'Rasa Aragonesa', 'Lechera', 'Blanca', 'Pedro'),
       (41, 'Vaca', 'Parda de Montaña', 'Lechera', 'Marrón', 'Ana'),
       (42, 'Cabra', 'Serrana', 'Carne', 'Marrón', 'María'),
       (43, 'Oveja', 'Segureña', 'Carne', 'Marrón', 'Antonio'),
       (44, 'Vaca', 'Rubia Gallega', 'Lechera', 'Marrón', 'Ana'),
       (45, 'Cabra', 'Murciano-Granadina', 'Lechera', 'Marrón', 'Juan'),
       (46, 'Oveja', 'Churra', 'Lechera', 'Marrón', 'Pedro'),
       (47, 'Vaca', 'Asturiana de los Valles', 'Lechera', 'Negra', 'María'),
       (48, 'Cabra', 'Alpina', 'Lechera', 'Marrón', 'Juan'),
       (49, 'Oveja', 'Merina', 'Lechera', 'Marrón', 'Antonio'),
       (50, 'Vaca', 'Charolais', 'Carne', 'Blanca', 'Antonio'),
       (51, 'Cabra', 'Malagueña', 'Lechera', 'Marrón', 'María'),
       (52, 'Oveja', 'Manchega', 'Lechera', 'Marrón', 'Antonio'),
	   (53, 'Cabra', 'Serrana', 'Macho', 'Marrón claro', 'Luis'),
       (54, 'Cabra', 'Serrana', 'Hembra', 'Marrón oscuro', 'Sofía'),
       (55, 'Cabra', 'Serrana', 'Macho', 'Blanco y marrón', 'Juan'),
       (56, 'Cabra', 'Serrana', 'Hembra', 'Blanca', 'Ana'),
       (57, 'Cabra', 'Serrana', 'Macho', 'Blanco', 'Pedro'),
       (58, 'Cabra', 'Murciano-Granadina', 'Hembra', 'Marrón oscuro', 'Sofía'),
       (59, 'Cabra', 'Murciano-Granadina', 'Macho', 'Marrón claro', 'Luis'),
       (60, 'Cabra', 'Murciano-Granadina', 'Hembra', 'Blanca', 'Ana'),
       (61, 'Cabra', 'Murciano-Granadina', 'Macho', 'Negro', 'Pedro'),
       (62, 'Cabra', 'Murciano-Granadina', 'Hembra', 'Marrón claro', 'Sofía'),
       (63, 'Cabra', 'Murciano-Granadina', 'Macho', 'Marrón oscuro', 'Luis'),
       (64, 'Cabra', 'Murciano-Granadina', 'Hembra', 'Marrón claro', 'Ana'),
       (65, 'Cabra', 'Murciano-Granadina', 'Macho', 'Blanco y marrón', 'Pedro'),
       (66, 'Oveja', 'Rasa Aragonesa', 'Hembra', 'Blanca', 'Sofía'),
       (67, 'Oveja', 'Rasa Aragonesa', 'Macho', 'Blanco', 'Luis'),
       (68, 'Oveja', 'Rasa Aragonesa', 'Hembra', 'Blanca', 'Ana'),
       (69, 'Oveja', 'Rasa Aragonesa', 'Macho', 'Negro', 'Pedro'),
       (70, 'Oveja', 'Rasa Aragonesa', 'Hembra', 'Marrón claro', 'Sofía'),
       (71, 'Oveja', 'Rasa Aragonesa', 'Macho', 'Marrón oscuro', 'Luis'),
       (72, 'Oveja', 'Rasa Aragonesa', 'Hembra', 'Blanca', 'Ana'),
       (73, 'Oveja', 'Rasa Aragonesa', 'Macho', 'Marrón claro', 'Pedro'),
       (74, 'Oveja', 'Manchega', 'Hembra', 'Blanca', 'Sofía'),
       (75, 'Oveja', 'Manchega', 'Macho', 'Blanco y marrón', 'Luis');
	   
	   
		INSERT INTO tipo_cuidado (tipo, observaciones) VALUES 
		('cuidar', 'Realizado chequeo general de salud y limpieza del recinto.'),
		('alimentar', 'Suministrada dieta especial según necesidades del animal.'),
		('sanar', 'Aplicado tratamiento médico para curar infección en una pata.'),
		('lavar', 'Lavado con agua y champú especial para mantener la higiene del animal.'),
		('ordeñar', 'Realizado ordeño manual de la vaca y comprobada la calidad de la leche producida.');
		
		

INSERT INTO cliente(cod_cliente, dni, nombre, direccion, email) VALUES
(1, '12345678A', 'María García', 'Calle Mayor, 1', 'maria.garcia@example.com'),
(2, '23456789B', 'Pedro Fernández', 'Avenida de la Constitución, 2', 'pedro.fernandez@example.com'),
(3, '34567890C', 'Sara López', 'Plaza del Ayuntamiento, 3', 'sara.lopez@example.com'),
(4, '45678901D', 'Javier Ruiz', 'Calle San Juan, 4', 'javier.ruiz@example.com'),
(5, '56789012E', 'Isabel Sánchez', 'Calle Santa Ana, 5', 'isabel.sanchez@example.com'),
(6, '67890123F', 'Luisa Pérez', 'Calle de la Estación, 6', 'luisa.perez@example.com'),
(7, '78901234G', 'David González', 'Calle Real, 7', 'david.gonzalez@example.com'),
(8, '89012345H', 'Laura Rodríguez', 'Avenida de la Libertad, 8', 'laura.rodriguez@example.com'),
(9, '90123456I', 'Manuel Gómez', 'Plaza de España, 9', 'manuel.gomez@example.com'),
(10, '01234567J', 'Lucía García', 'Calle Mayor, 10', 'lucia.garcia@example.com'),
(11, '12345678K', 'Juan López', 'Calle del Sol, 11', 'juan.lopez@example.com'),
(12, '23456789L', 'Ana Sánchez', 'Calle de la Luna, 12', 'ana.sanchez@example.com'),
(13, '34567890M', 'José Rodríguez', 'Calle Mayor, 13', 'jose.rodriguez@example.com'),
(14, '45678901N', 'Cristina Gómez', 'Calle San Francisco, 14', 'cristina.gomez@example.com'),
(15, '56789012O', 'Antonio Ruiz', 'Plaza del Ayuntamiento, 15', 'antonio.ruiz@example.com'),
(16, '67890123P', 'Rocío Pérez', 'Calle Real, 16', 'rocio.perez@example.com'),
(17, '78901234Q', 'Miguel González', 'Calle de la Fuente, 17', 'miguel.gonzalez@example.com'),
(18, '89012345R', 'Lucas Rodríguez', 'Avenida de la Libertad, 18', 'lucas.rodriguez@example.com'),
(19, '90123456S', 'María José Gómez', 'Plaza de España, 19', 'mariajose.gomez@example.com'),
(20, '01234567T', 'Jorge García', 'Calle Mayor, 20', 'jorge.garcia@example.com'),
(21, '12345678U', 'Carmen López', 'Calle San Juan, 21', 'carmen.lopez@example.com'),
(22, '23456789V', 'Pablo Sánchez', 'Calle Santa Ana, 22', 'pablo.sanchez@example.com'),
(23, '45678901X', 'Sofía González', 'Calle de la Estación, 23', 'sofia.gonzalez@example.com'),
(24, '56789012Y', 'Diego Rodríguez', 'Avenida de la Libertad, 24', 'diego.rodriguez@example.com'),
(25, '67890123Z', 'Elena Gómez', 'Plaza del Ayuntamiento, 25', 'elena.gomez@example.com'),
(26, '78901234A', 'Raúl Fernández', 'Calle Mayor, 26', 'raul.fernandez@example.com'),
(27, '89012345B', 'Nerea Sánchez', 'Calle de la Luna, 27', 'nerea.sanchez@example.com'),
(28, '90123456C', 'Mario Pérez', 'Calle Real, 28', 'mario.perez@example.com'),
(29, '01234567D', 'Julia González', 'Avenida de la Constitución, 29', 'julia.gonzalez@example.com'),
(30, '12345678E', 'Rubén López', 'Plaza de España, 30', 'ruben.lopez@example.com'),
(31, '23456789F', 'Laura Sánchez', 'Calle Mayor, 31', 'laura.sanchez@example.com'),
(32, '34567890G', 'Marcos García', 'Calle San Juan, 32', 'marcos.garcia@example.com'),
(33, '45678901H', 'Cristina Pérez', 'Calle Santa Ana, 33', 'cristina.perez@example.com'),
(34, '56789012I', 'Andrés Rodríguez', 'Calle de la Estación, 34', 'andres.rodriguez@example.com'),
(35, '67890123J', 'Carla Gómez', 'Avenida de la Libertad, 35', 'carla.gomez@example.com'),
(36, '78901234K', 'Alejandro González', 'Calle del Sol, 36', 'alejandro.gonzalez@example.com'),
(37, '89012345L', 'Aitana Sánchez', 'Calle Real, 37', 'aitana.sanchez@example.com'),
(38, '90123456M', 'Juan Carlos Pérez', 'Plaza del Ayuntamiento, 38', 'juancarlos.perez@example.com'),
(39, '01234567N', 'Celia García', 'Calle Mayor, 39', 'celia.garcia@example.com'),
(40, '12345678O', 'Sergio López', 'Calle de la Luna, 40', 'sergio.lopez@example.com'),
(41, '23456789P', 'Ismael Sánchez', 'Calle San Juan, 41', 'ismael.sanchez@example.com'),
(42, '34567890Q', 'Carmen Pérez', 'Calle Santa Ana, 42', 'carmen.perez@example.com'),
(43, '45678901R', 'Ángela González', 'Avenida de la Constitución, 43', 'angela.gonzalez@example.com'),
(44, '56789012S', 'Hugo Rodríguez', 'Plaza de España, 44', 'hugo.rodriguez@example.com'),
(45, '67890123T', 'María Martínez', 'Calle de la Estrella, 45', 'maria.martinez@example.com'),
(46, '78901234U', 'Pedro Fernández', 'Avenida de la Libertad, 46', 'pedro.fernandez@example.com'),
(47, '90123456V', 'Lucía Sánchez', 'Plaza del Ayuntamiento, 47', 'lucia.sanchez@example.com'),
(48, '01234567W', 'Miguel González', 'Calle Mayor, 48', 'miguel.gonzalez@example.com'),
(49, '12345678X', 'Lucas Rodríguez', 'Calle San Juan, 49', 'lucas.rodriguez@example.com'),
(50, '23456789Y', 'Paula Gómez', 'Calle Santa Ana, 50', 'paula.gomez@example.com');
INSERT INTO venta (cod_venta, fecha_pedido, fecha_entrega, estado_venta, cod_cliente) 
VALUES 
	(101, '2022-05-20 09:00:00', '2022-05-21 10:00:00', 'en proceso', 1),
	(102, '2022-04-30 12:00:00', '2022-05-01 13:00:00', 'en preparacion', 2),
	(103, '2022-06-15 08:00:00', '2022-06-16 09:00:00', 'en proceso', 3),
	(104, '2022-07-11 10:00:00', '2022-07-12 11:00:00', 'en preparacion', 4),
	(105, '2022-09-01 11:00:00', '2022-09-02 12:00:00', 'en proceso', 5),
	(106, '2022-08-08 08:00:00', '2022-08-09 09:00:00', 'en proceso', 6),
	(107, '2022-05-13 07:00:00', '2022-05-14 08:00:00', 'en preparacion', 7),
	(108, '2022-06-19 14:00:00', '2022-06-20 15:00:00', 'en proceso', 8),
	(109, '2022-08-27 11:00:00', '2022-08-28 12:00:00', 'en proceso', 9),
	(110, '2022-09-02 16:00:00', '2022-09-03 17:00:00', 'en preparacion', 10),
	(111, '2022-05-01 08:00:00', '2022-05-02 09:00:00', 'en proceso', 11),
	(112, '2022-07-22 10:00:00', '2022-07-23 11:00:00', 'en preparacion', 12),
	(113, '2022-06-05 12:00:00', '2022-06-06 13:00:00', 'en proceso', 13),
	(114, '2022-08-16 07:00:00', '2022-08-17 08:00:00', 'en proceso', 14),
	(115, '2022-09-05 09:00:00', '2022-09-06 10:00:00', 'en preparacion', 15),
	(116, '2022-06-12 11:00:00', '2022-06-13 12:00:00', 'en proceso', 16),
	(117, '2022-05-17 13:00:00', '2022-05-18 14:00:00', 'en preparacion', 17),
	(118, '2022-07-16 10:00:00', '2022-07-17 11:00:00', 'en proceso', 18),
	(119, '2022-07-26 14:00:00', '2022-07-27 15:00:00', 'en preparacion', 19),
	(120, '2022-06-07 09:00:00', '2022-06-08 10:00:00', 'en proceso', 20),
	(121, '2022-05-19 11:00:00', '2022-05-20 12:00:00', 'entregado', 21),
	(122, '2022-08-18 15:00:00', '2022-08-19 16:00:00', 'en preparacion', 22),
	(123, '2022-09-22 10:00:00', '2022-09-23 11:00:00', 'en proceso', 23),
	(124, '2022-05-31 12:00:00', '2022-06-01 13:00:00', 'en proceso', 24),
	(125, '2022-08-11 08:00:00', '2022-08-12 09:00:00', 'en proceso', 25),
	(126, '2022-07-06 16:00:00', '2022-07-07 17:00:00', 'en preparacion', 26),
	(127, '2022-06-23 10:00:00', '2022-06-24 11:00:00', 'entregado', 27),
	(128, '2022-09-16 13:00:00', '2022-09-17 14:00:00', 'en preparacion', 28),
	(129, '2022-05-27 09:00:00', '2022-05-28 10:00:00', 'en proceso', 29),
	(130, '2022-06-02 14:00:00', '2022-06-03 15:00:00', 'en proceso', 30),
	(131, '2022-09-13 12:00:00', '2022-09-14 13:00:00', 'en preparacion', 31),
	(132, '2022-07-20 11:00:00', '2022-07-21 12:00:00', 'en proceso', 32),
	(133, '2022-05-16 15:00:00', '2022-05-17 16:00:00', 'entregado', 33),
	(134, '2022-08-03 08:00:00', '2022-08-04 09:00:00', 'en preparacion', 34),
	(135, '2022-09-08 16:00:00', '2022-09-09 17:00:00', 'en proceso', 35),
	(136, '2022-06-29 14:00:00', '2022-06-30 15:00:00', 'en proceso', 36),
	(137, '2022-06-10 10:00:00', '2022-06-11 11:00:00', 'en proceso', 7),
    (138, '2022-08-25 12:00:00', '2022-08-26 13:00:00', 'en preparacion', 8),
    (139, '2022-09-30 08:00:00', '2022-10-01 09:00:00', 'en proceso', 9),
    (140, '2022-10-10 07:00:00', '2022-10-11 08:00:00', 'en proceso', 10);
INSERT INTO linea_venta (cod_linea, cod_venta, num_producto) VALUES
(1, 101, 31),
(4, 102, 42),
(6, 103, 9),
(7, 103, 54),
(8, 103, 68),
(9, 103, 34),
(10, 104, 2),
(11, 104, 37),
(12, 105, 23),
(13, 105, 12),
(14, 106, 43),
(15, 106, 15),
(16, 107, 24),
(17, 107, 33),
(19, 108, 61),
(20, 108, 67),
(21, 109, 3),
(22, 110, 6),
(23, 110, 26),
(24, 111, 38),
(27, 112, 68),
(29, 113, 20),
(30, 113, 30),
(31, 114, 9),
(32, 115, 1),
(33, 116, 27),
(34, 116, 33),
(35, 117, 21),
(36, 117, 26),
(37, 118, 41),
(38, 118, 42),
(43, 120, 43),
(44, 121, 12),
(46, 121, 67),
(47, 122, 1),
(48, 123, 13),
(50, 124, 29),
(51, 125, 8),
(54, 127, 19),
(55, 127, 27),
(58, 129, 39),
(60, 130, 11),
(61, 131, 46),
(65, 133, 21),
(66, 134, 35),
(67, 134, 37),
(68, 134, 44),
(69, 135, 3),
(70, 135, 28),
(72, 136, 6),
(73, 136, 40),
(74, 137, 24),
(76, 138, 9),
(77, 139, 32),
(78, 139, 34),
(79, 139, 61),
(80, 140, 22),
(81, 140, 23),
(82, 140, 35);
