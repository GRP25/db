package SQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

public class Purchases {
    Connection connection;

    public Purchases(Connection connection)  {
        this.connection = connection;
        purchaseMenu();
    }

    /**
     * Get one row data from PurchaseOrder table and PurchaseOrderLine
     */
    public String getPurchaseOneRow(String purchaseOrderId)  {

        // PurchaseOrder's attributes
        String supplierID = null, orderDate = null
                                , dateOfReceipt = null, dateOfPayment = null;

        // PurchaseOrderLine's attributes
        String productID, amount, purchasePrice;

        try {
            // To show a specific row
                // Query to PurchaseOrder table
                String query1 = "SELECT * FROM PurchaseOrder WHERE PurchaseOrderID = ?";
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
                String query2 = "SELECT * FROM PurchaseOrderLine WHERE PurchaseOrderID = ?";


                PreparedStatement pstmt1 = connection.prepareStatement( query2 );
                pstmt1.setString( 1, purchaseOrderId );

                // Extract data
                ResultSet rs2 = pstmt1.executeQuery();
                if (rs2.next()) {
                    purchaseOrderId = rs2.getString( "PurchaseOrderID" );
                    productID       = rs2.getString( "ProductID" );
                    amount          = rs2.getString( "Amount" );
                    purchasePrice   = rs2.getString( "PurchasePrice" );

                    return purchaseOrderId + "\t\t\t\t\t" + productID + "\t\t\t" + amount + "\t\t\t" + purchasePrice +
                            "\t\t\t"  + supplierID + "\t\t\t" + orderDate + "\t\t" + dateOfReceipt + "\t\t\t" + dateOfPayment;
                }
            }

        }
        catch (SQLException e) {
            System.out.println(e.getSQLState());
        }

        return "purchaseOrderId does not exist";
    }


    /**
     * Get data from PurchaseOrder
     */
    public List<String> getPurchaseOrder()  {

        List<String> purchases = new ArrayList<>(  );
        // PurchaseOrder's attributes
        String purchaseOrderId, supplierID, orderDate
                , dateOfReceipt, dateOfPayment;

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

                    purchases.add( purchaseOrderId + "\t\t\t\t" + supplierID + "\t\t\t" + orderDate +
                                                       "\t\t" +   dateOfReceipt + "\t\t\t" + dateOfPayment);
                }
                return purchases;

        }
        catch (SQLException e) {
            System.out.println();
        }

        return Collections.singletonList( "No data yet :)" );
    }

    /**
     * Get data from PurchaseOrderLine
     */
    public List<String> getPurchaseOrderLine() {

        List<String> purchases = new ArrayList<>(  );
        // PurchaseOrderLine's attributes
        String purchaseOrderId,productID, amount, purchasePrice;

        try {
            String query1 = "SELECT * FROM PurchaseOrderLine";
            PreparedStatement pstmt = connection.prepareStatement( query1 );


            // Extract data
            ResultSet rs1 = pstmt.executeQuery();
            while (rs1.next()) {
                purchaseOrderId = rs1.getString( "PurchaseOrderID" );
                productID       = rs1.getString( "ProductID" );
                amount          = rs1.getString( "Amount" );
                purchasePrice   = rs1.getString( "PurchasePrice" );

                purchases.add( purchaseOrderId + "\t\t\t\t" + productID + "\t\t\t" +
                                                amount + "\t\t\t" + purchasePrice);
            }
            return purchases;

        }
        catch (SQLException e) {
            System.out.println(e.getSQLState());
        }

        return Collections.singletonList( "No data yet :)" );
    }



    /**
     * Add data to PurchaseOrder table
     */

    public void addPurchaseOrder(String supplierID, String orderDate, String dateOfReceipt, String dateOfPayment) {
        try {
            // Table values inserted into fullQuery Strings
            String fullQuery = "INSERT INTO PurchaseOrder (SupplierID, OrderDate, dateOfReceipt ,DateOfPayment) " +
                    "VALUES ('"+supplierID+"', '"+orderDate+"','"+dateOfReceipt+"', '"+dateOfPayment+"')";

            // Sql commands executed, hopefully.
            Statement stm = connection.createStatement();
            stm.executeUpdate(fullQuery);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * Add data to PurchaseOrderLine table
     */

    public void addPurchaseOrderLine(String purchaseOrderID, String productID, String amount, String purchasePrice) {
        try {
            // Table values inserted into fullQuery Strings
            String fullQuery = "INSERT INTO PurchaseOrderLine (PurchaseOrderID, ProductID, Amount, PurchasePrice) " +
                    "VALUES ('"+purchaseOrderID+"','"+productID+"', '"+amount+"', '"+purchasePrice+"')";


            // Sql commands executed, hopefully.
            Statement stm = connection.createStatement();
            stm.executeUpdate(fullQuery);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }



    // cdio: HmDjHb0b4123 - CPO: 1234 - Purchases: 1234
    public  void purchaseMenu()  {
        // Create a scanner
        Scanner sa = new Scanner( System.in );

        while (true) {
            // Ask the user to select from the menu
            System.out.println( "\n\nSelect from the menu below and " +
                    "type the number of selecting: " +
                    "\n1. Add to PurchaseOrder and PurchaseOrderLine" +
                    "\n2. Show PurchaseOrder and PurchaseOrderLine table " +
                    "\n3. Exit" );

            int select = sa.nextInt();
            sa.nextLine();  // Consume newline left-over


            switch (select) {
                case 1:
                    System.out.println( "Select from the menu below and " +
                            "type the number of selecting: " +
                            "\n1. Add data to PurchaseOrder table" +
                            "\n2. Add data to PurchaseOrderLine table" );
                    int select1 = sa.nextInt();
                    sa.nextLine();  // Consume newline left-over
                    if (select1 == 1) {
                        System.out.println( "Type in existing SupplierID: L***** " );
                        String supplierID = sa.nextLine();
                        System.out.println( "Type in OrderDate: YYYYMMDD " );
                        String orderDate = sa.nextLine();
                        System.out.println( "Type in DateOfReceipt: YYYYMMDD " );
                        String dateOfReceipt = sa.nextLine();
                        System.out.println( "Type in DateOfPayment: YYYYMMDD " );
                        String dateOfPayment = sa.nextLine();
                        addPurchaseOrder( supplierID, orderDate, dateOfReceipt, dateOfPayment );
                    } else {
                        System.out.println( "Type in existing PurchaseOrderID: KO**** " );
                        String purchaseOrderID = sa.nextLine();
                        System.out.println( "Type in existing ProductID: P***** " );
                        String productID = sa.nextLine();
                        System.out.println( "Type in product amount: " );
                        String amount = sa.nextLine();
                        System.out.println( "Type in total price of purchase in DKK: " );
                        String purchasePrice = sa.nextLine();
                        addPurchaseOrderLine( purchaseOrderID, productID, amount, purchasePrice );
                    }
                    break;

                case 2:
                    System.out.println( "Select from the menu below and " +
                            "type the number of selecting: " +
                            "\n1. Get a specific row by using purchaseOrderID" +
                            "\n2. Get data from PurchaseOrder table" +
                            "\n3. Get data from PurchaseOrderLine table" );
                    int select2 = sa.nextInt();
                    sa.nextLine();  // Consume newline left-over
                    if (select2 == 1) {
                        System.out.print( "Enter purchaseOrderID: " );
                        System.out.println(
                                "PurchaseOrderID\t\t\tProductID\t\tAmount\t\tPurchasePrice\t\t" +
                                        "SupplierID\t\tOrderDate\t\tDateOfReceipt\t\tDateOfPayment\n" +
                                        getPurchaseOneRow( sa.nextLine() ) );
                    } else if (select2 == 2) {
                        System.out.println(
                                "PurchaseOrderID\t\tSupplierID\t\tOrderDate\t\tDateOfReceipt\t\tDateOfPayment" );
                        for (String s : getPurchaseOrder()) {
                            System.out.print( s + "\n" );
                        }
                    } else {
                        System.out.println(
                                "PurchaseOrderID\t\tProductID\t\tAmount\t\tPurchasePrice" );
                        for (String s : getPurchaseOrderLine()) {
                            System.out.print( s + "\n" );
                        }
                    }
                    break;
                case 3:
                    System.exit( 1 );
                    break;
            }

        }
    }

}



