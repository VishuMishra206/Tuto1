<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import= "java.io.InputStream"%>
<%@page import= "java.io.OutputStream"%>

<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "tutopointdb";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>
<form method="post" action="tempServlet">
<table border="1">
<tr>
<td>ID </td>
<td>Subject Name</td>
<td>About </td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from coursemain";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<%
String cname=resultSet.getString("CourseName"); 
String cabout=resultSet.getString("CourseDesc");
String id1=resultSet.getString("CourseId");%>
<tr>
<td>
 <%=cname %></td>
<td><%=cabout %></td>
 <td> <span>
<%InputStream CoursePDF =resultSet.getBinaryStream(4);
           

         int available1 = CoursePDF.available();
         byte[] bt = new byte[available1];
         //CoursePDF.read(bt);
         
         ByteArrayOutputStream o=new ByteArrayOutputStream();
         byte[] buffer=new byte[4096];
         int bytesRead=-1;
         while((bytesRead=CoursePDF.read(buffer))!=-1){
        	 o.write(buffer,0,bytesRead);
         }
         byte[] outPdf=o.toByteArray();
         String pdf=outPdf.toString();
        
         %>
        <a href="CourseV.jsp?name=<%=cname%>&decs=<%=cabout%>&cfile=<%=id1%>"
       
class="btn btn-primary btn-sm btn-course">Take A Course</a></span></td>
 <!-- href="/tempServlet"  -->
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table></form>
</body>
</html>