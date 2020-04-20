CREATE TABLE PurchaseOrderLine (
  PurchaseOrderID char(7) NOT NULL,
  ProductID char(6) NOT NULL,
  Amount INT DEFAULT NULL,
  PurchasePrice DECIMAL(20,2) DEFAULT NULL,
  FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrder (PurchaseOrderID),
  FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
) ;
