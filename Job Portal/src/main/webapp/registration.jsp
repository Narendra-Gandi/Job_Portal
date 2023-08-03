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
<title>Registration Page</title>
<%@include file="components/cdn.jsp"%>
<style>
</style>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="components/navbar.jsp"%>

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
						

	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-lg-4 offset-lg-4 ">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<h2>Registration</h2>
							<form action="add_user" method="post">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">NAME</label>
									 <input type="text" name="name" class="form-control">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input type="email" name="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>
								
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input type="password" name="password" class="form-control"
										id="exampleInputPassword1">
								</div>
								
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Qualification</label>
									 <input type="text" name="qualification" class="form-control">
								</div>
								
								
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%@include file="components/footer.jsp"%>
</body>
</html>