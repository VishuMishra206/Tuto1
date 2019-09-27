package Services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import java.sql.PreparedStatement;

public class LoginAuthentication {
	static String 	username;

	public static boolean validate(String name, String pass) {
		boolean status = false;
		try {String u;
			Class.forName("com.mysql.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/TutoPointDB", "root", "root");

			PreparedStatement ps = c.prepareStatement("select * from User where Email=? and Password=?");
			ps.setString(1, name);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			status = rs.next();
			
			PreparedStatement ps1 = c.prepareStatement("select * from User where Email =? ");
			ps1.setString(1, name);
			ResultSet rs2 = ps1.executeQuery();
			if(rs2.next()){
				u = rs2.getString(3);
				System.out.println("insisde valid"+ u);
				 
					
				}

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	/*public static String getName(String email) throws ClassNotFoundException {
		
		try {
			System.out.println("chala");
			Class.forName("com.mysql.jdbc.Driver");
			// loads driver
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/TutoPointDB", "root", "root");
			PreparedStatement ps = c.prepareStatement("select * from User where Email =? ");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			username = rs.getString(3);
			System.out.println("insisde valid"+username);
		//	username=rs.getString("NAME");
		if(rs.next()){
				
				}

		
	}

		catch (SQLException e) {

			e.printStackTrace();
		}

		return username;
	}*/

}
