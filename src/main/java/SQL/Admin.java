import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static SQL.DatabaseCtrl.connect;

public class Admin {
    /*
    private int getLastUserID() {
        String sql = "SELECT ?";

        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setLong(1, userCPR);
            ResultSet rs = pstmt.executeQuery();
            id = rs.getInt("user_id");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    }

    public void create(parameter) {
        String sql = "INSERT ?";

        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, parameter);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}

*/
}
