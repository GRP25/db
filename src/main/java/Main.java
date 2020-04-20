import SQL.DatabaseCtrl;
import SQL.Login;
import SQL.Purchases;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        System.out.println("Input employee ID to login:");
        String userID = "M00005"; //Dette er Malte
        Login l = new Login();
        String[] returns = l.login(userID);
        System.out.println(returns);
        Connection conn;
        switch (returns[0]){
            case "Admin":
                if (returns[1].equals("Fulltime") || returns.equals("Parttime")) {
                    conn = SQL.DatabaseCtrl.connect("Admin","1234");
                    new Admin(conn, userID, "Admin");
                }
                else if (returns[1].equals("Boss")) {
                    conn = SQL.DatabaseCtrl.connect("CEO","1234");
                    new Admin(conn, userID, "CEO");
                }
                break;
            case "Sales":
                if (returns[1].equals("Fulltime") || returns.equals("Parttime")) {
                    conn = SQL.DatabaseCtrl.connect("Sales", "1234");

                    new Sales(conn, userID, "CSO");
                }
                else if (returns[1].equals("Boss")) {
                    conn = SQL.DatabaseCtrl.connect("CSO", "1234");
                    new Sales(conn, userID, "Sales");
                }
                break;
            case "Purchases":
                if (returns[1].equals("Fulltime") || returns.equals("Parttime")){
                    conn = SQL.DatabaseCtrl.connect("Purchases","1234");
                        new Purchases(conn);
                } else if (returns[1].equals("Boss")){
                    conn = SQL.DatabaseCtrl.connect("CPO","1234");
                    new Purchases(conn);
                }
                break;
            default:
                break;
        }
    }
}