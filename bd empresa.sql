-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: empresa
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comprador`
--

DROP TABLE IF EXISTS `comprador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprador` (
  `Id_Comprador` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Documento` varchar(10) DEFAULT NULL,
  `RUC` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_Comprador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprador`
--

LOCK TABLES `comprador` WRITE;
/*!40000 ALTER TABLE `comprador` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechapago`
--

DROP TABLE IF EXISTS `fechapago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fechapago` (
  `Id_Fecha_Pago` int NOT NULL AUTO_INCREMENT,
  `Id_Pago` int DEFAULT NULL,
  `Fecha_Modificacion` date DEFAULT NULL,
  `Pago` float DEFAULT NULL,
  PRIMARY KEY (`Id_Fecha_Pago`),
  KEY `Id_Pago` (`Id_Pago`),
  CONSTRAINT `fechapago_ibfk_1` FOREIGN KEY (`Id_Pago`) REFERENCES `pago` (`Id_Pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechapago`
--

LOCK TABLES `fechapago` WRITE;
/*!40000 ALTER TABLE `fechapago` DISABLE KEYS */;
/*!40000 ALTER TABLE `fechapago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `listado_biatico`
--

DROP TABLE IF EXISTS `listado_biatico`;
/*!50001 DROP VIEW IF EXISTS `listado_biatico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listado_biatico` AS SELECT 
 1 AS `Id_Pago`,
 1 AS `proveedor`,
 1 AS `comprador`,
 1 AS `Pago_Total`,
 1 AS `Pago_Parcial`,
 1 AS `Restante`,
 1 AS `Biatico_Inicio`,
 1 AS `Biatico_Final`,
 1 AS `Biatico_Extras`,
 1 AS `Biatico_Personal`,
 1 AS `Biatico_Empresa`,
 1 AS `Fecha`,
 1 AS `Estado`,
 1 AS `Precio_Unidad`,
 1 AS `Tipo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listado_comprador`
--

DROP TABLE IF EXISTS `listado_comprador`;
/*!50001 DROP VIEW IF EXISTS `listado_comprador`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listado_comprador` AS SELECT 
 1 AS `Id_Comprador`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Documento`,
 1 AS `RUC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listado_grupo_ventas`
--

DROP TABLE IF EXISTS `listado_grupo_ventas`;
/*!50001 DROP VIEW IF EXISTS `listado_grupo_ventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listado_grupo_ventas` AS SELECT 
 1 AS `Grupo_Venta`,
 1 AS `Fecha`,
 1 AS `Id_Pago`,
 1 AS `Nombre`,
 1 AS `Documento`,
 1 AS `Licencia`,
 1 AS `cantidad`,
 1 AS `Ubicacion`,
 1 AS `Precio_Unidad`,
 1 AS `Pago_Total`,
 1 AS `Restante`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listado_proveedor`
--

DROP TABLE IF EXISTS `listado_proveedor`;
/*!50001 DROP VIEW IF EXISTS `listado_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listado_proveedor` AS SELECT 
 1 AS `Id_Proveedor`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Documento`,
 1 AS `Ruc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listado_transportista`
--

DROP TABLE IF EXISTS `listado_transportista`;
/*!50001 DROP VIEW IF EXISTS `listado_transportista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listado_transportista` AS SELECT 
 1 AS `Id_Transportista`,
 1 AS `Placa`,
 1 AS `Licencia`,
 1 AS `Documento`,
 1 AS `RUC`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `Id_Pago` int NOT NULL AUTO_INCREMENT,
  `Pago_Total` float DEFAULT '0',
  `Pago_Parcial` float DEFAULT '0',
  `Restante` float DEFAULT '0',
  `Biatico_Inicio` float DEFAULT '0',
  `Biatico_Final` float DEFAULT '0',
  `Biatico_Extras` float DEFAULT '0',
  `Biatico_Personal` float DEFAULT '0',
  `Biatico_Empresa` float DEFAULT '0',
  `Fecha` date DEFAULT NULL,
  `Ubicacion` text,
  `Estado` enum('PAGADO','DEUDA') DEFAULT NULL,
  `Precio_Unidad` float DEFAULT '0',
  `Tipo` enum('COMPRA','VENTA') DEFAULT NULL,
  PRIMARY KEY (`Id_Pago`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `Id_Proveedor` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Documento` varchar(10) DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrodeganado`
--

DROP TABLE IF EXISTS `registrodeganado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrodeganado` (
  `Id_Registro_Ganado` int NOT NULL AUTO_INCREMENT,
  `Raza` varchar(20) DEFAULT NULL,
  `Peso` float DEFAULT '0',
  `Color` varchar(20) DEFAULT NULL,
  `Sexo` varchar(1) DEFAULT NULL,
  `Salud` varchar(4) DEFAULT NULL,
  `Marca` varchar(10) DEFAULT NULL,
  `Aretes` varchar(10) DEFAULT NULL,
  `Descripcion` text,
  `Id_Grupo` int DEFAULT NULL,
  `Edad` int DEFAULT NULL,
  `Precio` float DEFAULT '0',
  `Id_Proveedor` int DEFAULT NULL,
  `Id_Transportista` int DEFAULT NULL,
  `Estado` enum('DISPONIBLE','VENDIDO') DEFAULT NULL,
  `Biatico_Ganado` float DEFAULT '0',
  `Id_Pago` int DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT 'Meses',
  PRIMARY KEY (`Id_Registro_Ganado`),
  KEY `Id_Proveedor` (`Id_Proveedor`),
  KEY `Id_Transportista` (`Id_Transportista`),
  KEY `Id_Pago` (`Id_Pago`) /*!80000 INVISIBLE */,
  CONSTRAINT `registrodeganado_ibfk_1` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedor` (`Id_Proveedor`),
  CONSTRAINT `registrodeganado_ibfk_2` FOREIGN KEY (`Id_Transportista`) REFERENCES `transportista` (`Id_Transportista`),
  CONSTRAINT `registrodeganado_ibfk_3` FOREIGN KEY (`Id_Pago`) REFERENCES `pago` (`Id_Pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrodeganado`
--

LOCK TABLES `registrodeganado` WRITE;
/*!40000 ALTER TABLE `registrodeganado` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrodeganado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registroventaganado`
--

DROP TABLE IF EXISTS `registroventaganado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registroventaganado` (
  `Id_Venta_Ganado` int NOT NULL AUTO_INCREMENT,
  `Id_Ganado_Registro` int NOT NULL,
  `Grupo_Venta` int DEFAULT NULL,
  `Id_Comprador` int DEFAULT NULL,
  `Id_Transportista` int DEFAULT NULL,
  `Id_Pago_Venta` int DEFAULT NULL,
  `Biatico_Ganado` float DEFAULT '0',
  `Precio_Final` float DEFAULT '0',
  `Precio_Unitario` float DEFAULT '0',
  `Peso_Actual` float DEFAULT '0',
  PRIMARY KEY (`Id_Venta_Ganado`),
  KEY `Id_Ganado_Registro` (`Id_Ganado_Registro`),
  KEY `Id_Comprador` (`Id_Comprador`),
  KEY `Id_Transportista` (`Id_Transportista`),
  KEY `Id_Pago_Venta` (`Id_Pago_Venta`),
  CONSTRAINT `registroventaganado_ibfk_1` FOREIGN KEY (`Id_Ganado_Registro`) REFERENCES `registrodeganado` (`Id_Registro_Ganado`),
  CONSTRAINT `registroventaganado_ibfk_2` FOREIGN KEY (`Id_Comprador`) REFERENCES `comprador` (`Id_Comprador`),
  CONSTRAINT `registroventaganado_ibfk_3` FOREIGN KEY (`Id_Transportista`) REFERENCES `transportista` (`Id_Transportista`),
  CONSTRAINT `registroventaganado_ibfk_4` FOREIGN KEY (`Id_Pago_Venta`) REFERENCES `pago` (`Id_Pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registroventaganado`
--

LOCK TABLES `registroventaganado` WRITE;
/*!40000 ALTER TABLE `registroventaganado` DISABLE KEYS */;
/*!40000 ALTER TABLE `registroventaganado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportista`
--

DROP TABLE IF EXISTS `transportista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportista` (
  `Id_Transportista` int NOT NULL AUTO_INCREMENT,
  `Placa` varchar(10) DEFAULT NULL,
  `Licencia` varchar(20) DEFAULT NULL,
  `Documento` varchar(10) DEFAULT NULL,
  `RUC` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_Transportista`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportista`
--

LOCK TABLES `transportista` WRITE;
/*!40000 ALTER TABLE `transportista` DISABLE KEYS */;
INSERT INTO `transportista` VALUES (1,'NINGUNO','NINGUNO','00000000','00000000000');
/*!40000 ALTER TABLE `transportista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `Id_Usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Usuario` varchar(30) DEFAULT NULL,
  `Documento` varchar(10) DEFAULT NULL,
  `Pass` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`Id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Nicolas','Leon Nolasco','nicolas1210','22664898','$2y$10$DVBg1SJLCSw.DusLNVuKCuNcGQ5Yh1GqpTxHT5yApAsW2HRw0F0vG');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'empresa'
--

--
-- Dumping routines for database 'empresa'
--
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZACION_PAGO_GENERAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZACION_PAGO_GENERAL`(IN IDP INT, IN PT FLOAT, IN PP FLOAT, 

IN BI FLOAT, IN BF FLOAT, IN BE FLOAT, IN BP FLOAT, IN BEM FLOAT, IN PRU FLOAT )
BEGIN

SET @B:=(select Pago_Parcial from pago WHERE Id_Pago = IDP) + PP;

SET @C:=(PT-@B);

SET @BINICIO:=(select Biatico_Inicio from pago WHERE Id_Pago = IDP);

SET @BFINAL:=(select Biatico_Final from pago WHERE Id_Pago = IDP);

SET @BEXTRAS:=(select Biatico_Extras from pago WHERE Id_Pago = IDP);

SET @BPERSONAL:=(select Biatico_Personal from pago WHERE Id_Pago = IDP);

SET @BEMPRESA:=(select Biatico_Empresa from pago WHERE Id_Pago = IDP);

INSERT INTO fechapago(Id_Pago,Fecha_Modificacion,Pago) VALUES (IDP,CURDATE(),PP);



UPDATE pago SET

Pago_Total = PT,

Pago_Parcial = @B,

Restante = @C,

Biatico_Inicio = @BINICIO+ BI,

Biatico_Final = @BFINAL + BF,

Biatico_Extras = @BEXTRAS + BE,

Biatico_Personal =  @BPERSONAL+ BP,

Biatico_Empresa = @BEMPRESA + BEM,

Precio_Unidad = PRU 

WHERE Id_Pago = IDP;



IF@C = 0 THEN

	UPDATE pago SET Estado = 'PAGADO'  WHERE Id_Pago = IDP;

ELSE

	UPDATE pago SET Estado = 'DEUDA'  WHERE Id_Pago = IDP;

END IF;

SET @D:=BI;



IF@D != 0 THEN

	UPDATE pago SET Tipo = 'VENTA'  WHERE Id_Pago = IDP;

	SET @E:=(select distinct Id_Grupo from registrodeganado where Id_Pago = IDP);

	SET @F:=(select count(Id_Grupo) from registrodeganado WHERE Id_Grupo = @E);

	SET @G:= (BI+BE+BP+BEM)/@F;

	UPDATE registrodeganado SET Biatico_Ganado = @G WHERE Id_Grupo = @E;

ELSE

	UPDATE pago SET Tipo = 'COMPRA'  WHERE Id_Pago = IDP;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZAR_PAGO_GANADO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_GANADO`( IN IDGRUPOT INT, IN IDPAGOT INT, IN PAGOTOTBIA FLOAT)
BEGIN

	SET @E:= (select sum(Precio) from empresa.registrodeganado  where Id_Grupo =  IDGRUPOT );

	UPDATE pago SET Pago_Total = @E WHERE Id_Pago = IDPAGOT;

	SET @D:= (SELECT Pago_Parcial FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	SET @F:= (SELECT Pago_Total FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	UPDATE pago SET Restante = @E-@D, Fecha_Modificado = CURDATE() where Id_Pago = IDPAGOT;

	SET @G:= (select count(Id_Grupo) from registrodeganado where Id_Grupo =  IDGRUPOT);

	SET @I:= PAGOTOTBIA/@G;

	UPDATE registrodeganado SET Biatico_Ganado = @I WHERE Id_Grupo = IDGRUPOT;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZAR_PAGO_GANADO_PRECIO_UNITARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_GANADO_PRECIO_UNITARIO`(IN IDGV INT, PESOT FLOAT, PRECIOUNI FLOAT)
BEGIN

UPDATE empresa.registroventaganado SET

Peso_Actual = PESOT,

Precio_Unitario = PRECIOUNI,

Precio_Final = PESOT * PRECIOUNI 

WHERE 

 Id_Venta_Ganado = IDGV;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZAR_PAGO_GANADO_PRECIO_UNITARIO_GANADO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_GANADO_PRECIO_UNITARIO_GANADO`(IN IDGV INT, PESOT FLOAT, PRECIOUNI FLOAT)
BEGIN



UPDATE empresa.registroventaganado SET

Peso_Actual = PESOT,

Precio_Unitario = PRECIOUNI,

Precio_Final = PESOT * PRECIOUNI 

WHERE 

 Id_Ganado_Registro = IDGV;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZAR_PAGO_GANADO_TOTAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_GANADO_TOTAL`( IN IDGRUPOT INT, IN IDPAGOT INT, IN PAGOTOTBIA FLOAT)
BEGIN

	SET @E:= (select Pago_Total from empresa.pago  where Id_Pago =  IDPAGOT );

	

	SET @D:= (SELECT Pago_Parcial FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	UPDATE pago SET Restante = @E-@D where Id_Pago = IDPAGOT;

	SET @G:= (select count(Id_Grupo) from registrodeganado where Id_Grupo =  IDGRUPOT);

	SET @I:= PAGOTOTBIA/@G;

	SET @F:= @E/@G;

	UPDATE registrodeganado SET Biatico_Ganado = @I WHERE Id_Grupo = IDGRUPOT;

	

	UPDATE registrodeganado SET Precio = @F WHERE Id_Grupo = IDGRUPOT;

	IF(@E-@D) = 0 THEN

	UPDATE pago SET Estado = 'PAGADO', Fecha_Modificado = CURDATE();

ELSE

	UPDATE pago SET Estado = 'DEUDA', Fecha_Modificado = CURDATE();

END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZAR_PAGO_GANADO_UNIDAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_GANADO_UNIDAD`( IN IDGRUPOT INT, IN IDPAGOT INT, IN PAGOTOTBIA FLOAT)
BEGIN

	SET @E:= (select sum(Precio) from empresa.registrodeganado  where Id_Grupo =  IDGRUPOT );

	UPDATE pago SET Pago_Total = @E WHERE Id_Pago = IDPAGOT;

	SET @D:= (SELECT Pago_Parcial FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	SET @F:= (SELECT Pago_Total FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	UPDATE pago SET Restante = @E-@D, Fecha = CURDATE() where Id_Pago = IDPAGOT;

	SET @G:= (select count(Id_Grupo) from registrodeganado where Id_Grupo =  IDGRUPOT);

	SET @I:= PAGOTOTBIA/@G;

	UPDATE registrodeganado SET Biatico_Ganado = @I WHERE Id_Grupo = IDGRUPOT;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZAR_PAGO_GANADO_VISTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_GANADO_VISTA`( IN IDGRUPOT INT, IN IDPAGOT INT, IN PRECIOT FLOAT)
BEGIN

	UPDATE empresa.pago SET Pago_Total = PRECIOT WHERE Id_Pago = IDPAGOT;

	SET @D:= (SELECT Pago_Parcial FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	SET @F:= (SELECT Pago_Total FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	UPDATE pago SET Restante = @F-@D, Fecha_Modificado = CURDATE() where Id_Pago = IDPAGOT;

	SET @G:= (select count(Id_Grupo) from registrodeganado where Id_Grupo =  IDGRUPOT);

	SET @H:= (SELECT Biatico_Inicio FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	SET @J:= (SELECT Biatico_Extras FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	SET @K:= (SELECT Biatico_Personal FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	SET @L:= (SELECT Biatico_Empresa FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	SET @M:= @H+@J+@K+@L;

	SET @I:= @M/@G;

	UPDATE registrodeganado SET Biatico_Ganado = @I WHERE Id_Grupo = IDGRUPOT;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZAR_PAGO_TOTAL_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_TOTAL_VENTA`( IN grupoventa INT, IN pesototal FLOAT, IN preciounidadventa FLOAT)
BEGIN

	SET @E:= (select distinct Id_Pago_Venta from registroventaganado where Grupo_Venta =  grupoventa);

	SET @F:= (SELECT Pago_Parcial FROM empresa.pago WHERE Id_Pago = @E);

	SET @G:= pesototal*preciounidadventa;

	SET @I:= (SELECT count(Grupo_Venta) FROM empresa.registroventaganado WHERE Grupo_Venta =grupoventa);

	SET @C:= @G - @F;

	IF@C < 0 THEN

	SELECT 1;

ELSE

	UPDATE pago SET Pago_Total =  @G ,  Restante = @C, Precio_Unidad = preciounidadventa where Id_Pago =  @E;

	UPDATE registroventaganado SET Peso_Actual = preciounidadventa, Precio_Final = @G/@I WHERE Grupo_Venta = grupoventa;

	SELECT 2;

END IF;

	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZAR_PAGO_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_VENTA`(IN IG INT, IN PP FLOAT, IN IDP FLOAT)
BEGIN

-- SET @C:=(select sum(Precio) from registroventaganado WHERE Grupo_Venta =IG);

-- SET  @D:= @C - PP;

-- UPDATE pago SET

-- Pago_Total = @C,

-- Pago_Parcial = PP,

-- Restante = @D

-- WHERE Id_Pago = IDP;

SET @E:=(SELECT Biatico_Final FROM pago WHERE Id_Pago =IDP);

SET @F:=(SELECT Biatico_Extras FROM pago WHERE Id_Pago =IDP);

SET @G:=(SELECT Biatico_Personal FROM pago WHERE Id_Pago =IDP);

SET @H:=(SELECT Biatico_Empresa FROM pago WHERE Id_Pago =IDP);

SET @I:= (SELECT count(Grupo_Venta) FROM registroventaganado WHERE Grupo_Venta =IG);

SET @J:= (@E+@F+@G+@H)/@I;

UPDATE registroventaganado SET

Biatico_Ganado = @J WHERE Grupo_Venta = IG;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZAR_PAGO_VENTA_PRECIO_UNIDAD_DEVERDAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_VENTA_PRECIO_UNIDAD_DEVERDAD`(IN IDGV INT)
BEGIN

SET @C:=(SELECT Id_Pago_Venta from registroventaganado WHERE Id_Ganado_Registro = IDGV);	

SET @E:=(SELECT Grupo_Venta from registroventaganado WHERE Id_Ganado_Registro = IDGV);	

SET @D:=(SELECT sum(Precio_Final) from registroventaganado WHERE Grupo_Venta = @E);	

SET @F:=(SELECT Pago_Parcial from pago WHERE Id_Pago = @C);	

UPDATE empresa.pago SET

Pago_Total = @D, Restante = @D-@F WHERE Id_Pago = @C;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZAR_PAGO_VENTA_PRECIO_UNIDAD_UJUM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_VENTA_PRECIO_UNIDAD_UJUM`(IN IDGV INT)
BEGIN



SET @C:=(SELECT Id_Pago_Venta from registroventaganado WHERE Id_Ganado_Registro = IDGV);	

SET @E:=(SELECT Grupo_Venta from registroventaganado WHERE Id_Venta_Ganado = IDGV);	

SET @D:=(SELECT sum(Precio_Final) from registroventaganado WHERE Grupo_Venta = @E);	

SET @F:=(SELECT Pago_Parcial from pago WHERE Id_Pago = @C);	

UPDATE empresa.pago SET

Pago_Total = @D, Restante = @D-@F WHERE Id_Pago = @C;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_BIATICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_BIATICO`(IN ID_PAGO32 INT)
DELETE FROM pago

WHERE Id_Pago = ID_PAGO32 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_BIATICO_PAGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_BIATICO_PAGO`(IN ID_PAGO32 INT)
DELETE FROM fechapago WHERE fechapago.Id_Pago = ID_PAGO32; ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_COMPRADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_COMPRADOR`(IN ID_VENDEDOR INT)
DELETE FROM comprador

WHERE Id_Comprador = ID_VENDEDOR ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_PROVEEDOR`(IN ID_VENDEDOR INT)
DELETE FROM proveedor
WHERE Id_Proveedor = ID_VENDEDOR ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_REGISTRO_BIATICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_REGISTRO_BIATICO`(IN ID_PAGO32 INT)
DELETE FROM fechapago WHERE fechapago.Id_Pago = ID_PAGO32 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_TRANSPORTISTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_TRANSPORTISTA`(IN ID_VENDEDOR INT)
DELETE FROM transportista

WHERE Id_Transportista = ID_VENDEDOR ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTADO_GRUPO_VENTAS_FILTRADO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTADO_GRUPO_VENTAS_FILTRADO`(IN `DNIBS` INT)
BEGIN

SET @C:=DNIBS;

IF LENGTH(@C) <= 1 THEN

SELECT

	registroventaganado.Grupo_Venta,

	pago.Fecha, 

	CONCAT_WS(' ',comprador.Nombre,comprador.Apellido) AS nombre,

	comprador.Documento,

	transportista.Licencia, 

	pago.Id_Pago, 

	count(Grupo_Venta) AS cantidad, 

	pago.Ubicacion, 

	pago.Precio_Unidad, 

	TRUNCATE(pago.Pago_Total,2) AS Pago_Total, 

	TRUNCATE(pago.Restante,2) AS Restante,

    TRUNCATE(sum(registrodeganado.Peso),2) AS Peso_Total,

	TRUNCATE(sum(registrodeganado.Precio) + sum(registrodeganado.Biatico_Ganado),2) AS precio_compra_total

FROM

	registroventaganado

	INNER JOIN

	pago

	ON 

		registroventaganado.Id_Pago_Venta = pago.Id_Pago

	INNER JOIN

	comprador

	ON 

		registroventaganado.Id_Comprador = comprador.Id_Comprador

    INNER JOIN

			registrodeganado

			ON 

				registroventaganado.Id_Ganado_Registro = registrodeganado.Id_Registro_Ganado



	INNER JOIN

	transportista

	ON 

		registroventaganado.Id_Transportista = transportista.Id_Transportista

		 GROUP BY Grupo_Venta;

ELSE

SELECT

	registroventaganado.Grupo_Venta,

	pago.Fecha, 

	CONCAT_WS(' ',comprador.Nombre,comprador.Apellido) AS nombre,

	comprador.Documento,

	transportista.Licencia, 

	pago.Id_Pago, 

	count(Grupo_Venta) AS cantidad, 

	pago.Ubicacion, 

	pago.Precio_Unidad, 

	TRUNCATE(pago.Pago_Total,2) AS Pago_Total, 

	TRUNCATE(pago.Restante,2) AS Restante

FROM

	registroventaganado

	INNER JOIN

	pago

	ON 

		registroventaganado.Id_Pago_Venta = pago.Id_Pago

	INNER JOIN

	comprador

	ON 

		registroventaganado.Id_Comprador = comprador.Id_Comprador

	INNER JOIN

	transportista

	ON 

		registroventaganado.Id_Transportista = transportista.Id_Transportista

		 WHERE comprador.Documento = @C GROUP BY Grupo_Venta;

END IF;







END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_BIATICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_BIATICO`()
SELECT

	pago.Id_Pago, 

	TRUNCATE(pago.Pago_Total,2)as Pago_Total, 

	TRUNCATE(pago.Pago_Parcial,2) as Pago_Parcial, 

	TRUNCATE(pago.Restante,2) as Restante, 

	TRUNCATE(pago.Biatico_Inicio,2) as Biatico_Inicio, 

	TRUNCATE(pago.Biatico_Final,2) as Biatico_Final, 

	TRUNCATE(pago.Biatico_Extras,2) as Biatico_Extras, 

	TRUNCATE(pago.Biatico_Personal,2) as Biatico_Personal, 

	TRUNCATE(pago.Biatico_Empresa,2) as Biatico_Empresa, 

	pago.Fecha, 

	pago.Estado,

	pago.Precio_Unidad,

	pago.Tipo

FROM

	pago ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_COMPRADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_COMPRADOR`()
SELECT
	empresa.comprador.Id_Comprador, 
	empresa.comprador.Nombre, 
	empresa.comprador.Documento, 
	empresa.comprador.Apellido, 
	empresa.comprador.RUC
FROM
	empresa.comprador ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_FECHA_PAGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_FECHA_PAGO`(IN IDP INT)
SELECT

	fechapago.Id_Fecha_Pago, 

	fechapago.Id_Pago, 

	fechapago.Fecha_Modificacion, 

	TRUNCATE(fechapago.Pago,2) as Pago

FROM

	fechapago 

WHERE

	fechapago.Id_Pago = IDP ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_GANADO_FILTRADO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_GANADO_FILTRADO`(IN idg INT)
BEGIN

 SELECT * FROM empresa.registrodeganado WHERE Id_Grupo = idg;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_GRUPO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_GRUPO`()
SELECT DISTINCT 

	registrodeganado.Id_Grupo, 

	pago.Fecha,

	registrodeganado.Id_Proveedor, 

	registrodeganado.Id_Transportista, 

	registrodeganado.Id_Pago, 

	concat_ws(' ',proveedor.Nombre, proveedor.Apellido) AS Nombre,

	proveedor.Documento, 

	transportista.Licencia,

	pago.Ubicacion AS Ubicacion,

	TRUNCATE((sum(registrodeganado.Peso)),2) AS Peso,

	Pago.Precio_Unidad AS Precio_Unidad,

	TRUNCATE(sum(registrodeganado.Precio),2) AS Precio

	

FROM

	registrodeganado

	INNER JOIN

	pago

	ON 

		registrodeganado.Id_Pago = pago.Id_Pago

	INNER JOIN

	transportista

	ON 

		registrodeganado.Id_Transportista = transportista.Id_Transportista

	INNER JOIN

	proveedor

	ON 

		registrodeganado.Id_Proveedor = proveedor.Id_Proveedor

		

	GROUP BY Id_Grupo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_GRUPO_COMPRA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_GRUPO_COMPRA`()
SELECT DISTINCT 

	registrodeganado.Id_Grupo, 

	pago.Fecha,

	registrodeganado.Id_Proveedor, 

	registrodeganado.Id_Transportista, 

	registrodeganado.Id_Pago, 

	concat_ws(' ',proveedor.Nombre, proveedor.Apellido) AS Nombre,

	proveedor.Documento, 

	transportista.Licencia,

	pago.Ubicacion AS Ubicacion,

	TRUNCATE((sum(registrodeganado.Peso)),2) AS Peso,

	Pago.Precio_Unidad AS Precio_Unidad,

	TRUNCATE(pago.Pago_Total,2) AS Precio,

	pago.Restante

FROM

	registrodeganado

	INNER JOIN

	pago

	ON 

		registrodeganado.Id_Pago = pago.Id_Pago

	INNER JOIN

	transportista

	ON 

		registrodeganado.Id_Transportista = transportista.Id_Transportista

	INNER JOIN

	proveedor

	ON 

		registrodeganado.Id_Proveedor = proveedor.Id_Proveedor

		

	GROUP BY Id_Grupo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_GRUPO_GANANCIAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_GRUPO_GANANCIAS`()
SELECT

	registroventaganado.Grupo_Venta, 

	pago.Fecha, 

	concat_ws(' ',comprador.Nombre, comprador.Apellido) AS Nombre,

	comprador.Documento, 

	transportista.Licencia,

	count(Grupo_Venta) AS cantidad,

	TRUNCATE(sum(registrodeganado.Precio),2) AS precio_compra,

	TRUNCATE(sum(registrodeganado.Biatico_Ganado),2) AS gasto_inicial,

	TRUNCATE(sum(registrodeganado.Precio),2) + 	TRUNCATE(sum(registrodeganado.Biatico_Ganado),2) AS precio_compra_total , 

	TRUNCATE(Pago.Pago_Total,2) AS precio_venta,

	TRUNCATE(sum(registroventaganado.Biatico_Ganado),2) AS gasto_final,

	TRUNCATE(Pago.Pago_Total,2) + TRUNCATE(sum(registroventaganado.Biatico_Ganado),2) AS precio_venta_total,

	TRUNCATE((Pago.Pago_Total + sum(registroventaganado.Biatico_Ganado)) - (sum(registrodeganado.Precio) + 	sum(registrodeganado.Biatico_Ganado)),2) AS ganancia

	

FROM

	registroventaganado 

	INNER JOIN

	pago

	ON 

		registroventaganado.Id_Pago_Venta = pago.Id_Pago

	INNER JOIN

	comprador

	ON 

		registroventaganado.Id_Comprador = comprador.Id_Comprador

	INNER JOIN

	transportista

	ON 

		registroventaganado.Id_Transportista = transportista.Id_Transportista

	INNER JOIN

	registrodeganado

	ON 

		registroventaganado.Id_Ganado_Registro = registrodeganado.Id_Registro_Ganado

		

	GROUP BY Grupo_Venta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_GRUPO_GANANCIAS_PRUEBA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_GRUPO_GANANCIAS_PRUEBA`(in DNIBS INT)
BEGIN



SET @C:=DNIBS;

IF LENGTH(@C) <= 1 THEN

		SELECT

			registroventaganado.Grupo_Venta, 

			pago.Fecha, 

			concat_ws(' ',comprador.Nombre, comprador.Apellido) AS Nombre,

			comprador.Documento, 

			transportista.Licencia,

			count(Grupo_Venta) AS cantidad,

			TRUNCATE(sum(registrodeganado.Precio),2) AS precio_compra,

			TRUNCATE(sum(registrodeganado.Biatico_Ganado),2) AS gasto_inicial,

			TRUNCATE(sum(registrodeganado.Precio) + 	sum(registrodeganado.Biatico_Ganado),2) AS precio_compra_total , 

			TRUNCATE(Pago.Pago_Total,2) AS precio_venta,

			TRUNCATE(sum(registroventaganado.Biatico_Ganado),2) AS gasto_final,

			TRUNCATE(Pago.Pago_Total + sum(registroventaganado.Biatico_Ganado),2) AS precio_venta_total,

			TRUNCATE((Pago.Pago_Total + sum(registroventaganado.Biatico_Ganado)) - (sum(registrodeganado.Precio) + 	sum(registrodeganado.Biatico_Ganado)),2) AS ganancia

			

		FROM

			registroventaganado 

			INNER JOIN

			pago

			ON 

				registroventaganado.Id_Pago_Venta = pago.Id_Pago

			INNER JOIN

			comprador

			ON 

				registroventaganado.Id_Comprador = comprador.Id_Comprador

			INNER JOIN

			transportista

			ON 

				registroventaganado.Id_Transportista = transportista.Id_Transportista

			INNER JOIN

			registrodeganado

			ON 

				registroventaganado.Id_Ganado_Registro = registrodeganado.Id_Registro_Ganado

				

			GROUP BY Grupo_Venta;

ELSE

	SELECT

	registroventaganado.Grupo_Venta, 

	pago.Fecha, 

	concat_ws(' ',comprador.Nombre, comprador.Apellido) AS Nombre,

	comprador.Documento, 

	transportista.Licencia,

	count(Grupo_Venta) AS cantidad,

	TRUNCATE(sum(registrodeganado.Precio),2) AS precio_compra,

			TRUNCATE(sum(registrodeganado.Biatico_Ganado),2) AS gasto_inicial,

			TRUNCATE(sum(registrodeganado.Precio) + 	sum(registrodeganado.Biatico_Ganado),2) AS precio_compra_total , 

			TRUNCATE(Pago.Pago_Total,2) AS precio_venta,

			TRUNCATE(sum(registroventaganado.Biatico_Ganado),2) AS gasto_final,

			TRUNCATE(Pago.Pago_Total + sum(registroventaganado.Biatico_Ganado),2) AS precio_venta_total,

			TRUNCATE((Pago.Pago_Total + sum(registroventaganado.Biatico_Ganado)) - (sum(registrodeganado.Precio) + 	sum(registrodeganado.Biatico_Ganado)),2) AS ganancia

FROM

	registroventaganado 

	INNER JOIN

	pago

	ON 

		registroventaganado.Id_Pago_Venta = pago.Id_Pago

	INNER JOIN

	comprador

	ON 

		registroventaganado.Id_Comprador = comprador.Id_Comprador

	INNER JOIN

	transportista

	ON 

		registroventaganado.Id_Transportista = transportista.Id_Transportista

	INNER JOIN

	registrodeganado

	ON 

		registroventaganado.Id_Ganado_Registro = registrodeganado.Id_Registro_Ganado

		

	 WHERE comprador.Documento = @C GROUP BY Grupo_Venta;

END IF;

	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_GRUPO_NUEVO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_GRUPO_NUEVO`()
SELECT DISTINCT 

	registrodeganado.Id_Grupo, 

	pago.Fecha,

	registrodeganado.Id_Proveedor, 

	registrodeganado.Id_Transportista, 

	registrodeganado.Id_Pago, 

	concat_ws(' ',proveedor.Nombre, proveedor.Apellido) AS Nombre,

	proveedor.Documento, 

	transportista.Licencia,

	pago.Ubicacion AS Ubicacion,

	TRUNCATE((sum(registrodeganado.Peso)),2) AS Peso,

	TRUNCATE(Pago.Precio_Unidad,2) AS Precio_Unidad,

	TRUNCATE(sum(registrodeganado.Precio),2) AS Precio

FROM

	registrodeganado

	INNER JOIN

	pago

	ON 

		registrodeganado.Id_Pago = pago.Id_Pago

	INNER JOIN

	transportista

	ON 

		registrodeganado.Id_Transportista = transportista.Id_Transportista

	INNER JOIN

	proveedor

	ON 

		registrodeganado.Id_Proveedor = proveedor.Id_Proveedor

		

	GROUP BY Id_Grupo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_PROVEEDOR`()
BEGIN
	select * FROM empresa.proveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_TRANSPORTISTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_TRANSPORTISTA`()
BEGIN
select * FROM empresa.transportista;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_VENTA_GANADO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_VENTA_GANADO`(IN `idg` INT)
SELECT

	registroventaganado.Id_Ganado_Registro, 

	registrodeganado.Raza, 

	registrodeganado.Peso, 

	registrodeganado.Precio, 

	registrodeganado.Sexo, 

	registrodeganado.Color, 

	registrodeganado.Salud, 

	registrodeganado.Aretes, 

	registrodeganado.Marca, 

	registrodeganado.Descripcion, 

	registrodeganado.Id_Grupo, 

	registroventaganado.Grupo_Venta, 

	CONCAT(registrodeganado.Edad," ",registrodeganado.Tipo) as Edad,

	TRUNCATE(registroventaganado.Precio_Final,2) AS Precio_Venta,

	TRUNCATE(registroventaganado.Precio_Final - registrodeganado.Precio ,2) AS Gananicas,

	CONCAT(proveedor.Apellido," ",proveedor.Nombre) as nombre,

	TRUNCATE(registroventaganado.Precio_Unitario,2) AS Precio_Unitario,

	registroventaganado.Peso_Actual AS Peso_Actual

	FROM

	registroventaganado

	

	INNER JOIN

	registrodeganado

	ON 

		registroventaganado.Id_Ganado_Registro = registrodeganado.Id_Registro_Ganado 

		INNER JOIN

	proveedor

	ON 

		registrodeganado.Id_Proveedor = proveedor.Id_Proveedor

		

		WHERE Grupo_Venta = idg ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTAR_VENTA_GANADO_VENDIDOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_VENTA_GANADO_VENDIDOS`(IN idg INT)
SELECT

	registroventaganado.Id_Ganado_Registro, 

	registrodeganado.Raza, 

	registrodeganado.Peso, 

	registrodeganado.Precio, 

	registrodeganado.Sexo, 

	registrodeganado.Color, 

	registrodeganado.Salud, 

	registrodeganado.Aretes, 

	registrodeganado.Marca, 

	registrodeganado.Descripcion, 

	registrodeganado.Id_Grupo, 

	registroventaganado.Grupo_Venta, 

	registrodeganado.Edad

FROM

	registroventaganado

	INNER JOIN

	registrodeganado

	ON 

		registroventaganado.Id_Ganado_Registro = registrodeganado.Id_Registro_Ganado WHERE Grupo_Venta = idg ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LISTA_PAGO_FILTRADO_COMPRA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTA_PAGO_FILTRADO_COMPRA`(IN GRUP INT)
SELECT

	pago.Id_Pago, 

	pago.Id_Grupo_Compra, 

	pago.Id_Grupo_Venta, 

	pago.Pago_Total, 

	pago.Pago_Parcial, 

	pago.Restante, 

	pago.Biatico_Inicio, 

	pago.Biatico_Extras, 

	pago.Biatico_Final, 

	pago.Biatico_Personal, 

	pago.Biatico_Empresa, 

	pago.Fecha

FROM

	pago

WHERE

pago.Id_Grupo_Compra = GRUP ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_COMPRADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_COMPRADOR`(IN ID_VENDEDOR INT, IN NOMBRE_VENDEDOR VARCHAR(30), IN APELLIDO_VENDEDOR VARCHAR(30), IN DOCUMENTO_VENDEDOR VARCHAR(20), IN RUC_VENDEDOR VARCHAR(30))
UPDATE comprador SET

Nombre = NOMBRE_VENDEDOR,

Apellido = APELLIDO_VENDEDOR,

Documento = DOCUMENTO_VENDEDOR,

RUC = RUC_VENDEDOR

WHERE Id_Comprador = ID_VENDEDOR ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_GANADO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_GANADO`(IN IDGANADOMOD INT, IN RAZA_GANADO VARCHAR(20),

 IN PESO_GANDO FLOAT, IN COLOR_GANADO VARCHAR(20), IN SEXO_GANADO VARCHAR(1), 

 IN SALUD_GANADO VARCHAR(4), IN MARCA_GANADO VARCHAR(10), IN ARETES_GANADO VARCHAR(10),

 IN SCRIPCION_GANADO text, IN EDAD_GANADO INT, PRECIO_GANADO FLOAT)
BEGIN

UPDATE registrodeganado SET

Raza = RAZA_GANADO,

Color = COLOR_GANADO,

Sexo = SEXO_GANADO,

Salud = SALUD_GANADO,

Marca = MARCA_GANADO,

Aretes = ARETES_GANADO,

Descripcion = SCRIPCION_GANADO,

Edad = EDAD_GANADO

WHERE Id_Registro_Ganado = IDGANADOMOD;



SET @C:= (SELECT Id_Grupo FROM empresa.registrodeganado where Id_Registro_Ganado =IDGANADOMOD );

SET @E:= (SELECT Id_Pago FROM empresa.registrodeganado where Id_Registro_Ganado =IDGANADOMOD );



SET @D:= (SELECT sum(Precio) from registrodeganado where Id_Grupo = @C);



SET @F:= (Select Pago_Parcial from pago where Id_Pago = @E);



UPDATE pago SET



Pago_Total = @D,

Restante = @D-@F

WHERE Id_Pago = @E;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_PAGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_PAGO`(In IDS INT,IN GRUPOIDCOMPRA INT, IN PAGOTOTAL FLOAT,

IN PAGOPARCIAL FLOAT, RESTANTE1 FLOAT, IN BIATICOINICIO FLOAT,IN BIATICOEXTRAS FLOAT,

IN BIATICOPERSONAL FLOAT,IN BIATICOEMPRESA FLOAT,IN PAGOTOTALBIATICO FLOAT)
BEGIN

	UPDATE pago SET

	Id_Grupo_Compra =GRUPOIDCOMPRA ,

	Pago_Total = PAGOTOTAL,

	Pago_Parcial = PAGOPARCIAL,

	Restante = RESTANTE,

	Biatico_Inicio = BIATICOINICIO,

	Biatico_Extras = BIATICOEXTRAS,

	Biatico_Personal = BIATICOPERSONAL,

	Biatico_Empresa = BIATICOEMPRESA,

	Fecha_Modificado = CURDATE()

	WHERE pago.Id_Pago = IDS;

	SET @D:=(SELECT count(Id_Grupo) from registrodeganado where Id_Grupo = GRUPOIDCOMPRA);

SET @C:=(PAGOTOTALBIATICO/@D);



UPDATE registrodeganado SET Biatico_Ganado = @C WHERE Id_Grupo = GRUPOIDCOMPRA;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_PROVEEDOR`(IN ID_PROVEEDORT INT, IN NOMBRE_PROVEEDOR VARCHAR(30), IN APELLIDO_PROVEEDOR VARCHAR(30), IN DOCUMENTO_PROVEEDOR VARCHAR(30), IN RUC_PROVEEDOR VARCHAR(20))
UPDATE proveedor SET

Nombre = NOMBRE_PROVEEDOR,

Apellido = APELLIDO_PROVEEDOR,

Documento = DOCUMENTO_PROVEEDOR,

ruc = RUC_PROVEEDOR

WHERE Id_Proveedor = ID_PROVEEDORT ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_TRANSPORTISTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_TRANSPORTISTA`(IN ID_TR INT,IN PLACA_T VARCHAR(20), IN LICENCIA_T VARCHAR(30), IN DOCUMENTO_T VARCHAR(10), IN RUC_T VARCHAR(15))
UPDATE transportista SET

Placa = PLACA_T,

Licencia = LICENCIA_T,

Documento = DOCUMENTO_T,

RUC = RUC_T

WHERE Id_Transportista = ID_TR ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTRAR_COMPRADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_COMPRADOR`(IN NOMBREV VARCHAR(30),IN APELLIDOV VARCHAR(30), IN DOCUMENTOV VARCHAR(10), IN RUCV VARCHAR(20))
BEGIN



DECLARE C INT;

SET @C:=(SELECT COUNT(*) from comprador WHERE Documento = BINARY DOCUMENTOV);

IF@C <= 1 THEN

	INSERT INTO comprador(Nombre,Apellido,Documento,RUC)VALUES(NOMBREV,APELLIDOV,DOCUMENTOV,RUCV);

	SELECT 1;

ELSE

	SELECT 2;

END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTRAR_GANADO_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_GANADO_VENTA`(IN IGR INT,IN IGV INT, IN COM INT, IN TRANS INT, IN IPG INT)
BEGIN

INSERT INTO registroventaganado(Id_Ganado_Registro,Grupo_Venta,Id_Comprador,Id_Transportista,Id_Pago_Venta) VALUES (IGR,IGV,COM,TRANS,IPG);



update empresa.registrodeganado set Estado = 'VENDIDO' where Id_Registro_Ganado = IGR ;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTRAR_GRUPO_COMPRA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_GRUPO_COMPRA`()
BEGIN

 SET @A:= (SELECT max(Id_Grupo) from registrodeganado);

 

IF LENGTH(@A) >= 1 THEN

	SELECT max(Id_Grupo) from registrodeganado;

ELSE

	SELECT 1;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTRAR_GRUPO_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_GRUPO_VENTA`()
BEGIN

 SET @A:= (SELECT max(Grupo_Venta) from registroventaganado);

 

IF LENGTH(@A) >= 1 THEN

	SELECT max(Grupo_Venta) from registroventaganado;

ELSE

	SELECT 1;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTRAR_PAGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_PAGO`(

IN PAGOPARCIAL FLOAT, IN BIATICOINICIO FLOAT,IN BIATICOEXTRAS FLOAT,

IN BIATICOPERSONAL FLOAT,IN BIATICOEMPRESA FLOAT,IN PAGOTOTALBIATICO FLOAT, IN UBICACIONGM TEXT, IN PRU FLOAT)
BEGIN

INSERT INTO pago(Pago_Parcial,Biatico_Inicio,Biatico_Extras,Biatico_Personal,Biatico_Empresa,Fecha,Ubicacion,Precio_Unidad,Tipo) VALUES (PAGOPARCIAL,BIATICOINICIO,BIATICOEXTRAS,BIATICOPERSONAL,BIATICOEMPRESA,CURDATE(),UBICACIONGM,PRU,'COMPRA');

SET @B:=(SELECT LAST_INSERT_ID());



INSERT INTO fechapago(Id_Pago,Fecha_Modificacion,Pago) VALUES (@B,CURDATE(),PAGOPARCIAL);

SELECT @B;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTRAR_PAGO_TOTAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_PAGO_TOTAL`(IN PAGOTOTALP FLOAT,

IN PAGOPARCIAL FLOAT, IN BIATICOINICIO FLOAT,IN BIATICOEXTRAS FLOAT,

IN BIATICOPERSONAL FLOAT,IN BIATICOEMPRESA FLOAT,IN PAGOTOTALBIATICO FLOAT, IN UBICACIONGM TEXT, IN PRU FLOAT)
BEGIN



INSERT INTO pago(Pago_Total,Pago_Parcial,Restante,Biatico_Inicio,Biatico_Extras,Biatico_Personal,Biatico_Empresa,Fecha,Ubicacion,Precio_Unidad,Tipo) VALUES (PAGOTOTALP,PAGOPARCIAL,PAGOTOTALP-PAGOPARCIAL,BIATICOINICIO,BIATICOEXTRAS,BIATICOPERSONAL,BIATICOEMPRESA,CURDATE(),UBICACIONGM,PRU,'COMPRA');





SET @B:=(SELECT LAST_INSERT_ID());



INSERT INTO fechapago(Id_Pago,Fecha_Modificacion,Pago) VALUES (@B,CURDATE(),PAGOPARCIAL);

SELECT @B;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTRAR_PAGO_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_PAGO_VENTA`(

IN PAGOPARCIAL FLOAT, IN BIATICOINICIO FLOAT,IN BIATICOEXTRAS FLOAT,

IN BIATICOPERSONAL FLOAT,IN BIATICOEMPRESA FLOAT,IN PAGOTOTALBIATICO FLOAT, IN UBI TEXT)
BEGIN

	INSERT INTO pago(Pago_Parcial,Biatico_Final,Biatico_Extras,Biatico_Personal,Biatico_Empresa,Fecha,Ubicacion,Tipo) VALUES (PAGOPARCIAL,BIATICOINICIO,BIATICOEXTRAS,BIATICOPERSONAL,BIATICOEMPRESA,CURDATE(),UBI,'VENTA');

SET @B:=(SELECT LAST_INSERT_ID());



INSERT INTO fechapago(Id_Pago,Fecha_Modificacion,Pago) VALUES (@B,CURDATE(),PAGOPARCIAL);

SELECT @B;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTRAR_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_PROVEEDOR`(IN NOMBREV VARCHAR(30),IN APELLIDOV VARCHAR(30), IN DOCUMENTOV VARCHAR(10), IN RUCV VARCHAR(20))
BEGIN



DECLARE C INT;

SET @C:=(SELECT COUNT(*) from proveedor WHERE Documento = BINARY DOCUMENTOV);

IF@C = 0 THEN

	INSERT INTO proveedor(Nombre,Apellido,Documento,ruc)VALUES(NOMBREV,APELLIDOV,DOCUMENTOV,RUCV);

	SELECT 1;

ELSE

	SELECT 2;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTRAR_TRANSPORTISTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_TRANSPORTISTA`(IN PLACA_T VARCHAR(20), IN LICENCIA_T VARCHAR(30), IN DOCUMENTO_T VARCHAR(10), IN RUC_T VARCHAR(15))
BEGIN



DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) from transportista WHERE Licencia = BINARY LICENCIA_T);

IF@CANTIDAD = 0 THEN

	INSERT INTO transportista(Licencia,PLaca,Documento,RUC)VALUES(LICENCIA_T,PLACA_T,DOCUMENTO_T,RUC_T);

	SELECT 1;

ELSE

	SELECT 2;

END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTRO_GANADO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRO_GANADO`(IN RAZA_GANADO VARCHAR(20), IN PESO FLOAT, IN COLOR_GANADO VARCHAR(20), IN SEXO_GANADO VARCHAR(1), IN SALUD_GANADO VARCHAR(4), IN MARCA_GANADO VARCHAR(10), IN ARETES_GANADO VARCHAR(10),IN SCRIPCION_GANADO text,IN IDGRUPO_GANADO INT, IN EDAD_GANADO INT, PRECIO_GANADO FLOAT,

 IN ID_PROVEEDOR_GANADO INT, IN ID_TRANSPORTISTA_GANADO INT,IN ID_PAGO_GANADO INT, IN TIP VARCHAR(29))
BEGIN

INSERT INTO registrodeganado(Raza,Peso,Color,Sexo,Salud,Marca,Aretes,Descripcion,Id_Grupo,Edad,

Precio,Id_Proveedor,Id_Transportista,Estado,Id_Pago,Tipo)VALUES(RAZA_GANADO,PESO,COLOR_GANADO,SEXO_GANADO,SALUD_GANADO,MARCA_GANADO,

ARETES_GANADO,SCRIPCION_GANADO,IDGRUPO_GANADO,EDAD_GANADO,PRECIO_GANADO,ID_PROVEEDOR_GANADO,ID_TRANSPORTISTA_GANADO,'DISPONIBLE',

ID_PAGO_GANADO,TIP);

select sum(Precio) from registrodeganado where Id_Grupo =IDGRUPO_GANADO;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTRO_GANADO_TOTAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRO_GANADO_TOTAL`(IN RAZA_GANADO VARCHAR(20), IN PESO FLOAT, IN COLOR_GANADO VARCHAR(20), IN SEXO_GANADO VARCHAR(1), IN SALUD_GANADO VARCHAR(4), IN MARCA_GANADO VARCHAR(10), IN ARETES_GANADO VARCHAR(10),IN SCRIPCION_GANADO text,IN IDGRUPO_GANADO INT, IN EDAD_GANADO INT,

 IN ID_PROVEEDOR_GANADO INT, IN ID_TRANSPORTISTA_GANADO INT,IN ID_PAGO_GANADO INT,IN TIP VARCHAR(29))
BEGIN

INSERT INTO registrodeganado(Raza,Peso,Color,Sexo,Salud,Marca,Aretes,Descripcion,Id_Grupo,Edad,Id_Proveedor,Id_Transportista,Estado,Id_Pago,Tipo)VALUES(RAZA_GANADO,PESO,COLOR_GANADO,SEXO_GANADO,SALUD_GANADO,MARCA_GANADO,

ARETES_GANADO,SCRIPCION_GANADO,IDGRUPO_GANADO,EDAD_GANADO,ID_PROVEEDOR_GANADO,ID_TRANSPORTISTA_GANADO,'DISPONIBLE',

ID_PAGO_GANADO,TIP);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SELECT_GANADO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_GANADO`(IN grupogranadot INT)
SELECT DISTINCT

	registrodeganado.Id_Registro_Ganado, 

	registrodeganado.Precio, 

	registrodeganado.Peso,

	registrodeganado.Raza, 

	 

	registrodeganado.Color, 

	registrodeganado.Sexo, 

	registrodeganado.Salud, 

	registrodeganado.Marca, 

	registrodeganado.Aretes, 

	registrodeganado.Descripcion, 

	registrodeganado.Id_Grupo, 

	registrodeganado.Edad, 

	

	registrodeganado.Estado

FROM

	registrodeganado

WHERE

	registrodeganado.Estado  = 'DISPONIBLE' AND registrodeganado.Id_Grupo = grupogranadot ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SELECT_GANADO_INPUT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_GANADO_INPUT`(IN idganadot INT)
SELECT

	registrodeganado.Id_Registro_Ganado, 

	registrodeganado.Precio, 

	registrodeganado.Peso,

	registrodeganado.Raza, 

	registrodeganado.Color, 

	registrodeganado.Sexo, 

	registrodeganado.Salud, 

	registrodeganado.Marca, 

	registrodeganado.Aretes, 

	registrodeganado.Descripcion, 

	registrodeganado.Id_Grupo, 

	registrodeganado.Edad, 

	registrodeganado.Estado

FROM

	registrodeganado

WHERE

	registrodeganado.Estado  = 'DISPONIBLE' AND registrodeganado.Id_Registro_Ganado = idganadot ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SELECT_GANADO_INPUT_LISTA_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_GANADO_INPUT_LISTA_VENTA`(IN idganadot INT)
SELECT

	registrodeganado.Id_Registro_Ganado, 

	registrodeganado.Precio, 

	registrodeganado.Peso,

	registrodeganado.Raza, 

	registrodeganado.Color, 

	registrodeganado.Sexo, 

	registrodeganado.Salud, 

	registrodeganado.Marca, 

	registrodeganado.Aretes, 

	registrodeganado.Descripcion, 

	registrodeganado.Id_Grupo, 

	registrodeganado.Edad, 

	registrodeganado.Estado

FROM

	registrodeganado

WHERE

	registrodeganado.Estado  = 'VENDIDO' AND registrodeganado.Id_Registro_Ganado = idganadot ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SELECT_GANADO_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_GANADO_VENTA`( IN GDV INT)
SELECT

	registrodeganado.Id_Registro_Ganado,

	registrodeganado.Raza, 

	registrodeganado.Peso, 

	registrodeganado.Color, 

	registrodeganado.Sexo, 

	registrodeganado.Salud, 

	registrodeganado.Marca, 

	registrodeganado.Aretes, 

	registrodeganado.Descripcion, 

	registrodeganado.Id_Grupo, 

	registrodeganado.Edad, 

	registrodeganado.Precio, 

	registroventaganado.Grupo_Venta

FROM

	registroventaganado

	INNER JOIN

	registrodeganado

	ON 

		registroventaganado.Id_Ganado_Registro = registrodeganado.Id_Registro_Ganado

		

	WHERE registroventaganado.Grupo_Venta = GDV AND registroventaganado.Precio_Final = 0 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SELECT_GRUPO_COMPRA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_GRUPO_COMPRA`()
SELECT DISTINCT

	registrodeganado.Id_Grupo, 

	registrodeganado.Estado,

	registrodeganado.Id_Registro_Ganado

FROM

	registrodeganado 

WHERE

	registrodeganado.Estado ='DISPONIBLE'

GROUP BY Id_Grupo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SELECT_GRUPO_COMPRA_TOTAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_GRUPO_COMPRA_TOTAL`()
SELECT DISTINCT

	registroventaganado.Grupo_Venta, 

	registroventaganado.Id_Pago_Venta, 

	pago.Pago_Total

FROM

	registroventaganado

	INNER JOIN

	pago

	ON 

		registroventaganado.Id_Pago_Venta = pago.Id_Pago

		WHERE pago.Pago_Total = 0

		GROUP BY Grupo_Venta ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VERIFICAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VERIFICAR_USUARIO`(IN USUARIOT VARCHAR(30))
SELECT

	usuario.Id_Usuario, 

	usuario.Nombre, 

	usuario.Apellido, 

	usuario.Documento, 

	usuario.Usuario, 

	usuario.Pass

FROM

	usuario		

	WHERE Usuario = BINARY USUARIOT ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `listado_biatico`
--

/*!50001 DROP VIEW IF EXISTS `listado_biatico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listado_biatico` AS select `pago`.`Id_Pago` AS `Id_Pago`,`proveedor`.`Documento` AS `proveedor`,`comprador`.`Documento` AS `comprador`,`pago`.`Pago_Total` AS `Pago_Total`,`pago`.`Pago_Parcial` AS `Pago_Parcial`,`pago`.`Restante` AS `Restante`,`pago`.`Biatico_Inicio` AS `Biatico_Inicio`,`pago`.`Biatico_Final` AS `Biatico_Final`,`pago`.`Biatico_Extras` AS `Biatico_Extras`,`pago`.`Biatico_Personal` AS `Biatico_Personal`,`pago`.`Biatico_Empresa` AS `Biatico_Empresa`,`pago`.`Fecha` AS `Fecha`,`pago`.`Estado` AS `Estado`,`pago`.`Precio_Unidad` AS `Precio_Unidad`,`pago`.`Tipo` AS `Tipo` from ((((`pago` join `registrodeganado` on((`pago`.`Id_Pago` = `registrodeganado`.`Id_Pago`))) join `proveedor` on((`registrodeganado`.`Id_Proveedor` = `proveedor`.`Id_Proveedor`))) join `registroventaganado` on(((`registrodeganado`.`Id_Registro_Ganado` = `registroventaganado`.`Id_Ganado_Registro`) or (`pago`.`Id_Pago` = `registroventaganado`.`Id_Pago_Venta`)))) join `comprador` on((`registroventaganado`.`Id_Comprador` = `comprador`.`Id_Comprador`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listado_comprador`
--

/*!50001 DROP VIEW IF EXISTS `listado_comprador`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listado_comprador` AS select `comprador`.`Id_Comprador` AS `Id_Comprador`,`comprador`.`Nombre` AS `Nombre`,`comprador`.`Apellido` AS `Apellido`,`comprador`.`Documento` AS `Documento`,`comprador`.`RUC` AS `RUC` from `comprador` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listado_grupo_ventas`
--

/*!50001 DROP VIEW IF EXISTS `listado_grupo_ventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listado_grupo_ventas` AS select `registroventaganado`.`Grupo_Venta` AS `Grupo_Venta`,`pago`.`Fecha` AS `Fecha`,`pago`.`Id_Pago` AS `Id_Pago`,concat_ws(' ',`comprador`.`Nombre`,`comprador`.`Apellido`) AS `Nombre`,`comprador`.`Documento` AS `Documento`,`transportista`.`Licencia` AS `Licencia`,count(`registroventaganado`.`Grupo_Venta`) AS `cantidad`,`pago`.`Ubicacion` AS `Ubicacion`,`pago`.`Precio_Unidad` AS `Precio_Unidad`,truncate(`pago`.`Pago_Total`,2) AS `Pago_Total`,truncate(`pago`.`Restante`,2) AS `Restante` from (((`registroventaganado` join `pago` on((`registroventaganado`.`Id_Pago_Venta` = `pago`.`Id_Pago`))) join `comprador` on((`registroventaganado`.`Id_Comprador` = `comprador`.`Id_Comprador`))) join `transportista` on((`registroventaganado`.`Id_Transportista` = `transportista`.`Id_Transportista`))) group by `registroventaganado`.`Grupo_Venta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listado_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `listado_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listado_proveedor` AS select `proveedor`.`Id_Proveedor` AS `Id_Proveedor`,`proveedor`.`Nombre` AS `Nombre`,`proveedor`.`Apellido` AS `Apellido`,`proveedor`.`Documento` AS `Documento`,`proveedor`.`ruc` AS `Ruc` from `proveedor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listado_transportista`
--

/*!50001 DROP VIEW IF EXISTS `listado_transportista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listado_transportista` AS select `transportista`.`Id_Transportista` AS `Id_Transportista`,`transportista`.`Placa` AS `Placa`,`transportista`.`Licencia` AS `Licencia`,`transportista`.`Documento` AS `Documento`,`transportista`.`RUC` AS `RUC` from `transportista` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-20  0:26:57
