<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/discourse-plugin" version="0.8.18">
    if(api.getCurrentUser() != null) {
        $("#logged-in-user").text(" " + api.getCurrentUser().username);
    }
</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Education &mdash; Free Website Template, Free HTML5
	Template by freehtml5.co</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by freehtml5.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="freehtml5.co" />
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/bootstrap.css">

<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<link rel="stylesheet" href="css/flexslider.css">

<link rel="stylesheet" href="css/pricing.css">

<link rel="stylesheet" href="css/style.css">

<script src="js/modernizr-2.6.2.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<div class="fh5co-loader"></div>

	<div id="page">
		<nav class="fh5co-nav" role="navigation">
		<div class="top">
			<div class="container">
				<div class="row"></div>
			</div>
		</div>
		<div class="top-menu">
			<div class="container">
				<div class="row">
					<div class="col-xs-2">
						<div id="fh5co-logo">
							<a href="index.html"><i class="icon-study"></i>Tuto<span>.</span></a>
						</div>
					</div>
					<div class="col-xs-10 text-right menu-1">
						<ul>
							<li class="active"><a href="index.html">Home</a></li>
							<!-- <li><a href="courses.html">Courses</a> -->
							<li class="has-dropdown"><a href="courses.html">Courses</a>
								<ul class="dropdown">
									<li><a href="Courses-PDF/JavaTheCompleteReference.pdf">Java</a></li>
									<li><a href="Courses-PDF/C++.pdf">C++</a></li>
									<li><a href="Courses-PDF/python.pdf">Python</a></li>
								</ul></li>



							<li><a href="teacher.html">Teacher</a></li>
							<li><a href="about.html">About</a></li>

							<!-- <li class="has-dropdown">
								<a href="blog.html">Blog</a>
								<ul class="dropdown">
									<li><a href="#">Web Design</a></li>
									<li><a href="#">eCommerce</a></li>
									<li><a href="#">Branding</a></li>
									<li><a href="#">API</a></li>
								</ul>
							</li> -->
							<li><a href="contact.html">Contact</a></li>
							<li class="btn-cta"><a href="index.html"><span>logout</span></a></li>



							<h3>
								<font face="Times New Roman" size="4">
									<%
										String name = request.getParameter("name");
									%><br> welcome <%=name%></font>
							</h3>




						</ul>
					</div>
				</div>

			</div>
		</div>
		</nav>

		<aside id="fh5co-hero">
		<div class="flexslider">
			<ul class="slides">
				<li style="background-image: url(pics/1.jpg);">
					<div class="overlay-gradient"></div>
					<div class="container">
						<div class="row">
							<div class="col-md-8 col-md-offset-2 text-center slider-text">
								<div class="slider-text-inner">
									<h1>The Roots of Education are Bitter, But the Fruit is
										Sweet</h1>
									<h2>
										<a href="" target="_blank">Tutorial</a>
									</h2>
									<p>
										<a class="btn btn-primary btn-lg" href="#">Start Learning
											Now!</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li style="background-image: url(pics/3.jpeg);">
					<div class="overlay-gradient"></div>
					<div class="container">
						<div class="row">
							<div class="col-md-8 col-md-offset-2 text-center slider-text">
								<div class="slider-text-inner">
									<h1>The Great Aim of Education is not Knowledge, But
										Action</h1>
									<h2>
										<a href="" target="_blank">Tutorial</a>
									</h2>
									<p>
										<a class="btn btn-primary btn-lg btn-learn" href="#">Start
											Learning Now!</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li style="background-image: url(pics/21.jpg);">
					<div class="overlay-gradient"></div>
					<div class="container">
						<div class="row">
							<div class="col-md-8 col-md-offset-2 text-center slider-text">
								<div class="slider-text-inner">
									<h1>We Help You to Learn New Things</h1>
									<h2>
										<a href="" target="_blank">Tutorial</a>
									</h2>
									<p>
										<a class="btn btn-primary btn-lg btn-learn" href="#">Start
											Learning Now!</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
		</aside>

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
<tr>
 <td><%=resultSet.getString("CourseId") %></td>
<td><%=resultSet.getString("CourseName") %></td>
<td><%=resultSet.getString("CourseDesc") %></td>
<%-- <td><%=resultSet.getString("CourseFile") %></td>
 --%>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

		<div id="fh5co-course">
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
						<h2>Our Course</h2>
						<!-- <p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p> -->
					</div>
				</div>
				<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from coursemain";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
				<div class="row">
					<div class="col-md-6 animate-box">
						<div class="course">
							<a href="#" class="course-img"
								style="background-image: url(pics/9.jpg);"> </a>
							<div class="desc">
								<h3>
									<br>

									<h3>
										<a href="#"> SUBJECT <%=resultSet.getString("CourseName") %></font>
									</h3>


									</a>
								</h3>
								<br>

								<h3>
									<a href="#"><%=resultSet.getString("CourseDesc") %></font>
								</h3>


								</a>
								</h3>

								 <span><a
									href="<%=resultSet.getBlob(4)%>"
					
									class="btn btn-primary btn-sm btn-course">Take A Course</a></span>
							</div>
						</div>
					</div>
					
					
				</div>
				<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
			</div>
		</div>

		

	
		<div id="fh5co-gallery" class="fh5co-bg-section">
			<div class="row text-center">
				<h2>
					<span>Our Tuto Gallery</span>
				</h2>
			</div>
			<div class="row">
				<div class="col-md-3 col-padded">
					<a href="#" class="gallery"
						style="background-image: url(pics/17.jpg);"></a>
				</div>
				<div class="col-md-3 col-padded">
					<a href="#" class="gallery"
						style="background-image: url(pics/16.jpg);"></a>
				</div>
				<div class="col-md-3 col-padded">
					<a href="#" class="gallery"
						style="background-image: url(pics/18.jpg);"></a>
				</div>
				<div class="col-md-3 col-padded">
					<a href="#" class="gallery"
						style="background-image: url(pics/19.jpg);"></a>
				</div>
			</div>
		</div>
		<br> <br> <br>
		<footer id="fh5co-footer" role="contentinfo"
			style="background-image: url(images/img_bg_4.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row row-pb-md">
				<div class="col-md-3 fh5co-widget">
					<h3>About Education</h3>
					<p>Facilis ipsum reprehenderit nemo molestias. Aut cum mollitia
						reprehenderit. Eos cumque dicta adipisci architecto culpa amet.</p>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1 fh5co-widget">
					<h3>Learning</h3>
					<ul class="fh5co-footer-links">
						<li><a href="#">Course</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Terms</a></li>
					</ul>
				</div>

				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1 fh5co-widget">
					<h3>Learn &amp; Grow</h3>
					<ul class="fh5co-footer-links">
						<li><a href="#">Privacy</a></li>

					</ul>
				</div>




			</div>



		</div>
		</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Count Down -->
	<script src="js/simplyCountdown.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>
	
</body>
</html>