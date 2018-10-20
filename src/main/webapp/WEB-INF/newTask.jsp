<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>New Task</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/css/create.css">
</head>
	<body>
	<a href="/users/dashboard"> Dashboard </a>
	<a href="/users">Log Out</a>
	<h1>Create a new task</h1>
	<div class='left'>
	
		<form:form action="/users/${id}/task/new" method="POST" modelAttribute="task">
	 
	 		<div class="form-group">
				<form:label  path="taskName">Task Name: </form:label>
				<form:errors path="taskName" class = "error"></form:errors>	
				<form:input class="form-control" path="taskName"></form:input>
			</div>
			
			<div class="form-group">
				<label  for="a-select">Assignee:</label>
				<form:errors class = "error" path="assignee"/>
		        <form:select class="form-control" path="assignee" id="a-select">
		        	<form:option value="">Assignee</form:option>
					<c:forEach items="${all}" var="user">
						<form:option value="${user.id}" > ${user.first} ${user.last} </form:option>
					</c:forEach>
				</form:select>
	    	</div>
    	
	    	<div class="form-group">
	    		<form:label  path="priority" for="p-select">Priority:</form:label>
	    		<form:errors class = "error" path="priority"/> 
		        <form:select class="form-control" path="priority" id="p-select">
		            <form:option value=""> Priority</form:option>
					<form:option value="High" > High </form:option>
					<form:option value="Medium"> Medium </form:option>
					<form:option value="Low"> Low </form:option>
				</form:select>
			</div>
		
    		<input type="submit"  class="btn btn-warning" value="Create"/>
	
		</form:form>
	</div>
	<div class='right'>
		<img alt="tasks" src="/img/tasks.png">
	</div>
	
	</body>
</html>