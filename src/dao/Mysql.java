package dao;

import java.sql.*;


public class Mysql {
    private static Connection conn = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    static {
        Mysql();
    }
    private static void Mysql() {
        try {
            String driverName = "com.mysql.cj.jdbc.Driver";
            Class.forName(driverName);
            //数据库名
            String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
            String username = "root";
            //密码和数据库一致
            String password = "123456";
            conn = DriverManager.getConnection(url, username, password);
            stmt = conn.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public static ResultSet getRs(String sql) throws Exception {
        try {
            rs = stmt.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    public static int executeUpdate(String sql) {
        int count = 0;
        try {
            count = stmt.executeUpdate(sql);
/*            if (count != 0)
                ;
                // con.commit();
            else
                ;*/
            // con.rollback();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return count;
    }

    public static void Close() {
        try {
            if (conn != null)
                conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}