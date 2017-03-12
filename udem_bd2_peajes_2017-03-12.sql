# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.21-MariaDB)
# Database: udem_bd2_peajes
# Generation Time: 2017-03-12 23:28:35 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table categorias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `psvalor_por_defecto` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;

INSERT INTO `categorias` (`id`, `nombre`, `psvalor_por_defecto`)
VALUES
	(1,'Automóviles, camperos y camionetas	10460',10460.00),
	(2,'Buses',15360.00),
	(3,'Camiones de dos ejes',15360.00),
	(4,'Camiones de tres ejes y cuatro ejes',27760.00),
	(5,'Camiones de cinco ejes',44260.00),
	(6,'Camiones de seis ejes',50960.00);

/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categorias_peajes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorias_peajes`;

CREATE TABLE `categorias_peajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `psvalor` decimal(10,2) NOT NULL,
  `categorias_id` int(11) NOT NULL,
  `peajes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categorias_peajes_categorias1_idx` (`categorias_id`),
  KEY `fk_categorias_peajes_peajes1_idx` (`peajes_id`),
  CONSTRAINT `fk_categorias_peajes_categorias1` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_categorias_peajes_peajes1` FOREIGN KEY (`peajes_id`) REFERENCES `peajes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categorias_peajes` WRITE;
/*!40000 ALTER TABLE `categorias_peajes` DISABLE KEYS */;

INSERT INTO `categorias_peajes` (`id`, `psvalor`, `categorias_id`, `peajes_id`)
VALUES
	(1,2092.00,1,6),
	(2,3072.00,2,6),
	(3,3072.00,3,6),
	(4,5552.00,4,6),
	(5,8852.00,5,6),
	(6,10192.00,6,6);

/*!40000 ALTER TABLE `categorias_peajes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ciudades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;

INSERT INTO `ciudades` (`id`, `nombre`)
VALUES
	(1,'Medellin'),
	(2,'Envigado'),
	(3,'Itagui'),
	(4,'Bello'),
	(5,'La Estrella'),
	(6,'Rionegro');

/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table conciliacionesbancarias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `conciliacionesbancarias`;

CREATE TABLE `conciliacionesbancarias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `psvalor` decimal(10,2) NOT NULL,
  `cdrecibo_banco` varchar(15) NOT NULL,
  `fetransaccion` datetime NOT NULL,
  `cderror` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `conciliacionesbancarias` WRITE;
/*!40000 ALTER TABLE `conciliacionesbancarias` DISABLE KEYS */;

INSERT INTO `conciliacionesbancarias` (`id`, `psvalor`, `cdrecibo_banco`, `fetransaccion`, `cderror`)
VALUES
	(1,100000.00,'01234','2017-02-13 12:24:22',NULL),
	(2,100000.00,'43210','2017-02-13 12:24:48',NULL),
	(3,50000.00,'340123','2017-02-15 12:25:38',NULL),
	(4,50000.00,'6789','2017-02-15 12:26:20',NULL),
	(6,100000.00,'43210','2017-02-13 12:24:48',NULL),
	(7,100000.00,'01234','2017-02-13 12:24:22',NULL),
	(8,100000.00,'43210','2017-02-13 12:24:48',NULL);

/*!40000 ALTER TABLE `conciliacionesbancarias` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pasos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pasos`;

CREATE TABLE `pasos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pspago` decimal(10,2) DEFAULT '0.00',
  `peaje_id` int(11) NOT NULL,
  `propietario_id` int(11) NOT NULL,
  `fepaso` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pasos_peajes1_idx` (`peaje_id`),
  KEY `fk_pasos_propietarios1_idx` (`propietario_id`),
  CONSTRAINT `fk_pasos_peajes1` FOREIGN KEY (`peaje_id`) REFERENCES `peajes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pasos_propietarios1` FOREIGN KEY (`propietario_id`) REFERENCES `propietarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pasos` WRITE;
/*!40000 ALTER TABLE `pasos` DISABLE KEYS */;

INSERT INTO `pasos` (`id`, `pspago`, `peaje_id`, `propietario_id`, `fepaso`)
VALUES
	(1,10460.00,1,1,'2016-10-24 18:00:00'),
	(2,10460.00,2,2,'2016-10-24 18:00:00'),
	(3,15360.00,3,3,'2016-10-24 18:00:00'),
	(4,10460.00,4,4,'2016-10-24 18:00:00'),
	(5,15360.00,5,5,'2016-10-24 18:00:00'),
	(6,27760.00,6,6,'2016-10-24 18:00:00'),
	(7,10460.00,7,7,'2016-10-24 18:00:00'),
	(8,10460.00,8,4,'2016-10-24 18:00:00'),
	(9,15360.00,8,3,'2016-10-24 18:00:00'),
	(10,10460.00,7,2,'2016-10-24 18:00:00'),
	(11,10460.00,6,7,'2016-11-24 18:00:00'),
	(12,15360.00,5,3,'2016-11-24 18:00:00'),
	(13,10460.00,4,4,'2016-11-24 18:00:00'),
	(14,10460.00,3,2,'2016-11-24 18:00:00'),
	(15,10460.00,2,2,'2016-11-24 18:00:00'),
	(16,10460.00,1,2,'2016-11-24 18:00:00'),
	(17,10460.00,4,1,'2016-11-24 18:00:00'),
	(18,15360.00,5,3,'2016-11-24 18:00:00'),
	(19,15360.00,6,5,'2016-11-24 18:00:00'),
	(20,27760.00,2,6,'2016-11-24 18:00:00'),
	(21,10460.00,1,7,'2016-12-24 18:00:00'),
	(22,15360.00,7,3,'2016-12-24 18:00:00'),
	(23,10460.00,7,2,'2016-12-24 18:00:00'),
	(24,15360.00,3,3,'2016-12-24 18:00:00'),
	(25,10460.00,2,4,'2016-12-24 18:00:00'),
	(26,15360.00,4,5,'2016-12-24 18:00:00'),
	(27,15360.00,6,5,'2016-12-24 18:00:00'),
	(28,10460.00,5,4,'2016-12-24 18:00:00'),
	(29,10460.00,1,1,'2016-12-24 18:00:00'),
	(30,10460.00,8,1,'2016-12-24 18:00:00'),
	(31,10460.00,7,2,'2017-01-24 18:00:00'),
	(32,15360.00,3,3,'2017-01-24 18:00:00'),
	(33,15360.00,2,5,'2017-01-24 18:00:00'),
	(34,27760.00,5,6,'2017-01-24 18:00:00'),
	(35,10460.00,4,7,'2017-01-24 18:00:00'),
	(36,15360.00,3,3,'2017-01-24 18:00:00'),
	(37,10460.00,6,2,'2017-01-24 18:00:00'),
	(38,10460.00,4,1,'2017-01-24 18:00:00'),
	(39,10460.00,3,2,'2017-01-24 18:00:00'),
	(40,10460.00,4,4,'2017-01-24 18:00:00'),
	(41,15360.00,7,5,'2017-02-24 18:00:00'),
	(42,27760.00,8,6,'2017-02-24 18:00:00'),
	(43,10460.00,8,7,'2017-02-24 18:00:00'),
	(44,10460.00,3,2,'2017-02-24 18:00:00'),
	(45,10460.00,2,2,'2017-02-24 18:00:00'),
	(46,10460.00,1,1,'2017-02-24 18:00:00'),
	(47,15360.00,3,3,'2017-02-24 18:00:00'),
	(48,10460.00,5,4,'2017-02-24 18:00:00'),
	(49,15360.00,5,5,'2017-02-24 18:00:00'),
	(50,27760.00,6,6,'2017-02-24 18:00:00'),
	(51,10460.00,2,2,'2017-03-24 18:00:00'),
	(52,15360.00,2,3,'2017-03-24 18:00:00'),
	(53,15360.00,1,3,'2017-03-24 18:00:00'),
	(54,10460.00,4,2,'2017-03-24 18:00:00'),
	(55,10460.00,5,1,'2017-03-24 18:00:00'),
	(56,10460.00,6,2,'2017-03-24 18:00:00'),
	(57,15360.00,3,3,'2017-03-24 18:00:00'),
	(58,10460.00,2,2,'2017-03-24 18:00:00'),
	(59,10460.00,6,1,'2017-03-24 18:00:00'),
	(60,10460.00,7,2,'2017-03-24 18:00:00');

/*!40000 ALTER TABLE `pasos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table peajes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `peajes`;

CREATE TABLE `peajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `peajes` WRITE;
/*!40000 ALTER TABLE `peajes` DISABLE KEYS */;

INSERT INTO `peajes` (`id`, `nombre`)
VALUES
	(3,'(Cocorná) El Santuario'),
	(4,'Escobero'),
	(5,'Las Palmas '),
	(8,'LLanos de Cuivá'),
	(6,'Niquía'),
	(2,'Peaje Palmitas (Túnel de Occidente)  '),
	(1,'Peaje San Cristobal (Túnel de Occidente)'),
	(7,'Trapiche*');

/*!40000 ALTER TABLE `peajes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table personas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cc` varchar(15) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `pssaldo` decimal(10,2) DEFAULT '0.00',
  `ciudad_id_vive` int(11) NOT NULL,
  `ciudad_id_trabaja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_personas_ciudades1_idx` (`ciudad_id_vive`),
  KEY `fk_personas_ciudades2_idx` (`ciudad_id_trabaja`),
  CONSTRAINT `fk_personas_ciudades1` FOREIGN KEY (`ciudad_id_vive`) REFERENCES `ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_ciudades2` FOREIGN KEY (`ciudad_id_trabaja`) REFERENCES `ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;

INSERT INTO `personas` (`id`, `cc`, `nombre`, `pssaldo`, `ciudad_id_vive`, `ciudad_id_trabaja`)
VALUES
	(1,'C1','Luis Carlos S',999999.00,1,1),
	(2,'C2','Jaime G',999999.00,5,NULL),
	(3,'C3','Carlos A',999999.00,6,6),
	(4,'C4','Bill G',999999.00,3,1);

/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table propietarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `propietarios`;

CREATE TABLE `propietarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rfid` varchar(15) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_UNIQUE` (`rfid`),
  KEY `fk_propietarios_personas1_idx` (`persona_id`),
  KEY `fk_propietarios_vehiculos1_idx` (`vehiculo_id`),
  CONSTRAINT `fk_propietarios_personas1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_propietarios_vehiculos1` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `propietarios` WRITE;
/*!40000 ALTER TABLE `propietarios` DISABLE KEYS */;

INSERT INTO `propietarios` (`id`, `rfid`, `persona_id`, `vehiculo_id`)
VALUES
	(1,'X1-1',1,1),
	(2,'X1-2',1,2),
	(3,'Y2-3',2,3),
	(4,'Y2-4',2,4),
	(5,'Z3-5',3,5),
	(6,'Z3-6',3,6),
	(7,'Z3-7',3,7);

/*!40000 ALTER TABLE `propietarios` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recargas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recargas`;

CREATE TABLE `recargas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) NOT NULL,
  `psvalor` decimal(10,2) NOT NULL,
  `cdrecibo_banco` varchar(15) NOT NULL,
  `ferecarga` datetime NOT NULL,
  `snvalidada` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `fk_recargas_personas1_idx` (`persona_id`),
  CONSTRAINT `fk_recargas_personas1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recargas` WRITE;
/*!40000 ALTER TABLE `recargas` DISABLE KEYS */;

INSERT INTO `recargas` (`id`, `persona_id`, `psvalor`, `cdrecibo_banco`, `ferecarga`, `snvalidada`)
VALUES
	(1,1,100000.00,'01234','2017-02-13 12:24:22','N'),
	(2,1,100000.00,'43210','2017-02-13 12:24:48','N'),
	(3,2,50000.00,'13579','2017-02-14 12:25:13','N'),
	(4,1,50000.00,'340123','2017-02-15 12:25:38','N'),
	(5,3,50000.00,'6789','2017-02-15 12:26:20','N'),
	(6,1,100000.00,'01234','2017-02-13 12:24:22','N'),
	(7,1,100000.00,'43210','2017-02-13 12:24:48','N');

/*!40000 ALTER TABLE `recargas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rep_peajes1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rep_peajes1`;

CREATE TABLE `rep_peajes1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `peaje_id` int(11) NOT NULL,
  `mes_a` decimal(8,2) DEFAULT NULL,
  `mes_b` decimal(8,2) DEFAULT NULL,
  `mes_c` decimal(8,2) DEFAULT NULL,
  `mes_d` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rep_peajes1_peajes1_idx` (`peaje_id`),
  CONSTRAINT `fk_rep_peajes1_peajes1` FOREIGN KEY (`peaje_id`) REFERENCES `peajes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

LOCK TABLES `rep_peajes1` WRITE;
/*!40000 ALTER TABLE `rep_peajes1` DISABLE KEYS */;

INSERT INTO `rep_peajes1` (`id`, `peaje_id`, `mes_a`, `mes_b`, `mes_c`, `mes_d`)
VALUES
	(1,1,20920.00,0.00,10460.00,15360.00),
	(2,2,10460.00,15360.00,10460.00,36280.00),
	(3,3,15360.00,41180.00,25820.00,15360.00),
	(4,4,15360.00,31380.00,0.00,10460.00),
	(5,5,10460.00,27760.00,25820.00,10460.00),
	(6,6,15360.00,10460.00,27760.00,20920.00),
	(7,7,25820.00,10460.00,15360.00,10460.00),
	(8,8,10460.00,0.00,38220.00,0.00);

/*!40000 ALTER TABLE `rep_peajes1` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reporte_anual
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reporte_anual`;

CREATE TABLE `reporte_anual` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_peaje` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `recaudado` decimal(10,2) DEFAULT NULL,
  `cantidad_vehiculos` int(11) DEFAULT NULL,
  `fecha` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

LOCK TABLES `reporte_anual` WRITE;
/*!40000 ALTER TABLE `reporte_anual` DISABLE KEYS */;

INSERT INTO `reporte_anual` (`id`, `nombre_peaje`, `recaudado`, `cantidad_vehiculos`, `fecha`)
VALUES
	(1,'Peaje San Cristobal (Túne',41840.00,4,2016),
	(2,'Peaje Palmitas (Túnel de ',59140.00,4,2016),
	(3,'(Cocorná) El Santuario',41180.00,3,2016),
	(4,'Escobero',46740.00,4,2016),
	(5,'Las Palmas ',56540.00,4,2016),
	(6,'Niquía',68940.00,4,2016),
	(7,'Trapiche*',46740.00,4,2016),
	(8,'LLanos de Cuivá',36280.00,3,2016);

/*!40000 ALTER TABLE `reporte_anual` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vehiculos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vehiculos`;

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(6) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `placa_UNIQUE` (`placa`),
  KEY `fk_vehiculos_categorias_idx` (`categoria_id`),
  CONSTRAINT `fk_vehiculos_categorias` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;

INSERT INTO `vehiculos` (`id`, `placa`, `categoria_id`)
VALUES
	(1,'LCS001',1),
	(2,'LCS002',1),
	(3,'JGB003',2),
	(4,'JGB004',1),
	(5,'CAL005',3),
	(6,'CAL006',4),
	(7,'CAL007',1);

/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping routines (PROCEDURE) for database 'udem_bd2_peajes'
--
DELIMITER ;;

# Dump of PROCEDURE p_insertar_paso
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `p_insertar_paso` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_insertar_paso`(IN v_peaje_id INT, IN v_rfid VARCHAR(15))
BEGIN
		/*Variables de trabajo*/
		DECLARE v_propietario_id INT;
		DECLARE v_id_persona INT;
		DECLARE v_pspagos DEC(10,2);
		DECLARE v_psvalor_especial DEC(10,2);
    DECLARE v_valor_a_pagar DEC(10,2);
    DECLARE v_saldo_disponible DEC(10,2);
		/*Consultar el valor generico de pago y codigo del vehiculo*/
		SELECT	categoria.psvalor_por_defecto, propietario.id
		INTO	v_pspagos, v_propietario_id
		FROM 	propietarios propietario,
			vehiculos vehiculo,
			categorias categoria
		WHERE	propietario.vehiculo_id = vehiculo.id AND
			categoria.id = vehiculo.categoria_id AND
			propietario.rfid = v_rfid;
		/*Punto 1 - Aquí usted debe intentar buscar si el peaje tiene un valor especial*/
		/*TO DO*/
    -- Traigo el valor del peaje especial
    SELECT cp.psvalor
    INTO v_psvalor_especial
    FROM
      propietarios p,
      vehiculos v,
      categorias c,
      categorias_peajes cp,
      peajes pe
    WHERE
      p.vehiculo_id = v.id
      AND
      c.id = v.categoria_id
      AND
      p.rfid = v_rfid
      AND
      pe.id = cp.peajes_id
      AND
      c.id = cp.categorias_id
      AND
      pe.id = v_peaje_id;
    -- Añado el valor a pagar si es especial o si no el por defecto
    IF v_psvalor_especial IS NULL THEN
	    SET v_valor_a_pagar = v_pspagos;
    ELSE
      SET v_valor_a_pagar = v_psvalor_especial;
	  END IF;
		/*Punto 2 - Aquí usted debe intentar Validar si hay suficiente dinero para cubrir
				el paso del peaje*/
		/*TO DO*/
    -- Traigo el saldo de la persona con el rfid
    SELECT pssaldo
    INTO v_saldo_disponible
    FROM
      propietarios p,
      personas pe
    WHERE
      p.persona_id = pe.id
      AND
      p.rfid = v_rfid;
    -- Verifico que tenga dinero para pagar sino tiene que saque un error
    -- si tiene que lo inserte en paso del peaje
    IF v_saldo_disponible < v_valor_a_pagar THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =  'No hay cantidad suficiente para pasar por el peaje, haga una recarga';
    END IF;
    INSERT INTO pasos
        ( peaje_id,	propietario_id,	pspago )
        VALUES
        ( v_peaje_id,	v_propietario_id,	v_valor_a_pagar);
		/*Punto 3 - Aquí usted debe debitar del saldo de la persona el valor del peaje*/
    SELECT p.id
    INTO v_id_persona
    FROM
      propietarios p,
      personas pe
    WHERE
      p.persona_id = pe.id
      AND
      p.rfid = v_rfid;
    UPDATE personas
    SET pssaldo = v_saldo_disponible -  v_valor_a_pagar
    WHERE id = v_id_persona;
		/*TO DO*/
    	END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE p_reporte_anual
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `p_reporte_anual` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `p_reporte_anual`(IN v_year INT)
BEGIN
    DECLARE done INT DEFAULT 0;
		DECLARE v_id_pasos INT;
	 	DECLARE v_nombre_peaje VARCHAR(25);
	 	DECLARE v_recaudado DEC(10,2);
		DECLARE v_cantidad INT;


    DECLARE cur_peajes CURSOR FOR
      SELECT
      pe.nombre,
      sum(pspago),
      count(*)
      FROM
      pasos,
      peajes pe
      WHERE
      pe.id = pasos.peaje_id
      AND
      YEAR(fepaso) = v_year
      GROUP BY peaje_id;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

    /* Limpiar tabla */
    TRUNCATE TABLE reporte_anual;
    /* Inicio ciclo*/
    OPEN cur_peajes;
    REPEAT
    FETCH cur_peajes INTO v_nombre_peaje, v_recaudado, v_cantidad;

    -- Si encontro datos
    IF NOT done THEN

      INSERT INTO reporte_anual ( nombre_peaje, recaudado, cantidad_vehiculos, fecha )
      VALUES( v_nombre_peaje, v_recaudado, v_cantidad, v_year);


      SET done = 0;
    END IF;
    UNTIL done END REPEAT;
    CLOSE cur_peajes;


    	END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE sp_rep_peajes1
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_rep_peajes1` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_rep_peajes1`( IN v_fecha DATE)
BEGIN
    DECLARE done                 INT DEFAULT 0;
      DECLARE v_id_peaje            INT;
    /*Var trabajo fechas*/
      DECLARE  d1                DATE;
      DECLARE  d2                DATE;
      DECLARE  d3                DATE;
      DECLARE  d4                DATE;
      DECLARE  d5                DATE;
      
      /*Var sumas x mes*/
    DECLARE  suma1                DEC(10,2);
      DECLARE  suma2                DEC(10,2);
      DECLARE  suma3                DEC(10,2);
      DECLARE  suma4                DEC(10,2);      
      
    DECLARE cur_peajes CURSOR FOR 
        SELECT id
            FROM     peajes;
            
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
    /* Calcular las fecha de consultas */
    SELECT DATE(CONCAT(YEAR(v_fecha - INTERVAL 3 MONTH),'-',MONTH(v_fecha - INTERVAL 3 MONTH),'-01' ))
        INTO d1;
    SELECT DATE(CONCAT(YEAR(v_fecha - INTERVAL 2 MONTH),'-',MONTH(v_fecha - INTERVAL 2 MONTH),'-01' ))
        INTO d2;
    SELECT DATE(CONCAT(YEAR(v_fecha - INTERVAL 1 MONTH),'-',MONTH(v_fecha - INTERVAL 1 MONTH),'-01' ))
        INTO d3;
    SELECT DATE(CONCAT(YEAR(v_fecha ),'-',MONTH(v_fecha ),'-01' ))
        INTO d4;
    SELECT DATE(CONCAT(YEAR(v_fecha + INTERVAL 1 MONTH),'-',MONTH(v_fecha + INTERVAL 1 MONTH),'-01' ))
        INTO d5;
        
    /* Limpiar tabla */
    TRUNCATE TABLE rep_peajes1;
    /* Inicio ciclo*/
    OPEN cur_peajes;
    REPEAT
        FETCH cur_peajes INTO v_id_peaje;
        -- Si encontro datos
        IF NOT done THEN
            SELECT SUM( pspago ) INTO suma1
                FROM pasos
                WHERE peaje_id = v_id_peaje AND
                    fepaso >= d1 AND fepaso < d2;
            SELECT SUM( pspago ) INTO suma2
                FROM pasos
                WHERE peaje_id = v_id_peaje AND
                    fepaso >= d2 AND fepaso < d3;
            SELECT SUM( pspago ) INTO suma3
                FROM pasos
                WHERE peaje_id = v_id_peaje AND
                    fepaso >= d3 AND fepaso < d4;
            SELECT SUM( pspago ) INTO suma4
                FROM pasos
                WHERE peaje_id = v_id_peaje AND
                    fepaso >= d4 AND fepaso < d5;
            
            INSERT INTO rep_peajes1 ( peaje_id, mes_a, mes_b, mes_c ,mes_d)
                VALUES( v_id_peaje, IFNULL(suma1,0), IFNULL(suma2,0), IFNULL(suma3,0), IFNULL(suma4,0));
            SET done = 0;
        END IF; 
    UNTIL done END REPEAT;
    CLOSE cur_peajes;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
