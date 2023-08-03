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


<%@page import="com.dao.*" %>
<%@page import="com.servlet.*" %>
<%@page import="com.db.*" %>
<%@page import="com.entity.*" %>

<!-- 
	================================= 
	Collections Interface and classes
	================================= 
 -->
 
 <%@page import="java.util.*" %>
 
<!-- 
	========================================  
	End Of Collections Interface and classes
	========================================  
 --> 




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Job Details</title>
<%@include file="components/cdn.jsp" %>
</head>
<body>

	<!-- 
		======================== 
			NAVBAR Starts
		========================
	 -->
	<%@include file="components/navbar.jsp" %>
	
	<!-- 
		======================== 
			NAVBAR END
		========================
	 -->
	 
	 <!-- 
	 	===========================
	 		user Authentication
	 	===========================
	  -->
	  <c:if test="$(empty user)">
		<c:redirect url="login.jsp" />
	</c:if>
	
	<!-- 
		===========================
		 End OF user Authentication
		===========================
	 -->
	  
	 
	 <div class="container">
	 	<div class="row">
	 		<div class="col-md-12">
	 			
	 			<%
	 				int id = Integer.parseInt(request.getParameter("id"));
	 				JobDAO dao  = new JobDAO(DBConnect.getConn());
	 				Jobs j = dao.getJobById(id);
	 			%>
	 			
	 			<div class="card-mt-5">
	 				<div class="card-body">
	 					<div class="text-center text-primary">
	 						<i class="far fa=clipboard fa-2x"></i>
	 					</div>
	 					
	 					<!-- 
	 						======================
	 							JOB DETAILS
	 						======================
	 					 -->
	 					 
	 					 <h6><%=j.getTitle()%></h6>
	 					 <p><%=j.getDescription() %></p>
	 					 <br>
	 					 
	 					<div class="form-row">
	 					 	<div class="form-group col-md-3">
	 					 		<input type="text" class="form-control form-control-sm" 
	 					 		 value="Location: <%=j.getLocation()%>" readonly>
	 					 	</div>
	 					 </div>
	 					
	 					
	 					<div class="form-row">
	 					 	<div class="form-group col-md-3">
	 					 		<input type="text" class="form-control form-control-sm" 
	 					 		 value="Category: <%=j.getCategory()%>" readonly>
	 					 	</div>
	 					 </div>
	 				</div>
	 			</div>
	 			
	 		</div>
	 	</div>
	 </div>
	 
	 
	
</body>
</html>