package model_Db;

import java.sql.*;

public class DBConnection {
    public static Connection getDBconnection(){
        String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";   //驱动程序名
        String userName = "sa";                      //数据库用户名
        String userPwd = "ch165075";                 //密码

        String  url="jdbc:sqlserver://localhost:1433;databaseName=students";

        try {
            Class.forName(driverName);
            Connection con=DriverManager.getConnection(url,userName,userPwd);
            return con;
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void closeDB(Connection con,PreparedStatement  pstm, ResultSet rs){
        try {
            if(rs!=null) rs.close();
            if(pstm!=null) pstm.close();
            if(con!=null) con.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}