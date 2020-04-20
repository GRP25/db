CREATE DATABASE dbprojekt;
USE dbprojekt;

GRANT CREATE USER           TO 'Admin'@'%';
GRANT CREATE USER           TO 'CEO'@'%';

/*Sequence Tables*/
CREATE TABLE Customer_seq (
	Customer_seq_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Employee_seq (
	Employee_seq_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Product_seq (
	Product_seq_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE PurchaseOrder_seq (
	PurchaseOrder_seq_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE SalesOrder_seq (
	SalesOrder_seq_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Supplier_seq (
	SalesOrder_seq_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);


/*Tables*/ 
CREATE TABLE Department (
    DepartmentName varchar(10) NOT NULL,
    PRIMARY KEY (DepartmentName)
);

GRANT ALL ON `Department`   TO 'CEO'@'%';
----

CREATE TABLE Employee (
    EmployeeID char(6),
    FirstName varchar(25) NOT NULL,
    LastName varchar(25) NOT NULL,
    Address varchar(50) DEFAULT NULL,
    PostalCode varchar(4) DEFAULT NULL,
    City varchar(25) DEFAULT NULL,
    Phone varchar(8) DEFAULT NULL,
    Salary INT DEFAULT NULL,
    HourlyWage INT DEFAULT NULL,
    Title varchar(25) DEFAULT NULL,
    Department varchar(10) NOT NULL,
    StartDate date NOT NULL,
    EndDate date,
    AcountNo INT NOT NULL,
    FOREIGN KEY (Department) REFERENCES Department(DepartmentName),
    PRIMARY KEY (EmployeeID, EndDate)
) ;

GRANT ALL ON `Employee`     TO 'CEO'@'%';
GRANT ALL ON `Employee`     TO 'Admin'@'%';
----


CREATE TABLE COTable(
	BossID char(6) DEFAULT NULL,
    DepartmentName varchar(10) NOT NULL,
    FOREIGN KEY (BossID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (DepartmentName) REFERENCES Department(DepartmentName),
    UNIQUE(BossID,DepartmentName) 
) ;

GRANT ALL ON `COTable`      TO 'CEO'@'%';
------

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

GRANT ALL ON Customers TO 'Sales'@'%';
GRANT ALL ON Customers TO 'CSO'@'%';
-----



CREATE TABLE ProductType (
    ProductType varchar(25) NOT NULL,
    Description varchar(200) DEFAULT NULL,
    HTMLDescription varchar(200) DEFAULT NULL,
    Image varchar(25) DEFAULT NULL,
    PRIMARY KEY (ProductType)
);
GRANT ALL ON `ProductType`  TO 'Admin'@'%';
GRANT ALL ON `ProductType`  TO 'CEO'@'%';
GRANT ALL ON `ProductType`  TO 'CPO'@'%';
GRANT ALL ON `ProductType`  TO 'Purchases'@'%';
----

CREATE TABLE Supplier (
    SupplierID char(6) NOT NULL,
    SupplierName varchar(25) NOT NULL,
    ContactPerson char(6) NOT NULL,
    Address varchar(50) DEFAULT NULL,
    PostalCode varchar(4) DEFAULT NULL,
    City varchar(25) DEFAULT NULL,
    Phone varchar(8) NOT NULL,
    FOREIGN KEY (ContactPerson) REFERENCES Employee (EmployeeID),
    PRIMARY KEY (SupplierID)
) ;
GRANT ALL ON Supplier TO 'Purchases'@'%';
GRANT ALL ON Supplier TO 'CPO'@'%';

CREATE TABLE Product (
    ProductID char(6) NOT NULL,
    ProductName varchar(25) NOT NULL,
    ProductType varchar(25) NOT NULL,
    Details varchar(200) DEFAULT NULL,
    HTMLDescription varchar(200) DEFAULT NULL,
    Image varchar(25) DEFAULT NULL,
    SupplierID char(6) DEFAULT NULL,
    PurchasePrice INT NOT NULL,
    SalesPrice INT NOT NULL,
    StockQuantity INT DEFAULT NULL,
    TransportSC varchar(30) DEFAULT NULL,
    TransportCC varchar(30) DEFAULT NULL,
    PRIMARY KEY (ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID),
    FOREIGN KEY (ProductType) REFERENCES ProductType (ProductType)
) ;
GRANT ALL       ON Product TO 'CPO'@'%';
GRANT SELECT    ON Product TO 'Sales'@'%';
GRANT ALL       ON Product TO 'Admin'@'%';
GRANT ALL       ON Product TO 'CEO'@'%';
GRANT ALL       ON Product TO 'Purchases'@'%';

CREATE TABLE PurchaseOrder (
  PurchaseOrderID char(7) NOT NULL,
  SupplierID char(6) NOT NULL,
  OrderDate date NOT NULL,
  DateOfReceipt date DEFAULT NULL,
  DateOfPayment date DEFAULT NULL,
  PRIMARY KEY (PurchaseOrderID),
  FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID)
) ;

GRANT ALL ON PurchaseOrder TO 'CPO'@'%';
GRANT ALL ON PurchaseOrder TO 'Purchases'@'%';
----

CREATE TABLE PurchaseOrderLine (
  PurchaseOrderID char(7) NOT NULL,
  ProductID char(6) NOT NULL,
  Amount INT DEFAULT NULL,
  PurchasePrice DECIMAL(20,2) DEFAULT NULL,
  FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrder (PurchaseOrderID),
  FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
) ;

GRANT ALL ON PurchaseOrderLine TO 'CPO'@'%';
GRANT ALL ON PurchaseOrderLine TO 'Purchases'@'%';
----

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

GRANT ALL ON SalesOrder TO 'CSO'@'%';
GRANT ALL ON SalesOrder TO 'Sales'@'%';
-----

CREATE TABLE SalesOrderLine (
    SalesOrderID char(7) NOT NULL,
    ProductID char(6) NOT NULL,
    Amount INT DEFAULT NULL,
    SalesPrice DECIMAL(20,2) DEFAULT NULL,
    FOREIGN KEY (SalesOrderID) REFERENCES SalesOrder (SalesOrderID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
    PRIMARY KEY(SalesOrderID, ProductID)
) ;

GRANT ALL ON SalesOrderLine TO 'CSO'@'%';
GRANT ALL ON SalesOrderLine TO 'Sales'@'%';

CREATE TABLE TimeStamps (
    EmployeeID char(6) NOT NULL,
    WorkDate date NOT NULL,
    WorkHours INT NOT NULL,
    WorkStatus varchar(10) DEFAULT NULL,
    Notice varchar(30) DEFAULT NULL,
    BossID char(6) DEFAULT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID),
    FOREIGN KEY (BossID) REFERENCES Employee (EmployeeID),
    PRIMARY KEY (EmployeeID, WorkDate)
) ;

GRANT ALL ON `TimeStamps`   TO 'CEO'@'%';
----

CREATE TABLE payroll (
	EmployeeID char(6),
    FirstName varchar(25),
    LastName varchar(25),
    Department varchar(10),
    Title varchar(25),
    Salary int,
    HourlyWage int,
    HoursWorked int,
    payout int,
    status varchar(10),
    PaymentDate date
);

GRANT ALL ON `payroll`      TO 'CEO'@'%';
----


/*--------- VIEWs ---------------*/

CREATE VIEW login AS
SELECT EmployeeID, Title, Department FROM Employee;

GRANT SELECT ON login TO 'login'@'%';
----

CREATE VIEW Dispatch
AS SELECT SalesOrder.CustomerID, Customer.FirstName, Customer.LastName, Customer.Address FROM SalesOrder
INNER JOIN Customer ON SalesOrder.CustomerID = Customer.CustomerID;

GRANT ALL ON Dispatch TO 'CSO'@'%';
GRANT ALL ON Dispatch TO 'Sales'@'%';
----

CREATE VIEW packing_list
AS SELECT SalesOrderLine.SalesOrderID, SalesOrderLine.ProductID, Product.ProductName, SalesOrderLine.Amount FROM SalesOrderLine
INNER JOIN Product ON SalesOrderLine.ProductID=Product.ProductID;

GRANT ALL ON packing_list TO 'CSO'@'%';
GRANT ALL ON packing_list TO 'Sales'@'%';
----

CREATE VIEW Invoice AS
(SELECT SalesOrderLine.SalesOrderID, SalesOrderLine.ProductID, Product.ProductName, SalesOrderLine.Amount, SalesOrderLine.SalesPrice, SalesOrderLine.Amount*SalesOrderLine.SalesPrice 'TotalLinePrice' FROM SalesOrderLine
INNER JOIN Product ON SalesOrderLine.ProductID = Product.ProductID )
UNION
(SELECT SalesOrderID, 'Total', null, null, null, SUM(Amount*SalesPrice) FROM SalesOrderLine
GROUP BY SalesOrderID);

GRANT ALL ON Invoice TO 'CSO'@'%';
GRANT ALL ON Invoice TO 'Sales'@'%';
--

CREATE VIEW timesheet AS 
SELECT EmployeeID, WorkDate, WorkHours, Notice, WorkStatus
FROM TimeStamps;

GRANT ALL ON timesheet TO 'CEO'@'%';
GRANT ALL ON timesheet TO 'CSO'@'%';
GRANT ALL ON timesheet TO 'CPO'@'%';
GRANT ALL ON timesheet TO 'Purchases'@'%';
GRANT ALL ON timesheet TO 'Sales'@'%';

CREATE VIEW timesheet_boss AS
SELECT t.*, e.Department
FROM TimeStamps AS t
INNER JOIN Employee AS e ON e.EmployeeID = t.EmployeeID

GRANT ALL ON timesheet_boss TO 'CSO'@'%';
GRANT ALL ON timesheet_boss TO 'CPO'@'%';
GRANT ALL ON timesheet_boss TO 'CEO'@'%';
----

---Vi ved ikke hvornår vi bruger denne
create view timesheet_all as
select E.FirstName, E.LastName, T.WorkDate, T.WorkHours, T.WorkStatus, C.FirstName AS StatusFirstName, C.Lastname AS StatusLastName, Notice
FROM Employee AS E, Employee AS C, TimeStamps AS T
WHERE E.EmployeeID = T.EmployeeID AND T.BossID = C.EmployeeID 
AND curdate() BETWEEN E.StartDate AND E.EndDate AND curdate() BETWEEN C.StartDate AND C.EndDate
order by WorkDate; 

CREATE VIEW MarketingCatalog AS
SELECT ProductID, ProductType, ProductName, Details, SalesPrice AS Price
FROM Product;


-------- Triggers --------------
DELIMITER $$
CREATE TRIGGER Customer_ID_Insert BEFORE INSERT ON Customer 
FOR EACH ROW 
Begin
	INSERT INTO Customer_seq VALUES (NULL);
	SET NEW.CustomerID = CONCAT ('K', LPAD(LAST_INSERT_ID(), 5, '0'));
END $$

CREATE TRIGGER Employee_ID_Insert BEFORE INSERT ON Employee 
FOR EACH ROW 
Begin
	INSERT INTO Employee_seq VALUES (NULL);
	SET NEW.EmployeeID = CONCAT ('M', LPAD(LAST_INSERT_ID(), 5, '0'));
END $$

CREATE TRIGGER Product_ID_Insert BEFORE INSERT ON Product 
FOR EACH ROW 
BEGIN
	INSERT INTO Product_seq VALUES (NULL);
	SET NEW.ProductID = CONCAT ('P', LPAD(LAST_INSERT_ID(), 5, '0'));
END $$

CREATE TRIGGER PurchaseOrder_ID_Insert BEFORE INSERT ON PurchaseOrder 
FOR EACH ROW 
BEGIN
	INSERT INTO PurchaseOrder_seq VALUES (NULL);
	SET NEW.PurchaseOrderID = CONCAT ('KO', LPAD(LAST_INSERT_ID(), 5, '0'));
END $$

CREATE TRIGGER SalesOrder_ID_Insert BEFORE INSERT ON SalesOrder 
FOR EACH ROW 
BEGIN
	INSERT INTO SalesOrder_seq VALUES (NULL);
	SET NEW.SalesOrderID = CONCAT ('SO', LPAD(LAST_INSERT_ID(), 5, '0'));
    SET NEW.OrderDate = curdate();
END $$

CREATE TRIGGER Supplier_ID_Insert BEFORE INSERT ON Supplier 
FOR EACH ROW 
BEGIN
	INSERT INTO Supplier_seq VALUES (NULL);
	SET NEW.SupplierID = CONCAT ('L', LPAD(LAST_INSERT_ID(), 5, '0'));
END $$

/*VIEWs*/ 

CREATE VIEW timesheet_boss AS
SELECT t.EmployeeID t.WorkDate t.WorkHours t.WorkStatus t.Notice t.BossID e.Department
FROM TimeStamps as t
INNER JOIN Employee as e

CREATE VIEW Dispatch
AS SELECT SalesOrder.CustomerID, Customer.FirstName, Customer.LastName, Customer.Address FROM SalesOrder
INNER JOIN Customer ON SalesOrder.CustomerID = Customer.CustomerID;

--HVORFOR STÅR DEN HER HER?
CREATE TRIGGER InsertSalesPrice BEFORE INSERT ON SalesOrderLine
FOR EACH ROW
BEGIN
	DECLARE n INT;
	SELECT SalesPrice INTO n
	FROM Product WHERE ProductID = NEW.ProductID;
    SET NEW.SalesPrice = n;
END$$

CREATE VIEW timesheet AS 
SELECT EmployeeID, WorkDate, WorkHours, Notice
FROM TimeStamps;

create view timesheet_all as
select E.FirstName, E.LastName, T.WorkDate, T.WorkHours, T.WorkStatus, C.FirstName AS StatusFirstName, C.Lastname AS StatusLastName, Notice
FROM Employee AS E, Employee AS C, TimeStamps AS T
WHERE E.EmployeeID = T.EmployeeID AND T.BossID = C.EmployeeID 
AND curdate() BETWEEN E.StartDate AND E.EndDate AND curdate() BETWEEN C.StartDate AND C.EndDate
order by WorkDate; 

GRANT ALL ON timesheet_all TO 'Admin'@'%';
GRANT ALL ON timesheet_all TO 'CEO'@'%';
----

CREATE VIEW MarketingCatalog AS
SELECT ProductID, ProductType, ProductName, Details, SalesPrice AS Price
FROM Product;


/*PROCEDURE*/ 

Delimiter //
CREATE procedure PaySalary (in var_startDate date, in var_endDate date)
	begin
    INSERT INTO payroll (EmployeeID,FirstName,LastName,Department,Title,Salary,HourlyWage,HoursWorked, payout, acount, PaymentDate)
    SELECT 	TimeStamps.EmployeeID, 
			Employee.FirstName, 
            Employee.LastName, 
            Employee.Department, 
            Employee.Title, 
            Employee.Salary,
            Employee.HourlyWage, 
            SUM(TimeStamps.WorkHours), 
            SUM((Employee.HourlyWage*TimeStamps.WorkHours)+Employee.Salary), 
			Employee.AcountNo,
            curdate()
	FROM TimeStamps 
    INNER JOIN Employee ON TimeStamps.EmployeeID=Employee.EmployeeID WHERE TimeStamps.WorkDate>=var_startDate AND TimeStamps.WorkDate<=var_endDate  
    GROUP BY TimeStamps.EmployeeID;
   UPDATE TimeStamps SET WorkStatus = 'payed' 
   WHERE WorkStatus = 'approved' AND WorkDate <= var_endDate;
    END //



DELIMITER $$
CREATE PROCEDURE SendOrder( IN ID CHAR(7))
BEGIN 
	UPDATE SalesOrder
    SET InvoiceDate = curdate(), ShippingDate = curdate()
    WHERE SalesOrderID = ID;
    
    SELECT ProductID, Details, Amount, SalesPrice, TotalLinePrice FROM Invoice WHERE SalesOrderID = ID;
END $$

DELIMITER $$
CREATE PROCEDURE PaymentRegister( IN ID CHAR(7))
BEGIN
	UPDATE SalesOrder
    SET PaymentDate = curdate()
    WHERE SalesOrderID = ID;
END$$
