## Planer for imorgen (18 march 2020)
* Finish Requrements for application
* Finish Database Scheme
* List over different users and there access
* Usecases in the database

# Brainstorm

## noter:
så få tabeller som muligt

Page 4/21 
NewEmployee (EmployeeID, FuldeName, ContactDetails, SalaryDetails, Title, Department, StartDate) 

If the employee changes information, then they are wanted old information remains available.
Permanent employees receive a fixed monthly salary plus overtime pay after an agreed hourly wage. Part-time employees receive hourly wages alone.


Page 5/21 
Product(ProductID, Details, HTMLDescription, Image, Supplier, PurchasePrice, SalePrice, StockQuantity, TransportSC, TrasportCC) (Transport daysfrom the supplier to the company
and from the company to the customer) // According to the text

Page 6/21
Customer(CustomerID, FullName, ContactInformation, CreditLimit)
SalesOrder(OrderID, ShippingDate, BillingDate, PaymentDate)
SalesOrderLine(OrderLineID, ProductID, OrderLine, Amount, Price) // Amount is number of product and Price is product’s selling price. 

Page 7/21
Supplier(SupplierID, Name, ContactPerson, ContactInformation)
PurchaseOrder(OrderID, SupplierID, OrderDate, DateOfReceipt, DateOfPayment)
PurchaseOrderLine(OrderID, ProductID, OrderLine, Amount, Price) // Amount is number of products and Price is product’s purchase Price.


