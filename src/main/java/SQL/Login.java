package SQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static SQL.DatabaseCtrl.connect;

public class Login {

    public String[] login(String employeeID) {
        String sql       = "SELECT * FROM login WHERE EmployeeID = ?";
        String[] returns = new String[2];

        try (Connection conn = connect("login","1234");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, employeeID);
            ResultSet rs = pstmt.executeQuery();
            if ( rs.next()) {
                returns[0] = rs.getString("Department");
                returns[1] = rs.getString("Title");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return returns;
    }
}


