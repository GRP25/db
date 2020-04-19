package SQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static SQL.DatabaseCtrl.connect;

public class TimeSheet {
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
    */

    public void createTimeSheet(String username, int hours, long date, String notice) {
        String sql = "INSERT INTO timesheet (EmployeeID, WorkDate, WorkHours, Notice) VALUES (?,?,?,?)";

        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, parameter);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
}
