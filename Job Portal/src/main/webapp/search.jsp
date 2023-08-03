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
<title>Search Results</title>
<%@include file="components/cdn.jsp" %>
</head>
<body style="background-color:#f0f1f2;">

	<!-- 
		=========================
			User Checking
		=========================
	 -->
	 
	 <!-- 
	
	 -->
	<!-- 
		============================= 
			User checking completed
		=============================
	 -->
	 
	 <!-- 
	 	========================= 
	 		Navbar Starts
	 	=========================
	  -->
	  
	 <%@include file="components/navbar.jsp" %>
	 
	 <!-- 
	 	========================= 
	 		Navbar Ends
	 	=========================
	  -->
	 
	 <div class="container">
	 	<div class="row">
	 		<div class="col-md-12">
	 			<h5 class="text-center text-primary">All Jobs</h5>
	 			
	 			<%
	 				String location = request.getParameter("location");
	 				String category = request.getParameter("category");
	 				
	 				String msg="";
	 				
	 				JobDAO dao = new JobDAO(DBConnect.getConn());
	 				List<Jobs> list = null;
	 				if("lo".equals(location)&&"co".equals(category)){ //if not selected anything
	 					list = new ArrayList<Jobs>();
	 					msg = "Job not available";
	 				}else if("lo".equals(location)||"co".equals(category)){	//if atleast anyone is selected
	 					list = dao.getJobsORLocationAndCategory(location,category) ;
	 				}else{
	 					list = dao.getJobsAndLocationAndCategory(location,category);	//if both are selected
	 				}
	 				
	 				/* 
	 				========================
	 					Messaging
	 				========================
	 				*/
	 				if(list.isEmpty()){ %>
	 					<h4 class="text-center text-danger">Job Not Available</h4>
	 				<%  } 
	 				
	 			
	 				/*
	 			<!-- 
	 				=========================  
	 					if list is not empty 
	 				=========================
	 			 -->
	 			*/
	 			
	 			
	 			 if(list!=null){
	 				 
	 			 	for(Jobs j:list){
	 			 		
	 			  %>
	 			 
	 			 <div class="cart mt-2">
	 			 	<div class="card-body">
	 			 		<div class="text-center text-primary">
	 			 			<i class="far fa-clipboard fa-2x"></i>
	 			 		</div>
	 			 		
	 			 		<h6><%=j.getTitle() %></h6>
	 			 		<p><%=j.getDescription() %></p>
	 			 		
	 			 		<br>
	 			 		
	 			 		<div class="form-row">
	 			 		
	 			 			<div class="form-group col-md-3">
	 			 				<input type="text" class="form-control-sm"
	 			 				value="Location:<%=j.getLocation()%>" readonly>
	 			 			</div>
	 			 			
	 			 			<div class="form-group col-md-3">
	 			 				<input type="text" class="form-control-sm"
	 			 				value="category:<%=j.getCategory()%>" readonly>
	 			 			</div>
	 			 			
	 			 		</div>
	 			 		
	 			 		<h6>
	 			 			Publish Date:
	 			 			<%=j.getPdate().toString() %>
	 			 		</h6>
	 			 		
	 			 		<div class="text-center">
	 			 			<a href="UserView.jsp?id=<%=j.getId()%>" class="btn btn-sm bg-success text-white">
	 			 				
	 			 			</a>
	 			 		</div>
	 			 		
	 			 	</div>
	 			 </div>
	 			 
	 			 
	 			 
	 			 <%
	 			 	}
	 			 	} else{
	 			 %>
	 			 	<h4 class="text-center text-danger"><%=msg %></h4>
	 			 	
	 			 <% } %>
	 			 
	 		</div>
	 	</div>
	 </div>

</body>
</html>