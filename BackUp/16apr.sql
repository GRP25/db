-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for Linux (x86_64)
--
-- Host: mama.sh    Database: dbprojekt
-- ------------------------------------------------------
-- Server version	10.1.44-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `COTable`
--

DROP TABLE IF EXISTS `COTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COTable` (
  `BossID` char(6) DEFAULT NULL,
  `DepartmentName` varchar(10) NOT NULL,
  UNIQUE KEY `BossID` (`BossID`,`DepartmentName`),
  KEY `DepartmentName` (`DepartmentName`),
  CONSTRAINT `COTable_ibfk_1` FOREIGN KEY (`BossID`) REFERENCES `Employee` (`EmployeeID`),
  CONSTRAINT `COTable_ibfk_2` FOREIGN KEY (`DepartmentName`) REFERENCES `Department` (`DepartmentName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COTable`
--

LOCK TABLES `COTable` WRITE;
/*!40000 ALTER TABLE `COTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `COTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `CustomerID` char(6) NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `PostalCode` char(4) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `Phone` varchar(8) NOT NULL,
  `Mail` varchar(50) DEFAULT NULL,
  `CreditLimit` decimal(10,2) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('K00001','Oliver','Poulsen','Bygaden 28','2605','Brøndby','86256438','ks23@gmail.com',100000.00),('K00002','Danny','boy','Bygaden 28','2605','Frankfurt','86256438','ks23@gmail.com',100000.00),('K00003','Kurt','Svendsen','Bygaden 28','2605','Brøndby','86256438','ks23@gmail.com',100000.00);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cdio`@`%`*/ /*!50003 TRIGGER Customer_ID_Insert BEFORE INSERT ON Customer 
FOR EACH ROW 
BEGIN
	INSERT INTO Customer_seq VALUES (NULL);
	SET NEW.CustomerID = CONCAT ('K', LPAD(LAST_INSERT_ID(), 5, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Customer_seq`
--

DROP TABLE IF EXISTS `Customer_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer_seq` (
  `Customer_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Customer_seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_seq`
--

LOCK TABLES `Customer_seq` WRITE;
/*!40000 ALTER TABLE `Customer_seq` DISABLE KEYS */;
INSERT INTO `Customer_seq` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `Customer_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `DepartmentName` varchar(10) NOT NULL,
  PRIMARY KEY (`DepartmentName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('Sales');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Dispatch`
--

DROP TABLE IF EXISTS `Dispatch`;
/*!50001 DROP VIEW IF EXISTS `Dispatch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Dispatch` (
  `CustomerID` tinyint NOT NULL,
  `FirstName` tinyint NOT NULL,
  `LastName` tinyint NOT NULL,
  `Address` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `EmployeeID` char(6) NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `PostalCode` varchar(4) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `Phone` varchar(8) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `Title` varchar(25) DEFAULT NULL,
  `Department` varchar(10) NOT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date NOT NULL,
  `AccountNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`,`EndDate`),
  KEY `Department` (`Department`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `Department` (`DepartmentName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('M00001','Bertram','Persen',NULL,NULL,NULL,NULL,NULL,NULL,'Sales','2020-04-10','0000-00-00',1234567890),('M00002','Bertram','Persen',NULL,NULL,NULL,NULL,NULL,NULL,'Sales','2020-04-10','0000-00-00',1234567890),('M00003','Bertram','Persen',NULL,NULL,NULL,NULL,NULL,NULL,'Sales','2020-04-10','0000-00-00',1234567890),('M00004','Bertram','Persen',NULL,NULL,NULL,NULL,NULL,NULL,'Sales','2020-04-10','0000-00-00',1234567890),('M00005','Bertram','Persen',NULL,NULL,NULL,NULL,NULL,NULL,'Sales','2020-04-10','0000-00-00',1234567890),('M00006','Bertram','Persen',NULL,NULL,NULL,NULL,NULL,NULL,'Sales','2020-04-10','0000-00-00',1234567890),('M00007','Bertram','Persen',NULL,NULL,NULL,NULL,NULL,NULL,'Sales','2020-04-10','0000-00-00',1234567890),('M00008','Bertram','Persen',NULL,NULL,NULL,NULL,NULL,NULL,'Sales','2020-04-10','0000-00-00',1234567890),('M00009','Bertram','Persen',NULL,NULL,NULL,NULL,NULL,NULL,'Sales','2020-04-10','0000-00-00',1234567890),('M00010','Bertram','Persen',NULL,NULL,NULL,NULL,NULL,NULL,'Sales','2020-04-10','0000-00-00',1234567890),('p12345','Martin','Bobsen',NULL,NULL,NULL,NULL,NULL,NULL,'Sales',NULL,'0000-00-00',NULL);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cdio`@`%`*/ /*!50003 TRIGGER Employee_ID_Insert BEFORE INSERT ON Employee 
FOR EACH ROW 
Begin
	INSERT INTO Employee_seq VALUES (NULL);
	SET NEW.EmployeeID = CONCAT ('M', LPAD(LAST_INSERT_ID(), 5, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Employee_seq`
--

DROP TABLE IF EXISTS `Employee_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee_seq` (
  `Employee_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Employee_seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_seq`
--

LOCK TABLES `Employee_seq` WRITE;
/*!40000 ALTER TABLE `Employee_seq` DISABLE KEYS */;
INSERT INTO `Employee_seq` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `Employee_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `FullPurchase`
--

DROP TABLE IF EXISTS `FullPurchase`;
/*!50001 DROP VIEW IF EXISTS `FullPurchase`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `FullPurchase` (
  `PurchaseOrderID` tinyint NOT NULL,
  `SupplierID` tinyint NOT NULL,
  `OrderDate` tinyint NOT NULL,
  `DateOfReceipt` tinyint NOT NULL,
  `DateOfPayment` tinyint NOT NULL,
  `ProductID` tinyint NOT NULL,
  `Amount` tinyint NOT NULL,
  `PurchasePrice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!50001 DROP VIEW IF EXISTS `Invoice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Invoice` (
  `SalesOrderID` tinyint NOT NULL,
  `ProductID` tinyint NOT NULL,
  `Details` tinyint NOT NULL,
  `Amount` tinyint NOT NULL,
  `SalesPrice` tinyint NOT NULL,
  `TotalLinePrice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `ProductID` char(6) NOT NULL,
  `Details` varchar(200) DEFAULT NULL,
  `HTMLDescription` varchar(200) DEFAULT NULL,
  `Image` varchar(25) DEFAULT NULL,
  `SupplierID` char(6) DEFAULT NULL,
  `PurchasePrice` int(11) NOT NULL,
  `SalesPrice` int(11) NOT NULL,
  `StockQuantity` int(11) DEFAULT NULL,
  `TransportSC` varchar(30) DEFAULT NULL,
  `TransportCC` varchar(30) DEFAULT NULL,
  `ProductName` varchar(25) NOT NULL,
  `ProductType` varchar(25) NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `SupplierID` (`SupplierID`),
  KEY `ProductType` (`ProductType`),
  CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`),
  CONSTRAINT `Product_ibfk_2` FOREIGN KEY (`ProductType`) REFERENCES `ProductType` (`ProductType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES ('P50001',NULL,NULL,NULL,NULL,1000000,500000,NULL,NULL,NULL,'Something','Lokomotiv'),('P50002',NULL,NULL,NULL,NULL,1000000,500000,NULL,NULL,NULL,'Something','Lokomotiv');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cdio`@`%`*/ /*!50003 TRIGGER Product_ID_Insert BEFORE INSERT ON Product 
FOR EACH ROW 
BEGIN
	INSERT INTO Product_seq VALUES (NULL);
	SET NEW.ProductID = CONCAT ('P', LPAD(LAST_INSERT_ID(), 5, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ProductType`
--

DROP TABLE IF EXISTS `ProductType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductType` (
  `ProductType` varchar(25) NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `HTMLDescription` varchar(200) DEFAULT NULL,
  `Image` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ProductType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductType`
--

LOCK TABLES `ProductType` WRITE;
/*!40000 ALTER TABLE `ProductType` DISABLE KEYS */;
INSERT INTO `ProductType` VALUES ('Lokomotiv',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ProductType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_seq`
--

DROP TABLE IF EXISTS `Product_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product_seq` (
  `Product_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Product_seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_seq`
--

LOCK TABLES `Product_seq` WRITE;
/*!40000 ALTER TABLE `Product_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PurchaseOrder`
--

DROP TABLE IF EXISTS `PurchaseOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PurchaseOrder` (
  `PurchaseOrderID` char(6) NOT NULL,
  `SupplierID` char(6) NOT NULL,
  `OrderDate` date NOT NULL,
  `DateOfReceipt` date DEFAULT NULL,
  `DateOfPayment` date DEFAULT NULL,
  PRIMARY KEY (`PurchaseOrderID`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `PurchaseOrder_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PurchaseOrder`
--

LOCK TABLES `PurchaseOrder` WRITE;
/*!40000 ALTER TABLE `PurchaseOrder` DISABLE KEYS */;
/*!40000 ALTER TABLE `PurchaseOrder` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cdio`@`%`*/ /*!50003 TRIGGER PurchaseOrder_ID_Insert BEFORE INSERT ON PurchaseOrder 
FOR EACH ROW 
BEGIN
	INSERT INTO PurchaseOrder_seq VALUES (NULL);
	SET NEW.PurchaseOrderID = CONCAT ('KO', LPAD(LAST_INSERT_ID(), 5, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `PurchaseOrderLine`
--

DROP TABLE IF EXISTS `PurchaseOrderLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PurchaseOrderLine` (
  `PurchaseOrderID` char(6) NOT NULL,
  `ProductID` char(6) NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  `PurchasePrice` decimal(20,2) DEFAULT NULL,
  KEY `PurchaseOrderID` (`PurchaseOrderID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `PurchaseOrderLine_ibfk_1` FOREIGN KEY (`PurchaseOrderID`) REFERENCES `PurchaseOrder` (`PurchaseOrderID`),
  CONSTRAINT `PurchaseOrderLine_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PurchaseOrderLine`
--

LOCK TABLES `PurchaseOrderLine` WRITE;
/*!40000 ALTER TABLE `PurchaseOrderLine` DISABLE KEYS */;
/*!40000 ALTER TABLE `PurchaseOrderLine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PurchaseOrder_seq`
--

DROP TABLE IF EXISTS `PurchaseOrder_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PurchaseOrder_seq` (
  `PurchaseOrder_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PurchaseOrder_seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PurchaseOrder_seq`
--

LOCK TABLES `PurchaseOrder_seq` WRITE;
/*!40000 ALTER TABLE `PurchaseOrder_seq` DISABLE KEYS */;
INSERT INTO `PurchaseOrder_seq` VALUES (1),(14),(20);
/*!40000 ALTER TABLE `PurchaseOrder_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `PurchasedSupplies`
--

DROP TABLE IF EXISTS `PurchasedSupplies`;
/*!50001 DROP VIEW IF EXISTS `PurchasedSupplies`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `PurchasedSupplies` (
  `SupplierID` tinyint NOT NULL,
  `PurchaseOrderID` tinyint NOT NULL,
  `OrderDate` tinyint NOT NULL,
  `DateOfReceipt` tinyint NOT NULL,
  `DateOfPayment` tinyint NOT NULL,
  `ProductID` tinyint NOT NULL,
  `Amount` tinyint NOT NULL,
  `PurchasePrice` tinyint NOT NULL,
  `SupplierName` tinyint NOT NULL,
  `Address` tinyint NOT NULL,
  `PostalCode` tinyint NOT NULL,
  `City` tinyint NOT NULL,
  `Phone` tinyint NOT NULL,
  `ContactPerson` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SalesOrder`
--

DROP TABLE IF EXISTS `SalesOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SalesOrder` (
  `SalesOrderID` char(7) NOT NULL,
  `CustomerID` char(6) NOT NULL,
  `OrderDate` date NOT NULL,
  `ShippingDate` date DEFAULT NULL,
  `InvoiceDate` date NOT NULL,
  `PaymentDate` date DEFAULT NULL,
  PRIMARY KEY (`SalesOrderID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `SalesOrder_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SalesOrder`
--

LOCK TABLES `SalesOrder` WRITE;
/*!40000 ALTER TABLE `SalesOrder` DISABLE KEYS */;
INSERT INTO `SalesOrder` VALUES ('SO00001','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO00002','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO00003','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO00004','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO00005','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO00006','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO00007','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO00008','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO00009','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO00010','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO00011','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO00012','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO00013','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO00014','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO00015','K00001','2020-01-01',NULL,'2020-01-01',NULL),('SO60002','K00002','2020-01-06','0000-00-00','0000-00-00','0000-00-00'),('SO60003','K00001','2020-01-06','2020-01-06','2020-01-06','2020-01-06');
/*!40000 ALTER TABLE `SalesOrder` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cdio`@`%`*/ /*!50003 TRIGGER SalesOrder_ID_Insert BEFORE INSERT ON SalesOrder 
FOR EACH ROW 
BEGIN
	INSERT INTO SalesOrder_seq VALUES (NULL);
	SET NEW.SalesOrderID = CONCAT ('SO', LPAD(LAST_INSERT_ID(), 5, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `SalesOrderLine`
--

DROP TABLE IF EXISTS `SalesOrderLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SalesOrderLine` (
  `SalesOrderID` char(7) NOT NULL,
  `ProductID` char(6) NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  `SalesPrice` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`SalesOrderID`,`ProductID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `SalesOrderLine_ibfk_1` FOREIGN KEY (`SalesOrderID`) REFERENCES `SalesOrder` (`SalesOrderID`),
  CONSTRAINT `SalesOrderLine_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SalesOrderLine`
--

LOCK TABLES `SalesOrderLine` WRITE;
/*!40000 ALTER TABLE `SalesOrderLine` DISABLE KEYS */;
INSERT INTO `SalesOrderLine` VALUES ('SO60003','P50001',5,1.00);
/*!40000 ALTER TABLE `SalesOrderLine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SalesOrder_seq`
--

DROP TABLE IF EXISTS `SalesOrder_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SalesOrder_seq` (
  `SalesOrder_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`SalesOrder_seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SalesOrder_seq`
--

LOCK TABLES `SalesOrder_seq` WRITE;
/*!40000 ALTER TABLE `SalesOrder_seq` DISABLE KEYS */;
INSERT INTO `SalesOrder_seq` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);
/*!40000 ALTER TABLE `SalesOrder_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier` (
  `SupplierID` char(6) NOT NULL,
  `SupplierName` varchar(25) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `PostalCode` varchar(4) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `Phone` varchar(8) NOT NULL,
  `ContactPerson` char(6) NOT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES ('L00001','Bibob',NULL,NULL,NULL,'12345678','m12345'),('L00002','Victor',NULL,NULL,NULL,'12345678','m12345'),('L00003','Gollum',NULL,NULL,NULL,'12345678','m12345'),('S00005','Micro Inc.','Vej 1','3400','HillCity','12345678',''),('s12345','Martin',NULL,NULL,NULL,'12345678',''),('S40001','Thomas Hohnen',NULL,NULL,NULL,'12345678',''),('S40004','Oliver Poulsen',NULL,NULL,NULL,'12345678','');
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cdio`@`%`*/ /*!50003 TRIGGER Supplier_ID_Insert BEFORE INSERT ON Supplier 
FOR EACH ROW 
BEGIN
	INSERT INTO Supplier_seq VALUES (NULL);
	SET NEW.SupplierID = CONCAT ('L', LPAD(LAST_INSERT_ID(), 5, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `SupplierInfo`
--

DROP TABLE IF EXISTS `SupplierInfo`;
/*!50001 DROP VIEW IF EXISTS `SupplierInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SupplierInfo` (
  `Address` tinyint NOT NULL,
  `PostalCode` tinyint NOT NULL,
  `City` tinyint NOT NULL,
  `Phone` tinyint NOT NULL,
  `SupplierID` tinyint NOT NULL,
  `SupplierName` tinyint NOT NULL,
  `ContactPerson` tinyint NOT NULL,
  `EmployeeID` tinyint NOT NULL,
  `FirstName` tinyint NOT NULL,
  `LastName` tinyint NOT NULL,
  `Salary` tinyint NOT NULL,
  `Title` tinyint NOT NULL,
  `Department` tinyint NOT NULL,
  `StartDate` tinyint NOT NULL,
  `EndDate` tinyint NOT NULL,
  `AccountNo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Supplier_seq`
--

DROP TABLE IF EXISTS `Supplier_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier_seq` (
  `SalesOrder_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`SalesOrder_seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier_seq`
--

LOCK TABLES `Supplier_seq` WRITE;
/*!40000 ALTER TABLE `Supplier_seq` DISABLE KEYS */;
INSERT INTO `Supplier_seq` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `Supplier_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeStamps`
--

DROP TABLE IF EXISTS `TimeStamps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimeStamps` (
  `EmployeeID` char(6) NOT NULL,
  `WorkDate` date NOT NULL,
  `WorkHours` int(11) NOT NULL,
  `WorkStatus` varchar(10) DEFAULT 'oprettet',
  `Notice` varchar(50) DEFAULT NULL,
  `BossID` char(6) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`,`WorkDate`),
  KEY `BossID` (`BossID`),
  CONSTRAINT `TimeStamps_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`),
  CONSTRAINT `TimeStamps_ibfk_2` FOREIGN KEY (`BossID`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeStamps`
--

LOCK TABLES `TimeStamps` WRITE;
/*!40000 ALTER TABLE `TimeStamps` DISABLE KEYS */;
INSERT INTO `TimeStamps` VALUES ('p12345','2020-04-15',8,'oprettet','',NULL);
/*!40000 ALTER TABLE `TimeStamps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!50001 DROP VIEW IF EXISTS `packing_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `packing_list` (
  `SalesOrderID` tinyint NOT NULL,
  `ProductID` tinyint NOT NULL,
  `Details` tinyint NOT NULL,
  `Amount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `timesheet`
--

DROP TABLE IF EXISTS `timesheet`;
/*!50001 DROP VIEW IF EXISTS `timesheet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `timesheet` (
  `EmployeeID` tinyint NOT NULL,
  `WorkDate` tinyint NOT NULL,
  `WorkHours` tinyint NOT NULL,
  `Notice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `timesheet_all`
--

DROP TABLE IF EXISTS `timesheet_all`;
/*!50001 DROP VIEW IF EXISTS `timesheet_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `timesheet_all` (
  `FirstName` tinyint NOT NULL,
  `LastName` tinyint NOT NULL,
  `WorkDate` tinyint NOT NULL,
  `WorkHours` tinyint NOT NULL,
  `WorkStatus` tinyint NOT NULL,
  `StatusFirstName` tinyint NOT NULL,
  `StatusLastName` tinyint NOT NULL,
  `Notice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `Dispatch`
--

/*!50001 DROP TABLE IF EXISTS `Dispatch`*/;
/*!50001 DROP VIEW IF EXISTS `Dispatch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cdio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Dispatch` AS select `SalesOrder`.`CustomerID` AS `CustomerID`,`Customer`.`FirstName` AS `FirstName`,`Customer`.`LastName` AS `LastName`,`Customer`.`Address` AS `Address` from (`SalesOrder` join `Customer` on((`SalesOrder`.`CustomerID` = `Customer`.`CustomerID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `FullPurchase`
--

/*!50001 DROP TABLE IF EXISTS `FullPurchase`*/;
/*!50001 DROP VIEW IF EXISTS `FullPurchase`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cdio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `FullPurchase` AS select `PurchaseOrder`.`PurchaseOrderID` AS `PurchaseOrderID`,`PurchaseOrder`.`SupplierID` AS `SupplierID`,`PurchaseOrder`.`OrderDate` AS `OrderDate`,`PurchaseOrder`.`DateOfReceipt` AS `DateOfReceipt`,`PurchaseOrder`.`DateOfPayment` AS `DateOfPayment`,`PurchaseOrderLine`.`ProductID` AS `ProductID`,`PurchaseOrderLine`.`Amount` AS `Amount`,`PurchaseOrderLine`.`PurchasePrice` AS `PurchasePrice` from (`PurchaseOrder` left join `PurchaseOrderLine` on((`PurchaseOrder`.`PurchaseOrderID` = `PurchaseOrderLine`.`PurchaseOrderID`))) where (`PurchaseOrder`.`PurchaseOrderID` = `PurchaseOrderLine`.`PurchaseOrderID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Invoice`
--

/*!50001 DROP TABLE IF EXISTS `Invoice`*/;
/*!50001 DROP VIEW IF EXISTS `Invoice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cdio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Invoice` AS select `packing_list`.`SalesOrderID` AS `SalesOrderID`,`packing_list`.`ProductID` AS `ProductID`,`packing_list`.`Details` AS `Details`,`packing_list`.`Amount` AS `Amount`,`Product`.`SalesPrice` AS `SalesPrice`,(`packing_list`.`Amount` * `Product`.`SalesPrice`) AS `TotalLinePrice` from (`packing_list` join `Product` on((`packing_list`.`ProductID` = `Product`.`ProductID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `PurchasedSupplies`
--

/*!50001 DROP TABLE IF EXISTS `PurchasedSupplies`*/;
/*!50001 DROP VIEW IF EXISTS `PurchasedSupplies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cdio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `PurchasedSupplies` AS select `FullPurchase`.`SupplierID` AS `SupplierID`,`FullPurchase`.`PurchaseOrderID` AS `PurchaseOrderID`,`FullPurchase`.`OrderDate` AS `OrderDate`,`FullPurchase`.`DateOfReceipt` AS `DateOfReceipt`,`FullPurchase`.`DateOfPayment` AS `DateOfPayment`,`FullPurchase`.`ProductID` AS `ProductID`,`FullPurchase`.`Amount` AS `Amount`,`FullPurchase`.`PurchasePrice` AS `PurchasePrice`,`Supplier`.`SupplierName` AS `SupplierName`,`Supplier`.`Address` AS `Address`,`Supplier`.`PostalCode` AS `PostalCode`,`Supplier`.`City` AS `City`,`Supplier`.`Phone` AS `Phone`,`Supplier`.`ContactPerson` AS `ContactPerson` from (`FullPurchase` join `Supplier` on((`FullPurchase`.`SupplierID` = `Supplier`.`SupplierID`))) where (`FullPurchase`.`SupplierID` = `FullPurchase`.`SupplierID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SupplierInfo`
--

/*!50001 DROP TABLE IF EXISTS `SupplierInfo`*/;
/*!50001 DROP VIEW IF EXISTS `SupplierInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cdio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `SupplierInfo` AS select `Supplier`.`Address` AS `Address`,`Supplier`.`PostalCode` AS `PostalCode`,`Supplier`.`City` AS `City`,`Supplier`.`Phone` AS `Phone`,`Supplier`.`SupplierID` AS `SupplierID`,`Supplier`.`SupplierName` AS `SupplierName`,`Supplier`.`ContactPerson` AS `ContactPerson`,`Employee`.`EmployeeID` AS `EmployeeID`,`Employee`.`FirstName` AS `FirstName`,`Employee`.`LastName` AS `LastName`,`Employee`.`Salary` AS `Salary`,`Employee`.`Title` AS `Title`,`Employee`.`Department` AS `Department`,`Employee`.`StartDate` AS `StartDate`,`Employee`.`EndDate` AS `EndDate`,`Employee`.`AccountNo` AS `AccountNo` from (`Supplier` left join `Employee` on(((`Supplier`.`Address` = `Employee`.`Address`) and (`Supplier`.`PostalCode` = `Employee`.`PostalCode`) and (`Supplier`.`City` = `Employee`.`City`) and (`Supplier`.`Phone` = `Employee`.`Phone`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `packing_list`
--

/*!50001 DROP TABLE IF EXISTS `packing_list`*/;
/*!50001 DROP VIEW IF EXISTS `packing_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cdio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `packing_list` AS select `SalesOrderLine`.`SalesOrderID` AS `SalesOrderID`,`SalesOrderLine`.`ProductID` AS `ProductID`,`Product`.`Details` AS `Details`,`SalesOrderLine`.`Amount` AS `Amount` from (`SalesOrderLine` join `Product` on((`SalesOrderLine`.`ProductID` = `Product`.`ProductID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `timesheet`
--

/*!50001 DROP TABLE IF EXISTS `timesheet`*/;
/*!50001 DROP VIEW IF EXISTS `timesheet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cdio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `timesheet` AS select `TimeStamps`.`EmployeeID` AS `EmployeeID`,`TimeStamps`.`WorkDate` AS `WorkDate`,`TimeStamps`.`WorkHours` AS `WorkHours`,`TimeStamps`.`Notice` AS `Notice` from `TimeStamps` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `timesheet_all`
--

/*!50001 DROP TABLE IF EXISTS `timesheet_all`*/;
/*!50001 DROP VIEW IF EXISTS `timesheet_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cdio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `timesheet_all` AS select `E`.`FirstName` AS `FirstName`,`E`.`LastName` AS `LastName`,`T`.`WorkDate` AS `WorkDate`,`T`.`WorkHours` AS `WorkHours`,`T`.`WorkStatus` AS `WorkStatus`,`C`.`FirstName` AS `StatusFirstName`,`C`.`LastName` AS `StatusLastName`,`T`.`Notice` AS `Notice` from ((`Employee` `E` join `Employee` `C`) join `TimeStamps` `T`) where ((`E`.`EmployeeID` = `T`.`EmployeeID`) and (`T`.`BossID` = `C`.`EmployeeID`) and (curdate() between `E`.`StartDate` and `E`.`EndDate`) and (curdate() between `C`.`StartDate` and `C`.`EndDate`)) order by `T`.`WorkDate` */;
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

-- Dump completed on 2020-04-16 16:50:51
