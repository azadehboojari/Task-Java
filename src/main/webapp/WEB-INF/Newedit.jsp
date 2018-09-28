<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Task</title>
</head>
<body>
	<h1>Edit ${task.taskName}</h1>
	
	<form action="/users/task/${task.id}/edit" method="post">
		<input name="taskName" type="text" placeholder="${task.taskName}" value="${task.taskName}">
		<p>
				<label for="a-select">Assignee:</label>
		        <select name="assignee" required id="a-select">
		        <option selected="selected" value="${task.assignee.first} ${task.assignee.last}"> ${task.assignee.first} ${task.assignee.last} </option>
					<c:forEach items="${all}" var="user">
						<option value="${user.id}">${user.first} ${user.last}</option>
					</c:forEach>
				</select>
    	</p>
    
    	<p>
    		<label for="p-select">Priority:</label>
	        <select name="priority" required id="p-select">
	        	<option selected="selected" value="${task.priority}">${task.priority}</option>
				<option value="High"> High </option>
				<option value="Medium"> Medium </option>
				<option value="Low"> Low </option>	
			</select>
    	</p>
     
		
    <input type="submit" value="Edit"/>
	
	
	
	</form>
</body>
</html>
<p><c:out value="${error}" /></p>
	<form:form action="/users/${id}/task/new" method="POST" modelAttribute="task">
	
		 <form:errors path="taskName" class = "error"></form:errors>     
        <form:input  path="taskName" type="text" placeholder="Task Name"  />
	    

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
    		<label for="p-select">Priority:</label>
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