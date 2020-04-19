import java.sql.*;
import java.util.Scanner;

/**
 * Admin
 */
public class Admin {
    Connection connection;
    String EmployeeID;
    String role;
    Scanner s = new Scanner(System.in);
    String[] inputParse;
    public Admin(Connection connection, String EmployeeID, String role) {
        if (connection == null) System.out.println("Incorrectly logged in");
        this.connection = connection;
        this.EmployeeID = EmployeeID;
        this.role = role;

        AdminMenu();
    }

    public void AdminMenu() {
        System.out.println("Select which action you wish to perform");
        System.out.println("1. Add Employee");
        System.out.println("2. Admin Employee");
        System.out.println("3. Pay employees");
        System.out.println("4. Retrieve the office handbook ");
        System.out.println("5. Add product ");
        System.out.println("6. Add product type ");
        System.out.println("7. Get marketing catalog ");
        System.out.println("8. Add a user to the database ");
        System.out.println("9. Admin current database users ");
        System.out.println("10. Get timesheet ");
        System.out.println("11. Query the database directly ");
        System.out.println("12. Exit program");

        int input = s.nextInt();

        switch (input) {
            case (1):
                AddEmployee();
                break;
            case (2):
                AdminEmployee();
                break;
            case (3):
                PayEmployees();
                break;
            case (4):
                GetOfficeHandbook();
                break;
            case (5):
                AddProduct();
                break;
            case (6):
                AddProductType();
                break;
            case (7):
                GetCatalog();
                break;
            case (8):
                AddDBUser();
                break;
            case (9):
                AdminDBUser();
                break;
            case (10):
                getTimeSheet();
                break;
            case (11):
                SQLquery();
                break;
            case (12):
                try {
                    connection.close();
                    System.exit(1);
                } catch (SQLException e){
                    System.out.println(e.getMessage());
            }
        }
    }

    public void AddEmployee() {
        String sql = "INSERT INTO Employee(FirstName, LastName, Address, PostalCode, City" +
                "Phone, Salary, HourlyWage, Title, Department, AcountNo" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        System.out.println("Please input the following, seperated by commas:");
        System.out.println("Firstname, Lastname, Address, Postalcode, City, Phonenumber, Salary, Job title, Department and account number");
        String input = s.nextLine();

        inputParse = input.split(",");


        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            for (int i = 1; i <= 11; i++ ) {
                if (i == 8 || i == 9 || i == 11) {
                    pstmt.setInt(i, Integer.parseInt(inputParse[i-1]));
                } else {
                    pstmt.setString(i, inputParse[i-1]);
                }
            }

        pstmt.executeQuery();
            System.out.println("User "+ inputParse[0] + "Added");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void AdminEmployee() {
        System.out.println("How do you wish to admin ");
        System.out.println("1. Update an employee");
        System.out.println("2. Delete an employee");
        System.out.println("3. Return to menu");

        int input = s.nextInt();

        switch (input) {
            case (1):
                String sql = "UPDATE Employee SET ? WHERE EmployeeID = ?;";
                System.out.println("Enter the ID of the employee you wish to update");
                String id = s.nextLine();
                System.out.println("Enter the changes you wish to make fx (FirstName = 'Mette', LastName = 'Larsen'");
                String change = s.nextLine();

                try {
                    PreparedStatement pstm = connection.prepareStatement(sql);
                    pstm.setString(1, change);
                    pstm.setString(2,id);
                    pstm.executeQuery();
                } catch (SQLException e){
                    System.out.println(e.getMessage());
            }
                break;
            case (2):
                String sqlD = "DELETE FROM Employee WHERE EmployeeID = ?;";
                System.out.println("Enter the ID of the employee you wish to delete");
                String userID = s.nextLine();

                try {
                    PreparedStatement dstm = connection.prepareStatement(sqlD);
                    dstm.setString(1, userID);
                    dstm.executeQuery();
                } catch (SQLException e){
                    System.out.println(e.getMessage());
            }

            case (3):
                System.out.println("Returning to menu");
                AdminMenu();
        }
    }

    public void PayEmployees() {
        try {
            CallableStatement cStmt = connection.prepareCall("{CALL PaySalary(?, ?)}");

            System.out.println("Please input the following, seperated by commas:");
            System.out.println("Starting date, end date");
            System.out.println("Example: 20200103, for 2020-01-03");
            String input = s.nextLine();

            inputParse = input.split(",");

            for (int i = 1; i <= 2; i++) {
                cStmt.setDate(i, Date.valueOf(inputParse[i-1]));
            }
            cStmt.executeQuery();
            System.out.println("Employees payed");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void GetOfficeHandbook() {
        String sql = "SELECT * FROM timesheet_all";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet result = pstmt.executeQuery();
            ResultSetMetaData meta = result.getMetaData();
            int columnNr = meta.getColumnCount();
            while (result.next()) {
                for (int i = 1; i < columnNr; i++) {
                    System.out.print(result.getString(i) + " ");
                }
                System.out.println();
            }


        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void AddProduct() {
        String sql = "INSERT INTO Product(Details, HTMLDescription, Image, SupplierID," +
                "PurchasePrice, SalesPrice, StockQuantity, TransportSC, TransportCC" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        System.out.println("Please input the following, seperated by commas:");
        System.out.println("Product details, HTMLDescription, Image, SupplierID, PurchasePrice, SalesPrice, StockQuantity, TransportSC and TransportCC");
        String input = s.nextLine();

        inputParse = input.split(",");


        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            for (int i = 1; i <= 9; i++ ) {
                if (i == 5 || i == 6) {
                    pstmt.setInt(i, Integer.parseInt(inputParse[i-1]));
                } else {
                    pstmt.setString(i, inputParse[i-1]);
                }
            }

            pstmt.executeQuery();
            System.out.println("Product Added");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public void AddProductType() {
        String sql = "INSERT INTO ProductType(ProductType, Description, HTMLDescription, Image)" +
                " VALUES (?, ?, ?, ?)";

        System.out.println("Please input the following, seperated by commas:");
        System.out.println("Product type, Description, HTMLDescription and Image");
        String input = s.nextLine();

        inputParse = input.split(",");


        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            for (int i = 1; i <= 4; i++ ) {
                    pstmt.setString(i, inputParse[i-1]);
            }

            pstmt.executeQuery();
            System.out.println("ProductType Added");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void GetCatalog() {
        String sql = "SELECT * FROM MarketingCatalog";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet result = pstmt.executeQuery();
            ResultSetMetaData meta = result.getMetaData();
            int columnNr = meta.getColumnCount();
            while (result.next()) {
                for (int i = 1; i < columnNr; i++) {
                    System.out.print(result.getString(i) + " ");
                }
                System.out.println();
            }


        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void AddDBUser() {
        String sql = "CREATE USER '?'@'%' IDENTIFIED BY '?'";
        System.out.println("Enter Username");
        String user = s.nextLine();
        System.out.println("Enter password");
        String pass = s.nextLine();
        try {
            PreparedStatement ptsm = connection.prepareStatement(sql);
            ptsm.setString(1, user);
            ptsm.setString(2, pass);
            ptsm.executeQuery();
        } catch (SQLException e) {
            e.getMessage();
        }
    }
    
    public void AdminDBUser() {
        
    }

    public void getTimeSheet() {

    }

    public void SQLquery() {

    }

    @Override
    public String toString() {
        return "";
    }
}