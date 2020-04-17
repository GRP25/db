package SQL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseCtrl {

    //Dette er vores connection object
    public static Connection connect(String user, String pass) {
        String url = "jdbc:mariadb://mama.sh:4123/test01";
        Connection conn = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }
}
