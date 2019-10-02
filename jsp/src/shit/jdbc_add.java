package shit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class jdbc_add {
    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/news";
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "123";
    public int add_data(String a_num,String word) {
        return bbc(a_num,word,DRIVER_NAME, URL, USER_NAME, PASSWORD);
    }

    static int bbc (String a_num,String word,String driverName, String url, String userName, String password) {
        int num = Integer.parseInt(a_num);
        Connection connection;
        try {
            Class.forName(driverName);
            connection = DriverManager.getConnection(url, userName, password);
            String sql = "insert into news_topic(id,topic) VALUES(?),(?)";
            PreparedStatement prst = connection.prepareStatement(sql);
            prst.setInt(1,num);
            prst.setString(2,word);
            System.out.println("成功删除序号" + num + "的新闻");
            prst.execute();
            prst.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return num;
    }
}
