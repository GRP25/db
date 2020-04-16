USE dbprojekt;
SHOW databases;
SHOW tables;

/*OK*/
/*DROP TABLE IF EXISTS Empolyee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS PurchaseOrder;
DROP TABLE IF EXISTS PurchaseOrderLine;
DROP TABLE IF EXISTS SalesOrder;
DROP TABLE IF EXISTS SalesOrderLine;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS TimeStamps;*/

CREATE TABLE Department (
    DepartmentName varchar(10) NOT NULL,
    PRIMARY KEY (DepartmentName)
);

CREATE TABLE COTable(
	BossID char(6) DEFAULT NULL,
    DepartmentName varchar(10) NOT NULL,
    FOREIGN KEY (BossID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (DepartmentName) REFERENCES Department(DepartmentName),
    UNIQUE(BossID,DepartmentName) 
) ;

CREATE TABLE Employee (
    EmployeeID char(6),
    FirstName varchar(25) NOT NULL,
    LastName varchar(25) NOT NULL,
    Address varchar(50) DEFAULT NULL,
    PostalCode varchar(4) DEFAULT NULL,
    City varchar(25) DEFAULT NULL,
    Phone varchar(8) DEFAULT NULL,
    Salary INT DEFAULT NULL,
    Title varchar(25) DEFAULT NULL,
    Department varchar(10) NOT NULL,
    StartDate date NOT NULL,
    EndDate date,
    AcountNo INT, NOT NULL
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
    CreditLimit INT NOT NULL,
    PRIMARY KEY (CustomerID)
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
    FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID)
    FOREIGN KEY (ProductType) REFERENCES ProductType (ProductType)
) ;

CREATE TABLE ProductType (
    ProductType varchar(25) NOT NULL,
    Description varchar(200) DEFAULT NULL,
    HTMLDescription varchar(200) DEFAULT NULL,
    Image varchar(25) DEFAULT NULL,
    PRIMARY KEY (ProductType),
)

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
  PurchaseOrderID char(6) NOT NULL,
  ProductID char(6) NOT NULL,
  Amount INT DEFAULT NULL,
  PurchasePrice DECIMAL(20,2) DEFAULT NULL,
  FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrder (PurchaseOrderID),
  FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
) ;

CREATE TABLE SalesOrder (
  SalesOrderID char(7) NOT NULL,
  CustomerID Char(6) NOT NULL,
  OrderDate date NOT NULL,
  ShippingDate date DEFAULT NULL,
  InvoiceDate date NOT NULL,
  PaymentDate date DEFAULT NULL,
  PRIMARY KEY (SalesOrderID),
  FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
) ;

CREATE TABLE SalesOrderLine (
    SalesOrderID char(7) NOT NULL,
    ProductID char(6) NOT NULL,
    Amount INT DEFAULT NULL,
    SalesPrice DECIMAL(20,2) DEFAULT NULL,
    FOREIGN KEY (SalesOrderID) REFERENCES SalesOrder (SalesOrderID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
    PRIMARY KEY(SalesOrderID, ProductID)
) ;

CREATE TABLE Supplier (
    SupplierID char(6) NOT NULL,
    SupplierName varchar(25) NOT NULL,
    ContactPerson char(6) NOT NULL,
    Address varchar(50) DEFAULT NULL,
    PostalCode varchar(4) DEFAULT NULL,
    City varchar(25) DEFAULT NULL,
    Phone varchar(8) NOT NULL,
    FOREIGN KEY (ContactPerson) REFERENCES Employee (EmployeeID)
    PRIMARY KEY (SupplierID)
) ;

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


