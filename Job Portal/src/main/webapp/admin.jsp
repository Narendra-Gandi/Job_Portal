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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN</title>
<%@include file="components/cdn.jsp" %>
<style>
.back-img {
	background: url("img/jobs.jpg");
	height: 90vh;
	width:100%;
	background-repeat:no-repeat;
	background-size: cover;
}
</style>

</head>
<body>

	<!-- 
		========================
		 Securing the ADMIN Page
		======================== 
	 -->
	<c:if test="${userobj.role ne 'admin'}">
	<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<!-- 
		=============================== 
		 End OF Securing the ADMIN Page
		===============================  
	 -->

	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-black p-4">Welcome ADMIN</h1>
		</div>
	</div>

</body>
</html>