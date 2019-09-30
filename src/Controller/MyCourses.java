package Controller;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.jdbc.Blob;

public class MyCourses {
	public static void main(String agrs[])
	{
	try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/TutoPointDB", "root", "root");

	PreparedStatement ps = c.prepareStatement("select * from coursemain");
	
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()){
		String CourseName = rs.getString(2);
		String CourseDecription = rs.getString(3);
		Blob CoursePDF =  (Blob) rs.getBlob(4);

		System.out.println("CourseName "+ CourseName);
		System.out.println(" CourseDecription"+ CourseDecription);
		System.out.println("CoursePDF "+ CoursePDF);

			
		}

} catch (Exception e) {
	System.out.println(e);
}
}}
