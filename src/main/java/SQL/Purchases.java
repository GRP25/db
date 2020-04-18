package SQL;

import java.sql.*;
import java.util.Scanner;

public class Purchases {
    DatabaseCtrl db = new DatabaseCtrl();


    /**
     * Get data from PurchaseOrder table and PurchaseOrderLine
     */
    public String getPurchase(String supplier_id, String user,
                              String pass) throws SQLException {

        // Add information of two tables (PurchaseOrder and PurchaseOrderLine)
        String informationOfTwoTables = "";

        // PurchaseOrder's attributes
        String purchaseOrderId = null, supplierID = null, orderDate = null
                                , dateOfReceipt = null, dateOfPayment = null;

        // PurchaseOrderLine's attributes
        String productID, amount, purchasePrice;

        try {
            Connection conn = DatabaseCtrl.connect( user, pass );
            // Query to PurchaseOrder table
            String query1 = "SELECT * FROM PurchaseOrder WHERE supplierID = ?";
            PreparedStatement pstmt = conn.prepareStatement( query1 );
            pstmt.setString( 1, supplier_id );  // TODO  Supplier_id row in the data base is 2 not 1

            // Extract data
            ResultSet rs1 = pstmt.executeQuery();
            if (rs1.next()) {
                purchaseOrderId = rs1.getString( "PurchaseOrderID" );
                supplierID      = rs1.getString( "SupplierID" );
                orderDate       = rs1.getString( "OrderDate" );
                dateOfReceipt   = rs1.getString( "DateOfReceipt" );
                dateOfPayment   = rs1.getString( "DateOfPayment" );


            }

            if (!purchaseOrderId.isEmpty()){
                // Query to PurchaseOrderLine table
                String query2 = "SELECT * FROM PurchaseOrderLine WHERE supplierID = ?";
                PreparedStatement pstmt1 = conn.prepareStatement( query2 );
                pstmt.setString( 1, purchaseOrderId );

                // Extract data
                ResultSet rs2 = pstmt.executeQuery();
                if (rs2.next()) {
                    purchaseOrderId = rs2.getString( "PurchaseOrderID" );
                    productID       = rs2.getString( "PurchaseOrderID" );
                    amount          = rs2.getString( "SupplierID" );
                    purchasePrice   = rs2.getString( "OrderDate" );

                    return purchaseOrderId + " " + productID + " " + amount + " " + purchasePrice +
                            " "  + supplierID + " " + orderDate + " " + dateOfReceipt + " " + dateOfPayment;
                }
            }

        }
        catch (SQLException e) {
            System.out.println();
        }

        return "SupplierID does not exist";
    }


    /*
     * Add data to PurchaseOrder table
     */

    public void addPurchase(String user, String pass) {

        try {
            Connection conn = DatabaseCtrl.connect(user, pass);

            // User is prompted for the table values to be inserted
            Scanner scanner = new Scanner(System.in);

            String purchaseOrderID = " ";
            String productID = " ";
            String amount = " ";
            String purchasePrice = " ";
            String supplierID = " ";
            String orderDate = " ";
            String dateOfPayment = " ";

            System.out.println("Type in existing PurchaseOrderID: KO**** ");
            purchaseOrderID = scanner.nextLine();
            System.out.println("Type in existing ProductID: P5**** ");
            productID = scanner.nextLine();
            System.out.println("Type in product amount: ");
            amount = scanner.nextLine();
            System.out.println("Type in total price of purchase in DKK: ");
            purchasePrice = scanner.nextLine();
            System.out.println("Type in existing SupplierID: ****** ");
            supplierID = scanner.nextLine();
            System.out.println("Type in OrderDate: YYYYMMDD ");
            orderDate = scanner.nextLine();
            System.out.println("Type in DateOfPayment: YYYYMMDD ");
            dateOfPayment = scanner.nextLine();

            // Table values inserted into fullQuery Strings
            String fullQuery1 = "INSERT INTO PurchaseOrderLine (PurchaseOrderID, ProductID, Amount, PurchasePrice) " +
                    "VALUES ('"+purchaseOrderID+"', '"+productID+"', '"+amount+"', '"+purchasePrice+"')";

            String fullQuery2 = "INSERT INTO PurchaseOrder (PurchaseOrderID, SupplierID, OrderDate, DateOfPayment) " +
                    "VALUES ('"+purchaseOrderID+"', '"+supplierID+"', '"+orderDate+"', '"+dateOfPayment+"')";

            // Sql commands executed, hopefully.
            Statement stm = conn.createStatement();
            stm.executeUpdate(fullQuery1);
            stm.executeUpdate(fullQuery2);
            conn.close();

        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

}