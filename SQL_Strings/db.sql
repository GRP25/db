/*OK*/
CREATE TABLE Department (
    DepartmentName varchar(10) NOT NULL,
    BossID char(6) DEFAULT NULL,
    FOREIGN KEY BossID REFERENCES Employee(EmployeeID)
)

CREATE TABLE Customer (
    CustomerID char(7) NOT NULL,
    FirstName varchar(25) NOT NULL,
    LastName varchar(25) NOT NULL,
    Address varchar(50) DEFAULT NULL,
    PostalCode char(4) DEFAULT NULL,
    City varchar(25) DEFAULT NULL,
    Phone varchar(8) NOT NULL,
    CreditLimit INT NOT NULL,
    PRIMARY KEY (customer_id)
) 

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
    StartDate date DEFAULT NULL,
    EndDate date,
    FOREIGN KEY (Department) REFERENCES Department(DepartmentName)
    PRIMARY KEY (EmployeeID, end_date)
) 

CREATE TABLE Product (
    ProductID char(6) NOT NULL,
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
) 

CREATE TABLE PurchaseOrder (
  PurchaseOrderID char(6) NOT NULL,
  SupplierID char(6) NOT NULL,
  OrderDate date NOT NULL,
  DateOfReceipt date DEFAULT NULL,
  DateOfPayment date DEFAULT NULL,
  PRIMARY KEY (PurchaseOrderID),
  FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID)
) 

CREATE TABLE PurchaseOrderLine (
  PurchaseOrderID char(6) NOT NULL,
  ProductID char(6) NOT NULL,
  Amount INT DEFAULT NULL,
  PurchasePrice DECIMAL(20,2) DEFAULT NULL,
  FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrder (PurchaseOrderID),
  FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
) 

CREATE TABLE SalesOrder (
  SalesOrderID char(7) NOT NULL,
  CustomerID INT NOT NULL,
  OrderDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ShippingDate timestamp DEFAULT NULL
  InvoiceDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PaymentDate timestamp DEFAULT NULL
  PRIMARY KEY (SalesOrderID),
  FOREIGN KEY (customer_id) REFERENCES Customer (customer_id)
) 

CREATE TABLE SalesOrderLine (
    SalesOrderID char(7) NOT NULL,
    ProductID char(6) NOT NULL,
    Amount INT DEFAULT NULL,
    SalesPrice DECIMAL(20,2) DEFAULT NULL,
    FOREIGN KEY (SalesOrderID) REFERENCES SalesOrder (SalesOrderID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
    PRIMARY KEY(SalesOrderID, ProductID)
) 

CREATE TABLE Supplier (
    SupplierID char(6) NOT NULL,
    SupplierName varchar(25) NOT NULL,
    ContactPerson varchar(25) NOT NULL,
    Address varchar(50) DEFAULT NULL,
    PostalCode varchar(4) DEFAULT NULL,
    City varchar(25) DEFAULT NULL,
    Phone varchar(8) NOT NULL,
    PRIMARY KEY (SupplierID)
) 

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
) 
