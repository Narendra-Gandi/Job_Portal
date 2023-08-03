<!-- 
	=============== 
		JSTL CDN
	===============
 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!-- 
	======================= 
		END OF JSTL CDN
	=======================
 -->
 
<%@page import="com.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add job</title>
<style>
	.success-msg{
		text-align:center;
		color:green;
		font-weight:900;
		font-family:Arial;
		font-size:30px;
	}
</style>
<%@include file="components/cdn.jsp"%>
</head>
<body style="background-color: %f0f1f2;">

	
	
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

	<!-- 
		=============================== 
					NAVBAR
		===============================	
	 -->

	<%@include file="components/navbar.jsp"%>
	
	<!-- 
		=============================== 
				END OF NAVBAR
		===============================	
	 -->
	
	
	
	<div class="container p-2 mt-5">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>

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
						 
						 

						<h5>Add jobs</h5>
					</div>
					
					<!-- 
						=================== 
							Form
						=================== 
					 -->					
					 
					<form action="add_job" method="post">
						<div class="form-group">
							<label>Enter Title</label> <input type="text" name="title"
								required class="form-control">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option selected>Choose..</option>
									<option value="HYDERABAD">HYDERABAD</option>
									<option value="VIJAYAWADA">VIJAYAWADA</option>
									<option value="VIZAG">VIZAG</option>
									<option value="BANGALORE">BANGALORE</option>
									<option value="CHENNAI">CHENNAI</option>
									<option value="DELHI">DELHI</option>
									<option value="MUMBAI">MUMBAI</option>
									<option value="REMOTE">REMOTE</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Category</label> <select class="custom-select"
									id="inlineFormCustomSelectPref" name="category">
									<option selected>choose..</option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Status</label> <select class="form-control" name="status">
									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label>Enter description</label>
							<textarea required rows="6" cols="" name="description"
								class="form-control">
							</textarea>
						</div>
						
						<button class="btn btn-success">Publish Job</button>
						
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>