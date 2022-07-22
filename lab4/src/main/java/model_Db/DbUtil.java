package model_Db;
import java.sql.*;
public class DbUtil{
	 private Connection con=null;
	 private PreparedStatement pstm=null;
	 private ResultSet rs=null;
	//设计对数据库记录变更的方法(数据库记录的添加、修改、删除方法)，其中查询SQL语句作为方法的形参
	public int updateSQL(String sql){
		int n=-1;
		try {
		    con=DBConnection.getDBconnection();
		    pstm=con.prepareStatement(sql);
		    n=pstm.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		DBConnection.closeDB(con, pstm,rs);
		return n;
	}
	//数据库记录的查询方法
	public ResultSet QuerySQL(String sql){
		try {
		    con=DBConnection.getDBconnection();	
		    pstm= con.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		    rs=pstm.executeQuery();
		    return rs;
		  } catch (SQLException e) {e.printStackTrace();}
		 DBConnection.closeDB(con, pstm,rs);
		  return null;
   }
}