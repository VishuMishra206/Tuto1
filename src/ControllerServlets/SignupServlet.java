package ControllerServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import Entities.Users;
import Services.ValidatePasswordEmail;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction transaction = null;
		try {
			session = Entities.HButil.getSessionFactory().openSession();
			transaction=session.getTransaction();
			if(!transaction.isActive()) 
				transaction.begin();

			Users user=new Users();
			
			user.setName(request.getParameter("name"));
			user.setEmail(request.getParameter("email"));
			user.setPassword(request.getParameter("psw"));
			PrintWriter out = response.getWriter();  
			/*session.save(user);
			transaction.commit();
			response.sendRedirect("index.html"); 
			out.print("hogaya");*/

			/*String email=request.getParameter("email");
		*/
			 
          //  ValidatePasswordEmail validation=new ValidatePasswordEmail();
			String password=request.getParameter("psw");
            
			if(ValidatePasswordEmail.validationpass(password))
			{
				session.save(user);
				transaction.commit();
				out.print("hogaya");
				response.sendRedirect("index.html");  

			}
			
				 else
				 {    RequestDispatcher rd=request.getRequestDispatcher("register.html");  
				 		rd.include(request,response);  
					 out.print("<center><b><p style=\"color:red\">PLEASE MATCH PASSWORD PATTERN</p></b></center>");  
				  
			    	   
			
		}
		   // out.close();  
}
			catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}

		Entities.HButil.shutdown();

	}

}
