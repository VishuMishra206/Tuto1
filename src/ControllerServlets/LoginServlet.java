package ControllerServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.sql.SelectValues;

import Entities.Users;
import Services.LoginAuthentication;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uname;
		HttpSession session=request.getSession();
		LoginAuthentication la=new LoginAuthentication();
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
		String loginemail=request.getParameter("Loginemail");
		String loginpwd=request.getParameter("Loginpsw");
		
		
		try {String u;
		Class.forName("com.mysql.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/TutoPointDB", "root", "root");
		
		PreparedStatement ps = c.prepareStatement("select * from User where Email=? and Password=?");
		ps.setString(1, loginemail);
		ps.setString(2, loginpwd);
		ResultSet rs = ps.executeQuery();
		 rs.next();
		
		PreparedStatement ps1 = c.prepareStatement("select * from User where Email =? ");
		ps1.setString(1, loginemail);
		ResultSet rs2 = ps1.executeQuery();
		if(rs2.next()){
			u = rs2.getString(3);
			System.out.println("insisde valid"+ u);
			RequestDispatcher rd=request.getRequestDispatcher("WelcomeUser.jsp?name="+u);  
	    	 rd.include(request,response);
				
			}
		  else{   out.print("<center><b><p style=\"color:red\">Sorry username or password error</p></b></center>");  
	    	/*  out.println("<script type=\"text/javascript\">");
	    	  out.println("alert('Invalid Username or Password');");
	    	  out.println("</script>");		*/  
	    	    RequestDispatcher rd=request.getRequestDispatcher("login.html");  
	    	  rd.include(request,response);  
	    	    
	    }  

	} catch (Exception e) {
		System.out.println(e);
	}
		

		
		  /*if(LoginAuthentication.validate(loginemail, loginpwd))
		  {   		session.setAttribute("loginemail", loginemail);

					 RequestDispatcher rd=request.getRequestDispatcher("WelcomeUser.jsp?loginemail");  
			    	 rd.include(request,response);
		}*/
				
			 
		  
			 // response.sendRedirect("index.html"); }
		/*	try {				

		    	 // response.include(request,response);  
				uname = LoginAuthentication.getName(loginemail);
				response.sendRedirect("WelcomeUser.jsp?uname="+uname); 
		 session.setAttribute("myname", uname);
			System.out.println(session.getAttribute(uname));
			}
			catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      // request.seng("WelcomeUser.jsp?name="+uname); 
		        
		      
		    }  */
		/*  else{   out.print("<center><b><p style=\"color:red\">Sorry username or password error</p></b></center>");  
		    	  out.println("<script type=\"text/javascript\">");
		    	  out.println("alert('Invalid Username or Password');");
		    	  out.println("</script>");		  
		    	    RequestDispatcher rd=request.getRequestDispatcher("login.html");  
		    	  rd.include(request,response);  
		    	    
		    }  */
		       
		   // out.close();  


	}
	}


