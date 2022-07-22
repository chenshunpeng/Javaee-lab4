package Controller_Servlet;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_Db.DbUtil;

@WebServlet("/insert")
public class insert extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    int id=Integer.parseInt(request.getParameter("id"));     
	    String name=request.getParameter("name");
	    String sex=request.getParameter("sex");
	    int age=Integer.parseInt(request.getParameter("age"));
	    float weight=Float.parseFloat(request.getParameter("weight"));
	    float hight=Float.parseFloat(request.getParameter("hight"));
	    String blood=request.getParameter("blood");
	    String sql1="Insert into stu_info(id,name,sex,age,weight,hight,blood)";
	    String sql2="values("+id+",'"+name+"','"+sex+"',"+age+","+weight+","+hight+",'"+blood+"')";
	    String sql=sql1+sql2;
	    DbUtil run=new DbUtil();
	    int n=run.updateSQL(sql);
	    if(n>=1)
	    	request.getRequestDispatcher("success.jsp").forward(request,response);	
		else       		        	
		    request.getRequestDispatcher("error.jsp").forward(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);		
	}
}
