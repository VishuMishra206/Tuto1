<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:if test="${requestScope.msg!=null}">
<h3><c:out value="${requestScope.msg}"> 
</c:out>
</c:if><br>
<c:if test="${sessionScope.fileName!=null}">
<c:set var="file" scope="session" value="${sessionScope.fileName}"/>
</c:if> 
<a href="<c:url value="downloadServlet?coursetitle=${file}"/>">Download </a><br>

<a href="<c:url value="file-list.jsp"/>">View List</a>





</body>
</h3>
</body>
</html>