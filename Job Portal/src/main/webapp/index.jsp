<!-- 
	==========================
	JSTL CORE TAGS LINK
	==========================
 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!-- 
	==========================
	End OF JSTL CORE TAGS LINK
	==========================
 -->



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.db.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JOB Portal</title>
<%@include file="components/cdn.jsp" %>

<style>
	.back-img{
		background:url("img/jobs.jpg");
		width:100%;
		height:80vh;
		background-repeat:no-repeat;
		background-size:cover;
	}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp" %>
	
	<!-- 
	===============================
		TO CHECK DB CONNECTION 
	===============================	
	-->
	<!-- 
		<%
		Connection conn = DBConnect.getConn(); 
		out.println(conn);
		%>
	 -->
	 
	 <!-- 
	 	===============================
	 	END OF DB CONNECTION CHECK
	 	=============================== 
	  -->
	
	
	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-dark p-4">
				<i class="fa fa-book" aria-hidden="true"></i> Online Job Portal
			</h1>
		</div>
	</div>
	
	<%@include file="components/footer.jsp" %>
</body>
</html>