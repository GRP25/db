INSERT INTO dbprojekt.`Department`(`DepartmentName`) VALUES ('Sales')

INSERT INTO dbprojekt.`Employee`(
    `EmployeeID`,`FirstName`,`LastName`,`Department`) 
    VALUES ('p12345','Martin','Bobsen','Sales')


/* View for employee til at udfylde timesedel */
create view timesheet AS
    SELECT EmployeeID, WorkDate, WorkHours, Notice 
    FROM TimeStamps;


/* View for at se en måneds samlede løn udbetaling */
CREATE VIEW SalaryOverview AS




/*Regitrer arbejdstimer*/
INSERT INTO dbprojekt.timesheet (`EmployeeID`,`Notice`,`WorkDate`,`WorkHours`) VALUES ('p12345','','20200415',8) 

/*Godkend arbejdstimer*/
UPDATE dbprojekt.TimeStamps (`BossID`, `Status`, `Notice`) VALUES ('p01234', 'godkendt', '')

/* Månedlig Lønning */
SELECT arbejstimer FROM TimeStamps WHERE arbejsdato > ? AND arbejsdato < ? AND EmployeeID = ? AND Status = 'godkendt'

