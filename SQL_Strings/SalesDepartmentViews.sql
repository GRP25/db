USE dbprojekt;

CREATE VIEW Dispatch
AS SELECT SalesOrder.CustomerID, Customer.FirstName, Customer.LastName, Customer.Address FROM SalesOrder
INNER JOIN Customer ON SalesOrder.CustomerID = Customer.CustomerID;

SELECT * FROM Dispatch;

CREATE VIEW Invoice
AS SELECT packing_list.SalesOrderID, packing_list.ProductID, packing_list.Details, packing_list.Amount, Product.SalesPrice, packing_list.Amount*Product.SalesPrice 'TotalLinePrice' FROM packing_list
INNER JOIN Product ON packing_list.ProductID = Product.ProductID;

SELECT * FROM Invoice;

SELECT * FROM packing_list;