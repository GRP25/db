import java.sql.*;
import java.util.Scanner;

public class Sales{

    Connection conn;
    String title;
    String EmployeeID;

    public Sales(Connection conn, String EmployeeID, String title) {
        this.conn = conn;
        this.title = title;
        this.EmployeeID = EmployeeID;

        SalesMenu();
    }

    public void SalesMenu(){
        System.out.println("Select the action you want to perform");
        System.out.println("1 Add a Customer");
        System.out.println("2 Add a Sales Order");
        System.out.println("3 Administrate Customer");
        System.out.println("4 Administrate Sales Order");
        System.out.println("5 Add a product to Sales Order");
        System.out.println("6 View packing list");
        System.out.println("7 View invoice");
        System.out.println("8 View dispatch");
        System.out.println("9 Add Payment register");
        System.out.println("10 Add view Time Sheet");
        System.out.println("11 Inset into time sheet");
        System.out.println("12 View all time sheets for sales department");

        Scanner input = new Scanner(System.in);
        int choice = input.nextInt();

        switch(choice){
            case 1:
                System.out.println("Input First Name, Last Name, Address, Postal code, City, Phone, Mail and CreditLimit");
                try {
                    /*String FirstName = input.nextLine(), LastName = input.nextLine(), Address = input.nextLine(), PostalCode = input.nextLine(), City = input.nextLine(), Phone = input.nextLine();
                    String Mail = input.nextLine(), CreditLimit = input.nextLine();
                    addCustomer(FirstName,LastName,Address,PostalCode,City,Phone,Mail,CreditLimit);*/
                    addCustomer("Thomas","Hohnen","Vejnummer","3080","Nørrebro","123456789","something@something.com","20");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case 2:
                System.out.println("Input Customer ID, Shippingdate, Invoice date and Payment date");
                try {
                    String CustomerID = input.nextLine(), ShippingDate = input.nextLine(), InvoiceDate = input.nextLine(), PaymentDate = input.nextLine();
                    addSale(CustomerID,ShippingDate,InvoiceDate,PaymentDate);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case 3:
                System.out.println("Input what you want to change and the ID for who you want to change");
                try {
                    String Update = input.nextLine(), CustomerID = input.nextLine();
                    adminCustomer(Update,CustomerID);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case 4:
                System.out.println("Input what you want to change and the ID for who you want to change");
                try {
                    String Update = input.nextLine(), SalesOrderID = input.nextLine();
                    adminSale(Update,SalesOrderID);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case 5:
                System.out.println("Input Sales Order ID, Product ID, Amount and Sales Price");
                try {
                    String SalesOrderID = input.nextLine(), ProductID = input.nextLine(), Amount = input.nextLine(), SalesPrice = input.nextLine();
                    addProductToSale(SalesOrderID,ProductID,Amount,SalesPrice);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case 6:
                System.out.println("Input Sales Order ID");
                try {
                    String SalesOrderID = input.nextLine();
                    packingList(SalesOrderID);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case 7:
                System.out.println("Input Sales Order ID");
                try {
                    String SalesOrderID = input.nextLine();
                    invoice(SalesOrderID);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case 8:
                System.out.println("Input Customer ID");
                try {
                    String CustomerID = input.nextLine();
                    dispatch(CustomerID);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case 9:
                System.out.println("Input Sales Order ID");
                try {
                    String SalesOrderID = input.nextLine();
                    paymentReg(SalesOrderID);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case 10:
                System.out.println("Input EmployeeID");
                try {
                    String EmployeeID = input.nextLine();
                    timeSheetView(EmployeeID);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case 11:
                System.out.println("Input Employee ID, Work Date, Work Hours and Notice");
                try {
                    String EmployeeID = input.nextLine(), WorksDate = input.nextLine(), WorkHours = input.nextLine(), Notice = input.nextLine();
                    timeSheetInsert(EmployeeID,WorksDate,WorkHours,Notice);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case 12:
                try {
                    timeSheetViewSalesDept();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                break;
        }

        input.close();
    }

    public void addCustomer(String FirstName, String LastName, String Address, String PostalCode, String City, String Phone, String Mail, String CreditLimit) throws SQLException {
        String sql = "INSERT INTO Customer( FirstName, LastName, Address, PostalCode, City, Phone, Mail, CreditLimit)" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setString(1,FirstName);
        pstm.setString(2,LastName);
        pstm.setString(3,Address);
        pstm.setString(4,PostalCode);
        pstm.setString(5,City);
        pstm.setString(6,Phone);
        pstm.setString(7,Mail);
        pstm.setString(8,CreditLimit);

        pstm.executeQuery();
    }

    public void addSale(String CustomerID, String ShippingDate, String InvoiceDate, String PaymentDate) throws SQLException {
        String sql = "INSERT INTO SalesOrder(CustomerID, ShippingDate, InvoiceDate, PaymentDate)" +
                "VALUES(?, ?, ?, ?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,CustomerID);
        pstm.setString(2,ShippingDate);
        pstm.setString(3,InvoiceDate);
        pstm.setString(4,PaymentDate);

        pstm.executeQuery();
    }

    public void adminCustomer(String Update, String CustomerID) throws SQLException {
        String sql = "UPDATE Customer SET ?"+
        "WHERE CustomerID = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,Update);
        pstm.setString(2,CustomerID);

        pstm.executeQuery();

    }

    public void adminSale(String Update, String SalesOrderID) throws SQLException {
        String sql = "UPDATE SalesOrder SET ?" +
                "WHERE SalesOrderID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,Update);
        pstm.setString(2,SalesOrderID);

        pstm.executeQuery();
    }

    public void addProductToSale(String SalesOrderID, String ProductID, String Amount, String SalesPrice) throws SQLException {
        String sql = "INSERT INTO SalesOrderLine (SalesOrderID, ProductID, Amount, SalesPrice)" +
                "VALUES (?, ?, ?, ?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,SalesOrderID);
        pstm.setString(2,ProductID);
        pstm.setString(3,Amount);
        pstm.setString(4,SalesPrice);

        pstm.executeQuery();
    }

    public void packingList(String SalesOrderID) throws SQLException {

        String sql = "SELECT * FROM packing_list WHERE SalesOrderID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,SalesOrderID);
        ResultSet rs = pstm.executeQuery();

        while(rs.next()) {

            String sID = rs.getString("SalesOrderID");
            String pID = rs.getString("ProductID");
            String detail = rs.getString("ProductName");
            String amout = rs.getString("Amount");

            System.out.format("%s, %s, %s, %s\n", sID , pID, detail, amout);
        }
    }

    public void invoice(String SalesOrderID) throws SQLException {

        String sql = "CALL sendOrder(?) ";
        CallableStatement pstm = conn.prepareCall(sql);
        pstm.setString(1,SalesOrderID);
        ResultSet rs = pstm.executeQuery();

        while(rs.next()){
            String pID = rs.getString("ProductID");
            String details = rs.getString("Details");
            String amount = rs.getString("Amount");
            String saleP = rs.getString("SalesPrice");
            String linePrice = rs.getString("TotalLinePrice");

            System.out.format("%s, %s, %s, %s, %s\n",pID,details,amount,saleP,linePrice);
        }

    }

    public void dispatch(String CustomerID) throws SQLException {

        String sql = "SELECT * FROM Dispatch WHERE CustomerID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,CustomerID);
        ResultSet rs = pstm.executeQuery();

        while(rs.next()){
            String cID = rs.getString("CustomerID");
            String fName = rs.getString("FirstName");
            String lName = rs.getString("LastName");
            String address = rs.getString("Address");

            System.out.format("%s, %s, %s, %s, \n", cID, fName, lName, address);
        }
    }

    public void paymentReg(String SalesOrderID) throws SQLException {
        String sql = "CALL PaymentRegister (?)";
        CallableStatement pstm = conn.prepareCall(sql);
        pstm.setString(1,SalesOrderID);

        pstm.executeQuery();
    }

    public void timeSheetView(String EmployeeID) throws SQLException {
        String sql = "SELECT * FROM timesheet WHERE EmployeeID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,EmployeeID);
        ResultSet rs = pstm.executeQuery();

        while(rs.next()){
            String eID = rs.getString("EmployeeID");
            String workDate = rs.getString("WorkDate");
            String workHours = rs.getString("WorkHours");
            String notice = rs.getString("Notice");

            System.out.format("&s, &s, &s, &s, \n", eID, workDate, workHours, notice);
        }
    }

    public void timeSheetInsert(String EmployeeID, String WorkDate, String WorkHours, String Notice) throws SQLException {
        String sql = "INSERT INTO timesheet (EmployeeID, WorkDate, WorkHours, Notice)" +
                "VALUES (?, ?, ?, ?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,EmployeeID);
        pstm.setString(2,WorkDate);
        pstm.setString(3,WorkHours);
        pstm.setString(4,Notice);

        pstm.executeQuery();
    }

    public void timeSheetViewSalesDept() throws SQLException {
        String sql = "SELECT * FROM timesheet_boos WHERE Department = Sales";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.executeQuery();
    }
}