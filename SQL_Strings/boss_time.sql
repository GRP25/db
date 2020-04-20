











CREATE VIEW timesheet_boss AS
SELECT t.*, e.Department
FROM TimeStamps AS t
INNER JOIN Employee AS e ON e.EmployeeID = t.EmployeeID
