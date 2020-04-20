package SQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

public class Purchases {
    Connection connection;

    public Purchases(Connection connection) {
        this.connection = connection;
    }

    /**
     * Get one row data from PurchaseOrder table and PurchaseOrderLine
     */
    public String getPurchaseOneRow(String purchaseOrderId) throws SQLException {

        // PurchaseOrder's attributes
        String supplierID = null, orderDate = null
                                , dateOfReceipt = null, dateOfPayment = null;

        // PurchaseOrderLine's attributes
        String productID, amount, purchasePrice;

        try {
            // To show a specific row
                // Query to PurchaseOrder table
                String query1 = "SELECT * FROM PurchaseOrder WHERE supplierID = ?";
                PreparedStatement pstmt = connection.prepareStatement( query1 );
                pstmt.setString( 1, purchaseOrderId );

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


                PreparedStatement pstmt1 = connection.prepareStatement( query2 );
                pstmt1.setString( 1, purchaseOrderId );

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
            System.out.println("purchaseOrderId does not exist");
        }

        return "purchaseOrderId does not exist";
    }


    /**
     * Get data from PurchaseOrder
     */
    public List<String> getPurchaseOrder() throws SQLException {

        List<String> purchases = new ArrayList<>(  );
        // PurchaseOrder's attributes
        String purchaseOrderId, supplierID, orderDate
                , dateOfReceipt, dateOfPayment;

        // PurchaseOrderLine's attributes
        String productID, amount, purchasePrice;

        try {
                String query1 = "SELECT * FROM PurchaseOrder";
                PreparedStatement pstmt = connection.prepareStatement( query1 );


                // Extract data
                ResultSet rs1 = pstmt.executeQuery();
                while (rs1.next()) {
                    purchaseOrderId = rs1.getString( "PurchaseOrderID" );
                    supplierID      = rs1.getString( "SupplierID" );
                    orderDate       = rs1.getString( "OrderDate" );
                    dateOfReceipt   = rs1.getString( "DateOfReceipt" );
                    dateOfPayment   = rs1.getString( "DateOfPayment" );

                    purchases.add( purchaseOrderId + "     " + supplierID + "     " + orderDate +
                                                            dateOfReceipt + "     " + dateOfPayment);
                }

        }
        catch (SQLException e) {
            System.out.println();
        }

        return Collections.singletonList( "SupplierID does not exist" );
    }

    /**
     * Get data from PurchaseOrderLine
     */
    public List<String> getPurchaseOrderLine() throws SQLException {

        List<String> purchases = new ArrayList<>(  );
        // PurchaseOrderLine's attributes
        String purchaseOrderId,productID, amount, purchasePrice;

        try {
            String query1 = "SELECT * FROM PurchaseOrder";
            PreparedStatement pstmt = connection.prepareStatement( query1 );


            // Extract data
            ResultSet rs1 = pstmt.executeQuery();
            while (rs1.next()) {
                purchaseOrderId = rs1.getString( "PurchaseOrderID" );
                productID      = rs1.getString( "SupplierID" );
                amount       = rs1.getString( "OrderDate" );
                purchasePrice   = rs1.getString( "DateOfReceipt" );

                purchases.add( purchaseOrderId + "    " + productID + "     " +
                                                amount + "     " + purchasePrice);
            }

        }
        catch (SQLException e) {
            System.out.println();
        }

        return Collections.singletonList( "SupplierID does not exist" );
    }



    /**
     * Add data to PurchaseOrder and PurchaseOrderLine table
     */

    public void addPurchase(String supplierID, String orderDate, String dateOfReceipt, String dateOfPayment,
                            String purchaseOrderID, String productID, String amount, String purchasePrice) {
        try {
            // Table values inserted into fullQuery Strings
            String fullQuery1 = "INSERT INTO PurchaseOrderLine ( ProductID, Amount, PurchasePrice) " +
                    "VALUES ('"+productID+"', '"+amount+"', '"+purchasePrice+"')" +
                    "WHERE PurchaseOrderID = '"+purchaseOrderID+"'";

            String fullQuery2 = "INSERT INTO PurchaseOrder (SupplierID, OrderDate, dateOfReceipt ,DateOfPayment) " +
                    "VALUES ('"+supplierID+"', '"+orderDate+"','"+dateOfReceipt+"', '"+dateOfPayment+"')" +
                    "WHERE PurchaseOrderID = '"+purchaseOrderID+"'";

            // Sql commands executed, hopefully.
            Statement stm = connection.createStatement();
            stm.executeUpdate(fullQuery1);
            stm.executeUpdate(fullQuery2);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

}

class purchaseMain{

    public static void main(String[] args) throws SQLException {
        purchaseMenu();
    }

    public static void purchaseMenu() throws SQLException {
        // Create a scanner
        Scanner sa = new Scanner( System.in );

        // Create an instance of Purchases class
        Purchases purchases = new Purchases(DatabaseCtrl.connect( "CPO", "1234" ));// todo


        // Ask the user to select from the menu
        System.out.println("Select from the menu below and " +
                            "type the number of selecting: " +
                            "\n1. Add to PurchaseOrder and PurchaseOrderLine" +
                            "\n2. Show PurchaseOrder and PurchaseOrderLine table ");

        int select = sa.nextInt();
        sa.nextLine();  // Consume newline left-over


        switch (select){
            case 1:
                System.out.println("Type in existing PurchaseOrderID: KO**** ");
                String  purchaseOrderID = sa.nextLine();
                System.out.println("Type in existing ProductID: P5**** ");
                String productID = sa.nextLine();
                System.out.println("Type in product amount: ");
                String amount = sa.nextLine();
                System.out.println("Type in total price of purchase in DKK: ");
                String purchasePrice = sa.nextLine();
                System.out.println("Type in existing SupplierID: ****** ");
                String supplierID = sa.nextLine();
                System.out.println("Type in OrderDate: YYYYMMDD ");
                String orderDate = sa.nextLine();
                System.out.println("Type in DateOfReceipt: YYYYMMDD ");
                String dateOfReceipt = sa.nextLine();
                System.out.println("Type in DateOfPayment: YYYYMMDD ");
                String dateOfPayment = sa.nextLine();
                purchases.addPurchase( supplierID, orderDate, dateOfReceipt, dateOfPayment,
                                         purchaseOrderID,  productID, amount, purchasePrice);
                break;

            case 2:
                System.out.println("Select from the menu below and " +
                                    "type the number of selecting: " +
                                    "1. Get a specific row by using purchaseOrderID"+
                                    "2. Get data from PurchaseOrder table" +
                                    "3. Get data from PurchaseOrderLine table"   );
                int select1 = sa.nextInt();
                if(select1 == 1){
                    System.out.print("Enter purchaseOrderID: ");
                    System.out.println(purchases.getPurchaseOneRow( sa.nextLine() ));
                }else if (select1 == 2){
                    System.out.println(purchases.getPurchaseOrder( ));
                }else {
                    System.out.println(purchases.getPurchaseOrderLine( ));
                }
                break;
        }


    }
}