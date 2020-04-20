USE dbprojekt;

INSERT INTO TimeStamps(EmployeeID, WorkDate, WorkHours, WorkStatus, Notice, BossID)
VALUES('M00006',20200420,16,'Godkendt','',(SELECT EmployeeID FROM boss WHERE Department = 'Sales'));

INSERT INTO TimeStamps(EmployeeID, WorkDate, WorkHours, WorkStatus, Notice, BossID)
VALUES('M00002',20200420,20,'Godkendt','',(SELECT EmployeeID FROM boss WHERE Department = 'Admin'));

INSERT INTO TimeStamps(EmployeeID, WorkDate, WorkHours, WorkStatus, Notice, BossID)
VALUES('M00004',20200420,10,'Godkendt','',(SELECT EmployeeID FROM boss WHERE Department = 'Admin'));

UPDATE TimeStamps SET WorkStatus = 'Pending' WHERE WorkStatus = 'Godkendt';

SELECT * FROM TimeStamps;

SELECT * FROM Employee;

SELECT * FROM COTable;

SELECT * FROM boss;

SELECT * FROM timesheet;

SELECT * FROM timesheet_all;