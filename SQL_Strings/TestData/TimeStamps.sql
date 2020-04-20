USE dbprojekt;


UPDATE TimeStamps SET WorkStatus = 'Pending' WHERE WorkStatus = 'Godkendt';

SELECT * FROM TimeStamps;

SELECT * FROM Employee;

SELECT * FROM COTable;

SELECT * FROM boss;

SELECT * FROM timesheet;

SELECT * FROM timesheet_all;
