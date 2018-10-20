<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/show.css">
</head>
<body>
<a href="/users/dashboard"> Go Back </a>
<a href="/users">Log Out</a>
<h1> Task: ${task.taskName} </h1>

	<div class='container'>
		<h3> <strong>Creator:</strong> ${task.creator.first} ${task.creator.last}</h3>
		<h3> <strong>Assignee:</strong> ${task.assignee.first} ${task.assignee.last}</h3>
		<h3> <strong>Priority:</strong> ${task.priority}</h3>
		
		<div id='bt'>
			<c:if test="${task.disabled}">
			<form action="/users/task/${task.id}/edit">
					<input type="submit" value="Edit" class="btn btn-warning">
			</form>
			</c:if>
			
			
			<c:if test="${task.disabled}">
				<form action="/users/task/${task.id}/delete" method="POST">
					<input type="submit" value="Delete" class="btn btn-warning">
				</form>
			</c:if>
			<c:if test="${task.complete}">
				<form action="/users/task/${task.id}/delete" method="POST">
					<input type="submit" value="completed" class="btn btn-warning">
				</form>
			</c:if>
		</div>
	</div>
	
	

</body>
</html>