<%@ page language="java" contentType="text/html; charset=UTF-8"
   import="java.sql.*" import="model_Db.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> <title>由提交页面获取查询条件并实现查询的页面</title> </head>
    <body>       
        <%
          Connection conn = DBConnection.getDBconnection();
          request.setCharacterEncoding("UTF-8");//设置字符编码，避免出现乱码                     
          String id=request.getParameter("id");                       
          String sql="select  *  from  stu_info where id=?"; 
          PreparedStatement  stmt= conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
          stmt.setString(1,id); 
          ResultSet rs=stmt.executeQuery();   
          rs.last(); //移至最后一条记录 
         %>你要查询的学生数据表中共有
          <font size="5" color="red"> <%=rs.getRow()%></font>人
          <form  method="post" action="update_stu_edit.jsp">          
            <table border="2" bgcolor= "ccceee" width="650">
               <tr bgcolor="CCCCCC" align="center">
                  <td>记录条数</td> <td>学号</td> <td>姓名</td>
                  <td>性别</td> <td>年龄</td><td>体重</td><td>身高</td><td>血型</td>                  
               </tr>
          <% rs.beforeFirst(); //移至第一条记录之前
             while(rs.next()){
          %>   <tr align="center">
                  <td><%= rs.getRow()%><br></td>
                  <td><%= rs.getString("id") %><br></td>
                  <td><%= rs.getString("name") %><br></td>
                  <td><%= rs.getString("sex") %><br></td>
                  <td><%= rs.getString("age") %><br></td>
                  <td><%= rs.getString("weight") %><br></td>
                  <td><%= rs.getString("hight") %><br></td>
                  <td><%= rs.getString("blood") %><br>
                  <input type="hidden" name="numb" value=<%=rs.getString("id")%>></td>
                  <td> <input type="Submit"  value="修改"></td>                  
                </tr>            
             <% }%>
           </table> 
           </form>       
         <%if(stmt!=null){ stmt.close(); }
           if(stmt!=null){ stmt.close(); }
           if(conn!=null){ conn.close(); } 
         %>  
    </body>
</html>