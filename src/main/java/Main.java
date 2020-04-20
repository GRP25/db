import SQL.DatabaseCtrl;
import SQL.Login;

import java.sql.Connection;

public class Main {
    public static void main(String[] args) {
        System.out.println("Input employee ID to login:");
        String userID = "M00036"; //Dette er Malte
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
                if (returns[1].equals("Fulltime") || returns.equals("Parttime"))
                    conn = SQL.DatabaseCtrl.connect("Sales","1234");
                else if (returns[1].equals("Boss"))
                    conn = SQL.DatabaseCtrl.connect("CSO","1234");
                break;
            case "Purchases":
                if (returns[1].equals("Fulltime") || returns.equals("Parttime"))
                    conn = SQL.DatabaseCtrl.connect("Purchases","1234");
                else if (returns[1].equals("Boss"))
                    conn = SQL.DatabaseCtrl.connect("CPO","1234");
                break;
            default:
                break;
        }
    }
}