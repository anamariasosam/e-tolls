/*
SQLyog Community v12.4.0 (64 bit)
MySQL - 5.7.14 : Database - peajes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`peajes` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;

USE `peajes`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `psvalor` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `categorias` */

insert  into `categorias`(`id`,`nombre`,`psvalor`) values 
(1,'Auto',1000.00),
(2,'Camion',2000.00),
(3,'TractoMula',4000.00);

/*Table structure for table `ciudades` */

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `ciudades` */

insert  into `ciudades`(`id`,`nombre`) values 
(1,'Medellin'),
(2,'Envigado'),
(3,'Rionegro'),
(4,'Santa Rosa');

/*Table structure for table `pasos` */

DROP TABLE IF EXISTS `pasos`;

CREATE TABLE `pasos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peajes_id` int(11) NOT NULL,
  `propietario_id` int(11) NOT NULL,
  `pspago` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `fk_table2_peajes1_idx` (`peajes_id`),
  KEY `fk_pasos_propietarios1_idx` (`propietario_id`),
  CONSTRAINT `fk_pasos_peajes1` FOREIGN KEY (`peajes_id`) REFERENCES `peajes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pasos_propietarios1` FOREIGN KEY (`propietario_id`) REFERENCES `propietarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `pasos` */

insert  into `pasos`(`id`,`peajes_id`,`propietario_id`,`pspago`) values 
(1,3,1,1000.00),
(2,3,1,1000.00),
(3,1,1,1000.00),
(4,3,2,2000.00),
(6,5,3,2000.00);

/*Table structure for table `peajes` */

DROP TABLE IF EXISTS `peajes`;

CREATE TABLE `peajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `peajes` */

insert  into `peajes`(`id`,`nombre`) values 
(3,'Aeropuerto'),
(5,'Atillo'),
(4,'Niquia'),
(1,'Palmas');

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cc` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `pssaldo` decimal(10,2) DEFAULT '0.00',
  `ciudad_id_vive` int(11) NOT NULL,
  `ciudad_id_trabaja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_personas_ciudades1_idx` (`ciudad_id_vive`),
  KEY `fk_personas_ciudades2_idx` (`ciudad_id_trabaja`),
  CONSTRAINT `fk_personas_ciudades1` FOREIGN KEY (`ciudad_id_vive`) REFERENCES `ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_ciudades2` FOREIGN KEY (`ciudad_id_trabaja`) REFERENCES `ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `personas` */

insert  into `personas`(`id`,`cc`,`nombre`,`pssaldo`,`ciudad_id_vive`,`ciudad_id_trabaja`) values 
(1,'c1','Juana Banana',0.00,2,NULL),
(2,'c2','Sacarias Piedas del Rio',0.00,1,3),
(3,'c3','Juana Rosa Ochoa',0.00,1,1);

/*Table structure for table `propietarios` */

DROP TABLE IF EXISTS `propietarios`;

CREATE TABLE `propietarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rfid` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_propietarios_vehiculos1_idx` (`vehiculo_id`),
  KEY `fk_propietarios_personas1_idx` (`persona_id`),
  CONSTRAINT `fk_propietarios_personas1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_propietarios_vehiculos1` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `propietarios` */

insert  into `propietarios`(`id`,`rfid`,`vehiculo_id`,`persona_id`) values 
(1,'AB123',1,3),
(2,'AB456',4,3),
(3,'XY001',3,1),
(4,'ZZ999',2,2);

/*Table structure for table `recargas` */

DROP TABLE IF EXISTS `recargas`;

CREATE TABLE `recargas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `psvalor` decimal(10,2) NOT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recargas_personas1_idx` (`persona_id`),
  CONSTRAINT `fk_recargas_personas1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `recargas` */

/*Table structure for table `vehiculos` */

DROP TABLE IF EXISTS `vehiculos`;

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehiculos_categorias_idx` (`categoria_id`),
  CONSTRAINT `fk_vehiculos_categorias` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `vehiculos` */

insert  into `vehiculos`(`id`,`placa`,`categoria_id`) values 
(1,'AAA123',1),
(2,'BBB456',2),
(3,'XYZ987',3),
(4,'AAA456',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
