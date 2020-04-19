USE dbprojekt;

CREATE VIEW Dispatch
AS SELECT SalesOrder.CustomerID, Customer.FirstName, Customer.LastName, Customer.Address FROM SalesOrder
INNER JOIN Customer ON SalesOrder.CustomerID = Customer.CustomerID;

SELECT * FROM Dispatch;

CREATE VIEW Invoice
AS SELECT SalesOrderLine.SalesOrderID, Product.ProductID, Product.ProductName, SalesOrderLine.Amount, SalesOrderLine.SalesPrice, SalesOrderLine.Amount*SalesOrderLine.SalesPrice 'TotalLinePrice' FROM SalesOrderLine
INNER JOIN Product ON SalesOrderLine.ProductID = Product.ProductID;

CREATE VIEW packing_list
AS SELECT SalesOrderLine.SalesOrderID, SalesOrderLine.ProductID, Product.ProductName, SalesOrderLine.Amount FROM SalesOrderLine
INNER JOIN Product ON SalesOrderLine.ProductID=Product.ProductID;

SELECT * FROM Invoice;

SELECT * FROM packing_list;

------- Invoice with total line
CREATE VIEW Invoice AS
(SELECT SalesOrderLine.SalesOrderID, SalesOrderLine.ProductID, Product.ProductName, SalesOrderLine.Amount, SalesOrderLine.SalesPrice, SalesOrderLine.Amount*SalesOrderLine.SalesPrice 'TotalLinePrice' FROM SalesOrderLine
INNER JOIN Product ON SalesOrderLine.ProductID = Product.ProductID )
UNION
(SELECT SalesOrderID, 'Total', null, null, null, SUM(Amount*SalesPrice) FROM SalesOrderLine
GROUP BY SalesOrderID)



-------- Procedures -------
DELIMITER $$
CREATE PROCEDURE SendOrder( ID CHAR(7))
BEGIN 
	UPDATE SalesOrder
    SET InvoiceDate = curdate(), ShippingDate = curdate()
    WHERE SalesOrderID = ID;
    
    SELECT ProductID, Details, Amount, SalesPrice, TotalLinePrice FROM Invoice WHERE SalesOrderID = ID;
END $$

##DROP PROCEDURE PaymentRegister;

DELIMITER $$
CREATE PROCEDURE PaymentRegister( ID CHAR(7))
BEGIN
	UPDATE SalesOrder
    SET PaymentDate = curdate()
    WHERE SalesOrderID = ID;
END$$

call SendOrder('SO00020');

Select * From SalesOrder