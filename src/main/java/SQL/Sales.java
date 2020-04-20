package SQL;

import java.sql.*;

import static SQL.DatabaseCtrl.connect;

public class Sales {
    String user, pass, employeeid;
    public Sales(String user, String pass, String employeeid){
        this.user = user;
        this.pass = pass;
        this.employeeid = employeeid;
        query();
    }

    public void query() {
        String sql = "SELECT * FROM Customer";
        try (Connection conn = connect(this.user,this.pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                System.out.println(rs.getString("CustomerID"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

}
