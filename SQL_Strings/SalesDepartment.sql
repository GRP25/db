USE dbprojekt;

DROP TABLE Customer_seq;
DROP TABLE SalesOrderLine;
DROP TABLE SalesOrder;
DROP TABLE Customer;

/* Create tables statements  --------------*/
CREATE TABLE Customer_seq (
	Customer_seq_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Customer (
    CustomerID char(6) NOT NULL,
    FirstName varchar(25) NOT NULL,
    LastName varchar(25) NOT NULL,
    Address varchar(50) DEFAULT NULL,
    PostalCode char(4) DEFAULT NULL,
    City varchar(25) DEFAULT NULL,
    Phone varchar(8) NOT NULL,
    Mail varchar(50),
    CreditLimit DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (CustomerID)
);

CREATE TABLE SalesOrder (
  SalesOrderID char(7) NOT NULL,
  CustomerID char(6) NOT NULL,
  OrderDate date NOT NULL,
  ShippingDate date DEFAULT NULL,
  InvoiceDate date NOT NULL,
  PaymentDate date DEFAULT NULL,
  PRIMARY KEY (SalesOrderID),
  FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);

CREATE TABLE SalesOrderLine (
    SalesOrderID char(7) NOT NULL,
    ProductID char(6) NOT NULL,
    Amount INT DEFAULT NULL,
    SalesPrice DECIMAL(20,2) DEFAULT NULL,
    FOREIGN KEY (SalesOrderID) REFERENCES SalesOrder (SalesOrderID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
    PRIMARY KEY(SalesOrderID, ProductID)
) ;

/* End of create tables ----------- */

/* Creating triggers --------------*/
DELIMITER $$
CREATE TRIGGER Customer_ID_Insert BEFORE INSERT ON Customer 
FOR EACH ROW 
BEGIN
	INSERT INTO Customer_seq VALUES (NULL);
	SET NEW.CustomerID = CONCAT ('K', LPAD(LAST_INSERT_ID(), 5, '0'));
END $$
/* End of creating triggers ------------- */

/* Creating VIEWs -----------*/
DROP VIEW packing_list;

CREATE VIEW packing_list 
AS SELECT SalesOrderLine.SalesOrderID, SalesOrderLine.ProductID, Product.Details, SalesOrderLine.Amount FROM SalesOrderLine 
INNER JOIN Product ON SalesOrderLine.ProductID=Product.ProductID;

/* end of creatings views --------*/

/* Using view with where condition */
SELECT * FROM packing_list WHERE SalesOrderID='SO60002';


/* Inserting test data  */
INSERT INTO Customer (CustomerID, FirstName, LastName, Address, PostalCode, City, Phone, CreditLimit, Mail) 
VALUES ('K30001', 'Oliver', 'Poulsen', 'Bygaden 28', '2605', 'Brøndby', '86256438', 100000, 'ks23@gmail.com');

INSERT INTO Customer (FirstName, LastName, Address, PostalCode, City, Phone, CreditLimit, Mail) 
VALUES ('Thomas', 'Hohnen', 'Bygaden 28', '2605', 'Brøndby', '86256438', 100000, 'ks23@gmail.com');

/* Create customer */
INSERT INTO Customer (CustomerID, FirstName, LastName, Address, PostalCode, City, Phone, CreditLimit, Mail) 
VALUES ('K30002', 'Kurt', 'Svendsen', 'Bygaden 28', '2605', 'Brøndby', '86256438', 100000, 'ks23@gmail.com');

/* Alter customer */
UPDATE Customer
SET FirstNAme = 'Danny', LastName = 'boy', City= 'Frankfurt' /* and so on */
WHERE CustomerID = 'K00002';  /* Enter customer ID */

/* Create Sale  */
INSERT INTO SalesOrder (SalesOrderID, CustomerID, OrderDate, ShippingDate, InvoiceDate, PaymentDate)
VALUES ('SO60002', 'K00002', '2020-01-06', '2020-01-06', '2020-01-06', '2020-01-06');




/* Add Products to the sales order 
	... */
SELECT * FROM Customer;


/* Updating test data for using with the program---------*/
/* Alter Sale  */
UPDATE SalesOrder
SET ShippingDate = 'Some name', InvoiceDate = 'some date', PaymentDate= 'som date' /* and so on */
WHERE SalesOrderID = 'SO60002';  /* Enter SalesOrderID */

/* Alter Sale shipping day */
UPDATE SalesOrder
SET ShippingDate = 'Some name'
WHERE SalesOrderID = 'SO60002';  /* Enter SalesOrderID */

/* Alter invoice date */
UPDATE SalesOrder
SET InvoiceDate = 'some date'
WHERE SalesOrderID = 'SO60002';  /* Enter SalesOrderID */

/* (Alter) Register payment day */
UPDATE SalesOrder
SET PaymentDate= 'som date'
WHERE SalesOrderID = 'SO60002';  /* Enter SalesOrderID */


SELECT * FROM SalesOrder


