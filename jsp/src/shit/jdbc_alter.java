package shit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class jdbc_alter {
    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/news";
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "123";
    public int ch(String a_num,String word) {
        return bbc(a_num,word,DRIVER_NAME, URL, USER_NAME, PASSWORD);
    }

    static int bbc (String a_num,String word,String driverName, String url, String userName, String password) {
        int num = Integer.parseInt(a_num);
        Connection connection;
        try {
            Class.forName(driverName);
            connection = DriverManager.getConnection(url, userName, password);
            connection.setAutoCommit(false);
            String sql = "update news_topic set topic=? where id=?;";
            PreparedStatement prst = connection.prepareStatement(sql);
            prst.setString(1,word);
            prst.setInt(2,num);
            prst.executeUpdate();
            connection.commit();
            prst.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return num;
    }
}
