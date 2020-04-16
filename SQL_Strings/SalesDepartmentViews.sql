USE dbprojekt;

CREATE VIEW Dispatch
AS SELECT SalesOrder.CustomerID, Customer.FirstName, Customer.LastName, Customer.Address FROM SalesOrder
INNER JOIN Customer ON SalesOrder.CustomerID = Customer.CustomerID;

SELECT * FROM Dispatch;

CREATE VIEW Invoice
AS SELECT SalesOrderLine.SalesOrderID, Product.ProductID, Product.Details, SalesOrderLine.Amount, SalesOrderLine.SalesPrice, SalesOrderLine.Amount*Product.SalesPrice 'TotalLinePrice' FROM SalesOrderLine
INNER JOIN Product ON SalesOrderLine.ProductID = Product.ProductID;

CREATE VIEW packing_list
AS SELECT SalesOrderLine.SalesOrderID, SalesOrderLine.ProductID, Product.Details, SalesOrderLine.Amount FROM SalesOrderLine
INNER JOIN Product ON SalesOrderLine.ProductID=Product.ProductID;

SELECT * FROM Invoice;

SELECT * FROM packing_list;