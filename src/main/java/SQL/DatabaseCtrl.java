package SQL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseCtrl {
    static Connection connect() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection("jdbc:sqlite:DB/test.db");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }
}
