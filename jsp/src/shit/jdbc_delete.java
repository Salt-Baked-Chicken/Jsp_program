package shit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class jdbc_delete {
    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/news";
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "123";
    public int de(String d_num) {
        return bbc(d_num,DRIVER_NAME, URL, USER_NAME, PASSWORD);
    }

    static int bbc (String d_num,String driverName, String url, String userName, String password) {
        int num = Integer.parseInt(d_num);
        Connection connection;
        try {
            Class.forName(driverName);
            connection = DriverManager.getConnection(url, userName, password);
            String sql = "delete from news_topic where id = ?";
            PreparedStatement prst = connection.prepareStatement(sql);
            prst.setInt(1,num);
            System.out.println("成功删除序号" + num + "的新闻");
            prst.execute();
            prst.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return num;
    }
}