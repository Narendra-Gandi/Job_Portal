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
<title>Home Page</title>
<%@include file="components/cdn.jsp"%>
</head>
<body>

	<!-- 
		==================== 
		 	User Check
		====================
	 -->



	<!-- 
		==================== 
		 	End User Check
		====================
	 -->


	<%@include file="components/navbar.jsp"%>


	<!-- 
		======================
		Display for the User
		======================
	 -->

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary mt-3">All Jobs</h5>

				<div class="card">
					<div class="card-body">

						<form class="form-inline" action="search.jsp" method="post">
							<div class="form-group col-md-5 mt-1">
								<h5>Location</h5>
							</div>

							<div class="form-group col-md-4 mt-1">
								<h5>Category</h5>
							</div>

							
							<!-- For Location -->
							<div class="form-group col-md-5">
								<select name="location" class="custom-select" id="inlineFormCustomSelectPref">
									<option selected value="lo">Choose...</option>
									<option value="HYDERABAD">HYDERABAD</option>
									<option value="BANGALORE">BANGALORE</option>
									<option value="VIZAG">VIZAG</option>
								</select>
							</div>
							
							<!-- For Category -->
							<div class="form-group col-md-5">
								<select name="category" class="custom-select" id="inlineFormCustomSelectPref">
									<option selected value="co">Choose...</option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Engineer">Engineer</option>
								</select>
							</div>
							
							
								<button class="btn btn-success">Submit</button>
							
							
						</form>

						</div>
					</div>
					
					
					<!-- 
						================== 
						Start JOBS Display
						================== 	
					 -->
					
					<%
						JobDAO dao = new JobDAO(DBConnect.getConn());
						List<Jobs> list = dao.getAllJobsForUser();
						for(Jobs j:list){
					%>
					
					
					<div class="card mt-2">
						<div class="card-body">
							<div class="text-center text-primary">
								<i class="far fa-clipboard fa-2x"></i>
							</div>
							
							<h6><%=j.getTitle()%></h6>
							
							<!-- 
								========================== 
									Job Description								
								==========================
							 -->
							
							<%
								if(j.getDescription().length()>0 && j.getDescription().length()<120){
							%>
							
							<p><%=j.getDescription()%></p>
							<% }else{ %>
							
							<p>
							<%=j.getDescription().substring(0,120)%>.....
							</p>
							<% } %>
							
							
							
							<!-- 
								========================== 
									End of Description								
								==========================
							 -->
							
							<br>
							
							<!-- 
								================== 
								 Location
								==================
							-->
							 
							 <div class="form-row">
							 	<div class="form-group col-md-3">
							 		<input type="text" class="form-control form-control-sm" value="location: <%=j.getLocation()%>" readonly>
							 	</div>
							 </div>
							 
							 <!-- 
								================== 
								 END Location
								==================
							-->
							
							
							<!-- 
								================== 
								 Category
								==================
							-->
							
							<div class="form-row">
								<div class="form-group col-md-3">
									<input type="text" class="form-control form-control-sm" value="category:<%=j.getCategory()%>" readonly>
								</div>
							</div>
							
							<!-- 
								================== 
								 Category END
								==================
							-->
							
							<!-- 
								================ 
									Date 
								================
							 -->
							 
							 	<h6>
							 		Published Date:
							 			<%=j.getPdate().toString()%>
							 	</h6>
							 
							 
							 <!-- 
								================ 
									Date END
								================
							 -->
							 
							 <div class="text-center">
							 	<a href="CompleteJobDescription.jsp?id=<%=j.getId()%>" 
							 	class="btn btn-sm bg-success text-white">View More</a>
							 </div>
							 
							
						</div>
					</div>
					
					
					
					<% } %>
					<!-- 
						================== 
						END OF JOBS Display
						================== 	
					 -->
				</div>
			</div>
		</div>
	
</body>
</html>