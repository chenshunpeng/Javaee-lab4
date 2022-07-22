<%@ page language="java" contentType="text/html; charset=UTF-8"
   import="java.sql.*" import="model_Db.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> <title>由提交页面获取查询条件并实现查询的页面</title> </head>
    <body>
        <center>
       <% 
          Connection conn = DBConnection.getDBconnection();
          request.setCharacterEncoding("UTF-8");//设置字符编码，避免出现乱码        
          String sex=request.getParameter("sex");
          float weight1=Float.parseFloat(request.getParameter("w1"));
          float weight2=Float.parseFloat(request.getParameter("w2"));                       
          String sql="select  *  from  stu_info where sex=? and weight>=? and weight<=?";
          PreparedStatement stmt= conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
          stmt.setString(1,sex);        
          stmt.setFloat(2,weight1);
          stmt.setFloat(3,weight2);
          ResultSet rs=stmt.executeQuery();   
          rs.last(); //移至最后一条记录 
         %>你要查询的学生数据表中共有
          <font size="5" color="red"> <%=rs.getRow()%></font>人
          <form>
          <table border="2" bgcolor= "ccceee" width="650">
               <tr bgcolor="CCCCCC" align="center">
                   <td>记录条数</td> <td>学号</td> <td>姓名</td><td>性别</td> <td>年龄</td><td>体重</td><td>身高</td><td>血型</td>
               </tr>
          <% rs.beforeFirst(); //移至第一条记录之前
             while(rs.next()){
          %>   <tr align="center">
                  <td><%= rs.getRow()%></td>
                  <td><%= rs.getString("id") %></td>
                  <td><%= rs.getString("name") %></td>
                  <td><%= rs.getString("sex") %></td>
                  <td><%= rs.getString("age") %></td>
                  <td><%= rs.getString("weight") %></td>
                  <td><%= rs.getString("hight") %></td>
                  <td><%= rs.getString("blood") %></td>
                </tr>            
             <% }%>
           </table>
           </form>
        </center>
         <%if(stmt!=null){ stmt.close(); }
           if(stmt!=null){ stmt.close(); }
           if(conn!=null){ conn.close(); } 
         %>  
    </body>
</html>