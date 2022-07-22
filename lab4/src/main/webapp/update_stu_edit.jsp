<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" import="model_Db.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  <title>修改编辑页面</title>  </head>
    <body>       
       <% Connection conn = DBConnection.getDBconnection(); 
          request.setCharacterEncoding("UTF-8");//设置字符编码，避免出现乱码          
          String numb=request.getParameter("numb");  
          session.setAttribute("numb",numb);                
          String sql="select  *  from  stu_info where id=?"; 
          PreparedStatement  stmt= conn.prepareStatement(sql);
          stmt.setString(1,numb); 
          ResultSet rs=stmt.executeQuery();  
          if(rs.next()){
              int id=rs.getInt("id"); 
              String name2=rs.getString("name");
              String sex2=rs.getString("sex"); 
              int age=rs.getInt("age");
              float weight=rs.getFloat("weight");
              float hight=rs.getFloat("hight"); 
              String blood=rs.getString("blood");
              if(rs!=null){ rs.close(); }
              if(stmt!=null){ stmt.close(); }
              if(conn!=null){ conn.close(); } 
              %> 
              <form action= "update_stu_write.jsp"  method="post">
               <table border="0" width="238" height="252">
                 <tr><td>学号</td><td><input name="id" value=<%=id%>></td></tr>
                 <tr><td>姓名</td><td><input name="name2" value=<%=name2%>></td></tr>
                 <tr><td>性别</td><td><input name="sex2" value=<%=sex2%>></td></tr>
                 <tr><td>年龄</td><td><input name="age"value=<%=age%>></td></tr>
                 <tr><td>体重</td><td><input name="weight"value=<%=weight%>></td></tr>
                 <tr><td>身高</td><td><input name="hight"value=<%=hight%>></td></tr>
                 <tr><td>血型</td><td><input name="blood"value=<%=blood%>></td></tr>
                 <tr align="center">
                   <td colspan="2">
                     <input type="submit" value="提  交">&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="reset" value="取  消">
                  </td>
                 </tr>
              </table>
             </form>
           <%}
           else{%>
               没有找到合适条件的记录！！<%
             if(rs!=null){ rs.close(); }
             if(stmt!=null){ stmt.close(); }
             if(conn!=null){ conn.close(); } 
            }%>                
    </body>
</html>
