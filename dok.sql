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
  `Country` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('K00001','Thomas','hohnen','Bygaden 28','Brøn',NULL,'86256438','ks23@gmail.com',100000.00,'Danmark'),('K00010','Bente','Bent','Istedgade 1','1302','København K','23445422','bb@gmail.com',123456.00,'Danmark'),('K00011','Katja','Kaj','Islands Brygge','2300','København S','33421123','kk@gmail.com',122345.00,'Danmark'),('K00012','Svampe','Bob','Nordhavn 10','1901','København Ø','99231234','sb@gmail.com',331232.00,'Danmark'),('K00013','Skipper','Bent','Nørrebrogade 3','1802','København N','99887766','sb2@gmail.com',12.00,'Danmark'),('K00014','Ole','Lukøje','Jagtvej 4','1409','København N','11111111','ol@gmail.com',999999.00,'Danmark');
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
Begin
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_seq`
--

LOCK TABLES `Customer_seq` WRITE;
/*!40000 ALTER TABLE `Customer_seq` DISABLE KEYS */;
INSERT INTO `Customer_seq` VALUES (1),(10),(11),(12),(13),(14),(15);
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
INSERT INTO `Department` VALUES ('Admin'),('Purchases'),('Sales');
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
  `HourlyWage` int(11) DEFAULT NULL,
  `Title` varchar(25) DEFAULT NULL,
  `Department` varchar(10) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `AcountNo` int(11) NOT NULL,
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
INSERT INTO `Employee` VALUES ('M00001','Malte','Petersen','Amagerbrogade 17','2300','København S','20589011',40000,250,'Fulltime','Admin','2020-04-13','2050-01-01',1234567890),('M00002','Lise','Jacobsen','DelfinGade 22','1325','København K','25608999',0,150,'Parttime','Admin','2020-04-13','2050-01-01',1234567890),('M00003','Frederik','Tomsen','Sankt Peders Stræde 9','1453','København K','80335080',0,220,'Parttime','Admin','2020-04-13','2050-01-01',1234567890),('M00004','Anders','Bentsen','Silkegade 1','1113','København V','20256070',70000,250,'Boss','Admin','2020-04-13','2050-01-01',1234567890),('M00005','Christine','Dahl','Grundtvigsvej 58','1864','København C','50408890',40000,250,'Boss','Sales','2020-04-13','2050-01-01',1234567890),('M00006','Hans','Christensen','Kanstanievej 23','1876','København C','25259070',30000,170,'Fulltime','Sales','2020-04-13','2050-01-01',1234567890),('M00007','Ole','Hansen','Niels Ebbesesn vej 5','1957','København K','70906242',32000,160,'Fulltime','Sales','2020-04-13','2050-01-01',1234567890),('M00008','Iben','Leth','Rhodosvej 9','2250','København V','94720764',0,200,'Parttime','Sales','2020-04-13','2050-01-01',1234567890),('M00009','Hans Peter','Mortensen','Acaciavej 4','2867','København K','77808210',0,200,'Parttime','Sales','2020-04-13','2050-01-01',1234567890),('M00010','Leif','Jensen','Gammelmosvej 182','2800','Kgs. Lyngby','80206099',0,180,'Parttime','Sales','2020-04-13','2050-01-01',1234567890),('M00011','Morten','Petersen','Hjorthøj 10','2800','Kgs. Lyngby','90887240',0,180,'Parttime','Sales','2020-04-13','2050-01-01',1234567890),('M00012','Eva Anette','Frederiksen','Henrik Ibsens Vej 5','1866','København C','60779020',80000,250,'Boss','Purchases','2020-04-13','2050-01-01',1234567890),('M00013','Viggo','Alberg','Kochsvej 10','1812','København C','22405260',40000,210,'Fulltime','Purchases','2020-04-13','2050-01-01',1234567890),('M00014','Ea','Fluvholm','Falkonergårdsvej 8','1952','København C','40428010',0,180,'Parttime','Purchases','2020-04-13','2050-01-01',1234567890);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_seq`
--

LOCK TABLES `Employee_seq` WRITE;
/*!40000 ALTER TABLE `Employee_seq` DISABLE KEYS */;
INSERT INTO `Employee_seq` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16);
/*!40000 ALTER TABLE `Employee_seq` ENABLE KEYS */;
UNLOCK TABLES;

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
  `ProductName` tinyint NOT NULL,
  `Amount` tinyint NOT NULL,
  `SalesPrice` tinyint NOT NULL,
  `TotalLinePrice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `MarketingCatalog`
--

DROP TABLE IF EXISTS `MarketingCatalog`;
/*!50001 DROP VIEW IF EXISTS `MarketingCatalog`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `MarketingCatalog` (
  `ProductID` tinyint NOT NULL,
  `ProductType` tinyint NOT NULL,
  `ProductName` tinyint NOT NULL,
  `Details` tinyint NOT NULL,
  `Price` tinyint NOT NULL
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
  `ProductName` varchar(25) NOT NULL,
  `ProductType` varchar(25) NOT NULL,
  `Details` varchar(200) DEFAULT NULL,
  `HTMLDescription` varchar(200) DEFAULT NULL,
  `Image` varchar(25) DEFAULT NULL,
  `SupplierID` char(6) DEFAULT NULL,
  `PurchasePrice` int(11) NOT NULL,
  `SalesPrice` int(11) NOT NULL,
  `StockQuantity` int(11) DEFAULT NULL,
  `TransportSC` varchar(30) DEFAULT NULL,
  `TransportCC` varchar(30) DEFAULT NULL,
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
INSERT INTO `Product` VALUES ('P00001','DSB MY100','dieseltrain','Flot Märklin DSB lokomotiv fra 1998',NULL,NULL,'L00004',1250,2499,10,NULL,NULL),('P00002','SBB Class C 5/6 \"Elefant\"','steamtrain','This is a placeholder describtion',NULL,NULL,'L00004',1450,3599,12,NULL,NULL);
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
INSERT INTO `ProductType` VALUES ('dieseltrain','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam porttitor, purus dignissim tincidunt ultrices, quam metus placerat nisi, ac cursus libero quam vel felis. Duis id metus tincidunt, conval',NULL,NULL),('steamtrain','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam porttitor, purus dignissim tincidunt ultrices, quam metus placerat nisi, ac cursus libero quam vel felis. Duis id metus tincidunt, conval',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_seq`
--

LOCK TABLES `Product_seq` WRITE;
/*!40000 ALTER TABLE `Product_seq` DISABLE KEYS */;
INSERT INTO `Product_seq` VALUES (1),(2),(4),(5),(6);
/*!40000 ALTER TABLE `Product_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PurchaseOrder`
--

DROP TABLE IF EXISTS `PurchaseOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PurchaseOrder` (
  `PurchaseOrderID` char(7) NOT NULL,
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
INSERT INTO `PurchaseOrder` VALUES ('KO00006','L00004','2020-04-20','2020-04-20','2020-04-20'),('KO00008','L00004','2020-05-20','2020-05-20','2020-05-20'),('KO00009','L00004','2020-04-20','2020-04-20','2020-04-20'),('KO00010','L00004','2020-06-20','2020-06-20','2020-06-20'),('KO00011','L00004','2020-06-21','2020-06-21','2020-06-21'),('KO00012','L00004','2020-06-22','2020-06-22','2020-06-22'),('KO00013','L00004','2020-06-23','2020-06-23','2020-06-23'),('KO00014','L00004','2020-04-20','2020-04-22','2020-04-22'),('KO00015','L00004','2020-04-20','2020-04-23','2020-04-23'),('KO00016','L00004','2020-04-20','2020-04-24','2020-04-24'),('KO00017','L00005','2020-04-20','2020-04-26','2020-04-26'),('KO00018','L00005','2020-04-20','2020-04-20','2020-04-27'),('KO00019','L00005','2020-04-20','2020-04-25','2020-05-25'),('KO00020','L00006','2020-04-20','2020-04-28','2020-04-28'),('KO00021','L00004','2020-04-20','2020-04-26','2020-04-26'),('KO00022','L00006','2020-04-20','2020-04-29','2020-04-29');
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
  `PurchaseOrderID` char(7) NOT NULL,
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
INSERT INTO `PurchaseOrderLine` VALUES ('KO00006','P00002',25,500000.00),('KO00009','P00002',5,1000000.00),('KO00011','P00002',200000,30.00),('KO00006','P00002',353,35335353.00),('KO00006','P00002',454,454545454.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PurchaseOrder_seq`
--

LOCK TABLES `PurchaseOrder_seq` WRITE;
/*!40000 ALTER TABLE `PurchaseOrder_seq` DISABLE KEYS */;
INSERT INTO `PurchaseOrder_seq` VALUES (6),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22);
/*!40000 ALTER TABLE `PurchaseOrder_seq` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `SalesOrder` VALUES ('SO00001','K00001','2020-04-20','2020-04-20','2020-04-20','2020-04-20'),('SO00002','K00001','2020-04-20','2020-04-20','2020-04-20','2020-04-20');
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
    SET NEW.OrderDate = curdate();
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
INSERT INTO `SalesOrderLine` VALUES ('SO00001','P00001',1,2499.00),('SO00001','P00002',5,3599.00);
/*!40000 ALTER TABLE `SalesOrderLine` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`cdio`@`%`*/ /*!50003 TRIGGER InsertSalesPrice BEFORE INSERT ON SalesOrderLine
FOR EACH ROW
BEGIN
	DECLARE n INT;

	SELECT SalesPrice INTO n
	FROM Product WHERE ProductID = NEW.ProductID;

    SET NEW.SalesPrice = n;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `SalesOrder_seq`
--

DROP TABLE IF EXISTS `SalesOrder_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SalesOrder_seq` (
  `SalesOrder_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`SalesOrder_seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SalesOrder_seq`
--

LOCK TABLES `SalesOrder_seq` WRITE;
/*!40000 ALTER TABLE `SalesOrder_seq` DISABLE KEYS */;
INSERT INTO `SalesOrder_seq` VALUES (1),(2);
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
  `ContactPerson` char(6) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `PostalCode` varchar(4) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `Phone` varchar(8) NOT NULL,
  PRIMARY KEY (`SupplierID`),
  KEY `ContactPerson` (`ContactPerson`),
  CONSTRAINT `Supplier_ibfk_1` FOREIGN KEY (`ContactPerson`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES ('L00004','Gebr. Märklin & Cie. GmbH','M00002','Stuttgarter strasse 55-57','3033','Göppingen','71616080'),('L00005','Naumann Fleischer AG','M00013','Leobnerstrasse 42','8043','Graz','06501327'),('L00006','De Clercq Associations','M00014','Rue des Honnelles 281','2040','Zandvliet','04791327');
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
-- Table structure for table `Supplier_seq`
--

DROP TABLE IF EXISTS `Supplier_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier_seq` (
  `SalesOrder_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`SalesOrder_seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier_seq`
--

LOCK TABLES `Supplier_seq` WRITE;
/*!40000 ALTER TABLE `Supplier_seq` DISABLE KEYS */;
INSERT INTO `Supplier_seq` VALUES (2),(3),(4),(5),(6);
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
  `WorkStatus` varchar(10) DEFAULT NULL,
  `Notice` varchar(30) DEFAULT NULL,
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
INSERT INTO `TimeStamps` VALUES ('M00002','2020-04-20',20,'payed','','M00004'),('M00002','2020-04-21',10,'payed','','M00004'),('M00004','2020-04-20',10,'payed','','M00004'),('M00006','2020-04-20',16,'payed','','M00005'),('M00008','2020-04-20',16,'payed','','M00005'),('M00011','2020-04-20',14,'payed','test',NULL),('M00013','2020-04-20',0,'payed','','M00012');
/*!40000 ALTER TABLE `TimeStamps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `boss`
--

DROP TABLE IF EXISTS `boss`;
/*!50001 DROP VIEW IF EXISTS `boss`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `boss` (
  `EmployeeID` tinyint NOT NULL,
  `Department` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `login`
--

DROP TABLE IF EXISTS `login`;
/*!50001 DROP VIEW IF EXISTS `login`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `login` (
  `EmployeeID` tinyint NOT NULL,
  `Title` tinyint NOT NULL,
  `Department` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
  `ProductName` tinyint NOT NULL,
  `Amount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll` (
  `EmployeeID` char(6) DEFAULT NULL,
  `FirstName` varchar(25) DEFAULT NULL,
  `LastName` varchar(25) DEFAULT NULL,
  `Department` varchar(10) DEFAULT NULL,
  `Title` varchar(25) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `HourlyWage` int(11) DEFAULT NULL,
  `HoursWorked` int(11) DEFAULT NULL,
  `payout` int(11) DEFAULT NULL,
  `PaymentStatus` varchar(10) DEFAULT NULL,
  `Acount` int(11) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES ('M00002','Lise','Jacobsen','Admin','Parttime',0,150,30,4500,'Payed',1234567890,'2020-04-20'),('M00004','Anders','Bentsen','Admin','Boss',70000,250,10,72500,'Payed',1234567890,'2020-04-20'),('M00006','Hans','Christensen','Sales','Fulltime',30000,170,16,32720,'Payed',1234567890,'2020-04-20'),('M00008','Iben','Leth','Sales','Parttime',0,200,16,3200,'Payed',1234567890,'2020-04-20'),('M00011','Morten','Petersen','Sales','Parttime',0,180,14,2520,'Payed',1234567890,'2020-04-20'),('M00013','Viggo','Alberg','Purchases','Fulltime',40000,210,0,40000,'Payed',1234567890,'2020-04-20');
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Temporary table structure for view `timesheet_boss`
--

DROP TABLE IF EXISTS `timesheet_boss`;
/*!50001 DROP VIEW IF EXISTS `timesheet_boss`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `timesheet_boss` (
  `EmployeeID` tinyint NOT NULL,
  `WorkDate` tinyint NOT NULL,
  `WorkHours` tinyint NOT NULL,
  `WorkStatus` tinyint NOT NULL,
  `Notice` tinyint NOT NULL,
  `BossID` tinyint NOT NULL,
  `Department` tinyint NOT NULL
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
/*!50001 VIEW `Invoice` AS (select `SalesOrderLine`.`SalesOrderID` AS `SalesOrderID`,`SalesOrderLine`.`ProductID` AS `ProductID`,`Product`.`ProductName` AS `ProductName`,`SalesOrderLine`.`Amount` AS `Amount`,`SalesOrderLine`.`SalesPrice` AS `SalesPrice`,(`SalesOrderLine`.`Amount` * `SalesOrderLine`.`SalesPrice`) AS `TotalLinePrice` from (`SalesOrderLine` join `Product` on((`SalesOrderLine`.`ProductID` = `Product`.`ProductID`)))) union (select `SalesOrderLine`.`SalesOrderID` AS `SalesOrderID`,'Total' AS `Total`,NULL AS `NULL`,NULL AS `NULL`,NULL AS `NULL`,sum((`SalesOrderLine`.`Amount` * `SalesOrderLine`.`SalesPrice`)) AS `SUM(Amount*SalesPrice)` from `SalesOrderLine` group by `SalesOrderLine`.`SalesOrderID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `MarketingCatalog`
--

/*!50001 DROP TABLE IF EXISTS `MarketingCatalog`*/;
/*!50001 DROP VIEW IF EXISTS `MarketingCatalog`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cdio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `MarketingCatalog` AS select `Product`.`ProductID` AS `ProductID`,`Product`.`ProductType` AS `ProductType`,`Product`.`ProductName` AS `ProductName`,`Product`.`Details` AS `Details`,`Product`.`SalesPrice` AS `Price` from `Product` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `boss`
--

/*!50001 DROP TABLE IF EXISTS `boss`*/;
/*!50001 DROP VIEW IF EXISTS `boss`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cdio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `boss` AS select `Employee`.`EmployeeID` AS `EmployeeID`,`Employee`.`Department` AS `Department` from `Employee` where (`Employee`.`Title` = 'Boss') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `login`
--

/*!50001 DROP TABLE IF EXISTS `login`*/;
/*!50001 DROP VIEW IF EXISTS `login`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cdio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `login` AS select `Employee`.`EmployeeID` AS `EmployeeID`,`Employee`.`Title` AS `Title`,`Employee`.`Department` AS `Department` from `Employee` */;
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
/*!50001 VIEW `packing_list` AS select `SalesOrderLine`.`SalesOrderID` AS `SalesOrderID`,`SalesOrderLine`.`ProductID` AS `ProductID`,`Product`.`ProductName` AS `ProductName`,`SalesOrderLine`.`Amount` AS `Amount` from (`SalesOrderLine` join `Product` on((`SalesOrderLine`.`ProductID` = `Product`.`ProductID`))) */;
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

--
-- Final view structure for view `timesheet_boss`
--

/*!50001 DROP TABLE IF EXISTS `timesheet_boss`*/;
/*!50001 DROP VIEW IF EXISTS `timesheet_boss`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cdio`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `timesheet_boss` AS select `t`.`EmployeeID` AS `EmployeeID`,`t`.`WorkDate` AS `WorkDate`,`t`.`WorkHours` AS `WorkHours`,`t`.`WorkStatus` AS `WorkStatus`,`t`.`Notice` AS `Notice`,`t`.`BossID` AS `BossID`,`e`.`Department` AS `Department` from (`TimeStamps` `t` join `Employee` `e` on((`e`.`EmployeeID` = `t`.`EmployeeID`))) */;
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

-- Dump completed on 2020-04-20 23:41:58
