<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>  <title>查询条件提交页面</title>  </head>  
  <body> 
         按学号查询<hr width="100%" size="3"> 
       <form action= "find_stu_5.jsp"  method="post">  
               性别：男 <input type="radio" value="男" name="sex" checked="checked">
               女<input type="radio"  value="女" name="sex">
               不区分性别<input type="radio"  value="男女" name="sex"><br><br>      
               体重范围: 最小<input type="text" name="w1">&nbsp;  
                         最大<input type="text" name="w2"> <p> 
              <input type="submit" value="提  交">
              &nbsp;&nbsp;&nbsp;&nbsp;                  
              <input type="reset" value="取  消"> 
       </form>
  </body>
</html>
