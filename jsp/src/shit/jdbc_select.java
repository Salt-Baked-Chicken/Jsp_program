package shit;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class jdbc_select {
    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/news";
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "123";

    public List<topic_bean> a() {
        List<topic_bean> ta = new ArrayList<topic_bean>();
        return bbc(ta, DRIVER_NAME, URL, USER_NAME, PASSWORD);
    }

    static List<topic_bean> bbc(List<topic_bean> ta, String driverName, String url, String userName, String password) {
        Connection connection;
        try {
            Class.forName(driverName);
            connection = DriverManager.getConnection(url, userName, password);
            String sql = "SELECT * FROM `news_topic`";
            PreparedStatement prst = connection.prepareStatement(sql);
            ResultSet rs = prst.executeQuery();
            topic_bean topic_b = null;
            while (rs.next()) {
                topic_b = new topic_bean();
                topic_b.setId(rs.getInt("id"));
                topic_b.settopic(rs.getString("topic"));
                ta.add(topic_b);
            }
            rs.close();
            prst.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ta;
    }
}