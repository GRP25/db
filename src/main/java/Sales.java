import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Sales{

    Connection conn;

    public Sales(Connection conn) {
        this.conn = conn;
    }

    public void addCustomer(String FistName, String LastName, String Address, String PostalCode, String City, String Phone, String Mail, String CreditLimit) throws SQLException {
        String sql = "INSERT INTO Customer( FirstName, LastName, Address, PostalCode, City, Phone, Mail, CreditLimit)" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,FistName);
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

    public void adminCustomer(){
        String sql = "SELECT * FROM Customer";

    }

    public void adminSale(){

    }

    public void addProductToSale(){

    }

    public void packingList(String SalesOrderID) throws SQLException {

        String sql = "SELECT * FROM packing_list WHERE SalesOrderID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,SalesOrderID);
        ResultSet rs = pstm.executeQuery();

        while(rs.next()) {

            String sID = rs.getString("SalesOrderID");
            String pID = rs.getString("ProductID");
            String detail = rs.getString("Details");
            String amout = rs.getString("Amount");

            System.out.format("%s, %s, %s, %s\n", sID , pID, detail, amout);
        }
    }

    public void invoice(String SalesOrderID) throws SQLException {

        String sql = "CALL sendOrder(?) ";
        PreparedStatement pstm = conn.prepareStatement(sql);
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

    public void paymentReg(){

    }

}