USE dbprojekt;


INSERT INTO Product (ProductID, ProductName, ProductType, PurchasePrice, SalesPrice)
VALUES ('P50001','Something','Lokomotiv','1000000', '500000');

INSERT INTO Product (ProductID, ProductName, ProductType, PurchasePrice, SalesPrice)
VALUES ('P50002','Something','Lokomotiv','1000000', '500000');

INSERT INTO Supplier (SupplierID, SupplierName, ContactPerson, Phone)
VALUES ('S40001','Thomas Hohnen','Oliver Poulsen','12345678');

INSERT INTO Supplier (SupplierID, SupplierName, ContactPerson, Phone)
VALUES ('S40004','Oliver Poulsen','Thomas Hohnen','12345678');

INSERT INTO SalesOrder (SalesOrderID, CustomerID, OrderDate, ShippingDate, InvoiceDate, PaymentDate)
VALUES ('SO60003', 'K00002', '2020-01-06', '2020-01-06', '2020-01-06', '2020-01-06');

SELECT * FROM SalesOrder;