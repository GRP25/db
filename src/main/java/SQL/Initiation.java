package SQL;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import static SQL.DatabaseCtrl.*;


public class Initiation {
    public void createNewUserTable() {
        String sql = "CREATE TABLE IF NOT EXISTS user (\n" +
                "   user_id integer PRIMARY KEY AUTOINCREMENT,\n" +
                "   user_name text NOT NULL, \n" +
                "   user_init text NOT NULL, \n" +
                "   user_cpr integer NOT NULL UNIQUE, \n" +
                "   user_password text NOT NULL \n" +
                ");";
        try (
                Connection conn = connect();
                Statement stmt = conn.createStatement()
        ) {
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
