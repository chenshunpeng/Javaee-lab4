<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" import="model_Db.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>    
    <title>修改后重写记录页面</title> 
  </head>
  <body> 
    <%
      Connection conn = DBConnection.getDBconnection();          
      String sql="update stu_info set id=?,name=?,sex=?,age=?,weight=?,hight=? where name=? and sex=?";
      PreparedStatement pstmt= conn.prepareStatement(sql);
      request.setCharacterEncoding("UTF-8");//设置字符编码，避免出现乱码
      int id=Integer.parseInt(request.getParameter("id"));     
      String name2=request.getParameter("name2");
      String sex2=request.getParameter("sex2");
      int age=Integer.parseInt(request.getParameter("age"));
      float weight=Float.parseFloat(request.getParameter("weight"));
      float hight=Float.parseFloat(request.getParameter("hight"));
      String name=(String) session.getAttribute("name");
      String sex=(String) session.getAttribute("sex");
      String blood=(String) session.getAttribute("blood");
      pstmt.setInt(1,id);
      pstmt.setString(2,name2);
      pstmt.setString(3,sex2);
      pstmt.setInt(4,age);
      pstmt.setFloat(5,weight);
      pstmt.setFloat(6,hight);
      pstmt.setString(7,name);
      pstmt.setString(8,sex);    
      try{ 
          int n=pstmt.executeUpdate();
          if(n>=1){%>
              重写数据操作成功！<br>
          <%}
          else{%>
             重写数据操作失败！<%=n%><br>
          <%} 
     }catch(Exception e){%>
           重写过程出现异常错误！<br>
           <%=e.getMessage()%>
     <% 
     }
     if(pstmt!=null){ pstmt.close(); }
     if(conn!=null){ conn.close(); } 
    %>
  </body>
</html>
