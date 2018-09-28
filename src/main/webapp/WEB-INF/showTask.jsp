<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> Task: ${task.taskName} </h1>
<h3> Creator: ${task.creator.first} ${task.creator.last}</h3>
<h3> Assignee: ${task.assignee.first} ${task.assignee.last}</h3>
<h3> Priority: ${task.priority}</h3>

	<c:if test="${task.disabled}">
	<form action="/users/task/${task.id}/edit">
			<input type="submit" value="Edit">
		</form>
	</c:if>
	
	
	<c:if test="${task.disabled}">
		<form action="/users/task/${task.id}/delete" method="POST">
			<input type="submit" value="Delete">
		</form>
	</c:if>
	<c:if test="${task.complete}">
		<form action="/users/task/${task.id}/delete" method="POST">
			<input type="submit" value="completed">
		</form>
	</c:if>
	
	<a href="/users/dashboard"> Go Back </a>

</body>
</html>