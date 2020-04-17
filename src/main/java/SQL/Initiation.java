package SQL;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import static SQL.DatabaseCtrl.*;


public class Initiation {
    /*
    public void createNewUserTable() {
        String sql = "CREATE TABLE IF NOT EXISTS user (\n" +
                "   employee_id text PRIMARY KEY, \n" +
                "   first_name text NOT NULL, \n" +
                "   last_name text NOT NULL, \n" +
                "   date text NOT NULL, \n" +
                "   working_hours integer NOT NULL, \n" +
                "   status text NOT NULL, \n" +
                "   status_first_name text NOT NULL, \n" +
                "   status_last_name text NOT NULL, \n" +
                "   comment text NOT NULL \n" +
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
     */
}
