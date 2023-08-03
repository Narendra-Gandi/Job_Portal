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
	
	
<%@page import="com.db.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.entity.*"%>
<%@page import="java.util.List"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view jobs</title>
<%@include file="components/cdn.jsp"%>
<style>
	.success-msg{
		text-align:center;
		color:green;
		font-weight:900;
		font-family:Arial;
		font-size:30px;
	}
</style>
</head>
<body style="background-color: #f0f1f2;">

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
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary mb-5 mt-5">All Jobs</h5>
				
				<!-- 
					=========================
						Success Message
					=========================
				 -->
				 
				<!--  
				<p class="success-msg">
				<c:out value="${succMsg}"/>
				</p>
				-->
				
				
				<c:if test="${not empty succMsg}" >
				<div class="alert alert-success" role="alert">${ succMsg}</div>
				<c:remove var="succMsg" />
				</c:if>
				
				<!-- 
					=========================
					 End OF Success Message
					=========================
				 -->
				
				<!-- 
				================= 
				To view the jobs
				=================
				-->

				<%
				JobDAO dao = new JobDAO(DBConnect.getConn());
				List<Jobs> list = dao.getAllJobs();
				for (Jobs j : list) {
				%>
				
				<!-- 
				================= 
				To view the jobs
				=================
				-->


				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>



						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%></p>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="location: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="category: <%=j.getCategory()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="status: <%=j.getStatus()%>" readonly>
							</div>

						</div>
						<h6>
							publish data:
							<%=j.getPdate()%></h6>
						<div class="text-center">
							<a href="edit_job.jsp?id=<%=j.getId() %>"><button class="btn btn-success">Edit</button></a>
							<a href="delete?id=<%=j.getId() %>"><button class="btn btn-danger">Delete</button></a>
						</div>
					</div>
				</div>
				
				
				<!-- 
				=====================
				End of view jobs code
				=====================				
				-->
				
				<%
				}
				%>
				
				
				<!-- 
				=====================
				End of view jobs code
				=====================				
				-->
				
			</div>
		</div>
	</div>
</body>
</html>