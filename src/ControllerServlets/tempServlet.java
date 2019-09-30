package ControllerServlets;
import java.io.DataOutputStream;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.PortableInterceptor.ForwardRequest;

import com.mysql.cj.jdbc.Blob;

/**
 * Servlet implementation class tempServlet
 */
@WebServlet("/tempServlet")
public class tempServlet extends HttpServlet {
	  Connection connection;
	    Statement statement;
	    ResultSet rs;
	    PreparedStatement pst;
	    Blob blob;
	    InputStream in;
	    OutputStream output;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
         try {
        	 
        	 InputStream in=request.getInputStream();
                
        	   in = ((ResultSet) request).getBinaryStream("CoursePDF");
         

         int available1 = in.available();
         byte[] bt = new byte[available1];
         in.read(bt);

                RequestDispatcher rd=request.getRequestDispatcher("CourseV.jsp");
                rd.forward(request, response);
                
            } catch (Exception e) {
                System.out.println(e);
            }
          

		//doGet(request, response);
	}

}
