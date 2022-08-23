---inventario

--base de datos


DROP DATABASE IF EXISTS farmalexia;
CREATE DATABASE IF NOT EXISTS farmalexia;
USE farmalexia;


CREATE TABLE persona(
idpersona INT AUTO_INCREMENT PRIMARY KEY,
ci INT NOT NULL UNIQUE,
primerNombre VARCHAR(25) NOT NULL,
seguntoNombre VARCHAR(25) NULL,
apellidoPaterno VARCHAR(25) NOT NULL, 
apellidoMaterno VARCHAR(25) NULL,
sexo ENUM ('M','F'),
fechaNacimiento DATE
)ENGINE=InnoDB;

CREATE TABLE cliente


CREATE TABLE rol(
idrol AUTO_INCREMENT PRIMARY KEY,
tipoPersona ENUM('admin','farmaceutico','auxiliarFarmacia')
)ENGINE=InnoDB;


CREATE TABLE medicamentos(
idMedicamento INT AUTO_INCREMENT PRIMARY KEY,
nombreMedicamento VARCHAR(50),
composicionMedicamento VARCHAR(50) NULL,
tipoMedicamento VARCHAR(25) NOT NULL,
presentacionMedicamento VARCHAR(25) NOT NULL,
precioDeVenta DECIMAL(8,2)
)ENGINE=InnoDB;

CREATE TABLE proveedores(
idprovedor INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
nombreProveedor VARCHAR(25)
)ENGINE=InnoDB;



CREATE TABLE identidad(
idIdentidad AUTO_INCREMENT PRIMARY KEY NOT NULL,
contrasenha VARCHAR(25) UNIQUE NOT NULL,
activo bool NOT NULL,
FOREIGN KEY(idpersona) REFERENCES persona(idpersona) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(idrol) REFERENCES rol(idrol) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;


CREATE TABLE sucursal(
idSucursal INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idEmpresa INT NOT NULL,
idCiudad INT NOT NULL,
idZona INT NOT NULL,
nombre VARCHAR (25) NOT NULL,
direccion VARCHAR (80) NOT NULL,
nit VARCHAR (15) NOT NULL,
numeroAutorizacion VARCHAR (15) NOT NULL,
activo bool not null,
FOREIGN KEY(idEmpresa) REFERENCES empresa(idEmpresa) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(idCiudad) REFERENCES ciudad(idCiudad) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(idZona) REFERENCES zona(idZona) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;




--tablas relacionales
CREATE TABLE registroFarmaco(
idRegistro INT AUTO_INCREMENT PRIMARY KEY NOT null,
fechaRegistro DATETIME,
cantidadRegistrada INT NOT null,
fechaVencimiento DATE NOT NULL,
FOREIGN KEY(idMedicamento) REFERENCES medicamentos(idMedicamento) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(idprovedor) REFERENCES proveedores(idprovedor) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE salidaMedicamentos(
idSalidaMedicamentos INT AUTO_INCREMENT PRIMARY KEY NOT null,
fechaHoraVenta DATETIME NOT null,
cantidaSalidaMendicamentos INT NOT NULL,
FOREIGN KEY(idRegistro) REFERENCES registroFarmaco(idRegistro) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(ididentidad) REFERENCES identidad(ididentidad) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;



