-- GRANT SELECT til USER login
-- WHERE `EmployeeID` = ? # I preparedstatement
CREATE VIEW login AS
SELECT `EmployeeID`,`Title`,`Department`
FROM `Employee`;


/* View for employee til at udfylde timesedel */
-- GRANT INSERT & UPDATE til Alle medarbejdere (Admin, Sales, Purchases)
create view timesheet AS
    SELECT EmployeeID, WorkDate, WorkHours, Notice 
    FROM TimeStamps;


/* View for Boss til at se samlede lønudbetalinger */
-- GRANT 

-- WHERE EmployeeID = ?;        # For at se en specifik medarbejder.
-- WHERE Department = ?;        # For at se en specifik Department.
-- WHERE Title = ?;             # For at se en specifik Title.
-- WorkDate BETWEEN ? AND ?;    # I et bestemt tidsinterval.

CREATE VIEW SalaryOverview AS
    SELECT arbejstimer FROM TimeStamps WHERE Status = 'godkendt'
