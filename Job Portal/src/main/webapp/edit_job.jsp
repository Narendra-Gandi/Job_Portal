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


<%@page import="com.servlet.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.entity.*"%>
<%@page import="com.db.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Job</title>
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
	 
	 

	<%@include file="components/navbar.jsp"%>
	<div class="container p-2 mt-5">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>

						<!-- 
							================================
							Getting id from view job button
							================================
						-->

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						JobDAO dao = new JobDAO(DBConnect.getConn());
						Jobs j = dao.getJobById(id);
						%>
						
						<!-- 
							================================
							END Getting id from view job button
							================================
						-->

						<h5>Edit jobs</h5>
					</div>
					<form action="update" method="post">

						<input type="hidden" value="<%=j.getId()%>" name="id">

						<div class="form-group">
							<label>Enter Title</label> <input type="text" name="title"
								required class="form-control" value="<%=j.getTitle()%>">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option value="<%=j.getLocation()%>"><%=j.getLocation()%></option>
									<option value="hyderabad">hyderabad</option>
									<option value="vijayawada">vijayawada</option>
									<option value="vizag">VIZAG</option>
									<option value="bangalore">bangalore</option>
									<option value="chennai">chennai</option>
									<option value="delhi">delhi</option>
									<option value="mumbai">mumbai</option>
									<option value="remote">remote</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Category</label> <select class="custom-select"
									id="inlineFormCustomSelectPref" name="category">
									<option value="<%=j.getCategory()%>"><%=j.getCategory()%></option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Status</label> <select class="form-control" name="status">
									<option class="Active" value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label>Enter description</label>
							<textarea required rows="6" cols="" name="description"
								class="form-control">
								<%=j.getDescription()%>
							</textarea>
						</div>
						<button class="btn btn-success">Update Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>