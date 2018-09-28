<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Task</title>
</head>
<body>
	<h1>Create a new task</h1>
	
	<form:form action="/users/${id}/task/new" method="POST" modelAttribute="task">
	
	 	<p><form:errors path="taskName" class = "error"></form:errors></p>
		<p>
			<form:label path="taskName">Task Name</form:label>
			<form:input path="taskName"></form:input>
		</p>
		<p>
				<label for="a-select">Assignee:</label>
				<form:errors path="assignee"/> 
		        <form:select path="assignee" id="a-select">
		        	<form:option value="">Assignee</form:option>
					<c:forEach items="${all}" var="user">
						<form:option value="${user.id}" > ${user.first} ${user.last} </form:option>
					</c:forEach>
				</form:select>
    	</p>
    	
    	<p>
    		<form:label  path="priority" for="p-select">Priority:</form:label>
    		<form:errors path="priority"/> 
	        <form:select path="priority" id="p-select">
	            <form:option value="">Priority</form:option>
				<form:option value="High" > High </form:option>
				<form:option value="Medium"> Medium </form:option>
				<form:option value="Low"> Low </form:option>
			</form:select>
    	</p>
			
		
		
     
		
    	<input type="submit" value="Create"/>
	
	
	
	</form:form>
</body>
</html>