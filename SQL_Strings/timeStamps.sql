INSERT INTO dbprojekt.`Department`(`DepartmentName`) VALUES ('Sales')

INSERT INTO dbprojekt.`Employee`(
    `EmployeeID`,`FirstName`,`LastName`,`Department`) 
    VALUES ('p12345','Martin','Bobsen','Sales')


/* View for employee til at udfylde timesedel */
create view timesheet AS
    SELECT EmployeeID, WorkDate, WorkHours, Notice 
    FROM TimeStamps;


/* View for at se en måneds samlede løn udbetaling */
/*
FORVENTET OUTPUT:
    Hver række viser 
        Navn, 
        Sammenlagt løn for valgt måned,
        Afdeling,
        Antal timer,
        fra dato,
        til dato,
        KontoNr,

        ex:
        Bob Jensen, 10.000, Sales, 37, 20200101, 20200131
        Bob Jensen, 10.000, Sales, 37, 20200101, 20200131
        Bob Jensen, 10.000, Sales, 37, 20200101, 20200131
        Bob Jensen, 10.000, Sales, 37, 20200101, 20200131
        Bob Jensen, 10.000, Sales, 37, 20200101, 20200131
        Bob Jensen, 10.000, Sales, 37, 20200101, 20200131
*/
CREATE VIEW SalaryOverview AS
    SELECT arbejstimer FROM TimeStamps WHERE arbejsdato > ? AND arbejsdato < ? AND EmployeeID = ? AND Status = 'godkendt'




/*Regitrer arbejdstimer*/
INSERT INTO dbprojekt.timesheet (`EmployeeID`,`Notice`,`WorkDate`,`WorkHours`) VALUES ('p12345','','20200415',8) 

/*Godkend arbejdstimer*/
UPDATE dbprojekt.TimeStamps (`BossID`, `Status`, `Notice`) VALUES ('p01234', 'godkendt', '')

/* Månedlig Lønning for Deltidsmedarbejder */
SELECT arbejstimer FROM TimeStamps WHERE arbejsdato > ? AND arbejsdato < ? AND EmployeeID = ? AND Status = 'godkendt'

