/* CREATION OF USERS */

--Admin Department
CREATE USER 'CEO'@'%' IDENTIFIED BY '1234';
CREATE USER 'Admin'@'%' IDENTIFIED BY '1234';

--Sales Department
CREATE USER 'CSO'@'%' IDENTIFIED BY '1234';
CREATE USER 'Sales'@'%' IDENTIFIED BY '1234';

--Purchases Department
CREATE USER 'CPO'@'%' IDENTIFIED BY '1234';
CREATE USER 'Purchases'@'%' IDENTIFIED BY '1234';

--Login user 
CREATE USER 'login'@'%' IDENTIFIED BY '1234';

/* CREATION OF THE DATABASE */
CREATE DATABASE dbprojekt;
USE dbprojekt;

/* CREATION OF SEQUENCE TABLES */
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


/* CREATION OF THE TABLES*/ 

CREATE TABLE Department (
    DepartmentName varchar(10) NOT NULL,
    PRIMARY KEY (DepartmentName)
);

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

CREATE TABLE ProductType (
    ProductType varchar(25) NOT NULL,
    Description varchar(200) DEFAULT NULL,
    HTMLDescription varchar(200) DEFAULT NULL,
    Image varchar(25) DEFAULT NULL,
    PRIMARY KEY (ProductType)
);

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

CREATE TABLE PurchaseOrder (
  PurchaseOrderID char(7) NOT NULL,
  SupplierID char(6) NOT NULL,
  OrderDate date NOT NULL,
  DateOfReceipt date DEFAULT NULL,
  DateOfPayment date DEFAULT NULL,
  PRIMARY KEY (PurchaseOrderID),
  FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID)
) ;

CREATE TABLE PurchaseOrderLine (
  PurchaseOrderID char(7) NOT NULL,
  ProductID char(6) NOT NULL,
  Amount INT DEFAULT NULL,
  PurchasePrice DECIMAL(20,2) DEFAULT NULL,
  FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrder (PurchaseOrderID),
  FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
) ;

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

/* CREATION OF THE VIEWs */
CREATE VIEW login AS
SELECT EmployeeID, Title, Department FROM Employee;

CREATE VIEW Dispatch
AS SELECT SalesOrder.CustomerID, Customer.FirstName, Customer.LastName, Customer.Address FROM SalesOrder
INNER JOIN Customer ON SalesOrder.CustomerID = Customer.CustomerID;

CREATE VIEW packing_list
AS SELECT SalesOrderLine.SalesOrderID, SalesOrderLine.ProductID, Product.ProductName, SalesOrderLine.Amount FROM SalesOrderLine
INNER JOIN Product ON SalesOrderLine.ProductID=Product.ProductID;

CREATE VIEW Invoice AS
(SELECT SalesOrderLine.SalesOrderID, SalesOrderLine.ProductID, Product.ProductName, SalesOrderLine.Amount, SalesOrderLine.SalesPrice, SalesOrderLine.Amount*SalesOrderLine.SalesPrice 'TotalLinePrice' FROM SalesOrderLine
INNER JOIN Product ON SalesOrderLine.ProductID = Product.ProductID )
UNION
(SELECT SalesOrderID, 'Total', null, null, null, SUM(Amount*SalesPrice) FROM SalesOrderLine
GROUP BY SalesOrderID);

CREATE VIEW timesheet AS 
SELECT EmployeeID, WorkDate, WorkHours, Notice, WorkStatus
FROM TimeStamps;

CREATE VIEW boss AS
SELECT EmployeeID, Department FROM Employee WHERE Title = 'Boss';

CREATE VIEW timesheet_boss AS
SELECT t.*, e.Department
FROM TimeStamps AS t
INNER JOIN Employee AS e ON e.EmployeeID = t.EmployeeID

create view timesheet_all as
select E.FirstName, E.LastName, T.WorkDate, T.WorkHours, T.WorkStatus, C.FirstName AS StatusFirstName, C.Lastname AS StatusLastName, Notice
FROM Employee AS E, Employee AS C, TimeStamps AS T
WHERE E.EmployeeID = T.EmployeeID AND T.BossID = C.EmployeeID 
AND curdate() BETWEEN E.StartDate AND E.EndDate AND curdate() BETWEEN C.StartDate AND C.EndDate
order by WorkDate; 

CREATE VIEW MarketingCatalog AS
SELECT ProductID, ProductType, ProductName, Details, SalesPrice AS Price
FROM Product;

/* CREATE THE TRIGGERS */
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


CREATE TRIGGER InsertSalesPrice BEFORE INSERT ON SalesOrderLine
FOR EACH ROW
BEGIN
	DECLARE n INT;
	SELECT SalesPrice INTO n
	FROM Product WHERE ProductID = NEW.ProductID;
    SET NEW.SalesPrice = n;
END$$

/* CREATION OF THE PROCEDURES */ 
Delimiter //

CREATE procedure PaySalary (in var_startDate date, in var_endDate date)
BEGIN
    INSERT INTO payroll (EmployeeID,FirstName,LastName,Department,Title,Salary,HourlyWage,HoursWorked, payout, PaymentStatus, acount, PaymentDate)
    SELECT 	TimeStamps.EmployeeID, 
			Employee.FirstName, 
            Employee.LastName, 
            Employee.Department, 
            Employee.Title, 
            Employee.Salary,
            Employee.HourlyWage, 
            SUM(TimeStamps.WorkHours), 
            SUM((Employee.HourlyWage*TimeStamps.WorkHours)+Employee.Salary), 
            'Payed',
			Employee.AcountNo,
            curdate()
	FROM TimeStamps 
    INNER JOIN Employee ON TimeStamps.EmployeeID=Employee.EmployeeID WHERE TimeStamps.WorkDate>=var_startDate AND TimeStamps.WorkDate<=var_endDate  
    GROUP BY TimeStamps.EmployeeID;
   UPDATE TimeStamps SET WorkStatus = 'payed' 
   WHERE WorkStatus = 'approved' AND WorkDate <= var_endDate;
    END //
Delimiter ;



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

/* CREATING PRIVILEGES FOR USERS */

GRANT ALL       ON *.*                  TO 'CEO'@'%';
GRANT EXECUTE   ON dbprojekt.*          TO 'CSO'@'%';
GRANT EXECUTE   ON dbprojekt.*          TO 'Sales'@'%';

GRANT ALL       ON Department           TO 'CEO'@'%';
GRANT ALL       ON Employee             TO 'CEO'@'%';
GRANT ALL       ON ProductType          TO 'CEO'@'%';
GRANT ALL       ON timesheet            TO 'CEO'@'%';
GRANT ALL       ON TimeStamps           TO 'CEO'@'%';
GRANT ALL       ON Product              TO 'CEO'@'%';
GRANT ALL       ON payroll              TO 'CEO'@'%';
GRANT ALL       ON timesheet_all        TO 'CEO'@'%';
GRANT ALL       ON timesheet_boss       TO 'CEO'@'%';
GRANT ALL       ON MarketingCatalog     TO 'CEO'@'%';

GRANT ALL       ON Employee             TO 'Admin'@'%';
GRANT ALL       ON ProductType          TO 'Admin'@'%';
GRANT ALL       ON Product              TO 'Admin'@'%';
GRANT ALL       ON timesheet_all        TO 'Admin'@'%';
GRANT ALL       ON timesheet            TO 'Admin'@'%';
GRANT ALL       ON MarketingCatalog     TO 'Admin'@'%';

GRANT ALL       ON PaymentRegister      TO 'CSO'@'%';
GRANT ALL       ON SendOrder            TO 'CSO'@'%';
GRANT ALL       ON Customer             TO 'CSO'@'%';
GRANT ALL       ON timesheet_boss       TO 'CSO'@'%';
GRANT ALL       ON Dispatch             TO 'CSO'@'%';
GRANT ALL       ON SalesOrder           TO 'CSO'@'%';
GRANT ALL       ON SalesOrderLine       TO 'CSO'@'%';
GRANT ALL       ON packing_list         TO 'CSO'@'%';
GRANT ALL       ON Invoice              TO 'CSO'@'%';
GRANT ALL       ON timesheet            TO 'CSO'@'%';

GRANT ALL       ON timesheet_boss       TO 'CPO'@'%';
GRANT ALL       ON timesheet            TO 'CPO'@'%';
GRANT ALL       ON PurchaseOrder        TO 'CPO'@'%';
GRANT ALL       ON PurchaseOrderLine    TO 'CPO'@'%';
GRANT ALL       ON ProductType          TO 'CPO'@'%';
GRANT ALL       ON Supplier             TO 'CPO'@'%';
GRANT ALL       ON Product              TO 'CPO'@'%';

GRANT ALL       ON ProductType          TO 'Purchases'@'%';
GRANT ALL       ON Supplier             TO 'Purchases'@'%';
GRANT ALL       ON Product              TO 'Purchases'@'%';
GRANT ALL       ON PurchaseOrder        TO 'Purchases'@'%';
GRANT ALL       ON PurchaseOrderLine    TO 'Purchases'@'%';
GRANT ALL       ON timesheet            TO 'Purchases'@'%';

GRANT SELECT    ON login                TO 'login'@'%';

GRANT ALL       ON SendOrder            TO 'Sales'@'%';
GRANT ALL       ON PaymentRegister      TO 'Sales'@'%';
GRANT ALL       ON Invoice              TO 'Sales'@'%';
GRANT ALL       ON packing_list         TO 'Sales'@'%';
GRANT ALL       ON Dispatch             TO 'Sales'@'%';
GRANT ALL       ON SalesOrderLine       TO 'Sales'@'%';
GRANT SELECT    ON Product              TO 'Sales'@'%';
GRANT SELECT    ON ProductType          TO 'Sales'@'%';
GRANT ALL       ON Customer             TO 'Sales'@'%';
GRANT ALL       ON SalesOrder           TO 'Sales'@'%';
GRANT ALL       ON timesheet            TO 'Sales'@'%';


INSERT INTO Department (DepartmentName) VALUES ('Sales');
INSERT INTO Department (DepartmentName) VALUES ('Purchases');
INSERT INTO Department (DepartmentName) VALUES ('Admin');


-- CREATE ALL EMPLOYEES
INSERT INTO `Employee` (`FirstName`, `LastName`,`Address`,`PostalCode`,`City`,`Phone`,`Salary`,`HourlyWage`,`Department`,`StartDate`,`EndDate`,`AcountNo`,`Title`) VALUES ('Malte','Petersen','Amagerbrogade 17', '2300','København S','20589011',40000,250,'Admin',20200413,20500101,1234567890,'Fulltime');
INSERT INTO `Employee` (`FirstName`, `LastName`,`Address`,`PostalCode`,`City`,`Phone`,`Salary`,`HourlyWage`,`Department`,`StartDate`,`EndDate`,`AcountNo`,`Title`) VALUES ('Lise','Jacobsen','DelfinGade 22','1325','København K', '25608999',0,150,'Admin',20200413,20500101,1234567890,'Parttime');
INSERT INTO `Employee` (`FirstName`, `LastName`,`Address`,`PostalCode`,`City`,`Phone`,`Salary`,`HourlyWage`,`Department`,`StartDate`,`EndDate`,`AcountNo`,`Title`) VALUES ('Frederik','Tomsen','Sankt Peders Stræde 9','1453','Københanv K','80335070',0,220,'Admin',20200413,20500101,1234567890,'Parttime');
INSERT INTO `Employee` (`FirstName`, `LastName`,`Address`,`PostalCode`,`City`,`Phone`,`Salary`,`HourlyWage`,`Department`,`StartDate`,`EndDate`,`AcountNo`,`Title`) VALUES ('Anders','Bentsen','Silkegade 1','1113','København V','20256070',70000,250,'Admin',20200413,20500101,1234567890,'Boss');


INSERT INTO `Employee` (`FirstName`, `LastName`,`Address`,`PostalCode`,`City`,`Phone`,`Salary`,`HourlyWage`,`Department`,`StartDate`,`EndDate`,`AcountNo`,`Title`) VALUES ('Christine','Dahl','Grundtvigsvej 58','1864','København C','50408890',40000,250,'Sales',20200413,20500101,1234567890,'Boss'); 
INSERT INTO `Employee` (`FirstName`, `LastName`,`Address`,`PostalCode`,`City`,`Phone`,`Salary`,`HourlyWage`,`Department`,`StartDate`,`EndDate`,`AcountNo`,`Title`) VALUES ('Hans','Christensen','Kastanievej 23','1876','København C','25252525',30000, 170,'Sales',20200413, 20500101,1234567890,'Fulltime'); 
INSERT INTO `Employee` (`FirstName`, `LastName`,`Address`,`PostalCode`,`City`,`Phone`,`Salary`,`HourlyWage`,`Department`,`StartDate`,`EndDate`,`AcountNo`,`Title`) VALUES ('Ole','Hansen','Niels Ebbesens Vej 5','1957','København K','70906242', 32000, 160,'Sales',20200413,20500101,1234567890,'Fulltime'); 
INSERT INTO `Employee` (`FirstName`, `LastName`,`Address`,`PostalCode`,`City`,`Phone`,`Salary`,`HourlyWage`,`Department`,`StartDate`,`EndDate`,`AcountNo`,`Title`) VALUES ('Iben','Leth','Rhodosvej 9','2250','København V','94720764',0, 200,'Sales',20200413,20500101,1234567890,'Parttime'); 
INSERT INTO `Employee` (`FirstName`, `LastName`,`Address`,`PostalCode`,`City`,`Phone`,`Salary`,`HourlyWage`,`Department`,`StartDate`,`EndDate`,`AcountNo`,`Title`) VALUES ('Hans Peter','Mortensen','Acaciavej 4','1867','København K','77808210',0, 200,'Sales',20200413,20500101,1234567890,'Parttime'); 
INSERT INTO `Employee` (`FirstName`, `LastName`,`Address`,`PostalCode`,`City`,`Phone`,`Salary`,`HourlyWage`,`Department`,`StartDate`,`EndDate`,`AcountNo`,`Title`) VALUES ('Leif','Jensen','Gammelmosevej 182','2800','Lyngby','80206099',0,180,'Sales',20200413,20500101,1234567890,'Parttime'); 
INSERT INTO `Employee` (`FirstName`, `LastName`,`Address`,`PostalCode`,`City`,`Phone`,`Salary`,`HourlyWage`,`Department`,`StartDate`,`EndDate`,`AcountNo`,`Title`) VALUES ('Morten','Petersen','Hjorthøj 10', '2800','Lyngby','90887240', 0, 180,'Sales',20200413,20500101,1234567890,'Parttime'); 


INSERT INTO `Employee` (`FirstName`, `LastName`,`Address`,`PostalCode`,`City`,`Phone`,`Salary`,`HourlyWage`,`Department`,`StartDate`,`EndDate`,`AcountNo`,`Title`) VALUES ('Eva Anette','Frederiksen','Henrik Ibsens Vej 5','1866','København C','60779020',80000,250,'Purchases',20200413,20500101,1234567890,'Boss'); 
INSERT INTO `Employee` (`FirstName`, `LastName`,`Address`,`PostalCode`,`City`,`Phone`,`Salary`,`HourlyWage`,`Department`,`StartDate`,`EndDate`,`AcountNo`,`Title`) VALUES ('Viggo','Alberg','Kochsvej 10', '1812','København C','22405260', 40000, 210,'Purchases',20200413,20500101,1234567890,'Fulltime'); 
INSERT INTO `Employee` (`FirstName`, `LastName`,`Address`,`PostalCode`,`City`,`Phone`,`Salary`,`HourlyWage`,`Department`,`StartDate`,`EndDate`,`AcountNo`,`Title`) VALUES ('Ea','Fluvholm','Falkonergårdsvej','1952','København C','40428010',0, 180,'Purchases',20200413,20500101,1234567890,'Parttime'); 

INSERT INTO `Customer` (`FirstName`,`LastName`,`Address`,`City`,`PostalCode`,`Country`,`Phone`,`Mail`,`CreditLimit`) 
VALUES ('Kurt','Svendsen','Bygaden 28','Brøndby',2605,'Danmark',86256438,'ks23@gmail.com',100000);

INSERT INTO `Customer` (`FirstName`,`LastName`,`Address`,`City`,`PostalCode`,`Country`,`Phone`,`Mail`,`CreditLimit`) 
VALUES ('Bente','Bent','Istedgade 1','København K',1302,'Danmark',23445422,'bb@gmail.com',123456);

INSERT INTO `Customer` (`FirstName`,`LastName`,`Address`,`City`,`PostalCode`,`Country`,`Phone`,`Mail`,`CreditLimit`) 
VALUES ('Katja','Kaj','Islands Brygge','København S',2300,'Danmark',33421123,'kk@gmail.com',122345);

INSERT INTO `Customer` (`FirstName`,`LastName`,`Address`,`City`,`PostalCode`,`Country`,`Phone`,`Mail`,`CreditLimit`) 
VALUES ('Svampe','Bob','Nordhavn 10','København Ø',1901,'Danmark',99231234,'sb@gmail.com',331232);

INSERT INTO `Customer` (`FirstName`,`LastName`,`Address`,`City`,`PostalCode`,`Country`,`Phone`,`Mail`,`CreditLimit`) 
VALUES ('Skipper','Bent','Nørrebrogade 3','København N',1802,'Danmark',99887766,'sb2@gmail.com',12);

INSERT INTO `Customer` (`FirstName`,`LastName`,`Address`,`City`,`PostalCode`,`Country`,`Phone`,`Mail`,`CreditLimit`) 
VALUES ('Ole','Lukøje','Jagtvej 4','København N',1409,'Danmark',11111111,'ol@gmail.com',999999);

INSERT INTO Supplier(SupplierName, ContactPerson, Address, PostalCode, City, Phone)
VALUES ('Gebr. Märklin & Cie. GmbH', 'M00002', 'Stuttgarter strasse 55-57', '3033', 'Göppingen', '71616080');

INSERT INTO ProductType (ProductType, Description, HTMLDescription, Image) VALUES ('dieseltrain', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam porttitor, purus dignissim tincidunt ultrices, quam metus placerat nisi, ac cursus libero quam vel felis. Duis id metus tincidunt, convallis mauris at, lacinia enim. Praesent bibendum magna magna, ut tempor nibh.',null,null);
INSERT INTO ProductType (ProductType, Description, HTMLDescription, Image) VALUES ('steamtrain', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam porttitor, purus dignissim tincidunt ultrices, quam metus placerat nisi, ac cursus libero quam vel felis. Duis id metus tincidunt, convallis mauris at, lacinia enim. Praesent bibendum magna magna, ut tempor nibh.',null,null);

INSERT INTO Product(ProductName, ProductType,Details, HTMLDescription, Image, SupplierID, purchasePrice, SalesPrice,StockQuantity, TransportSC, TransportCC) VALUES ('DSB MY100', 'dieseltrain','Flot Märklin DSB lokomotiv fra 1998', null,null,'L40001',1250,2499,10,null,null);
INSERT INTO Product(ProductName, ProductType,Details, HTMLDescription, Image, SupplierID, purchasePrice, SalesPrice,StockQuantity, TransportSC, TransportCC) VALUES ('SBB Class C 5/6 "Elefant"', 'steamtrain','This is a placeholder describtion', null,null,'L40001',1450,3599,12,null,null);

INSERT INTO SalesOrder(CustomerID, OrderDate, ShippingDate, InvoiceDate, PaymentDate)
VALUES ('K00001',20200420,20200420,20200420,20200420);

INSERT INTO SalesOrderLine(SalesOrderID, ProductID, Amount, SalesPrice)
VALUES('SO00001','P00001',1,10000.00);

INSERT INTO SalesOrderLine(SalesOrderID, ProductID, Amount, SalesPrice)
VALUES('SO00001','P00002',5,35000.00);

INSERT INTO TimeStamps(EmployeeID, WorkDate, WorkHours, WorkStatus, Notice, BossID)
VALUES('M00006',20200420,16,'Godkendt','',(SELECT EmployeeID FROM boss WHERE Department = 'Sales'));

INSERT INTO TimeStamps(EmployeeID, WorkDate, WorkHours, WorkStatus, Notice, BossID)
VALUES('M00002',20200420,20,'Godkendt','',(SELECT EmployeeID FROM boss WHERE Department = 'Admin'));

INSERT INTO TimeStamps(EmployeeID, WorkDate, WorkHours, WorkStatus, Notice, BossID)
VALUES('M00004',20200420,10,'Godkendt','',(SELECT EmployeeID FROM boss WHERE Department = 'Admin'));
