USE dbprojekt;


INSERT INTO Product (ProductID, ProductName, ProductType, PurchasePrice, SalesPrice)
VALUES ('P50001','Something','Lokomotiv','1000000', '500000');

INSERT INTO Product (ProductID, ProductName, ProductType, PurchasePrice, SalesPrice)
VALUES ('P50002','Something','Lokomotiv','1000000', '500000');

INSERT INTO Supplier (SupplierID, SupplierName, ContactPerson, Phone)
VALUES ('S40001','Thomas Hohnen','Oliver Poulsen','12345678');

INSERT INTO Supplier (SupplierID, SupplierName, ContactPerson, Phone)
VALUES ('S40004','Oliver Poulsen','Thomas Hohnen','12345678');

DELETE FROM SalesOrder
WHERE SalesOrderID = 'SO00016';

INSERT INTO SalesOrder (SalesOrderID, CustomerID, OrderDate, ShippingDate, InvoiceDate, PaymentDate)
VALUES ('SO60003', 'K00001', '2020-01-06', '2020-01-06', '2020-01-06', '2020-01-06');

INSERT INTO SalesOrderLine (SalesOrderID, ProductID, Amount, SalesPrice)
VALUES ('SO60003', 'P50001', 5, 1.00);

INSERT INTO SalesOrder(CustomerID,ShippingDate,InvoiceDate,PaymentDate)
VALUES('K00001','2020-01-06','2020-01-06','2020-01-06');

SELECT * FROM SalesOrder;

SELECT * FROM Customer;

SELECT * FROM Product;

SELECT * FROM SalesOrderLine;