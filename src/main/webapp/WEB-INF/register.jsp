<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Register</title>
	     <link rel="stylesheet" type="text/css" href="/css/style.css">
	     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	</head>
<body>

	<div class='container d-flex justify-content-center'>
			<form:form  class="newForm" action="/users" method="POST" modelAttribute="user">
				<h1 class="blue">Registration</h1>
				<c:if test="${userError!= null}">
					<p class="error">${userError}</p>				
				</c:if>
			    <p>
			        <form:errors path="first"/>
			        <form:input path="first" type="text" placeholder="First Name"/>
			    </p>
			    <p>
			        <form:errors path="last"/>
			        <form:input path="last" type="text" placeholder="Last Name"/>
			    </p>
			    <p>
			        <form:errors path="email"/>
			        <form:input type="email" path="email" placeholder="Email"/>
			    </p>
			    <p>
			        <form:errors path="password"/>     
			        <form:input type="password" path="password" placeholder="Password"/>
			    </p> 
			    <p>
			   		<input type="password" name="confirm" placeholder="confirm password">
			    </p>   
			    <input type="submit" class="btn btn-warning" value="Register"/>
			</form:form>   


		<form  class="newForm" action="/users/login" method="POST">
		<h1 class="blue">Login</h1>
			<c:if test="${loginError != null}" >
				<p class="error">${loginError}</p>				
			</c:if>
			<p><input type="text" name="email" type="text" placeholder="Email"><p>
			<p><input type="password" name="password"  placeholder="password"></p>
			<p><input type="submit" class="btn btn-warning" value="login"/></p>
		</form>
	</div>
</body>
</html> 