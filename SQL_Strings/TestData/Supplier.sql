USE dbprojekt;

DELETE FROM Supplier;

INSERT INTO Supplier(SupplierName, ContactPerson, Address, PostalCode, City, Phone)
VALUES ('Gebr. Märklin & Cie. GmbH', 'M00002', 'Stuttgarter strasse 55-57', '3033', 'Göppingen', '71616080');

SELECT * FROM Supplier;