use dbprojekt;
show tables;
show databases;

CREATE VIEW timesheet AS 
SELECT EmployeeID, WorkDate, WorkHours, Notice
FROM TimeStamps
WHERE 
(EmployeeID = substring_index(current_user(), '@',1));

create view timesheet_all as
select E.FirstName, E.LastName, T.WorkDate, T.WorkHours, T.WorkStatus, C.FirstName AS StatusFirstName, C.Lastname AS StatusLastName, Notice
FROM Employee AS E, Employee AS C, TimeStamps AS T
WHERE E.EmployeeID = T.EmployeeID AND T.BossID = C.EmployeeID 
AND curdate() BETWEEN E.StartDate AND E.EndDate AND curdate() BETWEEN C.StartDate AND C.EndDate
order by WorkDate; 

create role 'CEO','Admin', 'CSO', 'Sales',
'CPO', 'Purchases';

GRANT ALL ON dbprojekt TO 'CEO';
GRANT SELECT, DELETE, INSERT, UPDATE ON dbprojekt.Product TO 'Admin';
GRANT SELECT, DELETE, INSERT, UPDATE ON dbprojekt.ProductType TO 'Admin';

/* Sales department */
GRANT SELECT, DELETE, INSERT, UPDATE ON dbprojekt.Costumer TO 'Admin', 'CSO';
GRANT SELECT ON dbprojekt.Costumer TO 'Sales';

GRANT SELECT, DELETE, INSERT, UPDATE ON dbprojekt.SalesOrder TO 'Admin', 'CSO', 'Sales';
GRANT SELECT, DELETE, INSERT, UPDATE ON dbprojekt.SalesOrderLine TO 'Admin', 'CSO', 'Sales';

/* Purchases department */

GRANT SELECT, DELETE, INSERT, UPDATE ON dbprojekt.Supplier TO 'Admin', 'CPO';
GRANT SELECT ON dbprojekt.Supplier TO 'Purchases';

GRANT SELECT, DELETE, INSERT, UPDATE ON dbprojekt.PurchaseOrder TO 'Admin', 'CPO', 'Purchases';
GRANT SELECT, DELETE, INSERT, UPDATE ON dbprojekt.PurchaseOrderLine TO 'Admin', 'CPO', 'Purchases';

/* Timesheets */ 


SELECT current_role();

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
    Title varchar(25) DEFAULT NULL,
    Department varchar(10) NOT NULL,
    StartDate date DEFAULT NULL,
    EndDate date,
    FOREIGN KEY (Department) REFERENCES Department(DepartmentName),
    PRIMARY KEY (EmployeeID, end_date)
) 