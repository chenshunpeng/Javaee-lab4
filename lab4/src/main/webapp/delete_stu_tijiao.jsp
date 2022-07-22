<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>  <title>删除条件提交页面</title>  </head>  
  <body> 
         请选择删除记录条件<hr width="100%" size="3"> 
        <form action= "delete_stu_3.jsp"  method="post">
            学号: <input type="text" name="id"><br> <p>  
              <input type="submit" value="提  交">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                  
              <input type="reset" value="取  消"> 
       </form>
  </body>
</html>