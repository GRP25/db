package SQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Purchases {
    DatabaseCtrl db = new DatabaseCtrl();


    /**
     * Get data from PurchaseOrder table
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


        } catch (SQLException e) {
            System.out.println();
        }

        return "SupplierID does not exist";
    }






    /**
     * Add data to PurchaseOrder table
     */
//    public void addPurchase(){
//
//    }
}


//
//    /**
//     * Get data from PurchaseOrder table
//     */
//    public String getPurchase(String supplier_id, String user,
//                              String pass) throws SQLException {
//
//        // Add information of two tables (PurchaseOrder and PurchaseOrderLine)
//        String informationOfTwoTables = "";
//
//        // PurchaseOrder's attributes
//        String purchaseOrderId = null, supplierID = null, orderDate = null
//                , dateOfReceipt = null, dateOfPayment = null;
//
//        // PurchaseOrderLine's attributes
//        String productID, amount, purchasePrice;
//
//        try {
//            Connection conn = DatabaseCtrl.connect( user, pass );
//            // Query to PurchaseOrder table
//            String query1 = "SELECT * FROM PurchaseOrder WHERE supplierID = ?";
//            PreparedStatement pstmt = conn.prepareStatement( query1 );
//            pstmt.setString( 1, supplier_id );  // TODO  Supplier_id row in the data base is 2 not 1
//
//            // Extract data
//            ResultSet rs1 = pstmt.executeQuery();
//            if (rs1.next()) {
//                purchaseOrderId = rs1.getString( "PurchaseOrderID" );
//                supplierID      = rs1.getString( "SupplierID" );
//                orderDate       = rs1.getString( "OrderDate" );
//                dateOfReceipt   = rs1.getString( "DateOfReceipt" );
//                dateOfPayment   = rs1.getString( "DateOfPayment" );
//
//
//            }
//
//            if (!purchaseOrderId.isEmpty()){
//                // Query to PurchaseOrderLine table
//                String query2 = "SELECT * FROM PurchaseOrderLine WHERE supplierID = ?";
//                PreparedStatement pstmt1 = conn.prepareStatement( query2 );
//                pstmt.setString( 1, purchaseOrderId );
//
//                // Extract data
//                ResultSet rs2 = pstmt.executeQuery();
//                if (rs2.next()) {
//                    purchaseOrderId = rs2.getString( "PurchaseOrderID" );
//                    productID       = rs2.getString( "PurchaseOrderID" );
//                    amount          = rs2.getString( "SupplierID" );
//                    purchasePrice   = rs2.getString( "OrderDate" );
//
//                    return purchaseOrderId + " " + productID + " " + amount + " " + purchasePrice +
//                            " "  + supplierID + " " + orderDate + " " + dateOfReceipt + " " + dateOfPayment;
//                }
//            }
//
//
//        } catch (SQLException e) {
//            System.out.println();
//        }
//
//        return "SupplierID does not exist";
//    }