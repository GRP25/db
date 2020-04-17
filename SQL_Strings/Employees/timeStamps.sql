



/*Regitrer arbejdstimer*/
INSERT INTO dbprojekt.timesheet (`EmployeeID`,`Notice`,`WorkDate`,`WorkHours`) VALUES ('p12345','','20200415',8) 

/*Godkend arbejdstimer*/
UPDATE dbprojekt.TimeStamps (`BossID`, `Status`, `Notice`) VALUES ('p01234', 'godkendt', '')

/* Månedlig Lønning for Deltidsmedarbejder */
SELECT arbejstimer FROM TimeStamps WHERE arbejsdato > ? AND arbejsdato < ? AND EmployeeID = ? AND Status = 'godkendt'

