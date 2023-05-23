package org.nlt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;

import javax.management.modelmbean.RequiredModelMBean;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DataController  extends HttpServlet implements ParentInterface
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		service(req, resp);
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		service(req, resp);
	}
	
	
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession ses= req.getSession();
		String clientIp=req.getRemoteAddr();
		
		resp.setContentType("text/html");
		
		PrintWriter out= resp.getWriter();
		try 
		{
				if(pageName.equals("LoginPage"))
			{
				String email=req.getParameter("email");
				String password=req.getParameter("password");
				
				if(email.equals("Raju@gmail.com")&&password.equals("1234"))
				{
					ses.setAttribute("Ip", req.getRemoteAddr());
					ses.setAttribute("LoginName", "Ashish choudhary");
					RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
					rd.include(req, resp);
				}
				else
				{
					RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
					out.println("<h3>Invalid Login! Please Try Again.....</h3>");
					rd.include(req, resp);

				}
			}
			else if(pageName.equals("PersonPage")) {
				String date=req.getParameter("date");
				String selectAppointment=req.getParameter("selectAppointment");
				String selectService=req.getParameter("selectService");
				String selectDoctor=req.getParameter("selectDoctor");
				String name=req.getParameter("name");
				String email=req.getParameter("email");
				String date2=req.getParameter("date");
				String time=req.getParameter("time1");
				
				
				Statement smt= con.createStatement ();
				smt.execute("insert into dentals(date,selectAppointment,selectService,selectDoctor,name,email,time,status) values('"+date+"',"+selectAppointment+",'"+selectService+"','"+selectDoctor+"','"+name+"','"+email+"','"+gender+"',1)");
				
				smt.close();
				RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
				out.println("<h4>submited</h4>");
				rd.include(req, resp);
				
			}
			else if(pageName.equals("PersonUpdatePage")) {
				
				String id=req.getParameter("id");
				String fname=req.getParameter("fname");
				String age=req.getParameter("age");
				String email=req.getParameter("email");
				 System.out.println( "email pass");
			
				String password=req.getParameter("password");
				 System.out.println( "password pass");

				String phone=req.getParameter("phone");
				String gender=req.getParameter("gender");
				String dob=req.getParameter("dob");
				
				
				Statement smt= con.createStatement ();
				smt.execute("update students set name='"+fname+"',age='"+age+"',email='"+email+"',password='"+password+"',phone='"+phone+"',dob='"+dob+"',gender='"+gender+"' where id="+id);
				
				smt.close();
				RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
				//out.println("<h4> </h4>");
				rd.include(req, resp);
				
			}
             else if(pageName.equals("PersonDeletePage")) {
				
				String id=req.getParameter("id");
				String fname=req.getParameter("fname");
				String age=req.getParameter("age");
				String email=req.getParameter("email");
				String password=req.getParameter("password");
				String phone=req.getParameter("phone");
				String gender=req.getParameter("gender");
				String dob=req.getParameter("dob");
				
				
				Statement smt= con.createStatement ();
				smt.execute("update students set status=0 where id="+id);
				
				smt.close();
				RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
				//out.println("<h4> </h4>");
				rd.include(req, resp);
				
			}
			
			
		} catch (Exception e)
		{
			out.println("<h2>"+e+"</h2>");
		}
	
	}

}
