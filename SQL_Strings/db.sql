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
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `postal_code` varchar(4) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `phone` varchar(8) NOT NULL,
  `credit_limit` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

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
  `TlfNumber` varchar(8) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `Title` varchar(25) DEFAULT NULL,
  `Department` varchar(25) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `ProductID` char(6) NOT NULL,
  `Details` varchar(50) DEFAULT NULL,
  `HTMLDescription` varchar(50) DEFAULT NULL,
  `Image` varchar(25) DEFAULT NULL,
  `SupplierID` char(6) DEFAULT NULL,
  `PurchasePrice` int(30) NOT NULL,
  `SalesPrice` int(30) NOT NULL,
  `StockQuantity` int(10) DEFAULT NULL,
  `TransportSC` varchar(30) DEFAULT NULL,
  `TransportCC` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
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

--
-- Table structure for table `PurchaseOrderLine`
--

DROP TABLE IF EXISTS `PurchaseOrderLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PurchaseOrderLine` (
  `PurchaseOrderID` char(6) NOT NULL,
  `ProductID` char(6) NOT NULL,
  `Amount` int(10) DEFAULT NULL,
  `PurchasePrice` int(30) DEFAULT NULL,
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
-- Table structure for table `SalesOrder`
--

DROP TABLE IF EXISTS `SalesOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SalesOrder` (
  `SalesOrderID` char(7) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ShippingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `BillingDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `PaymentDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`SalesOrderID`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `SalesOrder_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SalesOrder`
--

LOCK TABLES `SalesOrder` WRITE;
/*!40000 ALTER TABLE `SalesOrder` DISABLE KEYS */;
/*!40000 ALTER TABLE `SalesOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SalesOrderLine`
--

DROP TABLE IF EXISTS `SalesOrderLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SalesOrderLine` (
  `SalesOrderID` char(7) NOT NULL,
  `ProductID` char(6) NOT NULL,
  `Amount` int(10) DEFAULT NULL,
  `SalesPrice` int(30) DEFAULT NULL,
  KEY `SalesOrderID` (`SalesOrderID`),
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
/*!40000 ALTER TABLE `SalesOrderLine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier` (
  `SupplierID` char(6) NOT NULL,
  `SupplierName` varchar(25) DEFAULT NULL,
  `ContactPerson` varchar(25) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `PostalCode` varchar(4) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `TlfNumber` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeStamps`
--

DROP TABLE IF EXISTS `TimeStamps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimeStamps` (
  `EmployeeID` char(6) NOT NULL,
  `WorkDate` date DEFAULT NULL,
  `WorkHours` int(2) DEFAULT NULL,
  `WorkStatus` varchar(10) DEFAULT NULL,
  `Notice` varchar(30) DEFAULT NULL,
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `TimeStamps_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeStamps`
--

LOCK TABLES `TimeStamps` WRITE;
/*!40000 ALTER TABLE `TimeStamps` DISABLE KEYS */;
/*!40000 ALTER TABLE `TimeStamps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-14 17:26:13
