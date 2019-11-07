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
                int a = 0;//这一行代码没有意义，是为了防止IDEA检测
                // 这里和select_limit方法的代码块相同而导致代码下方很多横线很丑
                topic_b = new topic_bean();
                topic_b.setId(rs.getInt("id"));
                topic_b.settopic(rs.getString("topic"));
                ta.add(topic_b);
                //在这里用JDBC调用Mysql查询语句，也米娜第一次获取到后台数据
                //目的是将这里获取到的数据包装成json，并用ajax输出到前台
                //发现java使用json需要使用构建依赖，阿里巴巴和一些开源提供了jar包和相关依赖，似乎需要到maven，还不太懂
            }
            rs.close();
            prst.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ta;
    }
}