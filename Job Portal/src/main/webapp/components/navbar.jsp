<!-- JSTL CODE -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!-- JSTL CODE -->


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#">Job Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only"></span></a>
      </li>
      
      <!-- 
      	========================= 
      		Admin
      	=========================
       -->
      
      <c:if test="${userobj.role eq 'admin'}">
      
       <li class="nav-item">
        <a class="nav-link" href="add_job.jsp"><i class="fa fa-plus-circle"></i>Post Job</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="view_job.jsp"><i class="fas fa-eye"></i> View Job</a>
      </li>
      
      </c:if>   
       
      <!-- 
      	============================== 
      		End of ADMIN PAGES
      	==============================
       -->
  
        
    </ul>
    
    <form class="form-inline my-2 my-lg-0">
    	<c:if test="${not empty userobj }">
     	<!-- <a href="#" class="btn btn-light"><i class="fas fa-user"></i>ADMIN</a>  -->
     	<a href="#" class="btn btn-light ml-1"><i class="fas fa-sign-in-alt"></i>LOGOUT</a>
     	</c:if>
     	
     	<c:if test="${empty userobj }">
     	<a href="login.jsp" class="btn btn-light"><i class="fas fa-sign-in-alt"></i>LOGIN</a>
     	<a href="registration.jsp" class="btn btn-light ml-1"><i class="fas fa-user-plus"></i>SIGN UP</a>
     	</c:if>
     </form>
   
  </div>
</nav>

