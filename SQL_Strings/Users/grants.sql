GRANT SELECT ON Employee TO 'login'@'%';

-- for CEO
GRANT ALL ON `Department`   TO 'CEO'@'%';
GRANT ALL ON `Employee`     TO 'CEO'@'%';
GRANT ALL ON `COTable`      TO 'CEO'@'%';
GRANT ALL ON `TimeStamps`   TO 'CEO'@'%';
GRANT ALL ON `Product`      TO 'CEO'@'%';
GRANT ALL ON `ProductType`  TO 'CEO'@'%';
GRANT ALL ON `payroll`      TO 'CEO'@'%';

-- for admin
GRANT ALL ON `Employee`     TO 'Admin'@'%';
GRANT ALL ON `Product`      TO 'Admin'@'%';
GRANT ALL ON `ProductType`  TO 'Admin'@'%';

GRANT CREATE USER           TO 'Admin'@'%';
GRANT CREATE USER           TO 'CEO'@'%';

-- Admin og CEO skal have adgang til kontorhåndbog (VIEWS) 

--for CSO
GRANT ALL ON Customers TO 'CSO'@'%';
GRANT ALL ON SalesOrder TO 'CSO'@'%';
GRANT ALL ON SalesOrderLine TO 'CSO'@'%';
-- views
GRANT ALL ON packing_list TO 'CSO'@'%';
GRANT ALL ON Invoice TO 'CSO'@'%';
GRANT ALL ON Dispatch TO 'CSO'@'%';
GRANT ALL ON timesheet TO 'CSO'@'%';
GRANT ALL ON timesheet_boss TO 'CSO'@'%';

--for Sales
GRANT SELECT ON Product TO 'Sales'@'%';
GRANT ALL ON Customers TO 'Sales'@'%';
GRANT ALL ON SalesOrder TO 'Sales'@'%';
GRANT ALL ON SalesOrderLine TO 'Sales'@'%';
--views
GRANT ALL ON packing_list TO 'Sales'@'%';
GRANT ALL ON Invoice TO 'Sales'@'%';
GRANT ALL ON Dispatch TO 'Sales'@'%';
GRANT ALL ON timesheet TO 'Sales'@'%';



-- for CPO
GRANT ALL ON PurchaseOrder TO 'CPO'@'%';
GRANT ALL ON PurchaseOrderLine TO 'CPO'@'%';
GRANT ALL ON Supplier TO 'CPO'@'%';
GRANT ALL ON Product TO 'CPO'@'%';
GRANT ALL ON timesheet TO 'CPO'@'%';
GRANT ALL ON timesheet_boss TO 'CPO'@'%';

-- for Purchases
GRANT ALL ON PurchaseOrder TO 'Purchases'@'%';
GRANT ALL ON PurchaseOrderLine TO 'Purchases'@'%';
GRANT ALL ON Supplier TO 'Purchases'@'%';
GRANT ALL ON Product TO 'Purchases'@'%';
GRANT ALL ON timesheet TO 'Purchases'@'%';
-- GRANT <+permission+> ON <+table+>TO '<+user+>'@'%';
