
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    private final String jdbcURL = "jdbc:sqlserver://DESKTOP-0V6L7CF\\MIEE:1433;databaseName=LibraryManagement_1";
    private final String jdbcUsername = "sa";
    private final String jdbcPassword = "159486753";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            // Đăng ký driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            // Kết nối đến cơ sở dữ liệu
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public User validateUser(String username, String password) {
        User user = null;
        String SELECT_USER_BY_USERNAME = "SELECT username, password, role FROM Account WHERE username = ? and password = ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    String userRole = rs.getString("role");
                    user = new User(username, password, userRole);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean userExists(String username) {
        boolean exists = false;
        String CHECK_USER_EXISTS = "SELECT username FROM Account WHERE username = ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(CHECK_USER_EXISTS)) {
            preparedStatement.setString(1, username);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                exists = rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }

    public void addUser(User user) {
        String INSERT_USERS_SQL = "INSERT INTO Account (username, password, role) VALUES (?, ?, ?)";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getRole());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
