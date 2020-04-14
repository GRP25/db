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

CREATE TABLE `TimeStamps` (
  `EmployeeID` char(6) NOT NULL,
  `WorkDate` date DEFAULT NULL,
  `WorkHours` int(2) DEFAULT NULL,
  `WorkStatus` varchar(10) DEFAULT NULL,
  `Notice` varchar(30) DEFAULT NULL,
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `TimeStamps_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
