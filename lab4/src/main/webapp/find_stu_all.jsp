<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" import="model_Db.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> <title>显示所有学生的页面</title> </head>
    <body>
        <center>
        <%
          DbUtil run=new DbUtil();
          String sql="select  *  from  stu_info "; 
          ResultSet rs=run.QuerySQL(sql);       
          rs.last(); //移至最后一条记录 
         %>
            你要查询的学生数据表中共有
          <font size="5" color="red"> <%=rs.getRow()%></font>人
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
        </center>            
    </body>
</html>
