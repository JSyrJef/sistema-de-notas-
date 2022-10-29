CREATE TABLE `users` (
  `id_users` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `upwd` varchar(45) NOT NULL,
  `uname` varchar(45) NOT NULL,
  `ulastname` varchar(45) NOT NULL,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`id_users`));

CREATE TABLE `trimestre` (
  `id_trimestre` int NOT NULL AUTO_INCREMENT,
  `trimestre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_trimestre`)); 

CREATE TABLE `unidad` (
  `id_unidad` int NOT NULL AUTO_INCREMENT,
  `unidad` varchar(45) NOT NULL,
  `id_trimestre` int NOT NULL,
  PRIMARY KEY (`id_unidad`),
  KEY `fk_trimestre` (`id_trimestre`),
  CONSTRAINT `fk_trimestre` FOREIGN KEY (`id_trimestre`) REFERENCES `trimestre` (`id_trimestre`));
  
  CREATE TABLE `evaluaciones` (
  `id_evaluacion` int NOT NULL AUTO_INCREMENT,
  `evaluacion` varchar(45) NOT NULL,
  `id_unidad` int NOT NULL,
  PRIMARY KEY (`id_evaluacion`),
  KEY `fk_unidad` (`id_unidad`),
  CONSTRAINT `fk_unidad` FOREIGN KEY (`id_unidad`) REFERENCES `unidad` (`id_unidad`));
  
  CREATE TABLE `grados` (
  `id_grado` int NOT NULL AUTO_INCREMENT,
  `grado` varchar(45) NOT NULL,
  `ciclo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_grado`));
  
  CREATE TABLE `secciones` (
  `id_seccion` int NOT NULL AUTO_INCREMENT,
  `seccion` char(20) NOT NULL,
  PRIMARY KEY (`id_seccion`));
  
  CREATE TABLE `materia` (
  `id_materia` int NOT NULL AUTO_INCREMENT,
  `materia` varchar(45) NOT NULL,
  `id_grado` int NOT NULL,
  PRIMARY KEY (`id_materia`),
  KEY `fk_grados` (`id_grado`),
  CONSTRAINT `fk_grados` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id_grado`));
  
CREATE TABLE `alumnos` (
  `id_alumno` int NOT NULL AUTO_INCREMENT,
  `num_list` int NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `genero` char(20) NOT NULL,
  `id_grado` int NOT NULL,
  `id_seccion` int NOT NULL,
  PRIMARY KEY (`id_alumno`),
  KEY `fk_grado` (`id_grado`),
  KEY `fk_seccion` (`id_seccion`),
  CONSTRAINT `fk_grado` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id_grado`),
  CONSTRAINT `fk_seccion` FOREIGN KEY (`id_seccion`) REFERENCES `secciones` (`id_seccion`));

CREATE TABLE `registro_notas` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `nota` varchar(45) NOT NULL,
  `id_alumno` int NOT NULL,
  `id_materia` int NOT NULL,
  `id_evaluacion` int NOT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `fk_evaluacion` (`id_evaluacion`),
  KEY `fk_materia` (`id_materia`),
  KEY `fk_alumno` (`id_alumno`),
  CONSTRAINT `fk_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`),
  CONSTRAINT `fk_evaluacion` FOREIGN KEY (`id_evaluacion`) REFERENCES `evaluaciones` (`id_evaluacion`),
  CONSTRAINT `fk_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`));






