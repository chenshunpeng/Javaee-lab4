<%@ page language="java" import="java.sql.*" import="model_Db.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>    
    <title>利用提交条件删除记录页面</title> 
  </head>
  <body> 
    <%
      Connection conn = DBConnection.getDBconnection(); 
      Statement stmt=conn.createStatement();
      request.setCharacterEncoding("UTF-8");//设置字符编码，避免出现乱码        
      String id=request.getParameter("id");       
      String sql="delete from stu_info where id=?";
      PreparedStatement  pstmt= conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);   
      pstmt.setString(1,id); 
      try{ 
          int n=pstmt.executeUpdate();
          if(n>=1){%>
              数据删除操作成功！<br>
          <%}
          else{%>
             数据删除操作失败！<br>
          <%} 
     }catch(Exception e){%>
           删除更新过程出现异常错误！<br>
           <%=e.getMessage()%>
     <%
     }
     if(stmt!=null){ stmt.close(); }
     if(conn!=null){ conn.close(); } 
    %>
  </body>
</html>
