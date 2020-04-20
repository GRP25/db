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
