/* Credit limit change to decimal  */


/* Create customer */
INSERT INTO Customer (CustomerID, FirstName, LastName, Address, PostalCode, City, Phone, CreditLimit, Mail) 
VALUES ('K30002', 'Kurt', 'Svendsen', 'Bygaden 28', '2605', 'Brøndby', '86256438', 100000, 'ks23@gmail.com');

/* Alter customer */
UPDATE Customer
SET FirstNAme = 'Some name', LastName = 'Last name', City= 'Frankfurt' /* and so on */
WHERE CustomerID = 'K30002';  /* Enter customer ID */

/* Create Sale  */
INSERT INTO SalesOrder (SalesOrderID, CustomerID, OrderDate, ShippingDate, InvoiceDate, PaymentDate)
VALUES ('SO60002', 'K30002', '2020-01-06', '2020-01-06', '2020-01-06', '2020-01-06');

/* Add Products to the sales order 
	... */



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
