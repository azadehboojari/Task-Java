<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Task</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/css/edit.css">
</head>
<body>
	<a href="/users/dashboard"> Dashboard </a>
	<a href="/users/task/${task.id}"> Go Back</a>
	<a href="/users">Log Out</a>
	<h1>Edit ${task.taskName}</h1>
	<div class='left'>
	<form:form action="/users/task/${task.id}/edit" method="POST" modelAttribute="task">
	<input type="hidden" name="_method" value="put">
	
		<form:label path="taskName">Task Name</form:label>
    	<form:errors path="taskName" class ="error"></form:errors>
		<form:input path="taskName" class="form-control" placeholder="${task.taskName}" value="${task.taskName}"></form:input>
    
   		<p>
			<label for="a-select">Assignee:</label>
			<form:errors path="assignee"/> 
	        <form:select class="form-control" path="assignee" id="a-select">
	        	<form:option value="${task.assignee}">${task.assignee.first} ${task.assignee.last} </form:option>
				<c:forEach items="${all}" var="user">
					<form:option value="${user.id}"> ${user.first} ${user.last} </form:option>
				</c:forEach>
			</form:select>
    	</p>
    	<p>
    		<label for="p-select">Priority:</label>
    		<form:errors path="priority" /> 
	        <form:select class="form-control" path="priority" id="p-select">
	            <form:option value="${task.priority}">${task.priority}>Priority</form:option>
				<form:option value="High" > High </form:option>
				<form:option value="Medium"> Medium </form:option>
				<form:option value="Low"> Low </form:option>
			</form:select>
    	</p>	
		
    <input type="submit" class="btn btn-warning" value="Edit"/>
	
	</form:form>
	</div>
	<div class='right'>
		<img alt="tasks" src="/img/tasks.png">
	</div>
</body>
</html>