## Planer for imorgen (18 march 2020)
* Finish Requrements for application
* Finish Database Scheme
* List over different users and there access
* Usecases in the database

<span style="text-decoration: underline">underline</span>
<u>underline</u>
_underline_

# Brainstorm

## noter:
så få tabeller som muligt

2. DB tabel skemaer og brugerprofiler

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






# Krav til medarbejdere
* Direktør og nærmeste medarbejdere
  * Oprettelse og administration af medarbejdere og løn
  * Månedlig lønudbetaling
  * Udarbejdelse af kontorhåndbogen
  * oprettelse og administration af produktype og produkter
  * Udarbejdelse af marketingkataloget
  * oprettelse og administration af database brugere

* Salgschef og salgsafdelingens medarbejdere
  * Oprettelse og administration af kunder og slagsordrer
    * Insert and update functions
  * Oprettelse af slagsordre
    * Insert functions
  * Pakning og afsendelse af slagsordre
    * Views Pakning with SalesOrders Lines
    * Views Afsendelse with SalesOrder and address
  * Fakturering af slagsordre ved afsendelse
    * Update invoice date when printing Order address
    * View to see all information for the invoide
  * Betalingsregistrering af slagsordre
    * Update function

* Indkøbschef og indkøbsafdelingens medarbejdere
  * Oprettelse og administration af leverandrører og købsordrer
  * Oprettelse af købsordre
  * Udpakning og lagerplacering af købsordre
  * Betaling af købsordre ved modtagelse

# TODO
1. Lav SQL kode
    1.1. Lav Test data
    1.2. Opbyg views
    1.3. Opret brugere og roller
    1.4. Finpuds og ret potentielle fejl.
    1.5. Opbyg databasen fra grunden igen
2. Kobl SQL kode sammen med java
3. Under Customer skal CreditLimit være decimal tal

# VIEWS 
* Direktør og nærmeste medarbejdere
    * Kontorhånbogen 
    * Marketingskatalog
    * (fra dato /til dato) opgørelse view over løn og medarbejdere - Kan tilpasses med WHERE
    * Timesedler (Employee view)
    * Timesedler (Boss view) - Måske ska boss have adgang til selve tabellen
* Salgschef og salgsafdelingens medarbejdere og kunder
    * Pakings liste --- DONE ---
    * Salgordrer og addresser (Afsendelse) --- DONE ---
    * Alle oplysninger til fakturaen ---DONE---
* Indkøbschef og indkøbsafdelingens medarbejdere
    * Supplierliste med info om kontaktpersoner
    * Oversigt over køb med info om kontaktperson og supplier
    * Købsordrer og addresser (Afsendelse)
