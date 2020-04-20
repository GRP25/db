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
        System.out.println("11. Exit program");

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
                try {
                    connection.close();
                    System.exit(1);
                } catch (SQLException e){
                    System.out.println(e.getMessage());
            }
        }
    }

    public void AddEmployee() {
        String sql = "INSERT INTO Employee(FirstName, LastName, Address, PostalCode, City, " +
                "Phone, Salary, HourlyWage, Title, Department, StartDate, EndDate, AcountNo)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        System.out.println("Please input the following, seperated by commas:");
        System.out.println("Firstname, Lastname, Address, Postalcode, City, Phonenumber, Salary, HourlyWage, Job title, Department, StartDate, EndDate and account number");
        String input = s.next();

        inputParse = new String[12];
        inputParse = input.split(",");


        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            for (int i = 1; i <= 13; i++ ) {
                if (i == 7 || i == 8 || i == 13) {
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
                System.out.println("Enter the ID of the employee you wish to update");
                String id = s.next();
                System.out.println("Enter the changes you wish to make fx (FirstName = 'Mette', LastName = 'Larsen'");
                String change = s.next();
                String sql = "UPDATE Employee SET ";
                sql += change;
                sql +=" WHERE EmployeeID = ?;";

                try {
                    PreparedStatement pstm = connection.prepareStatement(sql);
                    pstm.setString(1,id);
                    pstm.executeQuery();
                } catch (SQLException e){
                    System.out.println(e.getMessage());
            }
                break;
            case (2):
                String sqlD = "DELETE FROM Employee WHERE EmployeeID = ?;";
                System.out.println("Enter the ID of the employee you wish to delete");
                String userID = s.next();

                try {
                    PreparedStatement dstm = connection.prepareStatement(sqlD);
                    dstm.setString(1, userID);
                    dstm.executeQuery();
                } catch (SQLException e){
                    System.out.println(e.getMessage());
            }
                break;
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
            System.out.println("Example: 2020-01-03");
            String input = s.next();

            inputParse = new String[2];
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
        String sql = "INSERT INTO Product(ProductName, ProductType, Details, HTMLDescription, Image, SupplierID," +
                "PurchasePrice, SalesPrice, StockQuantity, TransportSC, TransportCC)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        System.out.println("Please input the following, seperated by commas:");
        System.out.println("Product details, HTMLDescription, Image, SupplierID, PurchasePrice, SalesPrice, StockQuantity, TransportSC and TransportCC");
        String input = s.next();

        inputParse = new String[10];
        inputParse = input.split(",");


        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            for (int i = 1; i <= 11; i++ ) {
                if (i == 7 || i == 8 || i == 9) {
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
                " VALUES (?, ?, ?, ?);";

        System.out.println("Please input the following, seperated by commas:");
        System.out.println("Product type, Description, HTMLDescription and Image");
        String input = s.next();

        inputParse = new String[3];
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
        String sql = "CREATE USER ?@'%' IDENTIFIED BY ?;";
        System.out.println("Enter Username");
        String user = s.next();
        System.out.println("Enter password");
        String pass = s.next();
        try {
            PreparedStatement ptsm = connection.prepareStatement(sql);
            ptsm.setString(1, user);
            ptsm.setString(2, pass);
            ptsm.executeQuery();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void AdminDBUser() {
        System.out.println("Which function do you wish to perfrom");
        System.out.println("1. Alter existing users password");
        System.out.println("2. Grant/revoke privileges on existing user");
        System.out.println("3. Delete a user");
        int choice = s.nextInt();

        switch (choice) {
            case (1):
                AlterUserPassword();
                break;
            case (2):
                GrantPrivilege();
                break;
            case (3):
                DeleteUser();
                break;
        }

    }

    private void DeleteUser() {
        String sql = "DROP USER ?;";
        System.out.println("Witch user do you wish to delete?");
        String in = s.next();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1,in);
            pstmt.executeQuery();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    private void GrantPrivilege() {
        String sql = " GRANT SELECT ON ";
        /*System.out.println("Specify the action you wish to perform");
        System.out.println("I.e ALL, SELECT ect.");
        String GR = s.next();*/
        System.out.println("Specify the table / database / views you wish to grant these priviliges on:");
        String db = s.next();
        System.out.println("Specify the user you wish to grant these privilges to");
        String userTest = s.next();
        sql += db;
        sql +=" TO '"+userTest+"'@'%';";

        System.out.println(sql);
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            //pstmt.setString(1,GR);
            //pstmt.setString(1, db);
            System.out.println(pstmt);
            pstmt.executeQuery();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public void revokePrivilege(){

    }

    private void AlterUserPassword() {
        String sql = "SET Password FOR ?@'%' = Password(?) ";
        System.out.println("Enter the username of the user you wish to change");
        String user = s.next();
        System.out.println("Enter SQL statment excluding WITH");
        String statement = s.next();

        try {
            PreparedStatement ptsmt = connection.prepareStatement(sql);
            ptsmt.setString(1, user);
            ptsmt.setString(2,statement);
            System.out.println(ptsmt);
            ptsmt.executeQuery();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void getTimeSheet() {
        System.out.println("Choose what you wish to do:");
        System.out.println("1. See timesheet ");
        System.out.println("2. Add entry to timesheet");
        if (role == "CEO") {
            System.out.println("3. View timesheet for employees ");
            System.out.println("4. Approve timesheet for employees");
        }

        int in = s.nextInt();

        switch (in) {
            case (1):
                viewTimeSheet();
                break;
            case (2):
                insertTimeSheet();
                break;
            case (3):
                if (role != "CEO") {
                    System.out.println("Unsuffecient acces");
                    getTimeSheet();
                    break;
                }
                viewTimeStamps();
                break;
            case (4):
                if (role != "CEO") {
                    System.out.println("Unsuffecient acces");
                    getTimeSheet();
                    break;
                }
                approve();
                break;
        }
    }

    private void approve() {
        String sql = "UPDATE TimeStamps SET WorkStatus = ? WHERE EmployeeID = ?;";
        System.out.println("Please the ID of the employee, which timesheet to approve or deny");
        String id = s.nextLine();
        System.out.println("Do you wish to approve or deny?");
        String con = s.nextLine();

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, con);
            stmt.setString(2, id);
            stmt.executeQuery();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    private void viewTimeStamps() {
        String sql = "SELECT * FROM TimeStamps";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            ResultSetMetaData meta = rs.getMetaData();
            int columnNr = meta.getColumnCount();
            while (rs.next()) {
                for (int i = 1; i < columnNr; i++) {
                    System.out.print(rs.getString(i) + " ");
                }
                System.out.println();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    private void insertTimeSheet() {
        String sql = "INSERT INTO timesheet(EmployeeID, WorkDate, WorkHours, Notice)" +
                "VALUES (?, ?, ?, ?); ";

            System.out.println("Please enter the following:");
            System.out.println("Date worked (as YYYYMMDD), Hours worked, and notice");
            String input = s.nextLine();

            inputParse = input.split(",");

            try {
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, EmployeeID);
                pstmt.setDate(2, Date.valueOf(inputParse[0]));
                pstmt.setInt(3, Integer.valueOf(inputParse[1]));
                pstmt.setString(4, inputParse[2]);
                pstmt.executeQuery();
                System.out.println("Workhours Added");
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
    }


    private void viewTimeSheet() {
        String sql = "SELECT * FROM timesheet WHERE EmployeeID = " + EmployeeID;
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            ResultSetMetaData meta = rs.getMetaData();
            int columnNr = meta.getColumnCount();
            while (rs.next()) {
                for (int i = 1; i < columnNr; i++) {
                    System.out.print(rs.getString(i) + " ");
                }
                System.out.println();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public String toString() {
        return "";
    }
}