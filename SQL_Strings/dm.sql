




/* Disse bliver lavet EN gang */
CREATE VIEW hournote AS 
    SELECT (EmployeeID, WorkDate, WorkHours, Notice) FROM TimeStamps

/* Disse bliver lavet hver gang at en ny bruger bliver oprettet*/
GRANT INSERT,UPDATE,SELECT ON dbprojekt.hournote TO '?'@'%' IDENTIFIED BY ;



/* Disse bliver lavet on the fly */

SELECT hournote WHERE EmployeeID = ?
INSERT INTO TimeStamps 




/* OPRET TIMESEDEL */
INSERT INTO hournote (EmployeeID, WorkDate, WorkHours, Notice)

/* GODKEND TIMESEDEL */
INSERT INTO hournoteApprove (EmployeeID, WorkDate, Status, Notice)


