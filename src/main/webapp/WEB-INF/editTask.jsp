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
</head>
<body>
	<h1>Edit ${task.taskName}</h1>
	
	<form:form action="/users/task/${task.id}/edit" method="POST" modelAttribute="task">
	<input type="hidden" name="_method" value="put">
		
    	<p><form:errors path="taskName" class ="error"></form:errors></p>
		<p>
			<form:label path="taskName">Task Name</form:label>
			<form:input path="taskName" placeholder="${task.taskName}" value="${task.taskName}"></form:input>
		</p>
    
   		<p>
			<label for="a-select">Assignee:</label>
			<form:errors path="assignee"/> 
	        <form:select path="assignee" id="a-select">
	        	<form:option value="${task.assignee}">${task.assignee.first} ${task.assignee.last} </form:option>
				<c:forEach items="${all}" var="user">
					<form:option value="${user.id}"> ${user.first} ${user.last} </form:option>
				</c:forEach>
			</form:select>
    	</p>
    	<p>
    		<label for="p-select">Priority:</label>
    		<form:errors path="priority" /> 
	        <form:select path="priority" id="p-select">
	            <form:option value="${task.priority}">${task.priority}>Priority</form:option>
				<form:option value="High" > High </form:option>
				<form:option value="Medium"> Medium </form:option>
				<form:option value="Low"> Low </form:option>
			</form:select>
    	</p>	
		
    <input type="submit" value="Edit"/>
	
	</form:form>
</body>
</html>