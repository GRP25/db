USE dbprojekt;

INSERT INTO SalesOrder(CustomerID, OrderDate, ShippingDate, InvoiceDate, PaymentDate)
VALUES ('K00001',20200420,20200420,20200420,20200420);

INSERT INTO SalesOrderLine(SalesOrderID, ProductID, Amount, SalesPrice)
VALUES('SO00001','P00001',1,10000.00);

INSERT INTO SalesOrderLine(SalesOrderID, ProductID, Amount, SalesPrice)
VALUES('SO00001','P00002',5,35000.00);

SELECT * FROM Customer;

SELECT * FROM SalesOrder;

SELECT * FROM SalesOrderLine;

SELECT * FROM Product;